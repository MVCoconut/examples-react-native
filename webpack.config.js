module.exports = {
	entry: './bin/generated/web/main.js',
	output: {
		filename: './bin/generated/web/bundle.js'
	},
	resolve: {
		alias: {
			'react-native': 'react-native-web'
		}
	}
}