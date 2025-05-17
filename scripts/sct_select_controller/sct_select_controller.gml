function sct_select_controller(_obj){
	var selected_count = 0;
	with (_obj) {
	    if (selected) {
	        selected_count += 1;
	    }
	}
	if (selected_count > 1) {
		with(_obj){
			with(shop) instance_destroy();
		}
		return true
	} else {
		return false
	}
}

function sct_select_controler_no_shop(_obj){
	var selected_count = 0;
	with (_obj) {
	    if (selected) {
	        selected_count += 1;
	    }
	}
	if (selected_count > 1) {
		return true
	} else {
		return false
	}
}