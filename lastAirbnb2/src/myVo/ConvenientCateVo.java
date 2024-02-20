package myVo;

public class ConvenientCateVo{
	private int convenient_category_idx;
	private String convenient_category;
	
	public ConvenientCateVo(int convenient_category_idx, String convenient_category) {
		this.convenient_category_idx = convenient_category_idx;
		this.convenient_category = convenient_category;
	}

	public int getConvenient_category_idx() {
		return convenient_category_idx;
	}

	public void setConvenient_category_idx(int convenient_category_idx) {
		this.convenient_category_idx = convenient_category_idx;
	}

	public String getConvenient_category() {
		return convenient_category;
	}

	public void setConvenient_category(String convenient_category) {
		this.convenient_category = convenient_category;
	}
	
	
}
