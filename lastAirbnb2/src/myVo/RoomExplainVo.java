package myVo;

public class RoomExplainVo {
	private int room_idx;
	private String r_explain;
	private String room_char;
	private String room_place;
	private String room_etc;
	private String room_register;
	
	public RoomExplainVo(int room_idx, String r_explain, String room_char, String room_place, String room_etc,
			String room_register) {
		this.room_idx = room_idx;
		this.r_explain = r_explain;
		this.room_char = room_char;
		this.room_place = room_place;
		this.room_etc = room_etc;
		this.room_register = room_register;
	}

	public int getRoom_idx() {
		return room_idx;
	}

	public String getR_explain() {
		return r_explain;
	}

	public String getRoom_char() {
		return room_char;
	}

	public String getRoom_place() {
		return room_place;
	}

	public String getRoom_etc() {
		return room_etc;
	}

	public String getRoom_register() {
		return room_register;
	}
	
	
}
