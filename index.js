const express = require('express');
const path = require('path');
const swig = require('swig');
const db = require('./db');
const encoder = require('./encoder');
const config = require('./config');

let app = express();

app.engine('swig', swig.renderFile);
app.set('view engine', 'swig');
app.set('views', __dirname + '/views');
app.set('x-powered-by', false);

app.use(require('morgan')('dev'));
app.use(express.static(path.join(__dirname, 'public')));
app.use(require('body-parser').urlencoded({ extended: false }));

app.get('/', (req, res) => {
	res.render('index');
});

app.post('/~new', (req, res) => {
	let url = req.body['url'] || '';
	if (/^\w+:\/\/.+/.test(url)) {
		db.incr().then(id => {
			id = encoder.encode(id);
			return db.put(id, url).then(() => {
				res.render('result', { result: config.url_prefix + id });
			});
		}).catch(err => {
			throw err;
		});
	} else {
		throw new Error('网址格式错误');
	}
});

app.get('/:url', (req, res,next) => {
	let url = req.params['url'] || '';
	db.get(url).then((result) => {
		if (result === null) {
			next();
		} else {
			res.redirect(result);
		}
	}).catch(e => {
		throw e;
	});
});

//404 error handle
app.use(function (req, res, next) {
	res.render('404');
});

//500 error handle
app.use(function(err, req, res, next){
	res.render('error', { error: err.message });
});

app.listen(3000);