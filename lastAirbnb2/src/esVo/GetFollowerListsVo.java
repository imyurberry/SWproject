package esVo;

public class GetFollowerListsVo {
	private String userImage;
	private String userId;
	
	public GetFollowerListsVo(String userImage, String userId) {
		this.userImage = userImage;
		this.userId = userId;
	}

	public String getUserImage() {
		return userImage;
	}

	public String getUserId() {
		return userId;
	}
	
}
