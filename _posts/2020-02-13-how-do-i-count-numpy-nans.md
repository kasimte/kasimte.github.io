---
layout: post
title: "How do I count numpy nans?"
tags: python numpy
---

This post demonstrates counting [numpy.nan](https://numpy.org/doc/1.18/reference/generated/numpy.isnan.html) instances in a dataset. It borrows from the answer to the stack overflow question [here](
https://stackoverflow.com/questions/21778118/counting-the-number-of-non-nan-elements-in-a-numpy-ndarray-in-python).


```python
import numpy as np
!python --version
```

    Python 3.7.4


## Initialize a dataset

First, we'll initialize a 2d array of 10000 by 10000 ones to play around with.


```python
data = np.ones((10000,10000)); data, data.shape
```




    (array([[1., 1., 1., ..., 1., 1., 1.],
            [1., 1., 1., ..., 1., 1., 1.],
            [1., 1., 1., ..., 1., 1., 1.],
            ...,
            [1., 1., 1., ..., 1., 1., 1.],
            [1., 1., 1., ..., 1., 1., 1.],
            [1., 1., 1., ..., 1., 1., 1.]]), (10000, 10000))



## Replace random selection of 100 indicies with numpy.nan

Next, we can take a random selection of 100 indicies using the numpy's `randint` function.


```python
random_rows = [np.random.randint(0,10000,100)]
random_columns = [np.random.randint(0,10000,100)]
random_rows, random_columns
```




    ([array([2489, 2232, 9101, 5141, 8159, 4862, 1258,  578, 3545, 6002, 2447,
             2654, 8737, 4459, 7562, 7755,   30, 9217, 8159, 3206, 8070, 3869,
              493,  554, 7340, 6127, 2894, 2194, 7688, 5580, 6272, 4443, 7499,
             6647, 6391, 3980, 9350, 8889, 6701, 6119, 9408, 3741, 9822,  943,
             3355, 6495, 4133, 3974,  767,  638, 3816, 6424, 3894, 2285, 4650,
             1747, 4414,  934, 6903,   72, 7336, 6886, 8757, 3455, 2987, 1857,
             8539, 4877, 7290, 2168, 8699, 3784, 1050,  419, 6522,  331, 6852,
             6707, 5405, 6416,  804, 6580, 2666, 8495, 9113, 9860, 6967, 7874,
             7953, 8535, 8132,  703, 8393, 5499,  882, 6343, 7166,  773, 7869,
             4849])],
     [array([1449, 8017, 5184, 2633, 7042, 7816, 4290, 5996,  428,  729, 9694,
             4407, 7413, 1387, 5740, 9173, 1576, 1562, 5955,  221, 7362, 7812,
              725,  721,  475,  446, 4753, 1752, 2657, 7106, 8727, 7783, 2447,
             6598,  849,  528, 2812, 1062, 7311, 1908, 9881, 1644, 7622, 5661,
             2994, 6229, 9411, 9725,  453, 3844, 6221, 7172, 6114, 1270, 8570,
              514, 3096, 1782, 6512, 7163, 2003, 1463, 8042, 4274,   25, 2756,
             3827, 3400, 7097, 2116, 7922, 7810, 2001, 2310, 1143,   99,  755,
             9611, 7654, 7215, 1320, 8924, 3520, 2513, 3994, 8836, 3458, 6736,
             8653, 6721, 2790, 6165, 1782, 2814, 1164, 5302, 3506, 9960, 2816,
             2159])])



After we have some random indicies, populating the data with np.nan is as simple as setting it.


```python
data[random_rows, random_columns] = np.nan
```

## Replace randomly selected indices with np.nan

In order to count the number of nan instances in the dataset, we can call `np.isnan` to return a mask of true / false depending on whether the data is nan. Then we can use the `np.count_nonzero` function to sum up the total.


```python
np.count_nonzero(np.isnan(data))
```




    100



Alternatively, if we inverse the true /false mask, we can count the instances that are not nan.


```python
np.count_nonzero(~np.isnan(data))
```




    99999900


