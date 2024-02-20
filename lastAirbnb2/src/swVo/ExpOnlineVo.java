package swVo;

public class ExpOnlineVo {
	private int onlineIdx;
	private String expType;
	private String onlineTitle;
	private String onlineImage;
	private String onlineInfo;
	
	public ExpOnlineVo(int onlineIdx, String expType, String onlineTitle, String onlineImage, String onlineInfo) {
		super();
		this.onlineIdx = onlineIdx;
		this.expType = expType;
		this.onlineTitle = onlineTitle;
		this.onlineImage = onlineImage;
		this.onlineInfo = onlineInfo;
	}

	public int getOnlineIdx() {
		return onlineIdx;
	}

	public String getExpType() {
		return expType;
	}

	public String getOnlineTitle() {
		return onlineTitle;
	}

	public String getOnlineImage() {
		return onlineImage;
	}

	public String getOnlineInfo() {
		return onlineInfo;
	}
}
