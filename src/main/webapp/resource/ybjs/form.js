$(document).ready(function() {
    $(".c-info-form").validate({
        success:"valid"
    });
	$(".more-check").bind("click",function(e){
		e.preventDefault();
		var $this = $(this);
		var $parent = $this.parent();
		$parent.find(".hide-check").removeClass("hide-check");
		$this.hide();
	});    
});