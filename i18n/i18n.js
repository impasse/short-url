const language = require('./values');

let supported = [];

Reflect.ownKeys(language).forEach((i) => {
	for (let j in language[i]) {
		if (supported.indexOf(j) === -1) {
			supported.push(j);
		}
	}
});

const Gen = (locale) => {
	return new Proxy({}, {
		get: function (target, name) {
			return language[name] && language[name][locale] || language[name][supported[0]] || name;
		}
	});
}

//choose best locale for render
let i18n = (req, res, next) => {
	req.locale = (req.acceptsLanguages() || []).find(_ => supported.indexOf(_) !== -1) || supported[0];
	res._ = res.locals._ = Gen(req.locale);
	next();
}

module.exports = exports = i18n;
