global = require './global/global.coffee'
$ = require './global/jquery.coffee'
Modernizr = require './global/modernizr.coffee'
delay = require './util/delay.coffee'
$el = require './cache/elCache.coffee'

require './template/template.less'
template = require './template/template.html'


$el.body.append template
$el.btfp = $('.btfp', $el.body)
$el.btfpOverlay = $('.btfp-overlay', $el.btfp)
$el.btfpPop = $('.btfp-pop', $el.btfp)
$el.btfpTitle = $('.btfp-title', $el.btfp)
$el.btfpText = $('.btfp-text', $el.btfp)
$el.btfpCancel = $('.btfp-cancel', $el.btfp)
$el.btfpConfirm = $('.btfp-confirm', $el.btfp)

beautifulPop = ->

beautifulPop.defaults =
  title: ''
  text: ''
  cancel: false
  cancelColor: '#D0D0D0'
  cancelText: '取消'
  confirmColor: '#AEDEF4'
  confirmText: '确认'

beautifulPop.setDefaults = (obj) ->
  $.extend beautifulPop.defaults, obj

beautifulPop::alert (obj, callback) ->
  self = this
  if !obj
    throw new Error 'must be arg!'
  opt = $.extend {}, beautifulPop.defaults, obj
  $el.btfpTitle.text opt.title
  $el.btfpText.text opt.text

  $el.btfpConfirm.css
    backgroundColor: opt.confirmColor
  $el.btfpConfirm.text opt.confirmText
  $el.btfpConfirm.show()

  if opt.cancel
    if opt.cancelColor
      $el.btfpCancel.css
        backgroundColor: opt.cancelColor
    if opt.cancelText
      $el.btfpCancel.text opt.cancelText
    $el.btfpCancel.show()

  $el.btfpConfirm.one 'click', (evt) ->
    evt.preventDefault()
    self._hide()
    callback(true) if callback

  $el.btfpCancel 'click', (evt) ->
    evt.preventDefault()
    self._hide()
    callback(false) if callback


beautifulPop::_show = () ->
  $el.btfp.show()
  popMarginTop = $el.btfpPop.height() / 2
  $el.btfpPop.css marginTop: -popMarginTop
  delay ->
    $el.btfpOverlay.addClass('anim')
    $el.btfpPop.show().addClass('show');

beautifulPop::_hide = () ->
  $el.btfpPop.removeClass('show').addClass('hide');
  $el.btfpPop.one 'animationend', ->
    $el.btfpPop.hide().removeClass('hide')
    $el.btfpOverlay.removeClass('anim').one 'transitionend', ->
      $el.btfp.hide()

global.win.beautifulPop = new beautifulPop
global.win.$el = $el;