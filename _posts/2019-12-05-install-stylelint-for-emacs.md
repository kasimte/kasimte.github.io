---
layout: post
title: "Install stylelint for Emacs"
tags: stylelint emacs
permalink: install-stylelint-for-emacs
---

I setup [stylelint](https://github.com/stylelint/stylelint) today and
now have it autochecking my CSS code in my favorite editor, Emacs!
Here are some notes on the installation.

Install the relevant packages using `yarn` (`npm` probably works took,
but I haven't tried that):

```
yarn global add stylelint
yarn global add stylelint-config-standard
yarn global add stylelint-scss
```

Add the PATH to your `.bash_profile` in your home directory:

```
export PATH="$(yarn global bin):$PATH"
```

Create a `.stylelintrc` file in your user `HOME` directory. You'll
have to edit the absolute paths for your own system (i.e., change
"Kasim" to your username).

```
{
    "extends": "/Users/Kasim/.config/yarn/global/node_modules/stylelint-config-standard",
    "plugins": [
        "/Users/Kasim/.config/yarn/global/node_modules/stylelint-scss"
    ],
    "rules": {
        "indentation": 2,
        "string-quotes": "double",
        "no-duplicate-selectors": true,
        "color-hex-case": "upper",
        "selector-no-qualifying-type": true,
        "selector-max-id": 0,
        "selector-max-combinators": 0,
        "selector-max-attribute": 0,
        "selector-combinator-space-after": "always",
        "selector-attribute-quotes": "always",
        "selector-attribute-operator-space-before": "always",
        "selector-attribute-operator-space-after": "always",
        "selector-attribute-brackets-space-inside": "always",
        "declaration-no-important": true,
        "declaration-colon-space-before": "never",
        "declaration-colon-space-after": "always",
        "property-no-vendor-prefix": true,
        "value-no-vendor-prefix": true,
        "function-url-quotes": "always",
        "font-family-name-quotes": "always-where-recommended",
        "comment-whitespace-inside": "always",
        "at-rule-no-vendor-prefix": true,
        "selector-no-vendor-prefix": true,
        "selector-max-universal": 0,
        "selector-max-type": 0,
        "media-feature-range-operator-space-before": "always",
        "media-feature-range-operator-space-after": "always",
        "media-feature-name-no-vendor-prefix": true,
        "media-feature-colon-space-before": "never",
        "media-feature-colon-space-after": "always",
        "at-rule-no-unknown": null
      }
}
```

You likely can set this up on a project basis as well, but I haven't tried that.

To get it up and running in Emacs, you'll want to install the following Emacs packages:

* flymake
* flycheck
* scss-mode

Then use `M-x scss-mode` and `M-x flycheck-mode` in Emacs to get things going.

If you get tired of enabling the modes everytime you launch Emacs, you
can set the modes to load automatically. Edit your `.emacs` file like
so:

```
;; Enable flycheck-mode by default when Emacs launches
(add-hook 'after-init-hook #'global-flycheck-mode)
```

You'll end up with automatic CSS checking in Emacs like this:

![portrait]({{ site.url }}/assets/images/stylelint-in-emacs.png)
