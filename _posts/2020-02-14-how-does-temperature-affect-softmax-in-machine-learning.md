---
layout: post
title: "How does temperature affect softmax in machine learning?"
tags: python softmax ml deep-learning
---

This notebook demonstrates the effects of high and low temperature settings on softmax. It includes code from the ground up to build an intuitive understanding of what is going on.


```python
import math
```

## Probabilities

Let's start something likely familiar, probabilities. Assume we have two possibilities, the first with a probability of 25% and the second with a probability of 75%.


```python
probabilities = [0.25, 0.75]; 
probabilities
```




    [0.25, 0.75]



## What's the deal with logits then?

From Stackoverflow:

> In Math, Logit is a function that maps probabilities ([0, 1]) to R ((-inf, inf))

Logits are just the `log` of the probabilities, so we can take the log of each probability above to get the `logits`.



```python
def logitsFrom(probabilities):
    return [math.log(x) for x in probabilities]

logits = logitsFrom(probabilities); logits
```




    [-1.3862943611198906, -0.2876820724517809]



In machine learning, the *logits layer* is a leyer near the end of a model, typically a classifier, which contains the logit of each classification.

## What is softmax?

The logits layer is often followed by a *softmax* layer, which turns the logits back into probabilities (between 0 and 1). From StackOverflow:

> Softmax is a function that maps [-inf, +inf] to [0, 1] similar as Sigmoid. But Softmax also normalizes the sum of the values(output vector) to be 1.

We can implement softmax on our logits array like so:


```python
def softmax(logits):
    bottom = sum([math.exp(x) for x in logits])
    softmax = [math.exp(x)/bottom for x in logits]
    return softmax

softmax(logits), sum(softmax(logits))
```




    ([0.25, 0.75], 1.0)



As you can see, we have our starting probability numbers back.

## What is softmax with temperature?

Temperature is a hyperparameter which is applied to logits to affect the final probabilities from the softmax. 

* A low temperature (below 1) makes the model more confident. 
* A high temperature (above 1) makes the model less confident.

Let's see both in turn.

## Low Temperature Example


```python
low_temp = 0.5
logits_low_temp = [x/low_temp for x in logits]
logits_low_temp
```




    [-2.772588722239781, -0.5753641449035618]



Now let's see what happens when we send this through softmax again.


```python
softmax(logits_low_temp), sum(softmax(logits_low_temp))
```




    ([0.1, 0.9], 1.0)



The higher probability of the two has risen from 0.75 to 0.9. The lower probability has dropped to 0.1.

## High Temperature Example


```python
# What happens if we apply a hightemperature?
low_temp = 5
logits_high_temp = [x/low_temp for x in logits]
logits_high_temp
```




    [-0.2772588722239781, -0.05753641449035618]




```python
softmax(logits_high_temp), sum(softmax(logits_high_temp))
```




    ([0.44528931866219296, 0.5547106813378071], 1.0)



With a high temperature setting, our probabilities are closer together.

## Related

* [https://stackoverflow.com/questions/41455101/what-is-the-meaning-of-the-word-logits-in-tensorflow](https://stackoverflow.com/questions/41455101/what-is-the-meaning-of-the-word-logits-in-tensorflow)


