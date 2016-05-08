{% extends "layout.swig" %}

{% block title %}缩短结果-短网址{% endblock %}


{% block head %}
	<script>
	document.addEventListener('copy', function(e){
                e.clipboardData.setData('text/plain', document.querySelector("#url").innerText);
                e.preventDefault();
    });
	</script>
{% endblock %}

{% block content %}
	<div class="container">
        <header>
            <a href="javascript:void(0)">
                <h1>缩短结果</h1>
            </a>
        </header>
        <section>
            <div class="tab_wrap"><a id="url" href="{{result}}">{{result}}</a></div>
			<div><button onclick="javascript:document.execCommand('copy')">点击复制到剪切板</button></div>
        </section>
        <footer>
            <p class="copyright">©2016 shyling</p>
        </footer>
    </div>
{% endblock %}