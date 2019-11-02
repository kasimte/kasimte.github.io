---
layout: post
title: Spinning Up with MacPorts
tags: macports mpi openmpi spinningup
---

OpenAI's Spinning Up tutorial is a great resource, but its [installation procedures](https://spinningup.openai.com/en/latest/user/installation.html#installing-python) aren't so friendly for those on Mac OSX and using MacPorts instead of HomeBrew.

After struggling a bit trying to figure out how to install `openmpi` with MacPorts, I finally stumbled across [this thread](https://github.com/openai/baselines/issues/114), which gave me an inkling as to where to go.

I kept on trying to run the `pip` install for the `spinningup` repo, but repeatedly hit this error when installing `mpi4py`.

```
_configtest.c:2:10: fatal error: 'mpi.h' file not found
#include <mpi.h>
```

It turns out I needed to install `openmpi-devel` AND activate it via MacPorts:


```
sudo port install openmpi-devel
sudo port select --set mpi openmpi-devel-mp-fortran
```

After this, all went well.
