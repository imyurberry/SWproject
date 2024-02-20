package myVo;

public class ConvenientVo {
	private int convenientCategoryIdx;
	private int convenientIdx;
	private String convenientName;
	private String convenientImage;
	private String convenientEx;
	
	public ConvenientVo(int convenientCategoryIdx, int convenientIdx, String convenientName, String convenientImage,
			String convenientEx) {
		this.convenientCategoryIdx = convenientCategoryIdx;
		this.convenientIdx = convenientIdx;
		this.convenientName = convenientName;
		this.convenientImage = convenientImage;
		this.convenientEx = convenientEx;
	}

	public int getConvenientCategoryIdx() {
		return convenientCategoryIdx;
	}

	public int getConvenientIdx() {
		return convenientIdx;
	}

	public String getConvenientName() {
		return convenientName;
	}

	public String getConvenientImage() {
		return convenientImage;
	}

	public String getConvenientEx() {
		return convenientEx;
	}
}
