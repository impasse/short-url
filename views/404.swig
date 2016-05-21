{% extends "layout.swig" %}

{% block title %}{{_.title_404}}{% endblock %}

{% block content %}
    <header>
        <a href="/">
            <h1>{{_.title}}</h1>
        </a>
    </header>
    <section>
        <div class="tab_wrap">{{_.page_not_found}}</div>
    </section> 
{% endblock %}
