const express = require('express');
const path = require('path');
const swig = require('swig');
const db = require('./db');
const encoder = require('./encoder');
const config = require('./config');
const swig_i18n = require('swig-i18n');
const locale = require("locale");

let app = express();

swig_i18n.init(config.language);

console.log(config.language)
console.log(swig_i18n);

app.engine('swig', swig.renderFile);
app.enable('trust proxy');
app.set('etag', false);
app.set('view engine', 'swig');
app.set('views', __dirname + '/views');
app.set('x-powered-by', false);

app.use(require('morgan')(config.loglevel));
app.use(express.static(path.join(__dirname, 'public'),{ etag: false }));
app.use(require('body-parser').urlencoded({ extended: false }));
app.use(locale(config.supported_languages));

app.get('/', (req, res) => {
	res.render('index', {i18n:{language: req.locale }});
});

app.post('/', (req, res) => {
	let url = req.body['url'] || '';
	if (url.length > 8192){
		throw new Error('网址过长');
		return;
	}
	if (/^\w+:\/\/.+/.test(url)) {
		db.incr().then(id => {
			id = encoder.encode(id);
			return db.put(id, url).then(() => {
				res.render('index', { result: config.url_prefix + id, locals:{i18n:{language: 'zh'}}});
			});
		}).catch(err => {
			throw err;
		});
	} else {
		throw new Error(config.language.invalid_url[req.locale]);
	}
});

app.get('/:url', (req, res, next) => {
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
app.use((req, res, next) => {
	res.render('404', {i18n:{language: req.locale }});
});

//500 error handle
app.use((err, req, res, next) => {
	res.render('error', { error: err.message, i18n:{language: req.locale }});
});

app.listen(...config.bind).on('listening', function () {
	let address = this.address();
	console.log(`Server listen at ${address.port} on ${address.address}`);
});
