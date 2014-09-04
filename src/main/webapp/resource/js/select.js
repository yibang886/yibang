function selectOnChange(obj,rootPath){
	var ajaxChildId = $(obj).attr('ajaxChildId');
	var value = $(obj).val();
	if(ajaxChildId == "" || value == ""){
		return;
	}
	var selJqueryObj = $("#" + ajaxChildId);
	var ajaxTableName = selJqueryObj.attr('ajaxTableName');
	var ajaxValueColName = selJqueryObj.attr('ajaxValueColName');
	var ajaxDispColName = selJqueryObj.attr('ajaxDispColName');
	var ajaxAppendSQL = selJqueryObj.attr('ajaxAppendSQL').replace(/\[ID]/g, value);
	$.ajax({
		url: rootPath + '/dbselect/query',
		type: 'POST',
		async: false,
		dataType:'json',
		data:{
			ajaxTableName: ajaxTableName,
			ajaxValueColName: ajaxValueColName,
			ajaxDispColName: ajaxDispColName,
			ajaxAppendSQL: ajaxAppendSQL
		},
		success: function(ret){
			var selArray = ret;
			selJqueryObj.html("");
			for(var i = 0; i < selArray.length; i++){
				selJqueryObj.append($("<option></option>").val(selArray[i].VALUE).text(selArray[i].TEXT));
			}
			selJqueryObj.change();
		}
	});
}
function getSelName2Input(iName,obj){
	$("input[name='" + iName + "']").first().val($(obj).find("option:selected").first().text());
}