{% extends "layout.swig" %}

{% block title %}短网址{% endblock %}

{% block content %}
	<h1>短网址</h1>
	<form action="/~new" method="POST">
		<p>
			<label for="url">网址</label>
			<input type="text" name="url" id="url"/>
		</p>
		</p>
			<input type="submit" value="提交"/>
		</p>
	</form>
{% endblock %}