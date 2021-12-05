---
layout: post
title:  The Log Derivative Trick For Dummies
tags: spinningup math reinforcement-learning
---

I came across this while reading through [OpenAI's Spinning Up Reinforcement Learning tutorial](https://spinningup.openai.com/en/latest/spinningup/rl_intro3.html):

> The Log-Derivative Trick. The log-derivative trick is based on a simple rule from calculus: the derivative of log x with respect to x is 1/x. When rearranged and combined with chain rule, we get:
>

$$\nabla_{\theta} P(\tau|\theta) = P(\tau|\theta) \nabla\log P(\tau|\theta)
$$

For the calculus challenged, like myself, this may not be too obvious, so the following added details may help. 

The first part is the chain rule from calculus:

$$
\log f(x) = \frac{1}{f(x)} * f(x)'
$$

If we replace $f(x)$, we get:


$$
\log P(\tau|\theta) = \frac{1}{P(\tau|\theta)} * \nabla_{\theta}P(\tau|\theta)
$$


When rearranged, this is

$$
\nabla_{\theta} P(\tau|\theta) = P(\tau|\theta) \log P(\tau|\theta)
$$

### More

* [https://medium.com/@aminamollaysa/policy-gradients-and-log-derivative-trick-4aad962e43e0](https://medium.com/@aminamollaysa/policy-gradients-and-log-derivative-trick-4aad962e43e0)
* [http://blog.shakirm.com/2015/11/machine-learning-trick-of-the-day-5-log-derivative-trick/](http://blog.shakirm.com/2015/11/machine-learning-trick-of-the-day-5-log-derivative-trick/)
