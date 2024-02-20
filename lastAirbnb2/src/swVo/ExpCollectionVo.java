package swVo;

public class ExpCollectionVo {
	private int collectionIdx;
	private String collectionName;
	private String img;
	
	public ExpCollectionVo(int collectionIdx, String collectionName, String img) {
		this.collectionIdx = collectionIdx;
		this.collectionName = collectionName;
		this.img = img;
	}

	public int getCollectionIdx() {
		return collectionIdx;
	}

	public String getCollectionName() {
		return collectionName;
	}

	public String getImg() {
		return img;
	}
}
