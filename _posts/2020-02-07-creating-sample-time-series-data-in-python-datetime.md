---
layout: post
title: "Create Sample Time Series Data in Python (DateTime)"
tags: python faker data-wrangling
---

I've been playing around with time series data in Python and was
looking for an easy and clean way to create random samples of
`datetime` objects.

There's more than one way to do this, but I was particularly fond of
an approach using the `faker` library, which is outlined on
StackOverflow
[here](https://stackoverflow.com/questions/553303/generate-a-random-date-between-two-other-dates).

## Code Example

First, we'll import the `faker` library and instantiate an `Faker`
object to generate random samples.

```
import faker
fake = Faker()
```

Then, we can test out creating a sample `datetime` like so:

```
fake.date_time_between(start_date='-10y', end_date='now')
# datetime.datetime(2014, 10, 1, 6, 58, 47)
```

Or, if we want just a `date` object, we can do that too:

```
fake.date_between(start_date='today', end_date='+10y')
# datetime.date(2023, 2, 22)
```

Now, if we want a range of samples, we can use Python's array creation syntax:

```
datetimes = [fake.date_time_between(start_date='-30y', end_date='now') for i in range(5)]
datetimes

# Output:
# [datetime.datetime(2008, 12, 2, 15, 0, 5),
#  datetime.datetime(2006, 4, 14, 12, 44, 6),
#  datetime.datetime(2019, 10, 1, 17, 45, 42),
#  datetime.datetime(2009, 9, 25, 15, 22, 49),
#  datetime.datetime(2001, 3, 6, 8, 10, 3)]
```
