global = require './global/global.coffee'
$ = require './global/jquery.coffee'
Modernizr = require './global/modernizr.coffee'
delay = require './util/delay.coffee'
$el = require './cache/elCache.coffee'

require './template/template.less'
template = require './template/template.html'


$el.body.append template
$el.btfp = $('.btfp', $el.body);
$el.btfpOverlay = $('.btfp-overlay', $el.btfp);

global.win.$el = $el
global.win.test = () ->
  $el.btfp.show()
  delay ->
    $el.btfpOverlay.addClass('anim')

