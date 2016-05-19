{% extends "layout.swig" %}

{% block title %}短网址{% endblock %}

{% block head -%}
	{% if result %}
		<script>
		document.addEventListener('copy', function(e){
			e.clipboardData.setData('text/plain', document.querySelector("#result_url").innerText);
			alert("已复制到剪切板");
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
		            	<input lang="zh" value="生成短链" class="btn-info" name="send_url" type="submit">
						<input lang="en" value="Generate short URL" class="btn-info" name="send_url" type="submit">
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
							<button lang="zh" onclick="javascript:document.execCommand('copy')">点击复制到剪切板</button>
							<button lang="en" onclick="javascript:document.execCommand('copy')">Copy to clipboard</button>
						</div>
					</center>
        		</div>
			{% endif %}
        </div>
        <footer>
        	<center>
        		<p class="copyright">©2016 shyling</p>
				<a id="zh" href="#">中文</a>
				<a id="en" href="#">English</a>
        	</center>
        </footer>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.3/jquery.min.js"></script>
	<script>
	var lang = "zh";
	$('*:lang(en)').css('display', 'none');
	$('*:lang(zh)').css('display', 'inherit');
	$("#en").click(function(){
		lang = "en";
		document.title = "URL shortener";
		$('*:lang(en)').css('display', 'inherit');
		$('*:lang(zh)').css('display', 'none');
	});
	$("#zh").click(function(){
		lang = "zh";
		document.title = "短网址";
		$('*:lang(en)').css('display', 'none');
		$('*:lang(zh)').css('display', 'inherit');
	});
	</script>
{% endblock %}
