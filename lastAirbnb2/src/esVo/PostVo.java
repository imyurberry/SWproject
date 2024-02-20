package esVo;

public class PostVo {
	private int postIdx;
	private int userIdx;
	private String content;
	private String writtenDate;
	
	public PostVo(int postIdx, int userIdx, String content, String writtenDate) {
		this.postIdx = postIdx;
		this.userIdx = userIdx;
		this.content = content;
		this.writtenDate = writtenDate;
	}

	public int getPostIdx() {
		return postIdx;
	}

	public int getUser_idx() {
		return userIdx;
	}

	public String getContent() {
		return content;
	}

	public String getWrittenDate() {
		return writtenDate;
	}
	
	
	
}
