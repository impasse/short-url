{% extends "layout.swig" %}

{% block title %}{% i18n title_error %}SHORT URL - ERROR{% endi18n%}{% endblock %}

{% block content %}
	<div class="container">
        <header>
            <a href="/">
                <h1>{% i18n title %}SHORT URL{% endi18n%}</h1>
            </a>
        </header>
        <section>
            <div class="tab_wrap">{{error}}</div>
        </section>
        <footer>
            <p class="copyright">©2016 shyling</p>
        </footer>
    </div>
{% endblock %}
