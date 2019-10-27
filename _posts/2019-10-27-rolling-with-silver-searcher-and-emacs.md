---
layout: post
title: Rolling with Silver Searcher in Emacs
---

I was in the habit of switching from my Emacs session to the command line to run `git grep`, which my brother had seen a couple times, and recommended the [Silver Searcher (Ag)](https://github.com/ggreer/the_silver_searcher) search utility.

The initial install was straightforward via MacPorts:

```
port install the_silver_searcher
```

But setting up in Emacs took a couple more steps than I anticipated, so I've outlined some tips here.

First, I needed MELPA setup as a Emacs package archive, so I had to add this to my `.emacs` file:

```
;; Add MELPA as a resource for emacs packages.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
```

Then the `ag` package was easy enough to find (search for "silver").

Secondly, I needed to load `exec-path-from-shell` into my `.emacs` file as well:

```
;; Load exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
```

Only after this was I able to start running commands like `M-x ag-project` from within Emacs. 
