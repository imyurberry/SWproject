package esVo;

public class GetPostReplyByPostIdx {
	private String userImage;
	private String userId;
	private String writtenDate;
	private String content;
	
	public GetPostReplyByPostIdx(String userImage, String userId, String writtenDate, String content) {
		this.userImage = userImage;
		this.userId = userId;
		this.writtenDate = writtenDate;
		this.content = content;
	}

	public String getUserImage() {
		return userImage;
	}

	public String getUserId() {
		return userId;
	}

	public String getWrittenDate() {
		return writtenDate;
	}
	
	public String getContent() {
		return content;
	}
	
}
