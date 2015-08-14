---
layout: post
title: "Rails tree structure"
date: 2013-11-21 15:56
comments: true
categories: [rails]
---

A couple of days ago I had to make a documents/folder structure for an app. The
idea was that there's two types of objects: **categories** and **documents**,
the user can click through categories and download documents. A category can
contain other categories and documents. We only had to show the category the
user is currently in, the files and categories that are in that category and
some way to navigate one level higher. So there was no need to see children's
children etc.

<!-- more -->

A quick search on the [Ruby Toolbox](https://www.ruby-toolbox.com) shows
[Ancestry](https://github.com/stefankroes/ancestry) and a bunch of other options
but most of them are way to complicated for the simple goal I was trying to
achieve so I've decided to build it from scratch.

I started out with two models, the Category model, and the Document model.

``` ruby app/models/category.rb
class Category < ActiveRecord::Base
  belongs_to :parent, class_name: 'Category', foreign_key: "parent_id"
  validates :title, presence: true
  has_many :documents

  def children
    self.class.where(parent_id: id)
  end

  def parent_title
    parent.title if parent.present?
  end
end
```

The category can belong to other categories, and that optional parent is stored
in the `parent_id` variable. A category has a title as we need something to show
when listing the categories and a category can have several documents in it.

``` ruby app/models/document.rb
class Document < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :category
end
```

Documents have a title to display them (and in a real world application probably
a file to go with it) and it may belong to a category. If it has no category it
should be displayed on the top level of the tree.

``` ruby db/schema.rb
create_table "categories", force: true do |t|
  t.string   "title"
  t.integer  "parent_id"
end

create_table "documents", force: true do |t|
  t.string   "title"
  t.integer  "category_id"
end
```
The database schema should look something like this.

One of the problems with these models is that a category can reference to ANY
category as it's parent. So even itself, to prevent that we'll need a custom
validator, it can be added to the category model with the following line:

``` ruby app/models/category.rb
validates_with CategoryParentValidator
```

And the validator itself would look something like this:
``` ruby app/validators/category_parent_validator.rb
Class CategoryParentValidator < ActiveModel::Validator
  def validate(record)
    if !record.new_record? && record.parent_id == record.id
      record.errors[:parent] << I18n.t('cant_be_itself', scope: 'errors.messages')
    end
  end
end
```
If the record is new we shouldn't check if the parent_id is the same as the
current id because the current id will be nil. So a new record without a parent
would have both id's on nil but is still valid.

The next step in building the tree structure is the controller:
``` ruby app/controllers/documents_controller.rb
class DocumentsController < ApplicationController
  before_action :set_document, only: [:show]
  before_action :set_files_variables, only: [:index, :show]

  def index
  end

  def show
  end

  private
  def set_document
    @document = Document.find params[:id]
  end

  def set_files_variables
    @selected_category = params[:selected_category]
    @parent_category = get_parent_category_id(@selected_category)
    @categories = Category.where(parent_id: @selected_category)
    @documents = Document.where(category_id: @selected_category)
  end

  def get_parent_category_id(category_id)
    begin
      selected_category = Category.find(category_id)
      return selected_category.parent.id if selected_category.parent.present?
    rescue ActiveRecord::RecordNotFound
    end

    nil #the category was not found or there was no parent
  end
end
```
There's a bunch of variables we're going to need in the view, the selected
category is needed so we can show the title of the category we're currently in.
The parent_category is needed to navigate to one level higher, the categories
are the categories in the selected category and the documents are the documents
in the selected category.

``` erb app/views/documents/_document_list.html.erb
<h3>Document List</h3>
<ul id="document_list">
  <% if @selected_category.present? %>
    <li class="parent">
    <%= link_to '..', documents_path(selected_category: @parent_category) %>
    </li>
  <% end %>
<% @categories.each do |category| %>
  <li class="category">
    <%= link_to "#{category.title}", documents_path(selected_category: category.id) %>
  </li>
<% end %>

<% @documents.each do |document| %>
  <li class="document <%= document_icon_class(document) %>">
    <%= link_to "#{document.title}", document_path(document, selected_category: @selected_category) %>
  </li>
<% end %>
</ul>
```
I expected the view to be pretty complex but it turned out to be easier then I
expected. We show the selected category, a way of navigating and a list of
categories and files in the category. Because there's no need to see children's
children this stays pretty simple.
