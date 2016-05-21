{% extends "layout.swig" %}

{% block title %}{{_.title_error}}{% endblock %}

{% block content %}
    <header>
        <a href="/">
            <h1>{{_.title_error}}</h1>
        </a>
    </header>
    <section>
        <div class="tab_wrap">{{error}}</div>
    </section>
{% endblock %}
