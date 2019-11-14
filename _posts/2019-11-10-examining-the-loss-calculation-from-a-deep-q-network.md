---
layout: post
title: Examining the Loss Calculation from a Deep Q Network
tags: rl reinforcement-learning atari deepmind
---

I finally got around to reading [*Playing Atari with Deep Reinforcement Learning*](https://arxiv.org/abs/1312.5602),
a well cited paper from a few years back where DeepMind trained a
neural network to play several Atari games.

Digging into RL and OpenAI's gym, I kept on seeing references to it and it seemed like only a matter of time until I would have to make my way back to it. The paper did not disappoint, as even in the "Background" section, some details that previously were a bit fuzzy became clear.

I was familiar with stochastic gradient descent, backpropagation, and
the basic idea of how loss is calculated in supervised learning, but
it's taken a little while to digest how this works in reinforcement
learning, particularly in optimizing a deep Q network.

In the words of the paper:

> A Q-network can be trained by minimising a sequence of loss functions *L<sub>i</sub>(θ<sub>i</sub>)* that changes at each iteration *i*,
> ![q-network-loss-formula](/assets/images/q-network-loss-formula.png)
> where *y<sub>i</sub> = E<sub>s′~E</sub> [r + γ max<sub>a′</sub> Q(s′, a′; θ<sub>i−1</sub>)\|s, a]* is the target for iteration *i* and *ρ(s, a)* is a probability distribution over sequences s and actions a that we refer to as the *behaviour distribution*.

In supervised learning, it is usually very clear what *y* is, as it is simply the labeled data. But in a RL, this becomes less clear. *y-hat* also seems intuitive to me as it is simply the Q-value output from the Q-network. But *y*, uses the Q-network itself in addition to the immediate reward from the environment to calculated the expected cumulative reward.



