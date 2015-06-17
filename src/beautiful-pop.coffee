global = require './global/global.coffee'
$ = require './global/jquery.coffee'
Modernizr = require './global/modernizr.coffee'
delay = require './util/delay.coffee'
animationend = require './util/animationend-property'
transitionend = require './util/transitionend-property'

$el = require './cache/elCache.coffee'

require './template/template.less'
template = require './template/template.html'

#dom 选择器
$el.body.append template
$el.btfp = $('.btfp', $el.body)
$el.btfpOverlay = $('.btfp-overlay', $el.btfp)
$el.btfpPop = $('.btfp-pop', $el.btfp)
$el.btfpTitle = $('.btfp-title', $el.btfp)
$el.btfpText = $('.btfp-text', $el.btfp)
$el.btfpCancel = $('.btfp-cancel', $el.btfp)
$el.btfpConfirm = $('.btfp-confirm', $el.btfp)


beautifulPop = ->

#  定义默认值
beautifulPop.defaults =
  title: ''
  text: ''
  cancel: false
  cancelColor: '#D0D0D0'
  cancelText: '取消'
  confirmColor: '#AEDEF4'
  confirmText: '确认'
  clickEvent: 'click'

#  重设默认值
beautifulPop::setDefaults = (obj) ->
  if !obj
    throw new Error 'must be arg!'
  $.extend beautifulPop.defaults, obj
  undefined

beautifulPop::alert = (obj, callback) ->
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

  self._show()

  $el.btfpConfirm.off(opt.clickEvent).one opt.clickEvent, (evt) ->
    evt.preventDefault()
    self._hide()
    callback(true) if callback

  $el.btfpCancel.off(opt.clickEvent).one opt.clickEvent, (evt) ->
    evt.preventDefault()
    self._hide()
    callback(false) if callback
  undefined


beautifulPop::_show = () ->
  $el.btfp.show()
  popMarginTop = $el.btfpPop.height() / 2
  $el.btfpPop.css marginTop: -popMarginTop
  delay ->
    $el.btfpOverlay.addClass('anim')
    $el.btfpPop.show().addClass('show');
  undefined

beautifulPop::_hide = () ->
  $el.btfpPop.removeClass('show').addClass('hide');
  $el.btfpPop.one animationend, ->
    $el.btfpPop.hide().removeClass('hide')
    $el.btfpOverlay.removeClass('anim').one transitionend, ->
      $el.btfp.hide()
      $el.btfpCancel.hide()
      $el.btfpConfirm.hide()
  undefined

global.win.beautifulPop = new beautifulPop