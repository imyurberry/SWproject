package esVo;

public class ChatListVo {
	private String userImage;
	private String userId;
	private int msgListIdx;
	private int userIdx;
	
	public ChatListVo(String userImage, String userId, int msgListIdx, int userIdx) {
		this.userImage = userImage;
		this.userId = userId;
		this.msgListIdx = msgListIdx;
		this.userIdx = userIdx;
	}

	public String getUserImage() {
		return userImage;
	}

	public String getUserId() {
		return userId;
	}

	public int getMsgListIdx() {
		return msgListIdx;
	}

	public int getUserIdx() {
		return userIdx;
	}
	
}
