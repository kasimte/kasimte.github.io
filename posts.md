---
layout: default
title: Posts
---

<div class="home">
  {%- if site.posts.size > 0 -%}
    <h1 class="post-list-heading">All Posts</h1>
	
	<p>
	
    <ul>
      {%- for post in site.posts -%}
        <li>
          {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
          <span class="post-meta">{{ post.date | date: date_format }}</span>
          <a href="{{ post.url | relative_url }}">
		    {{ post.title | escape }}
          </a>
        </li>
      {%- endfor -%}
    </ul>
  {%- endif -%}
