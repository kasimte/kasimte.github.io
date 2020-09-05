---
layout: post
title: Deep Learning for Coders with fastai and PyTorch, Lesson 2 Notes
tags: fastai deep-learning pytorch
---

These are some personal notes on Lesson 2 from the book, [Deep Learning for Coders with fastai and PyTorch: AI Applications Without a PhD](https://www.amazon.com/Deep-Learning-Coders-fastai-PyTorch/dp/1492045527).

## From Model to Production

Part of practicing deep learning is knowing what it can do. Some
people underestimate the constraints. Some people underestimate the
capabilities. There is a sweet spot. Using this is key to getting good
results.

**Where should you start using deep learning?** The most important concern
is *data availability*. Is there a project you are working on where
you have access to data already? Experiment rapidly and try to own
projects end-to-end. This will give you the best understanding of
where the pain points are.

**What is deep learning good at?** This is changing all the time, but
at the time of this writing, it is particularly good at computer
vision, natural language processing, combining text and images, and
recommendation systems. Sometimes data from other domains can be
converted into a computer vision or natural language processing task.

**How do we build a deep learning model that is useful?** The most
useful model is not necessarily the most accurate. One design approach
is *The Drivetrain Approach*, in which an objective is clearly
defined, controllable inputs are determined, then collectable data
identified (in this order). Only afterwards do models come into play.

**Looking for image data for a project?** Bing Image Search is
great at the time of this writing, but services keep on
changing. Check the FastAI course website for updated recommendations.

Be aware models only reflect the data given to them. Think of the
implications of your data. For example, if you train a model to detect
healthy skin based on a Bing Image Search of “healthy skin”, you will
actually be training a model to detect a *young white woman touching
her face*, because that is what Bing Image Search returns (refer
to
[this paper](https://www.media.mit.edu/publications/actionable-auditing-investigating-the-impact-of-publicly-naming-biased-performance-results-of-commercial-ai-products/) for
more details).

## FastAI Library Jargon

* We have `DataLoaders` , which is a collection class for `DataLoader` instances (e.g., training and validation). 
* Similarly, there are `DataSets` and `DataSet` classes.
* A `DataBlock` allows for flexible functional declaration of a `DataLoaders` instance.
* A `Learner` takes a `DataLoaders` instance and trains a model on it.
* Post training, we can give the `Learner` to a  `ClassificationInterpretation`  (assuming it is a classifier and not a regression) to easily create a *confusion matrix* for further model interpretation. With this class, you can also easily plot cases of top loss.
* fastai also includes `Cleaner` classes (e.g., `ImageClassifierCleaner`), which are given a `Learner` and help you clean up the data.

## Data Augmentation

When working with image data, we need a uniform input size. You could
crop the images or add blank padding space, but both have drawbacks. A
better alternative may be data augmentation, which means increasing
training data by taking random variations of input data. To implement
data augmentation, we can specify transform functions at the item
level or batch level in a `DataBlock`.

## Turning Your Model into an Online Application

Call `export` on your `Learner` instance to output your model
architecture and parameters to an exported `pkl` file. We can then
move this over to wherever you are building your online application.

Using a model for predictions is called *inference*. We can load an an
exported `pkl` file into a fastai learner with the `load_learner`
method. Then call `predict` on the `Learner` object.

With [IPython widgets](https://ipywidgets.readthedocs.io/en/latest/)
and [Voila](https://voila.readthedocs.io/en/stable/using.html), we can
build a web application out of a Jupyter Notebook itself.

Note in deployment for a small scale app, you likely do NOT need a
GPU. It makes it more complex, so you’re likely better off waiting
until you have an production application that is getting enough
traffic to switch over to using one.

What is the simplest way to host a small-scale hobby project, for
free? This will likely change over time, but at the time of this
writing, you can do so easily with a GitHub account
and [Binder](https://mybinder.org/).

## Deployment on Mobile and Edge Servers is a Work in Progress

The book writes:

> You may well want to deploy your application onto mobile devices, or
> edge devices such as a Raspberry Pi. There are a lot of libraries
> and frameworks that allow you to integrate a model directly into a
> mobile application. However, these approaches tend to require a lot
> of extra steps and boilerplate, and do not always support all the
> PyTorch and fastai layers that your model might use. In addition,
> the work you do will depend on what kind of mobile devices you are
> targeting for deployment—you might need to do some work to run on
> iOS devices, different work to run on newer Android devices,
> different work for older Android devices, etc. Instead, we recommend
> wherever possible that you deploy the model itself to a server, and
> have your mobile or edge application connect to it as a web service.

Later on, in more detail:

> A: I've had a chance to see up close how the mobile ML landscape is
> changing in my work. We offer an iPhone app that depends on computer
> vision, and for years we ran our own computer vision models in the
> cloud. This was the only way to do it then since those models needed
> significant memory and compute resources and took minutes to process
> inputs. This approach required building not only the models (fun!)
> but also the infrastructure to ensure a certain number of "compute
> worker machines" were absolutely always running (scary), that more
> machines would automatically come online if traffic increased, that
> there was stable storage for large inputs and outputs, that the iOS
> app could know and tell the user how their job was doing,
> etc. Nowadays Apple provides APIs for converting models to run
> efficiently on device and most iOS devices have dedicated ML
> hardware, so that's the strategy we use for our newer models. It's
> still not easy but in our case it's worth it, for a faster user
> experience and to worry less about servers. What works for you will
> depend, realistically, on the user experience you're trying to
> create and what you personally find is easy to do. If you really
> know how to run servers, do it. If you really know how to build
> native mobile apps, do that. There are many roads up the hill.

## How to Avoid Disaster

In practice, a deep learning model is typically just a small part of a
larger picture in production. And it is often harder to debug than
other software.

In production, for example, you may run into *out-of-domain*
data. This is when the production data and the training data end up
being different. This is something to be wary of, as there isn’t a
comprehensive technical solution.

In another example, what happens when the data our model sees begins
to change? This is known as *domain shift*.

There are often unforeseen consequences of deploying deep learning
models in production. For example, what are the consequences of data
*bias*? Could there be unforeseen and undesirable *feedback loops*?
One example of this is predictive policing. Will deep learning models
predict where crime will happen or where increased policing will
happen. Before deploying, it may be useful to consider what things
would look like if a machine learning system worked really well.

## Practical Notes

I ran on Google Colab, but at the time of this writing, there was
underlying `pandas` library incompatibility.

## Related
