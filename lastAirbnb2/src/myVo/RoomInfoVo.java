package myVo;

public class RoomInfoVo {
	private int room_info_idx;
	private String room_info_image;
	private String room_info_category;
	private String room_info_cate_detail;

	public RoomInfoVo(int room_info_idx, String room_info_image, String room_info_category,
			String room_info_cate_detail) {
		this.room_info_idx = room_info_idx;
		this.room_info_image = room_info_image;
		this.room_info_category = room_info_category;
		this.room_info_cate_detail = room_info_cate_detail;
	}

	public int getRoom_info_idx() {
		return room_info_idx;
	}

	public String getRoom_info_image() {
		return room_info_image;
	}

	public String getRoom_info_category() {
		return room_info_category;
	}

	public String getRoom_info_cate_detail() {
		return room_info_cate_detail;
	}
	
	
}
