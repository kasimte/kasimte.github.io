---
layout: post
title: "Running a program as a background process from the command line"
tags: command-line
---

In short, add "&" to your command to launch it as a background process
from the terminal.

I'm in the habit of launching programs on MacOSX from the command
line, with the most notable example probably being GitX, my favorite
git GUI program.

A few months ago, though, while playing with GitX installs, GitX
started hogging my terminal and launching in the foreground when I
would call it from Terminal. I would have to use GitX and then close
it before command came back to my terminal session.

My brother showed me this neat trick to signify launching something as
a background process. Instead of `gitx`, I just type `gitx&` and I
still command my terminal:

```
Kasim:kasimte.github.io Kasim$ gitx&
[1] 56298
Kasim:kasimte.github.io Kasim$ 
```
