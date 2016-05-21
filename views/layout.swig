<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>{% block title %}{{_.title}}{% endblock %}</title>
		<link rel="stylesheet" href="css/app.css"/>{% block head %}{% endblock %}
	</head>
	<body>
		<div class="container">{% block content %}{% endblock %}</div>
		<footer>
        	<center>
            	<p class="copyright"><a href="https://shyling.com">©2016 shyling</a></p>
        	</center>
    	</footer>
	</body>
</html>