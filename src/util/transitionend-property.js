/**
 * Created by shuyi.wu on 2015/6/17.
 */
var map = {
    transition : 'transitionend',
    WebkitTransition : 'webkitTransitionEnd',
    MozTransition : 'transitionend',
    OTransition : 'oTransitionEnd',
    msTransition : 'MSTransitionEnd'
};

/**
 * Expose `transitionend`
 */

var el = document.createElement('p');

for (var transition in map) {
    if (null != el.style[transition]) {
        module.exports = map[transition];
        break;
    }
}