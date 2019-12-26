---
layout: post
title: "Padding Tensors with PyTorch cat"
tags: pytorch tips
---

I found myself wanting to pad a tensor with zeroes last week, and wasn't sure how to do so most easily in pytorch.

This is a short example of the pytorch `cat` function, mostly for my own memory.

First, let's import the PyTorch library.


```
import torch
```

Let's say we have a 2x2 tensor, like so:

```
first = torch.ones(2, 2)
first
# Output:
# tensor([[1., 1.],
#         [1., 1.]])
```

And another 2x2 tensor, like so:

```
second = torch.zeros(2,2)
second
# Output:
# tensor([[0., 0.],
#         [0., 0.]])
```

We can put them together with the `cat` command like so:

```
third = torch.cat((first, second), 1)
third
# Output:
# tensor([[1., 1., 0., 0.],
#         [1., 1., 0., 0.]])
```

The first argument is the tuple of tensors to concatenate and the second argument is the dimension on which to append them. The function will check the tensors are of the same size on the dimension specified (here, 2 and 2).

Since the size of our tensors also match in the zero index dimension, we can also combine them like so:

```
fourth = torch.cat((first, second), 0)
fourth
# Output: 
# tensor([[1., 1.],
#         [1., 1.],
#         [0., 0.],
#         [0., 0.]])
```

## More

* [Example on Google Colab](https://drive.google.com/file/d/1OdfNAc3PhzU0-rC7pKFU_4NUzaj_gbKK/view?usp=sharing)
