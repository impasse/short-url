{% extends "layout.swig" %}

{% block title %}短网址{% endblock %}

{% block content %}
    <div class="container">
        <header>
            <a href="javascript:void(0)">
                <h1>短网址</h1>
            </a>
        </header>
        <section>
            <div class="tab_wrap">
                <div class="tab_title">
                    <div class="tab_select menu">
                        <a class="item active">缩短网址</a>
                    </div>
                </div>
                <div class="tab_body">
					<form action="/~new" method="POST">
                    	<div class="url_short">
                        	<div class="paste_url">
    	                        <label for="url" class="long_url_tip">请输入长网址:</label>
	    	                    <div class="url_input">
            	                    <input type="text" name="url" id="url">
                	            </div>
                    	    </div>
                        <div class="url_send">
                            <input type="submit" class="btn btn-info send_button" value="缩短网址"/>
                        </div>
                    </div>
					</form>
                </div>
            </div>
        </section>
        <footer>
            <p class="copyright">©2016 shyling</p>
        </footer>
    </div>
{% endblock %}