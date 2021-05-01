# What percentage of samples from a dataset fall into a range of another dataset? 

This notebook demonstrates using Python to compare two datasets with one variable. More specifically, it answers "What percentage of samples from dataset A fall into a particular range (e.g., the interquartile) of dataset B?" We use Python 3, numpy, and scipy.


```python
!python --version
```

    Python 3.7.4



```python
import numpy as np
import scipy.stats
```

Consider the following two datasets. I have chosen easy ones for clarity, but this methodology should work on any datasets of a single variable.


```python
a = np.arange(10, 40)
b = np.arange(0, 100)
a, b
```




    (array([10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
            27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39]),
     array([ 0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 16,
            17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33,
            34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
            51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67,
            68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84,
            85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99]))



How many data points from dataset A fall into the interquartile range of dataset B? For this, we can create a numpy histogram from dataset B, translate that into a random variable histogram distribution using scipy, and then call the `ppf` function for the range we want. Here, I round for convenience.


```python
hist_b = np.histogram(b, bins=100)
dist_b = scipy.stats.rv_histogram(hist_b)
start = dist_b.ppf(0.25).round(2)
finish = dist_b.ppf(0.75).round(2)
start, finish
```




    (24.75, 74.25)



Next, I create a similar distribution for dataset `a`, but now I take the ppf values from dataset `b` and call the `cdf` function. Taking the difference tells me the percentage of values from dataset `a` that are in the specified range in `b`.


```python
hist_a = np.histogram(a, bins=100)
dist_a = scipy.stats.rv_histogram(hist_a)
(dist_a.cdf(finish) - dist_a.cdf(start)).round(2)
```




    0.5



In our sample, the answer is 50%.
