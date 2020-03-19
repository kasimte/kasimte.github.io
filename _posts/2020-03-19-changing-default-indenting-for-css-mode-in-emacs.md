---
layout: post
title: "How do I change default indenting for CSS mode in Emacs?"
tags: emacs
---

After [installing stylelint for Emacs] a little while back, I found my
code linter complaining about CSS indenting. My default indenting was
set to 4 spaces, when the linter wanted 2.

These are some notes on configuring the default indenting for CSS mode
in Emacs.

1. Open Emacs.
2. `M-x customize-group` (option-x customize-group on Mac).
3. Specify `css` as the group to customize (`emacs` was the default for me).
4. Edit the `CSS Indent Offset` configuration:

```
Hide Css Indent Offset: 2
    State : SAVED and set.
   Basic size of one indentation step.
```

I assume this applies similarly to all the other code modes I use in
Emacs, which is a nifty little tip.


