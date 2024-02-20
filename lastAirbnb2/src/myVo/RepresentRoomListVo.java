package myVo;

public class RepresentRoomListVo {
	private String img1;
	private String roomName;
	private double roomScore;
	private int roomPrice;
	private double latitude;
	private double longitude;
	private int roomIdx;
	/* private int host_idx; */
	
	public RepresentRoomListVo(String img1, String roomName, double roomScore, int roomPrice, double latitude,
			double longitude, int roomIdx/* ,int host_idx */) {
		this.img1 = img1;
		this.roomName = roomName;
		this.roomScore = roomScore;
		this.roomPrice = roomPrice;
		this.latitude = latitude;
		this.longitude = longitude;
		this.roomIdx = roomIdx;
		/* this.host_idx = host_idx; */
	}

	public String getImg1() {
		return img1;
	}

	public String getRoomName() {
		return roomName;
	}

	public double getRoomScore() {
		return roomScore;
	}

	public int getRoomPrice() {
		return roomPrice;
	}

	public double getLatitude() {
		return latitude;
	}

	public double getLongitude() {
		return longitude;
	}
	
	public int getRoomIdx() {
		return roomIdx;
	}
	/*
	 * public int getHost_idx() { return host_idx; }
	 */
}
