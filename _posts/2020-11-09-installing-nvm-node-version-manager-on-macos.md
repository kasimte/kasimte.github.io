---
layout: post
title: "Installing nvm (node version manager) on MacOS"
tags: node macos
---

I installed `nvm` today following the instructions on the [GitHub repository](https://github.com/nvm-sh/nvm#installing-and-updating). It is a simple one line install:

```bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
```

I had to copy the bash (I use bash) shell setup manually to my `~/.bash_profile` file in my HOME directory, though:

```bash
#########################
## Node Version Manager
#########################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```

And then also restart my Terminal session for good measure. After that, everything seemed to go okay.
