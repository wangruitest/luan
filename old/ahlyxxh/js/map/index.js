$( function(){
	
 	$(".map_anchor .signs").mouseover(function(){
		
		$(this).children(".legend").show();
		
		}).mouseout(function(){
			
			$(this).children(".legend").hide();
	
		})
		
});