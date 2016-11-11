display = (function(){
	return {
		showUserInfo : function(point) {
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
