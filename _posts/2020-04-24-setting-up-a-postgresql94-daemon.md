---
layout: post
title: "Setting up a postgresql daemon on Mac OSX"
---

I was using Postgresql as the backend database for Rails development
and had version 9.1 installed up until my most recent upgrade to Mac
OSX Catalina.

Postgresql configuration is something I don't mess around with often
enough to really remember how I've set it up on my development
machine, so when I was forced to upgrade to 9.4, I couldn't remember
how I had setup Postgresql as a daemon to run by default.

The trick ended up being to install both `postgresql94` and
subsequently `postgresl94-server` via macports.

Upon installing the server, there is a handy message that tells you to
run `sudo port load postgresql94-server` to setup the daemon to run on
startup.

## From the Console

```
(base) Kasim:Atlas Kasim$ sudo port install postgresql94
--->  Computing dependencies for postgresql94
--->  Cleaning postgresql94
--->  Scanning binaries for linking errors
--->  No broken files found.                             
--->  No broken ports found.
(base) Kasim:Atlas Kasim$ sudo port install postgresql94-server
--->  Computing dependencies for postgresql94-server
--->  Fetching archive for postgresql94-server
--->  Attempting to fetch postgresql94-server-9.4.26_0.darwin_19.noarch.tbz2 from https://packages.macports.org/postgresql94-server
--->  Attempting to fetch postgresql94-server-9.4.26_0.darwin_19.noarch.tbz2.rmd160 from https://packages.macports.org/postgresql94-server
--->  Installing postgresql94-server @9.4.26_0
--->  Activating postgresql94-server @9.4.26_0
--->  Cleaning postgresql94-server
--->  Updating database of binaries
--->  Scanning binaries for linking errors
--->  No broken files found.                             
--->  No broken ports found.
--->  Some of the ports you installed have notes:
  postgresql94-server has the following notes:
    To create a database instance, after install do
     sudo mkdir -p /opt/local/var/db/postgresql94/defaultdb
     sudo chown postgres:postgres /opt/local/var/db/postgresql94/defaultdb
     sudo su postgres -c 'cd /opt/local/var/db/postgresql94 && /opt/local/lib/postgresql94/bin/initdb -D /opt/local/var/db/postgresql94/defaultdb'

    A startup item has been generated that will aid in starting postgresql94-server with launchd. It is disabled by default. Execute the following command
    to start it, and to cause it to launch at startup:
    
        sudo port load postgresql94-server
(base) Kasim:Atlas Kasim$ sudo port load postgresql94-server
--->  Loading startupitem 'postgresql94-server' for postgresql94-server
(base) Kasim:Atlas Kasim$ 
```

## Related

My brother recommended LaunchControl to me as a Mac OSX GUI program to
deal with startup items and daemons.
