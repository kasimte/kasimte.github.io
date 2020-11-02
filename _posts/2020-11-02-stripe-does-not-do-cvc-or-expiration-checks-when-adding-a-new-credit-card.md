---
layout: post
title: Stripe does not do CVC or expiration checks when adding a new credit card as a payment method
tags: stripe
---

I learned something new today when exploring the Stripe
interface. Namely, Stripe does not do CVC or expiration checks when
adding a new credit card as a payment method. Contrary to my
expectation, I was able to add a credit card, even with a bogus
expiration date (set to some random future date) and a made up CVC
number.

This was disconcerting to me, because such a payment method for a
customer would simply fail when a real charge is made at a future
date. In other words, if you are using Stripe as a payment processor,
a customer can add a credit card as a payment method, make a mistake
with the expiration date or CVC, and the next time the card is
charged, it will likely fail. This, in spite of the fact that they are
given no indication that their credit card info may have been entered
incorrectly when they initially added the card.

Some further digging
revealed
[this help page from Stripe](https://support.stripe.com/questions/check-if-a-card-is-valid-without-a-charge) with
some details as to why this may be the case:

> To prevent card testing, Stripe is sometimes required to not check
> cvc and zip checks on card validations, so they may appear as
> “unavailable”. Those checks will be available on the charge object
> once an actual payment is made. Stripe uses machine learning to
> predict when card testing is likely. These checks also may be
> unavailable as a cost-optimization if Stripe’s machine learning
> predicts the card is valid and that performing these checks will not
> increase the probability of a successful payment.

This led me down a bit of a rabbit hole into reading about
"[card testing](https://stripe.com/docs/card-testing)", which is when
fraudsters test if a stolen card is usable by making a small charge.
