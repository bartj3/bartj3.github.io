---
layout: post
title: "Keeping your workspace in sync using Dropbox"
date: 2013-11-07 08:52
comments: true
tags: [dotfiles]
---

I spend most of my time working on two systems, a desktop at work and a laptop
at home. As I spend a lot of that time in the terminal I've setup some things to
make sure my shell works exactly the same on both systems.

<!-- more -->

To achieve this I use [Dropbox](https://db.tt/gpBR2QOx) to sync all of my
dotfiles, if you haven't used Dropbox before you should definately give it a go.
It's a tool that keeps a folder in sync between your separate computer systems
(and phone) with the nice bonus of automaticly saving previous versions of all
of those files so if you accidentaly remove or overwrite one you can get it back
easily.

In my Dropbox folder I've got a folder called `global files/dotfiles` which
contains a lot of my dotfiles. The files and folders I keep in there are:
`.gemrc .gitconfig, .gitignore_global, .oh-my-zsh, .railsrc, .tmux.conf, .vim,
.vimrc, .zsh_history, .zshenv`

Obviously you should judge for yourself what files you will put in there but
these files are the ones that make sense for me to keep in sync.

To keep the files in sync you'll have to copy the originals files to your
dropbox folder and create a symlink to the Dropbox location in the old folder.
For example:

```
cd ~
mv .gemrc Dropbox/global\ files/dotfiles/.gemrc
ln -s Dropbox/global\ files/dotfiles/.gemrc .gemrc
```

After this your editor and shell should work exactly the same on all of your
systems.
