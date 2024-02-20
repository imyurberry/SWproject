package esVo;

public class NotificationVo {
	private int notification_idx;
	private int user_idx;
	private String txt;
	private String date;
	
	public NotificationVo(int notification_idx, int user_idx, String txt, String date) {
		this.notification_idx = notification_idx;
		this.user_idx = user_idx;
		this.txt = txt;
		this.date = date;
	}

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
