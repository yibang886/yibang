(function($){
	$("img[data-bigimg]").click(function(e){
		var tpl = '<div class="bimg-layer">\
    				<div class="layer-cnt"><img src="{img}"></div>\
    				<a href="" class="layer-close"></a>\
				  </div>';
		var src = $(this).attr("data-bigimg");
		if(src){
			var img = new Image();
			img.onload = function(){
				var d = dialog({
					padding: 0,
				    content: tpl.replace('{img}',src)
				});
				d.showModal();
				$(d._popup[0]).find(".layer-close").bind("click",function(e){
					e.preventDefault();
					d.remove();
				});			
			}
			img.src = src;
		}
	
	});
})(jQuery);