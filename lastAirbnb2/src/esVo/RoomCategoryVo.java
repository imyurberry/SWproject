package esVo;

public class RoomCategoryVo {
	private int room_category_idx;
	private String category_name;
	private String category_icon;
	
	public RoomCategoryVo(int room_category_idx, String category_name, String category_icon) {
		this.room_category_idx = room_category_idx;
		this.category_name = category_name;
		this.category_icon = category_icon;
	}

	public int getRoom_category_idx() {
		return room_category_idx;
	}

	public String getCategory_name() {
		return category_name;
	}

	public String getCategory_icon() {
		return category_icon;
	}
	
	
}
