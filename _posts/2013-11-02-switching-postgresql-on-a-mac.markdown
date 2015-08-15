---
layout: post
title: "Switching Postgresql on a Mac"
date: 2013-11-02 09:03
comments: true
tags: 
---

Earlier today I decided to switch from [Postgres.app](http://postgresapp.com) to
a simple homebrew install of postgresql. Not because I'm not satisfied with the
app but I think it's just a bit overkill to start up a database. Together with
the [lunchy gem](https://github.com/mperham/lunchy) (a launchctl wrapper)
I found yesterday switching should be a piece of cake. So I threw Postgres.app
in the trashbin. Entered `brew install postgresql` and everything was supposed
to be unicorns and rainbows.

<!-- more -->

However I kept getting this error when trying to interact with the database via
Rails:
```
could not connect to server: No such file or directory
Is the server running locally and accepting
connections on Unix domain socket "/var/pgsql_socket/.s.PGSQL.5432"?
```
I had absolutely no clue where to look but after a while of messing around I
figured it out, the `pg` gem I use with Rails was installed with the old
Postgresql installed. And now I switched databases it couldn't connect anymore.
The solution is simple, **just uninstall the pg gem and reinstall it**.
