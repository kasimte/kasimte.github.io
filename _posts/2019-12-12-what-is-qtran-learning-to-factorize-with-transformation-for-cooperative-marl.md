---
layout: post
title: "[PAPER REVIEW] QTran: Learning to Factorize with Transformation"
tags: marl mdp rl reinforcement-learning qtran qmix dec-pomdp papers
---

*As explained by Kasim Te and Yajie Zhou.*

I recently
read 
[QTRAN: Learning to Factorize with Transformation for Cooperative Multi-Agent Reinforcement Learning](https://arxiv.org/abs/1905.05408),
and also met with the [primary author](https://github.com/Sonkyunghwan) to discuss its
details. Here are some of my notes.

## What is QTran?

QTran is a [value-based](https://lilianweng.github.io/lil-log/2018/02/19/a-long-peek-into-reinforcement-learning.html#value-estimation) solution to
a [multi-agent reinforcement learning](https://github.com/LantaoYu/MARL-Papers) (MARL) task, focusing
on centralized training and decentralized execution
(CTDE). Although the global state may be used during training, at
execution time, each agent uses an individual policy to determine
actions, which is based on that agent’s observation (often partial) of
the global state. This type of task is referred to as a decentralized
partially observable markov decision process (DEC-POMDP). 

![dec-pomdp](/assets/images/qtran/dec-pomdp.png)

Here, 

* *P* is the probability of the next state *s'* based on the current state *s* and joint action ***u***.
* *R* is the shared reward function based on the current state *s* and joint action ***u***
* *O* is the observation function for agent *i* based on the current state *s*

The setting is cooperative, so agents share the reward.

## What is the factorization approach?

QTran takes
a [factorization](https://en.wikipedia.org/wiki/Factorization)
approach, in which the optimal joint action-value Q function (on which
the optimal joint policy is based) is decomposed into individual Q
functions for each agent to determine decentralized individual
policies for each agent.

A joint Q function is said to be factorizable into individual agent Q
functions if the following holds:

![igm](/assets/images/qtran/igm.png)

In the above, ***u*** is the joint action and ***tau*** is the state, represented
as the joint action-observation history. If the optimal joint action
is equivalent to the set of optimal individual actions *[u-i]*, then
the joint Q function is said to be factorizable by the individual Q
functions. In such a scenario, executing the optimal individual policies based
on the individual Q functions will result in optimizing the joint Q
function as well, even if executing in a decentralized manner.

## Motivation: Previous Approaches

VDN and [QMix](https://arxiv.org/abs/1803.11485) are two prior representative factorization
approaches. They learn a joint Q function and ensure factorizability
by adding a sufficient condition as a constraint. More specifically,
VDN ensures it via additivity:

![vdn-additivty](/assets/images/qtran/vdn-additivity.png)

And QMix, via monotonicity:

![qmix-monotonicity](/assets/images/qtran/qmix-monotonicity.png)

In the first, as the joint Q is simply the sum of the individual Q
functions, maximizing any individual Q function will also maximize the
joint Q function. The second expands upon this and allows non-linear
relationships between the joint Q and each individual Q, as long as
monotonicity is preserved.

## What about this game, though?

![non-monotonic-matrix-game](/assets/images/qtran/non-monotonic-matrix-game.png)

What's the optimal joint action of the non-montonic matrix game on the
left? It doesn't take long to see it is for both players to choose
*A*. And yet VDN and QMMIX both fail to learn the optimal joint action.

In many scenarios, the true joint Q function is likely very
complex. It is possibly not convex and possibly not monotonic. In
fact, it is possibly not even factorizable. And since the learned
joint Q function from VDN and QMix are bound by the above constraints,
they cannot express dynamics that are not additive or monotonic,
respectively.

## What is QTran’s approach?

QTran’s approach loosens the constraints and learns a joint Q function
with any possible factorization.

![hypothesis-space](/assets/images/qtran/hypothesis-space.png)

It does so by specifying the following constraint:

![qtran-sufficient-condition](/assets/images/qtran/qtran-sufficient-condition.png)

How does this work? QTran learns a joint Q function and uses a
separate, transformed joint Q prime function to ensure factorization,
where the transformed joint Q prime function is defined as the sum of
the individual Q functions. The objective loss function for training
the neural nets is based on a combination of training the main joint Q
function and other elements to ensure factorization. Quoting the
paper,

> One interpretation of this process is that rather than directly
 factorizing Qjt, we consider an alternative joint action-value
 function (i.e. Q’jt) that is factorized by additive
 decomposition. The function Vjt(T) corrects for the discrepancy
 between the centralized joint action-value function Qjt and the sum
 of individual joint action-value functions [Qi].”
 
Here is a simplified visualization for intuition:

![qtran-intuition](/assets/images/qtran/qtran-intuition.png)

## What does the architecture look like?

![qtran-architecture](/assets/images/qtran/qtran-architecture.png)

Above is a diagram of the QTran architecture from the paper. Of note,
there are three neural networks, all sharing parameters:

* an individual action-value network: [Qi]
* a joint action-value network: Qjt
* a state-value network: Vjt

The first is used for decentralized execution and additively for
calculating joint Q prime. The second is used for approximating the
true joint Q value. The third is used in combination with joint Q
prime to ensure factorization during learning.

## How does this even work?

All three are neural networks, sharing parameters and an objective
loss function. The loss has three components:

![qtran-loss](/assets/images/qtran/qtran-loss.png)

The first component is the temporal difference loss (TD error), which
is based on a standard deep Q network. It trains the joint Q function
to approximate the true joint Q function, and is an approach others
have used previously with success.

The novelty of QTran lies in the second and third components of the
loss, which ensure factorizability by training joint Q prime (which is
simply the sum of the individual Q functions by definition) to match
the optimal actions of joint Q.

The second component (opt for optimal) adds to the loss if joint Q
prime is greater than joint Q in the optimal action case. The third
part of the loss adds to the loss if joint Q prime is less than joint
Q in the non-optimal case. In Lopt and Lnopt, joint Q is denoted as
joint Q hat because these portions of the loss are not used to train
joint Q. In the author’s implementation, this is done by calling
Tensorflow’s `stop_gradient` command on joint Q hat.

The total loss then just becomes a sum of all three
components. Visually, this can be represented like this:

![qtran-loss-intuition](/assets/images/qtran/qtran-loss-intuition.png)

## More

* [QTran Presentation Slides](https://docs.google.com/presentation/d/1bamDeYgYZTo2Ty-npoCy5FSekltOdRju24_tDDH95zQ/edit?usp=sharing)
* [Presentation on YouTube](https://youtu.be/BO0RZw3RHVg) (a bit rough, as this was an informal run)


