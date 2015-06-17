(function($){
	$(document).ready(function (){
		$('#test').on('click', function(){
			beautifulPop.alert({
				title: 'Hello, World!'
			})
		});
	});
})(window.jQuery);