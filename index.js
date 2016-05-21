const express = require('express');
const path = require('path');
const swig = require('swig');


const db = require('./db');
const encoder = require('./encoder');
const config = require('./config');
const i18n = require('./i18n');

const app = express();

app.engine('swig', swig.renderFile);

app.enable('trust proxy');
app.disable('etag');
app.disable('x-powered-by');
app.set('view engine', 'swig');
app.set('views', path.join(__dirname, '/views'));

app.use(require('morgan')(config.loglevel));
app.use(express.static(path.join(__dirname, 'public'), { etag: false }));
app.use(require('body-parser').urlencoded({ extended: false }));
app.use(i18n);

app.get('/', (req, res) => {
	res.render('index');
});

app.post('/', (req, res) => {
	const url = req.body['url'] || '';
	if (url.length > 8192) {
		throw new Error(res._.url_too_long);
		return;
	}
	if (/^\w+:\/\/.+/.test(url)) {
		db.incr().then(id => {
			id = encoder.encode(id);
			return db.put(id, url).then(() => {
				res.render('index', { result: config.url_prefix + id });
			});
		}).catch(err => {
			throw err;
		});
	} else {
		throw new Error(res._.invalid_url);
	}
});

app.get('/:url', (req, res, next) => {
	const url = req.params['url'] || '';
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
	res.render('404');
});

//500 error handle
app.use((err, req, res, next) => {
	if (err)
		res.render('error', { error: err.message });
});

app.listen(...config.bind).on('listening', function () {
	const address = this.address();
	console.log(`Server listen at ${address.port} on ${address.address}`);
});
