package swVo;

public class WishlistVo {
	private int wishlistIdx;
	private int userIdx;
	private String biglistName;
	private int roomIdx;
	private int expIdx;
	private String img1;
	private String expImg1;
	
	public WishlistVo(int wishlistIdx, int userIdx, String biglistName, int roomIdx, int expIdx, String img1,
			String expImg1) {
		this.wishlistIdx = wishlistIdx;
		this.userIdx = userIdx;
		this.biglistName = biglistName;
		this.roomIdx = roomIdx;
		this.expIdx = expIdx;
		this.img1 = img1;
		this.expImg1 = expImg1;
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

	public int getRoomIdx() {
		return roomIdx;
	}

	public int getExpIdx() {
		return expIdx;
	}

	public String getImg1() {
		return img1;
	}

	public String getExpImg1() {
		return expImg1;
	}

	
}
