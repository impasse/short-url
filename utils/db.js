const redis = require('redis');
const process = require('process');

const config = require('../config');

let client = redis.createClient(...config.redis_config);

//client.select(0);

client.on('error', function (err) {
	console.error(err);
});

module.exports = exports = {
	get: (name) => {
		return new Promise(function (resolve, reject) {
			client.get(name, function (err, data) {
				if (err) {
					reject(err);
				} else {
					resolve(data);
				}
			});
		});
	},
	put: (name, value) => {
		return new Promise(function (resolve, reject) {
			client.set(name, value, function (err, res) {
				if (err) {
					reject(err);
				} else {
					resolve(res);
				}
			});
		});
	},
	incr: () => {
		return new Promise(function (resolve, reject) {
			client.incr('~COUNT', function (err, res) {
				if (err) {
					reject(err);
				} else {
					resolve(res);
				}
			});
		});
	}
}
