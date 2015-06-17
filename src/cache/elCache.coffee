$ = require '../global/jquery.coffee'
global = require '../global/global.coffee'

$el = {}
$el.win = $(global.win);
$el.doc = $(global.doc);
$el.body = $('body');
module.exports = $el