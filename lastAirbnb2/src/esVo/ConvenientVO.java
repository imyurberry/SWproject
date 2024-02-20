package esVo;

public class ConvenientVO {
	private int convenientCategoryIdx;
	private int convenientIdx;
	private String convenientName;
	private String convenientImage;
	
	public ConvenientVO(int convenientCategoryIdx, int convenientIdx, String convenientName,
			String convenientImage) {
		this.convenientCategoryIdx = convenientCategoryIdx;
		this.convenientIdx = convenientIdx;
		this.convenientName = convenientName;
		this.convenientImage = convenientImage;
	}

	public int getConvenientCategoryIdx() {
		return convenientCategoryIdx;
	}

	public int getConvenient_idx() {
		return convenientIdx;
	}

	public String getConvenient_name() {
		return convenientName;
	}

	public String getConvenient_image() {
		return convenientImage;
	}
	
}
