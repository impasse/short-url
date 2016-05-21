const language = require('./values');

const Gen = (locale) => {
	return new Proxy({}, {
		get: function (target, name) {
			return language[name] && language[name][locale] || name;
		}
	});
}

let supported = [];

Object.keys(language).forEach((i) => {
	for (let j in language[i]) {
		if (supported.indexOf(j) === -1) {
			supported.push(j);
		}
	}
});

let i18n = (req, res, next) => {
	req.locale = (req.acceptsLanguages() || []).find(_ => supported.indexOf(_) !== -1) || supported[0];
	res._ = res.locals._ = Gen(req.locale);
	next();
}

module.exports = exports = i18n;