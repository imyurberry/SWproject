$(function(){
	$(".exp").click(function() {
		window.open("ExpInfo.html", "", "");
	})
	
	$(".filter_icon_r").click(function() {
		$(location).attr("href","Filter.html");
	})
	
	$('.exp_img > svg').click(function(e) {
  		e.preventDefault(); 
  		e.stopPropagation();
	});
	
	$(".exp_img > svg").click(function() {
	   	if($(this).parent().find("svg").css("fill") != "rgb(255, 56, 92)") {
		   	let idx = $(".exp_img > svg").index($(this));
		  	alert("idx : " + idx);
		   	$("#heart_val").val(idx);
		   	$("#wish_outer").css("display","block");
		   	$("#wish").css("display","block");
		   	$("body").css("overflow-y","hidden");
	   	} else if($(this).css("fill") == "rgb(255, 56, 92)") {
		   	$(this).css("fill","rgba(0, 0, 0, 0.5)");
   	   	}
   	})
   	$(".wish_header > button").click(function(){
	   	$("#wish_outer").css("display","none");
	   	$("#wish").css("display","none");
	   	$("body").css("overflow-y","scroll");
   	});
   	$("#wish_outer").click(function(){
	   	$("#wish_outer").css("display","none");
	   	$("#wish").css("display","none");
	   	$("body").css("overflow-y","scroll");
   	});
   
   	$(".wish_content1").click(function() {
	   	let idx = $("#heart_val").val();
	   	$("#wish_outer").css("display","none");
	    $("#wish").css("display","none");
	    $("body").css("overflow-y","scroll");
	    $(".exp_img > svg").eq(idx).css("fill", "#FF385C");
    	alert("!");
    })
})