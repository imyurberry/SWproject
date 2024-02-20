package myVo;

public class ReviewVo {
	private int room_idx;
	private int review_idx;
	private String review;
	private int user_idx;
	private double score;
	private String written_date;
	private String user_id;
	private String user_regidence;
	private String user_image;
	
	public ReviewVo(int room_idx, int review_idx, String review, int user_idx,
			double score, String written_date, String user_id, String user_regidence, String user_image) {
		super();
		this.room_idx = room_idx;
		this.review_idx = review_idx;
		this.review = review;
		this.user_idx = user_idx;
		this.score = score;
		this.written_date = written_date;
		this.user_id = user_id;
		this.user_regidence = user_regidence;
		this.user_image = user_image;
	}

	public int getRoom_idx() {
		return room_idx;
	}

	public int getReview_idx() {
		return review_idx;
	}

	public String getReview() {
		return review;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public double getScore() {
		return score;
	}

	public String getWritten_date() {
		return written_date;
	}
	public String getUser_id() {
		return user_id;
	}

	public String getUser_regidence() {
		return user_regidence;
	}

	public String getUser_image() {
		return user_image;
	}
	
	
}
