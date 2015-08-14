---
layout: post
title: "The world of Objective-C through Ruby eyes"
date: 2013-10-30 20:45
comments: true
categories: [ruby, objective-c]
---

My contract says _Developer_ which might sound a bit allround but up until
recently 95% of the development I did was Ruby on Rails. With a rare sidestep
to Actionscript, Objective-C, Coffeescript, plain Ruby and more. I've always
wanted to do some more Objective-C and in my spare time I've made one or two
apps in the past (actually one finished and about 10 started but never finished
;)) But I believe the only way to learn something properly is by doing it 40
hours a week. So a couple of weeks ago I've finally had the luck that we
(Wirelab) got an Objective-C job and it was quiet enough for me to focus on
picking up Objective-C and building the app.

As I'm a Ruby developer and more specifically a Rails developer I'm quite a lazy
developer. When I run into a problem more often then not there's a gem to solve
it for me or there's a blog that explains step by step how to solve it. Rarely
I spend days or even hours on a single problem anymore.

<!-- more -->

So it was quite a shock for me to find the state the Objective-C "community" is
in. I say "community" because I've probably looked for it in the wrong places,
but the blogposts, tutorials and stack overflow answers (and questions) seem to
be of a poor quality compared with Ruby. The pride that ruby developers have in
their work doesn't seem to be present in the Objective-C scene: if it works its
good.

I don't want my code to work, I want my code to __shine__. I've been lucky to
have a friend who's an experienced Objective-C developer that has been pushing
me in the right direction last couple of weeks because I haven't found the
shining ambition a lot online. Like I've said before maybe I've just been
looking in the wrong places so please do correct me if I'm wrong. One awesome
thing the Objective-C community does have is [Cocoapods](http://cocoapods.org/).
On there I've found great pods (Objective-C's gems) like
[AFNetworking](https://github.com/AFNetworking/AFNetworking),
[SVProgressHUD](https://github.com/samvermette/SVProgressHUD),
[JASidePanels](https://github.com/gotosleep/JASidePanels) and many more. It's
not only an easy way to find these gems to make your life easier, it's also a
place to display your own shining code. (There is one thing wrong with these pods
though... They're named after the thing they actually do! Aweful, I've always
loved the smart gem names like Nokogiri, Capybara and Koala.

I want to share my way of being a lazy developer with the Objective-C developers
so I've decided to build some gems, or actually I should say pods. As a fresh
developer I will probably mess some things up badly, but I might also fix some
stuff thats weird for me but the experienced developers take for granted.

Last week I've worked on `NSDate+RelativeTime`, a pod you can find on
[Cocoapods](http://cocoapods.org/?q=nsdate%20relative%20time%20bart) or on
[GitHub](https://github.com/bartj3/NSDate-RelativeTime). It got some positive
feedback since I've posted it so I'll assume people are using it. Sadly there's
no actual stats on pod usage like there is with Rubygems. And I've got another
pod in the works.

I'm pretty satisfied with the result as it solves a problem I ran into a couple
of weeks ago and there didn't seem to be anything like this yet so I hope it
helps some other developers be lazy like me.

A thing in the pod that definitely doesn't shine yet is it's tests. Testing
with Objective-C, and especially continuous integration seems to be way harder
then it is with Ruby. And most of the resources I found were outdated. It
frustrates me I need to generate an entire project while there's only one file
with actual tests. And besides that only IOS is tested while it should work fine
on OSX as well, but I don't have the tests to prove it. If there's anyone out
there who would like to pair with me to get some more robust tests running and
getting some kind of CI setup that'd be awesome.

### I'm a lazy developer and working on making Objective-C developers just as lazy as me!
