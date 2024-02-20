package myVo;

public class RoomImageVo {
	private int img_idx;
	private int room_idx;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private String img5;
	
	public RoomImageVo(int img_idx, int room_idx, String img1, String img2, String img3, String img4, String img5) {
		this.img_idx = img_idx;
		this.room_idx = room_idx;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.img4 = img4;
		this.img5 = img5;
	}

	public int getImg_idx() {
		return img_idx;
	}

	public int getRoom_idx() {
		return room_idx;
	}

	public String getImg1() {
		return img1;
	}

	public String getImg2() {
		return img2;
	}

	public String getImg3() {
		return img3;
	}

	public String getImg4() {
		return img4;
	}

	public String getImg5() {
		return img5;
	}
	
	
}
