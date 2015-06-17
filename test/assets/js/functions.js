(function($){
	$(document).ready(function (){
		beautifulPop.setDefaults({
			clickEvent: 'click tap'
		});
		$('#test').on('click tap', function(){
			beautifulPop.alert({
				title: 'Hello, World!'
			})
		});
	});
})(window.jQuery);