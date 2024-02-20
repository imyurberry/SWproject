//위시버튼
$(function(){
   $("#exp_etc > div:nth-child(3)").click(function(){
      $("#wish_outer").css("display","block");
      $("#wish").css("display","block");
      $("body").css("overflow-y","hidden");
   });
   $(".wish_header>button").click(function(){
      $("#wish_outer").css("display","none");
      $("#wish").css("display","none");
      $("body").css("overflow-y","scroll");
   });
   $("#wish_outer").click(function(){
      $("#wish_outer").css("display","none");
      $("#wish").css("display","none");
      $("body").css("overflow-y","scroll");
   });
});