---
layout: post
title: Installing OpenMPI with MacPorts
tags: macports macosx homebrew
---

*Update: I don't recommend this anymore.*

I was trying to get up and running with OpenAI's [baselines repository](https://github.com/openai/baselines) today, and held my breath when I saw that 

> Installation of system packages on Mac requires Homebrew.

in the README of the repostiory.

I've had some nightmares trying to untangle the incompatibility of MacPorts and Homebrew on my Mac, and for this and that development reason am stuck with MacPorts on my Mac. 

It looked like the only things needed by Homebrew were `cmake` and `openmpi`, of which `openmpi` was the only one that gave me some difficulty.

Everytime I would try to activate `openmpi`, I would get this error:

```
$ sudo port configure openmpi-default
--->  Computing dependencies for libgcc
The following dependencies will be installed:  libgcc9
Continue? [Y/n]: y
--->  Activating libgcc9 @9.2.0_1
Error: Failed to activate libgcc9: Image error: /opt/local/include/gcc/c++/algorithm is being used by the active libgcc port.  Please deactivate this port first, or use 'port -f activate libgcc9' to force the activation.
```

The trick ended up being to deactivate `libgcc`, allowing `libgcc9`, a dependency of `openmpi` to be activated and installed.

```
sudo port deactivate libgcc
sudo port configure openmpi
```

After this, everything seemed to work:

```
$ sudo port configure openmpi
--->  Computing dependencies for openmpi
The following dependencies will be installed: 
 libgcc
 libgcc9
 openmpi-default
Continue? [Y/n]: y
--->  Activating libgcc9 @9.2.0_1
--->  Cleaning libgcc9
--->  Fetching archive for libgcc
--->  Attempting to fetch libgcc-2.0_2.darwin_18.x86_64.tbz2 from http://jog.id.packages.macports.org/macports/packages/libgcc
--->  Attempting to fetch libgcc-2.0_2.darwin_18.x86_64.tbz2.rmd160 from http://jog.id.packages.macports.org/macports/packages/libgcc
--->  Installing libgcc @2.0_2
--->  Activating libgcc @2.0_2
--->  Cleaning libgcc
--->  Fetching distfiles for openmpi-default
--->  Verifying checksums for openmpi-default
--->  Extracting openmpi-default
--->  Applying patches to openmpi-default
--->  Configuring openmpi-default
--->  Building openmpi-default
--->  Staging openmpi-default into destroot
--->  Installing openmpi-default @4.0.1_0+gcc9
--->  Activating openmpi-default @4.0.1_0+gcc9
--->  Cleaning openmpi-default
--->  Fetching distfiles for openmpi
--->  Verifying checksums for openmpi
--->  Extracting openmpi
--->  Configuring openmpi
--->  Some of the ports you installed have notes:
  openmpi-default has the following notes:
    The mpicc wrapper (and friends) are installed as:
    
      /opt/local/bin/mpicc-openmpi-mp (likewise mpicxx, ...)
    
    To make openmpi-default's wrappers the default (what you get when
    you execute 'mpicc' etc.) please run:
    
      sudo port select --set mpi openmpi-mp-fortran
$
```
