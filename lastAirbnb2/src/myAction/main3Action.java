package myAction;

import java.io.IOException; 
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import myDao.Main3Dao;
import myVo.ConvenientVo;
import myVo.ReviewVo;
import myVo.RoomExplainVo;
import myVo.RoomImageVo;
import myVo.RoomInfoVo;
import myVo.RoomVo;
import myVo.StayVo;
import esVo.UserInfoVo;

public class main3Action implements Action{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Main3Dao dao3 = new Main3Dao();
   
      // main2.jsp占쎈쐻占쎈윥占쎈군占쎈쐻占쎈윞占쎈쭓 占쎈쐻占쎈윞占쎈쭆占쎈눇�댆�슜爾쏉옙�쐻�뜝占� 占쎈쐻占쎈윥占쎈묍占쎈쐻占쎈윥�댆六웓x,占쎈쐻占쎈윪繹먮뛼�쐻占쎈윥獒뺤쉩�쐻占쎈윥獄��릥dx 占쎈쎗占쎈즵�뙴袁ㅻ뎨�뜝占�
      int roomIdx = Integer.parseInt(request.getParameter("roomIdx"));
      RoomVo roomvo = dao3.getRoom(roomIdx);
      int hostidx = roomvo.getUser_idx();
      
      
      // �뜝�럥���뜝�럥�떁nfo 占쎈쐻占쎈윪占쎄껑�뜝�럥�걫�뜝�럥堉э옙逾녑뜝占�
      String str = roomvo.getRoom_info_idx(); //1,2,3
      String[] str2 = str.split(",");
      
      String conv = roomvo.getConvenient_idx();
      

                                                
      int countReview = dao3.getCountReview(roomIdx);
      RoomImageVo imagevo = dao3.getRoomImage(roomIdx);
      UserInfoVo uservo = dao3.getUserInfo(hostidx);
      RoomExplainVo explainvo = dao3.getRoomExplain(roomIdx);
      ArrayList<RoomInfoVo> roominfovo = dao3.getRoomInfo(roomIdx,str2);
      ArrayList<ConvenientVo> convenientvo = dao3.getConvenientV2(conv);
      ArrayList<ReviewVo> reviewvo = dao3.getReview(roomIdx);
      ArrayList<StayVo> stayvo = dao3.getStay(roomIdx);
      

      
      request.setAttribute("roomvo",roomvo);
      request.setAttribute("countReview",countReview);
      request.setAttribute("imagevo",imagevo);
      request.setAttribute("uservo",uservo);
      request.setAttribute("explainvo",explainvo);
      request.setAttribute("roominfovo",roominfovo);
      request.setAttribute("reviewvo",reviewvo);
      request.setAttribute("convenientvo",convenientvo);
      request.setAttribute("stayvo",stayvo);
//      for(StayVo vo : stayvo) {
//    	  if(vo.getStay_img().contains("svg")){
//    		  System.out.println(vo.getStay_img());
//    	  }else {
//    		  System.out.println(vo.getStay_img());
//    	  }
//      }
//      
      
      
      RequestDispatcher rd = request.getRequestDispatcher("main3.jsp");
      rd.forward(request, response);
      
   }
   
   

}