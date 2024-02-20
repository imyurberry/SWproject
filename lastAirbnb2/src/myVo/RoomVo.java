package myVo;


public class RoomVo {
	private int room_idx;
	private int room_category_idx;
	private String room_name;
	private Double room_score;
	private String room_location;
	private int country_idx;
	private double latitude;
	private double longitude;
	private int room_price;
	private int room_sale; 
	private String room_type;
	private String room_info_idx;
	private String room_info_ex;
	private int max_member; 
	private int bedroom;
	private int bed_total;
	private int bathroom;
	private String pet;
	private String immediately;
	private String self_check_in;
	private int building_type;
	private String convenient_idx;
	private int user_idx;
	
	public RoomVo(int room_idx, int room_category_idx, String room_name, Double room_score, String room_location,
			int country_idx, double latitude, double longitude, int room_price, int room_sale, String room_type,
			String room_info_idx, String room_info_ex, int max_member, int bedroom, int bed_total, int bathroom,
			String pet, String immediately, String self_check_in, int building_type, String convenient_idx, int user_idx) {
		this.room_idx = room_idx;
		this.room_category_idx = room_category_idx;
		this.room_name = room_name;
		this.room_score = room_score;
		this.room_location = room_location;
		this.country_idx = country_idx;
		this.latitude = latitude;
		this.longitude = longitude;
		this.room_price = room_price;
		this.room_sale = room_sale;
		this.room_type = room_type;
		this.room_info_idx = room_info_idx;
		this.room_info_ex = room_info_ex;
		this.max_member = max_member;
		this.bedroom = bedroom;
		this.bed_total = bed_total;
		this.bathroom = bathroom;
		this.pet = pet;
		this.immediately = immediately;
		this.self_check_in = self_check_in;
		this.building_type = building_type;
		this.convenient_idx = convenient_idx;
		this.user_idx = user_idx;
	}


	public int getRoom_idx() {
		return room_idx;
	}


	public int getRoom_category_idx() {
		return room_category_idx;
	}

	public String getRoom_name() {
		return room_name;
	}


	public Double getRoom_score() {
		return room_score;
	}


	public String getRoom_location() {
		return room_location;
	}


	public int getCountry_idx() {
		return country_idx;
	}


	public double getLatitude() {
		return latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public int getRoom_price() {
		return room_price;
	}


	public int getRoom_sale() {
		return room_sale;
	}


	public String getRoom_type() {
		return room_type;
	}


	public String getRoom_info_idx() {
		return room_info_idx;
	}



	public String getRoom_info_ex() {
		return room_info_ex;
	}



	public int getMax_member() {
		return max_member;
	}


	public int getBedroom() {
		return bedroom;
	}



	public int getBed_total() {
		return bed_total;
	}



	public int getBathroom() {
		return bathroom;
	}


	public String getPet() {
		return pet;
	}

	public String getImmediately() {
		return immediately;
	}



	public String getSelf_check_in() {
		return self_check_in;
	}

	public int getBuilding_type() {
		return building_type;
	}


	public String getConvenient_idx() {
		return convenient_idx;
	}



	public int getUser_idx() {
		return user_idx;
	}

	
	
}
