---
layout: post
title: Pro Tip for Searching in Emacs
tags: emacs tips hacking coding
---

I used to exit my Emacs workflow to use `git grep` from the command
line a lot. That was until my brother recently leveled up my coder
search game with the following commands directly in Emacs:

For searching the entire git project that one is currently working in:

```
M-x ag-project
```

This requires the Silver Searcher plugin, which is super fast and
provides direct navigation to the searched files.

For searching only the current directory:

```
M-x grep find
```

This scopes the search to whatever directory one is currently browsing
in Emacs, which can be useful for searches with too many results.
