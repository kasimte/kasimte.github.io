---
layout: post
title: "Why can’t weight preferences be part of the state in multi objective reinforcement learning?"
tags: morl
permalink: why-cant-weight-preferences-be-part-of-the-state-in-morl
---

A friend and I were looking at the following diagram the other day of
a multi-objective Q value network.

![morl-neural-network]({{ site.url }}/assets/images/morl-neural-network.png)

<small><i>Image Credit: [Runzhe Yang](https://www.cs.princeton.edu/~runzhey/demo/multi-objective-reinforcement-learning.pdf)</i></small>

And my friend, asked: "Why can't the weight preferences be considered
part of the state?" The network takes both `state` and `weights` as
input, so why not just consider `weighs` as part of the `state`, which
can be formulated however we want?

I had to go back to the formal definition of
a
[Markov Decision Process](https://en.wikipedia.org/wiki/Markov_decision_process).

In an MDP is a 4-tuple *(S, A, P, R)*, where P is the probability of the
next state given a current state and action. 

Weight preferences, however, are not part of this equation. Weight
preferences typically come from the a user, and in multi-objective
reinforcement learning, the problem setting deals with not knowing a
user’s weight preferences beforehand.

## More

* [A Generalized Algorithm for Multi-Objective Reinforcement Learning and Policy Adaptation](https://www.cs.princeton.edu/~runzhey/demo/multi-objective-reinforcement-learning.pdf), by Runzhe Yang
