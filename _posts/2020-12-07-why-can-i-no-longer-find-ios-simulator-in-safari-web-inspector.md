---
layout: post
title: "Why can I no longer find iOS Simulator in Safari's Web Inspector? Answer: Safari Technology Preview"
tags: xcode safari ios-programming
---

If you're familiar with debugging Javascript for the iOS Simulator,
you're probably familiar with using the Safari Browser with a Web
Inspector to hook into a UIWebView running in your iOS Simulator.

I don't do this infrequently enough that it is just on the edge of my
memory - I know it's possible, I just usually have to spend a couple
minutes figuring out how to do it. And so I spent the better part of
an hour today looking for this such feature, being confused about why
it seemingly disappeared.

It seems Apple likes to change the tools, so I guess it's moved over
to something separate called *Safari Technology Preview*.

![safari-technology-preview-download.png]({{site.url}}/assets/images/safari-technology-preview-download.png)

In the words of the install package:

> Safari Technology Preview gives you an early look at upcoming and
> improved web technologies, including HTML, JavaScript, and CSS. It
> comes with the most recent version of WebKit, the rendering engine
> that powers Safari. You can help us improve these technologies by
> testing them and sending us your feedback.

You can download it
here:
[https://developer.apple.com/safari/download/](https://developer.apple.com/safari/download/)

The preview runs similar to Safari and have the `Develop > Simulator`
menu which previously appeared in Safari:

![safari-technology-preview.png]({{site.url}}/assets/images/safari-technology-preview.png)

## Related

[https://stackoverflow.com/questions/50972680/missing-web-inspector-settings-in-simulator](https://stackoverflow.com/questions/50972680/missing-web-inspector-settings-in-simulator)
