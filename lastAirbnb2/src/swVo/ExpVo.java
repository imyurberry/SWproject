package swVo;

public class ExpVo {
	private int expIdx;
	private String expImg1;
	private String expImg2;
	private String expImg3;
	private String expImg4;
	private String expImg5;
	private double score;
	private String expLocation;
	private int cnt;
	private String expName;
	private int expPrice;
	
	public ExpVo(int expIdx, String expImg1, String expImg2, String expImg3, String expImg4, String expImg5,
			double score, String expLocation, int cnt, String expName, int expPrice) {
		this.expIdx = expIdx;
		this.expImg1 = expImg1;
		this.expImg2 = expImg2;
		this.expImg3 = expImg3;
		this.expImg4 = expImg4;
		this.expImg5 = expImg5;
		this.score = score;
		this.expLocation = expLocation;
		this.cnt = cnt;
		this.expName = expName;
		this.expPrice = expPrice;
	}

	public int getExpIdx() {
		return expIdx;
	}

	public String getExpImg1() {
		return expImg1;
	}

	public String getExpImg2() {
		return expImg2;
	}

	public String getExpImg3() {
		return expImg3;
	}

	public String getExpImg4() {
		return expImg4;
	}

	public String getExpImg5() {
		return expImg5;
	}

	public double getScore() {
		return score;
	}

	public String getExpLocation() {
		return expLocation;
	}

	public int getCnt() {
		return cnt;
	}

	public String getExpName() {
		return expName;
	}

	public int getExpPrice() {
		return expPrice;
	}
}
