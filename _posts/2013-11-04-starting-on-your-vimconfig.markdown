---
layout: post
title: "Starting on your vimconfig"
date: 2013-11-04 19:47
comments: true
tags: [vim]
---

Once you've installed Vim(didn't install it yet?
[check out this blogpost](/blog/2013/11/03/getting-started-with-vim/)) it's time
to setup your configuration file, where the Vim magic happens. Vim
configurations are different for each developer, you start out with a blank
configuration file, or maybe with a copy of a vimrc of a developer you know and
over the years as you grow as a developer your vimrc will grow with you.

<!-- more -->

Your vimrc is something to be proud of, it shows what awesome work flow
improvements you've made and it shows how you know how to mold your tools
completely to work for you. A lot of developers share their dot files on GitHub
and if the developer's a Vim user it's very likely you can find his vimrc there
as well. Vims configuration file can be found in `~/.vimrc`, and obviously the
best way to edit it is in Vim. But as you might need some time to get used to
editing text and navigating through it in Vim you could of course open it in
your (previous) favorite text editor as well.

I'll show you some of the lines you can put in your vimrc that I have in there,
and of which I believe you really can't do without. If you would like to know
more about a setting then I explained about it, remember that you can use Vim
help for all of this stuff (for example `:h nocompatible`).

``` vim
set nocompatible
```
This will tell Vim to actually behave like Vim, and not try to be compatible
with Vi. An old editor which was created way before I was even born, so I can't
really be bothered about compatibility with it. I should probably look up what
the exact differences are but I was told this should be in there, so now I'm
telling you.

``` vim
syntax enable
```
Tell Vim to use color syntax highlighting, this will make coding a lot more
pleasant.

``` vim
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
```
I actually don't have these in my vimrc anymore but used to have this for quite
a while. In Vim you really (really!) shouldn't use the arrow keys for
navigation, I had a hard time doing so, so I used this set of configurations to
disable the key and tell me what key to use.

``` vim
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set copyindent
set listchars=tab:··,trail:·
set list
```
Auto indentation makes your life easier, these settings won't only take care of
your indentation, they will also make sure you're using spaces instead of tabs
for indentation. And last but not least they'll show you if the person before
you messed his tabs/spaces up by showing tabs in your code and showing trailing
spaces. The whole tabs vs spaces ends up being your personal preference so you
might want to tweak this to match your own preference.

``` vim
set cursorline
```
It highlights the entire line your cursor is on, not quite a must have, but I
think it just makes coding a bit more pleasant.

``` vim
set colorcolumn=80
```
You should really try to keep your lines shorter then 80 characters, it makes
your code way easier to read and has the nice advantage that you can actually
split screen your code on a laptop as well. This setting will draw a line at the
80 character limit, it's not prohibiting you from creating longer lines, but
just subtly reminding you.


``` vim
let mapleader=","
```
A lot of the shortcuts in Vim use the leader key to trigger them, (and the longer
you're developing the more you'll create) the default leader key however is `\`
which is pretty annoying, the comma is easy to reach so mapping the leader key to
your comma will make a lot of your shortcuts easier.

``` vim
set backspace=2
```
By default Vim can have some pretty weird behaviors, this corrects one of them.
For example: Vim won't remove newlines with backspace by default. Annoying!

``` vim
set history=1000
```
When using Vim in normal mode (where you enter the commands) you can navigate
through your previous commands using the arrow keys, by default it stores the
last 20 commands you gave Vim which normally should be more then enough. But it
never hurts to be safe, in case you forgot that awesome command you used a while
ago.

``` vim
set relativenumber
```
This is an incredible setting which took me way to long to find, navigating to
Vim can be a guess sometimes, you want to delete the piece of code in the next
couple of lines but how many lines is it exactly? You're at line 15, the other
code is at line 29, so thats 14 lines... These simple calculations will take a
slight amount of your time which would have been better spend coding. Relative
numbers will show you relative line numbers. Which means that in the gutter
where normally the line numbers start with 1 at the top of the file and go down
the gutter will show the current line as 0, the line above and below it as 1,
and above and below that as 2 etc.

``` vim
set encoding=utf-8
```
This one should be pretty obvious: it sets the character encoding used inside
Vim, it's not default though so make sure you set it.

``` vim
nmap k gk
nmap j gj
```
When using `k` and `j` to navigate up and down your code you expect to go to the
next line on your screen, thats not default though. Vim will send you to the
next line in the file, which if Vim wrapped the line because your screen's too
small might not be exactly what you meant. This completely annoyed me so I
remapped `k` and `j` to `gk` and `gj` which will make them behave like I want
them to.

These configurations are just the tip of the iceberg, there are way more options
to configure, but these should get you started. Make sure to browse through
other people's configurations as often as possible to learn new tricks and keep
tweaking your configuration to make your Vim the best there is.

I'll be writing more posts about Vim ([read more](/blog/categories/vim/)), so
make sure to read those too, expect articles about plugins, workflows and more!


