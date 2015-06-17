gulp = require 'gulp'
gutil = require 'gulp-util'
webpack = require 'webpack'
webpackConf = require './webpack.config'

gulp.task 'webpack', (callback) ->
  myConf = Object.create webpackConf;
  webpack myConf, (err, stats) ->
    throw new gutil.PluginError 'webpack:build', err if err
    gutil.log '[webpack:build]', stats.toString
      colors: true
    callback()
    null