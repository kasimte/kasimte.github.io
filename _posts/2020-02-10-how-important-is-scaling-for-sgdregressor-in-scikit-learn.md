---
layout: post
title: "How important is scaling for SGDRegressor in SciKit Learn?"
tags: pandas regression sgd scikit-learn
---

I've been playing around with `SGDRegressor` from the scikit learn
library and was having some trouble with nonsensical outputs.

Even with a simple manufactured dataset, to which a `LinearRegressor`
could fit a perfect line, `SGDRegressor` was spitting out nonsensical
values.

Here was the sample dataset I used, where the predicted value was
simply 5 times the input value:

```
num_samples = 100
multiple = 5
y = np.array([i*multiple for i in range(num_samples)])
x = np.array([i for i in range(num_samples)])
x[:5], y[:5]

# Output:
# (array([0, 1, 2, 3, 4]), array([ 0,  5, 10, 15, 20]))
```

It wasn't until I started scaling the data that I was able to get the
results I expected.

From the [scikit-learn website](https://scikit-learn.org/stable/modules/sgd.html#tips-on-practical-use):

> Stochastic Gradient Descent is sensitive to feature scaling, so it is
> highly recommended to scale your data. For example, scale each
> attribute on the input vector X to [0,1] or [-1,+1], or standardize it
> to have mean 0 and variance 1. Note that the same scaling must be
> applied to the test vector to obtain meaningful results.

I created a Jupyter Notebook below as a simple demonstration.

## More

* [See the code: Jupyter Notebook](https://github.com/kasimte/machine-learning-playground/blob/master/notebooks/scikit-learn-sgdregressor-scaling.ipynb)
* [SGD: Tips on Pracitcal Use](https://scikit-learn.org/stable/modules/sgd.html#tips-on-practical-use)
* [StackOverflow: SGDRegressor nonsensical result](https://stackoverflow.com/questions/31443840/sgdregressor-nonsensical-result)
