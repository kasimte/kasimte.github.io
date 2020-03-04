---
layout: post
title: "Adding Brave Rewards to Jekyll on GitHub Pages"
tags: jekyll
permalink: adding-brave-rewards-to-jekyll-on-github-pages
---

I've been playing around
with [Brave as my primary web browser](https://brave.com/kas421) for
several months now, and even started to take for granted how pleasant
it is to have ads blocked by default.

It wasn't until today, though, that I went ahead and setup a Brave
Rewards account, and it seemed natural to experiment with adding this
website as a channel.

I ran into a small hitch, though, as verifying the channel requires a
`brave-rewards-verification.txt` file to a directory `.well-known`
directory of the site, so
it [shows up like this](.well-known/brave-rewards-verification.txt).

Since GitHub Pages, where this site is hosted, ignores directories
(and likely files, I imagine) prefixed with a `.`, though, it didn't
verify immmediately.

But adding the following to my `_config.yml` file solved everything:

```
# Force inclusion of directories and/or files in the
# conversion. .htaccess is a good example since dotfiles are excluded
#  by default.
include: [".well-known"]
```

See the [repository](https://github.com/kasimte/kasimte.github.io) for
more details.
