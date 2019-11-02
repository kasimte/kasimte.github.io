---
layout: post
title: Installing an older version of OpenSSL via MacPorts
tags: macports macosx openssl bro
---

I had to install an older version of OpenSSL via MacPorts today and was having trouble until my brother pointed me to the MacPorts website on how to do it. 

The trick ended up being checking out an older commit of the MacPorts repostiory first:

```
git clone --single-branch https://github.com/macports/macports-ports.git
```

The `--single-branch` option makes it so only one branch is downloaded. This may save you a little time, as the repository ends up being pretty big.

In my case, I was looking for version `openss@1.0.2p`, which required browsing the repository on GitHub, finding the particular commit on which the version was available and installing directly from the relevant directory in the repository:

```
$ cd devel/openssl
$ sudo port install
```

And voila, I finally got my desired port version installed:

```
--->  Computing dependencies for openssl
--->  Fetching archive for openssl
--->  Attempting to fetch openssl-1.0.2p_0.darwin_18.x86_64.tbz2 from http://jog.id.packages.macports.org/macports/packages/openssl
--->  Attempting to fetch openssl-1.0.2p_0.darwin_18.x86_64.tbz2 from https://packages.macports.org/openssl
--->  Attempting to fetch openssl-1.0.2p_0.darwin_18.x86_64.tbz2 from http://kmq.jp.packages.macports.org/openssl
--->  Fetching distfiles for openssl
--->  Attempting to fetch openssl-1.0.2p.tar.gz from http://cjj.kr.distfiles.macports.org/openssl
--->  Verifying checksums for openssl                                                
--->  Extracting openssl
--->  Applying patches to openssl
--->  Configuring openssl
--->  Building openssl
--->  Staging openssl into destroot
--->  Installing openssl @1.0.2p_0
--->  Deactivating openssl @1.1.1d_0
```
