---
layout: post
title:  Issues with GCC when Installing mujoco-py
---

I kept on running into this GCC error when trying to install `mujoco-py` for OpenAI’s Spinning Up tutorials:

```
(spinningup) Kasim:spinup Kasim$ pip install -U 'mujoco-py<2.1,>=2.0'
...
...
...
      'Could not find GCC executable.\n\n'
  RuntimeError: Could not find GCC executable.
  
  HINT: On OS X, install GCC with `brew install gcc`. or `port install gcc`.
  ----------------------------------------
  ERROR: Failed building wheel for mujoco-py
```

At this point, it wasn’t obvious to me where to go, but finally made some headway by searching around with `port search gcc` and installing `gcc7` :

```
(spinningup) Kasim:spinup Kasim$ sudo port install gcc7
--->  Computing dependencies for gcc7
--->  Fetching archive for gcc7
--->  Attempting to fetch gcc7-7.4.0_3.darwin_18.x86_64.tbz2 from https://pek.cn.packages.macports.org/macports/packages/gcc7
      [                                        ]  58.8 %        speed: 745.3 KiB/s        [                                        ] --->  Attempting to fetch gcc7-7.4.0_3.darwin_18.x86_64.tbz2.rmd160 from https://pek.cn.packages.macports.org/macports/packages/gcc7
--->  Installing gcc7 @7.4.0_3
--->  Activating gcc7 @7.4.0_3
--->  Cleaning gcc7
--->  Scanning binaries for linking errors
--->  No broken files found.                             
--->  No broken ports found.
```

Afterwards, installing `mujoco-py` seemed to get by without a hitch:

```
Successfully built mujoco-py
Installing collected packages: Cython, imageio, monotonic, fasteners, glfw, mujoco-py
Successfully installed Cython-0.29.13 fasteners-0.15 glfw-1.8.3 imageio-2.6.1 monotonic-1.5 mujoco-py-2.0.2.7
(spinningup) Kasim:spinup Kasim$ 
```

There was some extra light at the end of the rainbow, as this was one of the last install hurdles to getting the Spinning Up RL environment up and running.

![SpinningUp](/assets/images/spinning-up-first-run.png)
