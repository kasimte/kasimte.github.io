---
layout: post
title: "What are the differences among Autoregression, Moving-average regression, ARMA, and ARIMA for time series forecasting?"
tags: time-series
permalink: what-are-the-differences-among-autoregression-moving-average-arma-and-arima-for-time-series-forecasting
---

These are all classical models of forecasting based on time series
data, with slight differences. This post focuses on the conceptual
differences to gain an intuition and overview.

## Autoregressive model

*Autoregression* refers to a regression model based on itself
(“auto”). Basically, it takes *p* number of time steps before the one
to be forecast and fits a regression model based on that. Or, in other
words, predict the current value based on *p* previous values. Time
steps before the one to be forecast are referred to as *lags*, so one
could also say, predict the current value based on *p* lags. And the
number of *lags* is called the *order* of the model.

$$
X_{t}=c+\sum _{i=1}^{p}\varphi _{i}X_{t-i}+\varepsilon _{t}\,
$$

* $X_{t}$: value to be forecast at time $t$.
* $c$: some constant value
* $\varepsilon_{t}$: error value at time $t$
* $p$ number of *lags*, or *order* of the model
* $\varphi_{i}$: model parameter at index $i$

More: [Autoregressive model - Wikipedia](https://en.wikipedia.org/wiki/Autoregressive_model)

## Moving-average regression model

The *moving-average regression model* takes a slightly different
approach. It takes the average of the time series, and then predicts
the current value based on the error term of *n* previous time
steps. Similar to above, the *n* is referred to as the *order*.

How does this compare to the autoregressive approach above?

Pros: 

* The error terms of the lags are modeled to affect the forecasted
  value directly, rather than indirectly.
* The error influence from lags is limited to the *order*, and not
  infinitely like the autoregressive approach.

Cons: 

* Fitting the model can be more complicated, as the error terms are
  not directly observable (they are included within the lag total
  values).

$$
X_{t}=\mu +\varepsilon _{t}+\theta _{1}\varepsilon _{t-1}+\cdots +\theta _{q}\varepsilon _{t-q}\,
$$

* $X_{t}$: value to be forecast at time $t$.
* $\mu$: the average of the series
* $\varepsilon_{t}$: error value at time $t$
* $q$: the number of *lags* to use, or *order* of the model
* $\theta_{t}$: the parameter of the model at time *t*

This is alternatively written with the summmation operator like so:

$$
X_{t}=\mu +\varepsilon _{t}+\sum _{i=1}^{q}\theta _{i}\varepsilon _{t-i}.\,
$$

Note that this model name sounds similar to the *moving average*
concept from statistics, but is conceptually different.

## Autoregressive moving average model (ARMA)

After reviewing the above, *ARMA* becomes much easier to understand,
as it’s simply a combination of the above two.

$$
X_{t}=c+\varepsilon _{t}+\sum _{i=1}^{p}\varphi _{i}X_{t-i}+\sum _{i=1}^{q}\theta _{i}\varepsilon _{t-i}.\,
$$

*ARMA* forecasts the targeted value as a combination of both *p*
previous lag values and *q* previous error values.

## Autoregressive integrated moving average (ARIMA)

The *ARIMA* approach extends *ARMA* by using *difference* values as
opposed to the lag values themselves. This is the *integrated* part.

What is a *difference* value? A *difference* value for time step *t*
would be the differnce between it and the previous value at time step
*t-1*. Or, formulaically:

$$
X_{t} - X_{t-1}
$$

Using the differences as opposed to the values themselves is an effort
to
eliminate
[*non-stationarity*](https://en.wikipedia.org/wiki/Stationary_process),
or differences in the data when shifted in time. Difference values may
be calculated repeatedly on a series, also giving them an *order*.


