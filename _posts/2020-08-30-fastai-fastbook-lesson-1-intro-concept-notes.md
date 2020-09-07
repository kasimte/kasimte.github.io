---
layout: post
title: Deep Learning for Coders with fastai and PyTorch, Lesson 1 Intro Concept Notes
tags: fastai deep-learning pytorch
---

The folks over at [fast.ai](https://www.fast.ai/) just released a
version 2 of the fastai library, along with
a
[new book](https://www.amazon.com/Deep-Learning-Coders-fastai-PyTorch/dp/1492045527). I've
dabbled with the Deep Learning Course for Coders course before, but
the new release has me inspired for a more thorough go through. Here
are some of my notes from the intro. It isn't meant to be a summary,
just some of the points that stood out in my mind.

 You don’t have to care that much about architectures unless you’re an
academic:

> There are many different architectures in fastai, which we will
> introduce in this book (as well as discussing how to create your
> own). Most of the time, however, picking an architecture isn't a
> very important part of the deep learning process. It's something
> that academics love to talk about, but in practice it is unlikely to
> be something you need to spend much time on.

Ever wonder which ResNet model you should use? The numbers refer to
the number of layers.

> The 34 in resnet34 refers to the number of layers in this variant of
> the architecture (other options are 18, 50, 101, and 152). Models
> using architectures with more layers take longer to train, and are
> more prone to overfitting (i.e. you can't train them for as many
> epochs before the accuracy on the validation set starts getting
> worse). On the other hand, when using more data, they can be quite a
> bit more accurate.

Overfitting is the biggest challenge in ML.

> Overfitting is the single most important and challenging issue when
> training for all machine learning practitioners, and all algorithms.

Pretrained models are important, even if they don’t get
recognition. If you leverage one, you can very quickly end up with
state-of-the-art results. This hit home because I have been reading
academic papers and have not seen it emphasized much.

> Using pretrained models is the most important method we have to
> allow us to train more accurate models, more quickly, with less
> data, and less time and money. You might think that would mean that
> using pretrained models would be the most studied area in academic
> deep learning... but you'd be very, very wrong! The importance of
> pretrained models is generally not recognized or discussed in most
> courses, books, or software library features, and is rarely
> considered in academic papers. As we write this at the start of
> 2020, things are just starting to change, but it's likely to take a
> while. So be careful: most people you speak to will probably greatly
> underestimate what you can do in deep learning with few resources,
> because they probably won't deeply understand how to use pretrained
> models.

Is transfer learning an area of opportunity?

> Using a pretrained model for a task different to what it was
> originally trained for is known as transfer learning. Unfortunately,
> because transfer learning is so under-studied, few domains have
> pretrained models available. For instance, there are currently few
> pretrained models available in medicine, making transfer learning
> challenging to use in that domain. In addition, it is not yet well
> understood how to use transfer learning for tasks such as time
> series analysis.

On applying AI:

> As you can see, the different types of malware look very distinctive
> to the human eye. The model the researchers trained based on this
> image representation was more accurate at malware classification
> than any previous approach shown in the academic literature. This
> suggests a good rule of thumb for converting a dataset into an image
> representation: if the human eye can recognize categories from the
> images, then a deep learning model should be able to do so too.
>
> In general, you'll find that a small number of general approaches in
> deep learning can go a long way, if you're a bit creative in how you
> represent your data! You shouldn't think of approaches like the ones
> described here as "hacky workarounds," because actually they often
> (as here) beat previously state-of-the-art results. These really are
> the right ways to think about these problem domains.
