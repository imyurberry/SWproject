package myVo;

public class NotificationVo {
	private int notification_idx;
	private int user_idx;
	private String txt;
	private String date;
	
	// 파라미터를 담는 객체(빈그릇)생성 - 생성자
	public NotificationVo(int notification_idx, int user_idx, String txt, String date) { // 생성자
		this.notification_idx = notification_idx;
		this.user_idx = user_idx;
		this.txt = txt;
		this.date = date;
	}
	
	
	// 값을 넣은 값을 리턴해줌
	public int getNotification_idx() {
		return notification_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public String getTxt() {
		return txt;
	}

	public String getDate() {
		return date;
	}
}
