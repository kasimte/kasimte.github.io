---
layout: post
title: "PyTorch Data Manipulation Practice"
tags: pytorch
---

Just some small examples of

* [view](#view)
* [reshape](#reshape)
* [squeeze](#squeeze)
* [unsqueeze](#squeeze)
* [flatten](#flatten)
* [rand](#rand)

in pytorch. 

I must've seen a dozen examples of these in Jupyter notebooks, but can't seem to remember them unless I write it out like this myself.

## Import

```
import torch
```

## View

Instantitate a 3x4 tensor.

```
x = torch.tensor([[1,2,3,4],
                  [5,6,7,8],
                  [9,10,11,12]], dtype=torch.float32)
print(x)

# tensor([[ 1.,  2.,  3.,  4.],
#        [ 5.,  6.,  7.,  8.],
#        [ 9., 10., 11., 12.]])
```

View it as one dimension.

```
x = x.view(1,12)
print(x)

# tensor([[ 1.,  2.,  3.,  4.,  5.,  6.,  7.,  8.,  9., 10., 11., 12.]])
```

Move it back to three dimensions, but let pytorch figure out the rest with -1.

```
x = x.view(3,-1)
print(X)

# tensor([[ 1.,  2.,  3.,  4.],
#        [ 5.,  6.,  7.,  8.],
#        [ 9., 10., 11., 12.]])
```

View it as 2 dimensions.

```
x = x.view(2, 6)
print(x)

# tensor([[ 1.,  2.,  3.,  4.,  5.,  6.],
#        [ 7.,  8.,  9., 10., 11., 12.]])
```

## Reshape

We can also use reshape, although the implementation is slightly different. See [here](https://stackoverflow.com/questions/49643225/whats-the-difference-between-reshape-and-view-in-pytorch) for more details.

```
# Reshape it to 4 dimensions. 
x = x.reshape(4, -1)
print(x)

# Reshape it to original 3 dimensions
x = x.reshape(3, -1)
print(x)
```

Output:

```
tensor([[ 1.,  2.,  3.],
        [ 4.,  5.,  6.],
        [ 7.,  8.,  9.],
        [10., 11., 12.]])
tensor([[ 1.,  2.,  3.,  4.],
        [ 5.,  6.,  7.,  8.],
        [ 9., 10., 11., 12.]])
```

## Squeeze and Unsqueeze

Add an outer layer to the tensor.

```
y = x.view(1,2,-1)
print(y)

# Output:
# tensor([[[ 1.,  2.,  3.,  4.,  5.,  6.],
#         [ 7.,  8.,  9., 10., 11., 12.]]])
```

Squeeze removes these extra tensor layers.

```
y = y.squeeze()
print(y)

# tensor([[ 1.,  2.,  3.,  4.,  5.,  6.],
#        [ 7.,  8.,  9., 10., 11., 12.]])
```        
Unsqueeze does the opposite.

```
y = y.unsqueeze(0)
print(y)
# tensor([[[ 1.,  2.,  3.,  4.,  5.,  6.],
#         [ 7.,  8.,  9., 10., 11., 12.]]])
```

The argument to unsqueeze is the axis.

```
y = y.unsqueeze(1)
print(y)
# tensor([[[ 1.,  2.,  3.,  4.,  5.,  6.]],
#         [[ 7.,  8.,  9., 10., 11., 12.]]])
```

## Flatten

Flatten creates a one-dimensional tensor, sort of like `view(1, -1).squeeze()`.

```
print(y.flatten())
# tensor([ 1.,  2.,  3.,  4.,  5.,  6.,  7.,  8.,  9., 10., 11., 12.])
```

Compare that with this:

```
print(y.view(1,-1).squeeze())
# tensor([ 1.,  2.,  3.,  4.,  5.,  6.,  7.,  8.,  9., 10., 11., 12.])
```

## Rand

`rand` deals with random numbers.

```
# Create a tensor of size 1 with random number between 0 and 1.
z = torch.rand(1)
print(z)
# tensor([0.7780])

# Or pull out the value like this.
print(z[0])
# tensor(0.7780)
```