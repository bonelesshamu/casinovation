display = (function(){
	return {
		showUserInfo : function(point) {
			console.log(point);
			$('#ex8').attr('data-slider-max', point);
		},
		showDecision : function() {
			$('#decision').attr('disabled', false);
			$('#decision').prop('disabled', false);
		},
		hideDecision : function() {
			$('#decision').attr('disabled', true);
			$('#decision').prop('disabled', true);
		}
	};
}());
var blockUI = (function() {
	return {
		show : function(str) {
			$.blockUI({
				message: str,
				css: {
					border: 'none',
					padding: '10px',
					backgroundColor: '#333',
					opacity: 1.0,
					color: '#fff'
				},
				overlayCSS: {
					backgroundColor: '#000',
					opacity: 0.8
				}
			});
		},
		hide : function() {
			$.unblockUI();
		}
	};
}());
