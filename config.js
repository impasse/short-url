module.exports = exports = {
	url_prefix: "http://localhost:3399/",
	redis_config: [],
	minimum: 1,
	bind: [3399, '127.0.0.1'],
	loglevel: "combined",
	supported_languages: [
		'en',
		'zh'
	],
	language: {
		title: {
			en: 'Short URL',
			zh: '短网址'
		},
		title_error : {
			en: 'Short URL - Error.',
			zh: '错误-短网址'
		},
		title_404: {
			en: 'Short URL - 404.',
			zh: '404-短网址'
		},
		generate_short_link: {
			en: 'Generate short url.',
			zh: '生成短链'
		},
		copy_to_clipboard: {
			en: 'Click to copy to clipboard.',
			zh: '点击复制到剪切板'
		},
		it_has_been_copied_to_the_clipboard: {
			en: 'It has been copied to the clipboard.',
			zh: '已复制到剪切板'
		},
		invalid_url: {
			en: 'Invalid URL.',
			zh: '网址格式错误'
		},
		url_too_long: {
			en: 'The URL is too long.',
			zh: '网址过长'
		},
		page_not_found: {
			en: 'The page you requested could not be found.',
			zh: '你要浏览的页面未找到'
		}
	}
}
