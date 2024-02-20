package myVo;

public class RoomCategoryVo {
	private int room_category_idx;
	private String category_name;
	private String categorty_icon;
	
	public RoomCategoryVo(int room_category_idx, String category_name, String categorty_icon) {
		this.room_category_idx = room_category_idx;
		this.category_name = category_name;
		this.categorty_icon =categorty_icon;
	}
	
	public int getRoom_category_idx() {
		return room_category_idx;
	}
	public String getCategory_name() {
		return category_name;
	}
	public String getCategory_icon() {
		return categorty_icon;
	}


}
