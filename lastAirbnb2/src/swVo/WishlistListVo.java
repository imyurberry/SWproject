package swVo;

public class WishlistListVo {
	private int wishlistIdx;
	private int userIdx;
	private String biglistName;
	private String img;
	private int cnt;
	
	public WishlistListVo(int wishlistIdx, int userIdx, String biglistName, String img, int cnt) {
		this.wishlistIdx = wishlistIdx;
		this.userIdx = userIdx;
		this.biglistName = biglistName;
		this.img = img;
		this.cnt = cnt;
	}

	public int getWishlistIdx() {
		return wishlistIdx;
	}

	public int getUserIdx() {
		return userIdx;
	}

	public String getBiglistName() {
		return biglistName;
	}

	public String getImg() {
		return img;
	}

	public int getCnt() {
		return cnt;
	}
	
	

}
