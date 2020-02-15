---
layout: post
title: "Setting up MathJax and LaTeX on Jekyll"
tags: jekyll math latex
permalink: how-do-i-setup-mathjax-and-latex-on-jekyll
---

Inspired by
fastai's
[blog template](https://www.fast.ai/2020/01/16/fast_template/), I
setup MathJax for Jekyll on this blog today.

Now I can write stuff like $\sum_n (x)$, or alternatively in this form:

$$
\sum_n (x)
$$

Setup involves two steps:

1. Adding this [code snippet](https://gist.github.com/kasimte/3749c1d0b18bd2249b748fe7fd3abe87) to `_includes/head.html`.
2. Adding `use_mathjax: true` to the `_config.yml` file.

Afterwards, I was able to write LaTeX right in my markdown blog post
files, invoking the above examples with `$\sum_n (x)$` and `$$\sum_n
(x)$$`, respectively.
