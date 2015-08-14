---
layout: post
title: "Blogging with Vim"
date: 2013-11-16 08:13
comments: true
categories: [vim]
---

Writings blog posts with Vim is awesome! Obviously, if I thought otherwise I
wouldn't currently be writing this in Vim. Writing posts on my local machine
works perfectly for me as interruptions aren't as big of a problem as they
would be when I'd be writing in some textarea online. I can just close the file,
pick up whatever is interrupting me and continue whenever I want. Another nice
thing is that I often write posts while traveling by public transport and
writing the posts on my local machine means I don't have to rely on the internet
the public transport offers (which actually isn't too bad in the Netherlands).
Another thing that blogging in Vim makes possible is that you can just open a
single terminal screen, set it to fullscreen and write without any distractions.

<!-- more -->

Blogging in Vim wouldn't be half as cool if you wouldn't be able to deploy your
markdown files straight to your blog from the commandline. Blogging from your
terminal, everyone wants that right? Or is it just for weird developers? Ah
well... [Octopress](https://github.com/imathis/octopress) makes this possible!
You can write your post in markdown, run a rake command and tadaaa: it's
deployed and online for everyone to read! To get started with Octopress it will
take some minor configuration, or if you're anything like me a lot of
configuration but once setup it's a great way to blog.
[The Octopress site](http://octopress.org) has plenty of guides explaining
where to get started and where to start tweaking if you want a custom solution.

There's a couple of downsides of writing in Vim which are fixable by setting
your configuration properly. By default there's no line breaking in Vim so if
you would just start typing away all of your text will end up becoming one long
giant line of text. This is fixable by typing `:set textwidth=80`, keeping your
lines under 80 lines is a great convention while coding. But it works great for
keeping your texts readable as well. This is a setting I do not have in my
.vimrc because I only want this set while writing blog posts, automatic
line breaks are probably a bad idea while coding. I do have the setting
`:set colorcolumn=80` in my .vimrc which shows where the 80th character is in
every line so I can (attempt) to stay under the 80 char limit manually while
coding.

If you already started on your post without setting text width or if you
copy-pasted something and ruined your formatting you can select the text using
visualmode and type `gq` to reformat all of the selected text. Obviously it
would be even better if you use `gg{motion}` to achieve the same with less
keystrokes but personally I often use visualmode for this action.

For me one of the biggest loss when using Vim is the lack of spell checking,
because English isn't my native tongue I <s>definately</s> definitely need it
(and to be honest I a need it when writing Dutch texts as well). Of course
spell checking is something you can turn on, and with plenty of supported
languages. To turn spell checking on and highlight the incorrectly spelled words
use the command `:setlocal spell spelllang=en_us`. You can then navigate
forwards (`]s`) and backwards (`[s`) through these incorrectly spelled words and
by using the `z=` command you'll open up the list with correct spelling
suggestions. When writing tech articles there'll probably be a bunch of words
that are not in the list and thus incorrectly marked as incorrect. You can add
these words to the wordlist by using the `zg` command. There's an enormous
amount of alternative commands when fixing your typo's and spelling errors,
be sure to check out the relative help files at `:h spell`.

Most of these settings have shortcuts which make them easier to type out, Vim
help will tell you about them. For example `:help textwidth` (or even `:h
textwidth`, we are lazy devs!) will tell you that setting `:set tw` will do
exactly the same! And while you're in the help files anyways `:h set` will tell
you that you should use `:se tw=80` next time you're setting your text width!
