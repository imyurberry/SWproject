package esVo;

public class PostReplyVo {
	private int replyIdx;
	private int userIdx;
	private int postIdx;
	private String content;
	private String writtenDate;
	
	public PostReplyVo(int replyIdx, int userIdx, int postIdx, String content, String writtenDate) {
		this.replyIdx = replyIdx;
		this.userIdx = userIdx;
		this.postIdx = postIdx;
		this.content = content;
		this.writtenDate = writtenDate;
	}

	public int getReplyIdx() {
		return replyIdx;
	}

	public int getUserIdx() {
		return userIdx;
	}

	public int getPostIdx() {
		return postIdx;
	}

	public String getContent() {
		return content;
	}

	public String getWrittenDate() {
		return writtenDate;
	}
	
}
