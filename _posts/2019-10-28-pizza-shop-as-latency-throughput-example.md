---
layout: post
title: The Pizza Shop's Latency/Throughput Tradeoff
tags: networking optimization sungho
---

A friend researching network optimization recently tried to explain the latency/throughput tradeoff to me, but it seemed very abstract and hard to wrap my head around.

It seemed much easier to me to put it in terms of something concrete, something I could understand easily, like my old friend Sungho and his pizza shop.

Sungho is from [Busan](https://en.wikipedia.org/wiki/Busan) and used to run a small pizza shop. It was a busy shop with one oven, limiting the number of pizzas that the shop could make  per hour. Customers want their pizzas fast and don't necessarily prepare in advance. When the American expat around the corner calls in his pepperoni pizza (hold the corn, mind you), he wants it as soon as possible. Let's the turnaround time on a pizza order *latency*. 

Now, what happens when the frequency and magnitude of orders starts to vary? One might expect more orders during the Chuseok (harvest season) holiday, when families are getting together and there might be a spike of particularly large orders for a whole family. Suppose a Korean family orders 50 pizzas at once. Sungho fires up the oven and starts to churn out pizzas as fast as possible (maximizing *throughput*), which is what the family wants. But what then happens, if the lonely expat American calls in immediately after and orders one pepperoni pizza? His latency will be increased to the time it takes to make the 50 pizzas and then his own order.

Sungho might be better served by reducing throughput slightly, allowing some flexibility to minimize the latency of all orders.


### More on the Latency Throughput Tradeoff:

* [Latency Throughput Tradeoff: Why Fast Services are Slow and Vice Versa](https://blog.danslimmon.com/2019/02/26/the-latency-throughput-tradeoff-why-fast-services-are-slow-and-vice-versa/)
* [Site Reliability Engineering, Chapter 3: Embracing Risk](https://landing.google.com/sre/sre-book/chapters/embracing-risk/)
