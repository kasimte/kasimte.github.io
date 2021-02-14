---
layout: post
title: "Clearing up harddrive space with docker prune"
tags: terminal productivity docker
---

My brother taught me a neat one-line trick today to clear up some
extra harddrive space with `docker prune`.

It is pretty straight-forward:

```bash
docker image prune
```

What does this do? It searches through all the docker images you have
locally on your computer and deletes any that don't have any
containers referencing them.

An `image` is like the saved docker instance and a `container` is an
instantiation of an `image`. You may have multiple `contianer` objects
for each `image`, but you may also have none.

This cleared up a couple gigs for me but I could se eit clearing up a
lot more space for someone using docker more heavily.
