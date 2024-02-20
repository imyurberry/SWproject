$(function() {
	/*모든리뷰버튼 클릭*/
    $("#rv_all_view").click(function(){
      $("#bg_popup").css("display", "block");
      $("#pop_review").css("display", "block");
      $("body").css("overflow-y","hidden");
   
   });
   // 후기x버튼 눌렀을때 닫기
   $(".pop_header>button").click(function(){
      $("#bg_popup").css("display", "none");
      $("#pop_review").css("display", "none");
      $("body").css("overflow-y","scroll");
      //최신순 버튼초기화
      $(".pop_section2-1-1").css("border","1px solid rgb(221, 221, 221)");
      $(".pop_section_sort").css("display","none");
   });
   // 후기 팝업 바깥여백눌렀을때 창닫기
   $("#bg_popup").click(function(){
      $("#bg_popup").css("display", "none");
      $("#pop_review").css("display", "none");
      $("body").css("overflow-y","scroll");
      // 최신순버튼초기화
      $(".pop_section2-1-1").css("border","1px solid rgb(221, 221, 221)");
      $(".pop_section_sort").css("display","none");
   });
   //최신순버튼눌렀을때
   $(".pop_section2-1-1").click(function(e){//
      if($(".pop_section_sort").css("display") == "none"){
         $(this).css("border", "2px solid black");
         $(".pop_section_sort").css("display" , "block");
      }else if($(".pop_section_sort").css("display") == "block"){
         $(".pop_section_sort").css("display" , "none");
         $(this).css("border","1px solid grey");
      }
   });
   
   // !리뷰창눌렀을때 최신순버튼숨기기
   $("pop_section2-1-1").on("click",function(event){
      event.preventDefault();
      event.stopPropagation();
      return false;
   });
   $("#pop_review").click(function(){
      if($(".pop_section_sort").css("display") == "block"){
         $(".pop_section_sort").css("display" , "none");
         $(".pop_section2-1-1").css("border","1px solid grey");
      }
   });
   
   
   // 후기제목 밑 후기버튼 클릭
    $(".sp2").click(function(){
      $("#bg_popup").css("display", "block");
      $("#pop_review").css("display", "block");
      $("body").css("overflow-y","hidden");
   });
   // 후기글 '더보기'눌렀을때 버튼클릭
    $(".ri2-3>span").click(function(){
      $("#bg_popup").css("display", "block");
      $("#pop_review").css("display", "block");
      $("body").css("overflow-y","hidden");
   });
})