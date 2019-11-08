$(document).ready(function(){
    $(".aaa").click(function(){
		var cont=$(this).parent().parent().find(".mycontent");
		if(cont.is(":hidden")){				
		 cont.show();
		 $(this).removeClass("down");				
		}else{					
			cont.hide();
		$(this).addClass("down");
		
			}			
	});
			
	$(".dot").mouseover(function(){
		
		$(this).siblings(".box").show();
		
		});
	$(".close").click(function(){
		
		$(this).parent().parent().hide();
		})			
	
	

		
});
