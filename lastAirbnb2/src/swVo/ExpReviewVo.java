package swVo;

public class ExpReviewVo {
	private int expIdx;
	private int reviewIdx;
	private String review;
	private String userImage;
	private String userName;
	private double score;
	private String writtenDate;
	private int cnt;
	private double avg;
	
	public ExpReviewVo(int expIdx, int reviewIdx, String review, String userImage, String userName, double score,
			String writtenDate, int cnt, double avg) {
		super();
		this.expIdx = expIdx;
		this.reviewIdx = reviewIdx;
		this.review = review;
		this.userImage = userImage;
		this.userName = userName;
		this.score = score;
		this.writtenDate = writtenDate;
		this.cnt = cnt;
		this.avg = avg;
	}

	public int getExpIdx() {
		return expIdx;
	}

	public int getReviewIdx() {
		return reviewIdx;
	}

	public String getReview() {
		return review;
	}

	public String getUserImage() {
		return userImage;
	}

	public String getUserName() {
		return userName;
	}

	public double getScore() {
		return score;
	}

	public String getWrittenDate() {
		return writtenDate;
	}

	public int getCnt() {
		return cnt;
	}

	public double getAvg() {
		return avg;
	}
}