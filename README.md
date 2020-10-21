# Kasim Te's Personal Website

[![HitCount](http://hits.dwyl.com/kasimte/kasimtegithubio.svg)](http://hits.dwyl.com/kasimte/kasimtegithubio)

This is my personal website. Trying to keep it simple:

* hosted on GitHub Pages ([Click Here to see the actual site](https://kasimte.github.io))
* built with [Jekyll](https://jekyllrb.com/)
* based off the [Minima theme](https://github.com/jekyll/minima)
* responsive images based on [Jekyll Picture Tag](https://github.com/rbuchberger/jekyll_picture_tag)
* tags added based off the [tutorial here by Long Qian](http://longqian.me/2017/02/09/github-jekyll-tag/)

## Tips

Build the site for production:

```
JEKYLL_ENV=production bundle exec jekyll build
```

## Adding Responsive Images

1. Add `some_image.png` to `assets/images/fullsize/`.
2. In the markdown file, write something like `{% picture some_image.png %}`.
