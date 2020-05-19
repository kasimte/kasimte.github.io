---
layout: post
title: "Emacs on Mac OSX Catalina"
tags: emacs
permalink: installing-emacs-on-mac-osx-catalina
---

I made the dreadful mistake of upgrading to Mac OSX Catalina this
week, while in the midst of some programming projects, and all of a
sudden Emacs stopped working.

From the command line, a which emacs returned no results:

```
$ which emacs
$
```

Nothing.

A quick search turned up some brave souls who have trodden down this
upgrade path before me and I could see this wasn't an isolated
problem. There are some other blog posts about this that go into more
detail, but in short, I had to

1. go to System Preferences > Privacy > Full Disk Access > Add Emacs
2. update my `.bash_profile` file in my home directory so that my `EDITOR` now reads:

```
export EDITOR="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
```

## Related

* [https://emacs.stackexchange.com/questions/53026/how-to-restore-file-system-access-in-macos-catalina](https://emacs.stackexchange.com/questions/53026/how-to-restore-file-system-access-in-macos-catalina)
* [https://stackoverflow.com/questions/59234713/how-to-launch-emacs-in-console-on-catalina](https://stackoverflow.com/questions/59234713/how-to-launch-emacs-in-console-on-catalina)
