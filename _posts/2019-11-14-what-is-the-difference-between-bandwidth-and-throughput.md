---
layout: post
title: "Bandwidth versus Throughput as a Pizza Shop"
tags: networking analogy conceptual-learning
---

In a continuation of a talk amongst friends about
the
[throughput versus latency tradeoff](/2019/10/28/pizza-shop-as-latency-throughput-example),
we got confused about the difference between bandwidth and throughput.

While both are rates (quantity over time), bandwidth is the maximum
rate while throughput is the rate actually used.

To continue the [pizza shop analogy](/2019/10/28/pizza-shop-as-latency-throughput-example), if I have one oven that fits one
pizza can cook a maxmium of ten pizzas per hour, then my *bandwidth*
is ten pizzas per hour. But I don't have to cook ten pizzas per
hour. If I leave the oven off, I can cook zero pizzas per hour. Or
maybe I only want to cook five pizzas per hour. The rate at which I
actually cook pizzas is my *throughput*.

How does this relate to the latency versus throughput tradeoff? And
why is it a tradeoff between latency and throughput and not between
latency and bandwidth? If your throughput is maxed out at your
bandwidth, then latency is likely to be high. If your bandwidth is
high, you can serve at a higher rate, but your latency still depends
on your throughput being lower than your bandwidth.

## More

* [(Quora) Computer Networking: What is the difference between bandwidth and throughput?](https://www.quora.com/Computer-Networking-What-is-the-difference-between-bandwidth-and-throughput)
