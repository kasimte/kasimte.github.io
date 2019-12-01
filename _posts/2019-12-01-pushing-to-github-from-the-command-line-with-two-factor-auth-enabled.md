---
layout: post
title: "Pushing to GitHub from the Command Line with Two-Factor Authentication Enabled"
tags: github 2fa command-line
---

I had been struggling recently with GitHub, after having turned on
two-factor authentication for my account. Authentication for pushing
to git repositories on my account no longer seemed to work.

For a while, I used the GitHub Desktop client as a workaround, until
more recently when I wanted to clone other people's repositories, but
add my own account as an additional remote and push to my own account.

It turns out GitHub recommends creating a personal access token for
the command line in this scenario, as outlined here:

https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line

## More

* [Using command-line git with GitHub 2FA](https://gmacario.github.io/2017/08/08/cmdline-git-with-github-2fa.html)


