const config = require('./config');

const chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c',
	'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];

const num2chars = (num, min = config.minimum) => {
	let tmp = '';
	do {
		tmp = chars[num % chars.length] + tmp;
		num = Math.floor(num / chars.length);
	} while (num > 0);
	return tmp.length > min ? tmp : chars[0].repeat((min - tmp.length)) + tmp;
}

const chars2num = (str) => {
	let chrs = Array.from(str);
	let end = 0;
	let num = 0;
	do {
		num += Math.pow(chars.length, end++) * chars.indexOf(chrs.pop());
	} while (chrs.length > 0);
	return num;
}

module.exports = exports = {
	encode: num2chars,
	decode: chars2num
}