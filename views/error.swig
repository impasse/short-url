{% extends "layout.swig" %}

{% block title %}错误-短网址{% endblock %}

{% block content %}
	<div class="container">
        <header>
            <a href="/">
                <h1>短网址</h1>
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