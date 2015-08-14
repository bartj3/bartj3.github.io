---
layout: post
title: "Configure your Vim for easy searching"
date: 2013-11-12 18:26
comments: true
categories: [vim]
---

When navigating through Vim you'll search a lot using the `/` command, which
works 'ok' by default but there's a couple of settings you can make to increase
Vims search functionality a lot.

<!-- more -->

These are the settings I have in my `.vimrc`:

``` vim
set incsearch
```
Normally Vim will wait with searching until you've completed your search pattern
and once you press enter it will search for a match. Once you've set `incearch`
it will immediately start searching as you type. So you'll see where the first
match of your search pattern is, pretty handy as you'll immediately see whether
your pattern is correct or not.

``` vim
set hlsearch
```
This will highlight all of the matches of your search pattern, making it easy to
show where and how often your pattern matches.

``` vim
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch
```
This will disable the highlights when you enter insertmode and will turn them
back on when you leave insertmode. So if you've searched and want to change
something it'll stop highlighting the results but once you're done editing
you'll be able to continue your search.

``` vim
map <Leader>cs :nohlsearch<cr>
```
Highlighting your results is great, but you'll want to turn the highlights off
once you're done with them. Typing `:nohlsearch` will do the trick, but as this
is something I do quite often I've created a shortcut for it: `<Leader>cs`
clears all the search results (**C**lear **S**earch).

There's plenty more stuff to tweak about searching through Vim, these are the
ones I've set but if you want to learn more tricks be sure to check out Vim's
awesome help guides. They've got an entire chapter about searching, check it out
at: `:h usr_27` 

Am I searching through my files the hard way or am I missing an awesome setting?
Please let me know in the comments, via mail or on Twitter!
