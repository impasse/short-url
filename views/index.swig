{% extends "layout.swig" %}

{% block title %}{% i18n title %}SHORT URL{% endi18n%}{% endblock %}

{% block head -%}
	{% if result %}
		<script>
		document.addEventListener('copy', function(e){
			e.clipboardData.setData('text/plain', document.querySelector("#result_url").innerText);
			alert("{% i18n it_has_been_copied_to_the_clipboard %}COPIED TO CLIPBOARD{% endi18n%}");
            e.preventDefault();
			});
		</script>
	{% endif %}
{%- endblock %}

{% block content %}
   <div class="container">
		<header>
           <h1><img src="img/logo.jpg" style="height:105px"></h1>
        </header>
        <div class="content">
        	<form method="POST">
        		<div class="url_input">
            		<input type="text" name="url" id="url">
            	</div>
            	<div class="url_send">
            		<center>
		            	<input value="{% i18n generate_short_link %}GENERATE SHORT LINK{% endi18n%}" class="btn-info" name="send_url" type="submit">
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
							<button onclick="javascript:document.execCommand('copy')">{% i18n copy_to_clipboard %}COPY TO CLIPBOARD{% endi18n%}</button>
						</div>
					</center>
        		</div>
			{% endif %}
        </div>
        <footer>
        	<center>
        		<p class="copyright">©2016 shyling</p>
        	</center>
        </footer>
	</div>
{% endblock %}
