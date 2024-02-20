package esVo;

public class ChatDetailVo {
	private String userId;
	private String userImage;
	private int msgListIdx;
	private int userIdx;
	private String msg;
	private String dateTime;
	private int msgIdx;
	
	public ChatDetailVo(String userId, String userImage, int msgListIdx, int userIdx, String msg, String dateTime,
			int msg_idx) {
		this.userId = userId;
		this.userImage = userImage;
		this.msgListIdx = msgListIdx;
		this.userIdx = userIdx;
		this.msg = msg;
		this.dateTime = dateTime;
		this.msgIdx = msg_idx;
	}

	public String getUserId() {
		return userId;
	}

	public String getUserImage() {
		return userImage;
	}

	public int getMsgListIdx() {
		return msgListIdx;
	}

	public int getUserIdx() {
		return userIdx;
	}

	public String getMsg() {
		return msg;
	}

	public String getDateTime() {
		return dateTime;
	}

	public int getMsg_idx() {
		return msgIdx;
	}
	
	
}
