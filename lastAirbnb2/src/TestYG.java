import java.util.ArrayList;
import java.util.Scanner;

import myDao.Main3Dao;

public class TestYG {

//	public static void main(String[] args) {
//		Main3Dao mDao = new Main3Dao();
//		Scanner sc = new Scanner(System.in);
//		System.out.print("input room_idx(ex.1) : ");
//		int roomIdx = sc.nextInt();
//		System.out.print("input date8ch(ex.20240215) : " );
//		String date8ch = sc.next();
//		boolean b = mDao.checkRoomAvailable(roomIdx, date8ch);
//		System.out.println(b ? "예약가능" : "예약불가능!");
//	}

//	public static void main(String[] args) {
//		   Calendar cal = Calendar.getInstance();
//		   cal.set(2024, 0, 1);
//		   for(int i=1; i<=366; i++) {
//			   String year = "" + cal.get(Calendar.YEAR);
//			   String month = "" + (cal.get(Calendar.MONTH)+1);
//			   if(month.length()==1) month = "0" + month;
//			   String date = "" + cal.get(Calendar.DATE);
//			   if(date.length()==1) date = "0" + date;
//			   System.out.println(year + month + date);
//			   
//			   cal.add(Calendar.DATE, 1);
//		   }
//
//	}
	
	public static void main(String[] args) {
		Main3Dao mDao = new Main3Dao();
		Scanner sc = new Scanner(System.in);
		System.out.print("input room_idx(ex.1) : ");
		int roomIdx = sc.nextInt();
		System.out.println("<2024년 예약불가능 날짜 목록>");
		ArrayList<String> list1 = mDao.getListDate8chUnavailable(roomIdx);
		for(String s : list1) {
			System.out.println(" - " + s);
		}
	}
}
