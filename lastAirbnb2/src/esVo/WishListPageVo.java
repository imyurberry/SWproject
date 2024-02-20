package esVo;

public class WishListPageVo {
	private String img1;
	private String bigListName;
	private int countRoom;
	
	public WishListPageVo(String img1, String bigListName, int countRoom) {
		this.img1 = img1;
		this.bigListName = bigListName;
		this.countRoom = countRoom;
	}

	public String getImg1() {
		return img1;
	}

	public String getBigListName() {
		return bigListName;
	}
	
	public int getCountRoom() {
		return countRoom;
	}
}
