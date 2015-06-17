(function($){
	$(document).ready(function (){
		beautifulPop.setDefaults({
			clickEvent: 'tap'
		});
		$('#test').on('tap', function(){
			beautifulPop.alert({
				title: 'Hello, World!'
			})
		});
	});
})(window.jQuery);