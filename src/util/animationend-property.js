/**
 * Created by shuyi.wu on 2015/6/17.
 */
var map = {
    animation: 'animationend',
    WebkitAnimation: 'webkitAnimationEnd',
    MozAnimation: 'mozAnimationEnd',
    OAnimation: 'oAnimationEnd',
    msAnimation: 'MSAnimationEnd'
};

/**
 * Expose `animationend`
 */

var el = document.createElement('p');

for (var animation in map) {
    if (null != el.style[animation]) {
        module.exports = map[animation];
        break;
    }
}