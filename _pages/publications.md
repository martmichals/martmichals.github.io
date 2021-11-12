---
layout: page
permalink: /publications/
title: publications
description: Publications in reversed chronological order.
years: []
nav: true
---

<h1>Nothing to see here...yet.</h1>

<div class="publications">

{% for y in page.years %}
  <h2 class="year">{{y}}</h2>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}

</div>
