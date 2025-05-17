function sct_get_objs(_obj){
for(var i = 0;i<instance_number(_obj);i++){
    check = instance_find(_obj,i);

    if check.selected {
			return check.id;
		}
	}
}