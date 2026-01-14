const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      colors: {
        "signUp": "#ecffc8",
        "mainColor": "#506268",
        "fontColor": "#0f1213",
        "footerGray": "#f5f5f5",
        "editIcon": "#047487",
        "removeIcon": "#920404",
        "evaluationStrong": "#126f05",
        "evaluationLight": "#ddffd9",
        "chapterStrong": "#05636f",
        "surveyStrong": "#686f05",
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: []
}