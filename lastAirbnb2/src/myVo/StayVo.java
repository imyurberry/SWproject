package myVo;

public class StayVo {
	private int stay_idx;
	private int room_idx;
	private String stay_img;
	private String stay_type;
	private String bed_count;

	public StayVo(int stay_idx, int room_idx, String stay_img, String stay_type, String bed_count) {
		this.stay_idx = stay_idx;
		this.room_idx = room_idx;
		this.stay_img = stay_img;
		this.stay_type = stay_type;
		this.bed_count = bed_count;
	}

	public int getStay_idx() {
		return stay_idx;
	}

	public int getRoom_idx() {
		return room_idx;
	}

	public String getStay_img() {
		return stay_img;
	}

	public String getStay_type() {
		return stay_type;
	}

	public String getBed_count() {
		return bed_count;
	}
	
	
}
