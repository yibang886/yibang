(function($){
	$(".s-p-more").bind("click",function(e){
		e.preventDefault();
		var $this = $(this);
		var $parent = $this.parent();
		$parent.find(".s-p-hiden").removeClass("s-p-hiden");
		$this.hide();
	});
	
})(jQuery);