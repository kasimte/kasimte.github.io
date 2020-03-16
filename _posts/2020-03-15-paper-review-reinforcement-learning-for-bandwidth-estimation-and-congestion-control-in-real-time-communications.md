---
layout: post
title: "[Paper Review] Reinforcement learning for bandwidth estimation and congestion control in real-time communications"
tags: rl networking congestion-control
permalink: paper-review-reinforcement-learning-for-bandwidth-estimation-and-congestion-control-in-real-time-communications
---

I've been reading a bunch of papers on reinforcment learning applied
to video streaming recently, and a shorter paper out of Microsoft
called *Reinforcement learning for bandwidth estimation and congestion
control in real-time communications* caught my eye for its clarity.

Here are some of my notes.

## Abstract

> Bandwidth estimation and congestion control for real-time
> communications (i.e., audio and video conferencing) remains a
> difficult problem, despite many years of research. Achieving high
> quality of experience (QoE) for end users requires continual updates
> due to changing network architectures and technologies. In this
> paper, we apply reinforcement learning for the first time to the
> problem of real-time communications (RTC), where we seek to optimize
> user-perceived quality. We present initial proof-of-concept results,
> where we learn an agent to control sending rate in an RTC system,
> evaluating using both network simulation and real Internet video
> calls. We discuss the challenges we observed, particularly in
> designing realistic reward functions that reflect QoE, and in
> bridging the gap between the training environment and real-world
> networks.

## My Summary

They focus on applying reinforcement learning (RL) to improving real
time, two-way, communications in video streaming. In other words, some
sort of two-way video call like FaceTime or a Skype video call.

RL has previously been applied to video streaming, but not in two-way real time communications. They are

1. video on demand (think of a regular YouTube)
2. real-time video streaming (think a live broadcast over Twitch, Facebook Live, etc.)

### What makes real time communications so difficult?

1. If you want two-way interactivity, you can't have a pre-fetched buffer which is typically used in the scenarios above.
2. Upload speed comes into play for all parties, which is typically more limited than downlaod speed.
3. The model needs to run in real-time, so decisions have a tighter window.
4. There are no pre-encoded quality levels for the video streams, so the action space is perhaps not discrete.

### R3Net: An Initial Approach

They train a neural network model designed to estimate bandwidth in
real-time. It runs on the receiver side, which then communicates its
results to the sender, which then can use the data to control the
sending rate of the stream (presumbly increasing data flow and
quality, as bandwidth allows).

They formulate the state input as 

* receiver rate (kb/s) 
* average package interval (ms)
* pacakge loss rate (%)
* average RTT (ms)

and their action as a bandwidth estimate of 0 to 8 Mb/s. Their reward
is then designed as

$$
0.6 ln (4R+1) - D - 10L
$$

where *R* is the receiver rate in (Mb/s), *D* is the average RTT, and
*L* is the packet loss rate. This then supposedly translates to a
representation of better QoE, because it rewards receiving more
network packets (data) and punishes delay and dropped packets.

They use Unscented Kalman Filter (UKF) as a fixed-rule baseline, and
show their neural network improves bandwidth usage by about 5% in a
simulated environment, but find the neural network falters a bit when
moved to a real environment, and measuring actual video quality (with
Netflix's VMAF), particularly over a slower 3G connection.

## Takeaway

Their neural network setup wasn't particularly interesting to me, as
it is just a module that can be improved, but the paper provides and
nice architectural overview of how RL might be applied in real-time
communications environment, as well as a short introduction to what
else is being done in this field of research. 

I was also left wondering how they designed the coefficients in their
reward function and why they didn't try to tie the reward directly to
the VMAF quality output in the real scenario.


## More

[Fang, Joyce, et al. "Reinforcement learning for bandwidth estimation and congestion control in real-time communications." arXiv preprint arXiv:1912.02222 (2019).](https://arxiv.org/pdf/1912.02222.pdf)

