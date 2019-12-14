---
layout: default
title: Posts
permalink: "/"
---

Hi, I'm [Kasim](about/). Welcome to my site. 

<div class="home">
  {%- if site.posts.size > 0 -%}
    <h1 class="post-list-heading">Posts</h1>
	
	<p>
	
    <ul>
      {%- for post in site.posts -%}
        <li>
          <a href="{{ post.url | relative_url }}">
		    {{ post.title | escape }}
          </a>
          {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
          <span class="post-meta">{{ post.date | date: date_format }}</span>
          </li>
      {%- endfor -%}
    </ul>
  {%- endif -%}
