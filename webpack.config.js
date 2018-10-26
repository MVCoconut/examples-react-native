const path = require('path');

module.exports = {
	entry: './bin/generated/web/main.js',
	output: {
		path: path.resolve(__dirname, 'bin/generated/web'),
		filename: 'bundle.js'
	},
	resolve: {
		alias: {
			'react-native': 'react-native-web'
		}
	}
}