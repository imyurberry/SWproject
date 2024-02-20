package esVo;

import java.util.ArrayList;

import esDao.ProfileTimelineDao;

public class TotalPostVo {
	private PostVo postList;
	private ArrayList<GetPostReplyByPostIdx> replyList;
	private int totalCountLike;
	private int totalCountReply;
	
	public TotalPostVo(PostVo postList, ArrayList<GetPostReplyByPostIdx> replyList, int totalCountLike,
			int totalCountReply) {
		this.postList = postList;
		this.replyList = replyList;
		this.totalCountLike = totalCountLike;
		this.totalCountReply = totalCountReply;
	}
	
	public PostVo getPostList() {
		return postList;
	}
	public ArrayList<GetPostReplyByPostIdx> getReplyList() {
		return replyList;
	}
	public int getTotalCountReply() {
		return totalCountReply;
	}
	public int getTotalCountLike(){
		return totalCountLike;
	}
	
}
