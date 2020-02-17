---
layout: post
title: "How do I use numpy's stack, vstack, and hstack?"
tags: python numpy 
permalink: how-do-i-use-numpy-stack-vstack-and-hstack
---

This post contains examples of formatting numpy arrays with `stack`,
`vstack`, and `hstack`.


```python
import numpy as np
```

## Sample data 

Let's start with some normal Python lists to start.


```python
arrays = [[i, i+1] for i in range(0, 6, 2)]
arrays
```




    [[0, 1], [2, 3], [4, 5]]



## numpy.stack

https://docs.scipy.org/doc/numpy/reference/generated/numpy.stack.html

`numpy.stack` is the most general of the three methods, offering an axis parameter for specifying which way to put the arrays together.

With axis 0, we end up with a shape similar to what our original Python lists were in.


```python
stack_axis_zero = np.stack(arrays, axis=0)
stack_axis_zero, stack_axis_zero.shape
```




    (array([[0, 1],
            [2, 3],
            [4, 5]]), (3, 2))



Notice how this is similar to the standard `numpy.array` creation from Python lists function.


```python
np.array(arrays), np.array(arrays).shape
```




    (array([[0, 1],
            [2, 3],
            [4, 5]]), (3, 2))



`numpy.stack` is more abstract, however, and offers an axis change as well.


```python
stack_axis_one = np.stack(arrays, axis=1)
stack_axis_one, stack_axis_zero.shape
```




    (array([[0, 2, 4],
            [1, 3, 5]]), (3, 2))



## numpy.vstack

`numpy.vstack` implies a vertical stack, and we end up with a similar result as above.


```python
vertical_stack = np.vstack(arrays)
vertical_stack, vertical_stack.shape
```




    (array([[0, 1],
            [2, 3],
            [4, 5]]), (3, 2))



Notice how this is similar to the more abstract `numpy.stack` method, operating on axis 0.


```python
s = np.stack(arrays, axis=0)
s, s.shape
```




    (array([[0, 1],
            [2, 3],
            [4, 5]]), (3, 2))



Which is also similar to creating the expected shape from `numpy.array`, when operating on lists.


```python
a = np.array(arrays)
a, a.shape
```




    (array([[0, 1],
            [2, 3],
            [4, 5]]), (3, 2))



## numpy.hstack

`nummpy.hstack` is a little different, reducing the dimension and appending the arrays into one.


```python
horizontal_stack = np.hstack(arrays)
horizontal_stack, horizontal_stack.shape
```




    (array([0, 1, 2, 3, 4, 5]), (6,))



But it can also work on higher order dimensions.


```python
a = np.array([[1],[2],[3]])
b = np.array([[4],[5],[6]])
c = np.array([[7],[8],[9]])

np.hstack([a, b, c])
```




    array([[1, 4, 7],
           [2, 5, 8],
           [3, 6, 9]])


