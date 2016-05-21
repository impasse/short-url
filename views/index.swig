{% extends "layout.swig" %}

{% block title %}{{_.title}}{% endblock %}

{% block head -%}
	{% if result %}
		<script>
		document.addEventListener('copy', function(e){
			e.clipboardData.setData('text/plain', document.querySelector("#result_url").innerText);
			alert("{{_.it_has_been_copied_to_the_clipboard}}");
            e.preventDefault();
			});
		</script>
	{% endif %}
{%- endblock %}

{% block content %}
	<header>
		<h1><img src="img/logo.jpg" style="height:105px"/></h1>
    </header>
    <div class="content">
		<form method="POST">
        	<div class="url_input">
           		<input type="text" name="url" id="url">
           	</div>
           	<div class="url_send">
           		<center>
		           	<input value="{{_.generate_short_link}}" class="btn-info" name="send_url" type="submit">
           		</center>
           	</div>
        	</form>
			{% if result %}
				<div id="success_result">
					<center>
        				<div class="result">
        					<a id="result_url" href="{{result}}">{{result}}</a>
        				</div>
						<div>
							<button onclick="javascript:document.execCommand('copy')">{{_.copy_to_clipboard}}</button>
						</div>
					</center>
        		</div>
			{% endif %}
    </div>
{% endblock %}
