---
layout: post
title: Is "visual rendering" the future of QoE optimization?
tags: networking machine-learning research qoe paper-review
---

Is *visual rendering* the future abstraction for optimizing quality of
experience (QoE)? A new workshop paper
([2008.04128 A New Abstraction for Internet QoE Optimization](https:**arxiv.org*abs*2008.04128))
out of the University of Chicago and Microsoft Research seems to think
so.

Why change the abstraction? Although user-perceived QoE is subjective
by nature, Internet video streaming optimization has typically
centered on optimizing a *QoE model* based on *human engineered
features*. And optimizing QoE has largely plateaued, despite an ever
growing list of features.

*Visual rendering*, on the other hand, is “a video stream that records
all of the pixels displayed on the screen over time as seen by the
user.” This provides two main advantages:
	
* **expressibility**: it captures a *full visual experience* of a
  user, thereby bypassing the need for human engineered features and
  potential abstraction mismatch with actual user perception
* **generalizability**: it is a *unifying* abstraction for all
  Internet applications

What sort of architecture would be required for this new approach? The
paper outlines two main requirements:

* A **visual renderer** that infers the visual rendering of taking an optimization *action*.
* A **QoE model** that takes the visual rendering as input and predicts the QoE of a given optimization *action*.

It then goes on to draw upon ideas from other disciplines to suggest
ideas for how QoE modeling based on visual rendering might work. From
*cognitive visual perception*, it borrows the ideas of *expectation*
and *attention* to posit high QoE as meeting exceptions without the
attention region. From *computer vision*, *visual attention
detection*, *video summarization*, and *video prediction* techniques
could be used in implementing the new QoE model concept.

Will this be a new frontier in machine learning in networking? I guess
we’ll have to wait and see.

## Related

* [See the paper on arvix.org](https://arxiv.org/abs/2008.04128)
