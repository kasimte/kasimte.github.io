---
layout: post
title: "Playing with external APIs, like Stripe, from your Rails instance"
tags: rails
---

It's always been a bit of a mystery what the best way to play with
integration of my Rails app with external APIs (like Stripe) might
be. My brother put an end to that today by showing me how dead simple
it is from the Rails console.

So if you're trying to manually play with an external API, you can
load up your console and fire away.

```
$bundle exec rails console
Loading backup environment (Rails 4.2.11.1)
irb(main):001:0> 
```

Then look at your API reference
([like here](https://stripe.com/docs/api/coupons/list?lang=ruby)) and
run with it.

Here's an example of querying for a Stripe coupon.

```
irb(main):001:0> Stripe.api_key
=> "some_api_key"

irb(main):001:0> Stripe::Coupon.list({limit: 1})
=> #<Stripe::ListObject:0x3fcc22040d5c> JSON: {
  "object": "list",
  "data": [
    {"id":"some_id","object":"coupon","amount_off":1000,"created":1585272944,"currency":"usd","duration":"once","duration_in_months":null,"livemode":false,"max_redemptions":1,"name":"$10 Coupon","percent_off":null,"redeem_by":1593221744,"times_redeemed":0,"valid":true}
  ],
  "has_more": true,
  "url": "/v1/coupons"
}
irb(main):003:0> 
```
