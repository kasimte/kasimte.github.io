---
layout: post
title: "Linear Regression on Time Series with SciKit Learn and Pandas"
tags: pandas regression time-series scikit
---

This post demonstrates simple linear regression from time series data
using scikit learn and pandas.

## Imports

Import required libraries like so.

```
import numpy as np
import pandas as pd
import datetime
from sklearn import linear_model
```

## Create time series data

There are many ways to do this. Refer to the Time series section in
the pandas documentation for more details. Here, we take a date range
for the year of 2020 and create a datetime index based on each day.

```
start = datetime.datetime(2020, 1, 1)
end = datetime.datetime(2020, 12, 31)
index = pd.date_range(start, end)
index, len(index)
```

Output:

```
(DatetimeIndex(['2020-01-01', '2020-01-02', '2020-01-03', '2020-01-04',
                '2020-01-05', '2020-01-06', '2020-01-07', '2020-01-08',
                '2020-01-09', '2020-01-10',
                ...
                '2020-12-22', '2020-12-23', '2020-12-24', '2020-12-25',
                '2020-12-26', '2020-12-27', '2020-12-28', '2020-12-29',
                '2020-12-30', '2020-12-31'],
                dtype='datetime64[ns]', length=366, freq='D'), 366)
```

## Create a pandas dataframe

Next, we can put this in a pandas dataframe. We can add an artificial
"value" column that is a multiple of 5 for some generic target data.

```
multiple = 5
l = list(range(0, len(index)*multiple, multiple))
df = pd.DataFrame(l, index = index)
df.index.name = "date"
df.columns = ["value"]
df
```

Output:

```
            value
date	
2020-01-01	0
2020-01-02	5
2020-01-03	10
2020-01-04	15
2020-01-05	20
...	...
2020-12-27	1805
2020-12-28	1810
2020-12-29	1815
2020-12-30	1820
2020-12-31	1825
366 rows × 1 columns
```

## Simple feature engineering from time series

We want something sensible to predict from. One simple option is to
convert the date index into an integer from the minimum start date
like so:

```
df['days_from_start'] = (df.index - df.index[0]).days; df
```

Output:

```
value	days_from_start
date		
2020-01-01	0	0
2020-01-02	5	1
2020-01-03	10	2
2020-01-04	15	3
2020-01-05	20	4
...	...	...
2020-12-27	1805	361
2020-12-28	1810	362
2020-12-29	1815	363
2020-12-30	1820	364
2020-12-31	1825	365
366 rows × 2 columns
```

## Simple Regression

We can now pull out the columns for simple linear regression.

```
x = df['days_from_start'].values.reshape(-1, 1)
y = df['value'].values
```

Note that our input variables x have to be reshaped for input to the model.

## Use scikit's LinearRegression to fit the model

Run

```
model = linear_model.LinearRegression().fit(x, y)
linear_model.LinearRegression(copy_X=True, fit_intercept=True, n_jobs=1, normalize=False)
LinearRegression(copy_X=True, fit_intercept=True, n_jobs=1, normalize=False)
model.predict([[1], [7], [50]])
```

Output:

```
array([  5.,  35., 250.])
```

## More

* [See a Jupyter Notebook with this code](https://github.com/kasimte/machine-learning-playground/blob/master/notebooks/linear-regression-from-time-series-data.ipynb)
