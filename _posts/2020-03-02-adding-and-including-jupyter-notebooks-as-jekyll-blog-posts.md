---
layout: post
title: "Adding Jupyter Notebooks as Jekyll Blog Posts"
tags: jekyll jupyter-notebooks
permalink: adding-and-including-jupyter-notebooks-as-jekyll-blog-posts
---

I've been working a bunch with jupyter notebooks recently, and was
looking for an easy way to include the notebooks on this blog to
demonstrate code examples easily.

Here is the rough workflow I've developed:

1. Add and edit jupyter notebooks in a `_notebooks` folder of the blog repository.
2. Convert it with `jupyter nbconvert --to html notebook.ipynb`.
3. Move the conversion to the `_posts` folder.
4. Add the standard Jekyll metadata (title, etc.) with the layout set as `notebook` (this is a custom layout for Jupyter notebooks).

This is a slightly modified workflow from [another Jekyll post I
found here](https://cduvallet.github.io/posts/2018/03/ipython-notebooks-jekyll). The
main difference is that I am exporting in HTML, rather than markdown,
so the default jupyter notebook HTML formatting for code cells and
their output is preserved.

Here is a [link to an example post](/what-does-roll-do-in-numpy-and-pytorch#What-does-roll-do-in-numpy-and-pytorch?) generated from notebook.


## Related

* [Blogging with jupyter notebooks and jekyll](https://cduvallet.github.io/posts/2018/03/ipython-notebooks-jekyll)
* [Including Jupyter Notebooks in Jekyll blog posts](https://briancaffey.github.io/2016/03/14/ipynb-with-jekyll.html)
