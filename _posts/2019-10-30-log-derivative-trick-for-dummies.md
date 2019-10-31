---
layout: post
title:  The Log Derivative Trick For Dummies
---

I came across this while reading through [OpenAI's Spinning Up Reinforcement Learning tutorial](https://spinningup.openai.com/en/latest/spinningup/rl_intro3.html):

> The Log-Derivative Trick. The log-derivative trick is based on a simple rule from calculus: the derivative of \log x with respect to x is 1/x. When rearranged and combined with chain rule, we get:
>
>   &nabla;<sub>theta</sub>P(trajectory\|theta) = P(trajectory\|theta) log P(trajectory\|theta) 

For the calculus challenged, like myself, this may not be too obvious, so the following added details may help.

* log f(x) = 1/f(x) * f(x)' (chain rule) 
* log P(trajectory\|theta) = (1/P(trajectory\|theta)) * &nabla;<sub>theta</sub>P(trajectory\|theta)
* When rearranged, this is
  * &nabla;<sub>theta</sub>P(trajectory\|theta) = P(trajectory\|theta) log P(trajectory\|theta)

More:

* [https://medium.com/@aminamollaysa/policy-gradients-and-log-derivative-trick-4aad962e43e0](https://medium.com/@aminamollaysa/policy-gradients-and-log-derivative-trick-4aad962e43e0)
* [http://blog.shakirm.com/2015/11/machine-learning-trick-of-the-day-5-log-derivative-trick/](http://blog.shakirm.com/2015/11/machine-learning-trick-of-the-day-5-log-derivative-trick/)
