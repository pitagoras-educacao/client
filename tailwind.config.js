/** @type {import('tailwindcss').Config} */
module.exports = {
	content: [
		"./node_modules/flowbite/**/*.js",
		"./index.html",
		"./src/**/*.{vue,js,ts,jsx,tsx}",
	],
	theme: {
		extend: {},
	},
	plugins: [
		require('flowbite/plugin')
	],
	safelist: [
		{ pattern: /bg\D+/ },
	]
}

