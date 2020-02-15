---
layout: post
title: "Is there a time difference between numpy.zeros and numpy.empty?"
tags: numpy pyhton
permalink: is-there-a-time-difference-between-numpy-zeroes-and-numpy-empty
---

I was reading
on
[this thread](https://stackoverflow.com/questions/43145332/numpy-array-of-zeros-or-empty) on
StackOverflow about the difference between a numpy array of zeros and
empty.

Does it make much difference when initializing an array? I decided to
play around with Python's timeit to see the time difference.


```python
import timeit
import numpy as np
```

We can initialize a big number to put into our loop first.


```python
big = 10**6; big
```




    1000000



And then move on to timing our array initializations.


```python
%timeit np.empty([big, big])
```

    17.7 ms ± 150 µs per loop (mean ± std. dev. of 7 runs, 100 loops each)



```python
%timeit np.zeros([big, big])
```

    17.6 ms ± 208 µs per loop (mean ± std. dev. of 7 runs, 100 loops each)


Although there is a difference, it doesn't seem to be much.
