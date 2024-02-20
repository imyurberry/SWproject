function show(a){
	a.css("display","block");
}
function close(b){
	b.css("display","none");
}
$(function(){
	$("#select_htdi").click(function(){
		if($("#how_to_decide_import").css("display") == "none"){
			show($("#how_to_decide_import"));
			show($("#htdi_background"));
			$("#body").css("overflow-y","hidden");
		}
	});
	$(".close_button").click(function(){
		if($("#how_to_decide_import").css("display") == "block"){
			close($("#how_to_decide_import"));
			close($("#htdi_background"));
			$("#body").css("overflow-y","scroll");
		}
	});
	$("#htdi_background").click(function(){
		close($("#how_to_decide_import"));
		close($("#htdi_background"));
		$("#body").css("overflow-y","scroll");
	});
	$("#search").click(function(){
		location.href= "main2.jsp";
	});
});
$(function(){
	$(".slide_but").click(function(){
		const howmanyday = $(".slide_but").val();
		$("#content_fir > div > div > p > button").html(howmanyday + "박");
		let howManyDays = howmanyday*211001;
		const res = howManyDays.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		$("#total_price").html(res);
	});
});