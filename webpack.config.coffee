autoprefixer = require 'autoprefixer-core'
csswring = require 'csswring'

config =
  entry: ['./src/beautiful-pop.coffee']
  output:
    path: './dist'
    filename: 'bundle.js'
  module:
    loaders: [
      {test: /\.coffee$/, loader: "coffee"}
      {test: /\.css$/, loader: "style!css!postcss"}
      {test: /\.less/, loader: "style!css!less!postcss"}
      {test: /\.html$/, name: "mandrillTemplates", loader: 'raw!html-minify'}
      {test: /\.png$/, loader: "url-loader?limit=1000000"}
      {test: /\.jpg$/, loader: "url-loader"}
    ]
  resolve:
    extensions: [
      ""
      ".coffee"
      ".js"
      ".css"
      ".html"
      ".less"
    ]
  postcss: [autoprefixer]

module.exports = config