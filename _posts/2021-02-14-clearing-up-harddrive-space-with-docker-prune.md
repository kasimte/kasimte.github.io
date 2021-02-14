---
layout: post
title: "Using z"
tags: terminal productivity
---

My brother introduced me to `z` today. Talk about fast directory navigation from the command line! `z` tracks directories you visit in the Terminal and offers fast navigation to previously visited locations via name or regex.

```bash
# `z` brings up a list of directories I've visited, sorted by frequency.
Kasim:~ Kasim$ z
common:    /Users/Kasim/Projects
149952     /Users/Kasim/Projects/Atlas
179111     /Users/Kasim/Projects
299664     /Users/Kasim/Projects/nodeappgen
389657     /Users/Kasim/Projects/atlas
# `z atlas` goes to the most frequently directory matching `atlas`
Kasim:~ Kasim$ z atlas
Kasim:atlas Kasim$ pwd
/Users/Kasim/Projects/atlas
# `z node` goes to the most frequently directory matching `atlas`
Kasim:atlas Kasim$ z node
Kasim:nodeappgen Kasim$ pwd
/Users/Kasim/Projects/nodeappgen
Kasim:nodeappgen Kasim$
```

Installing was a breeze. I copied the `z.sh` file from GitHub (https://github.com/rupa/z/blob/master/z.sh) to `~/bin/z.sh` and added the following to my `.bash_profile`:

```bash
################################################
## z: https://github.com/rupa/z/blob/master/z.sh
################################################
. ~/bin/z.sh
```
