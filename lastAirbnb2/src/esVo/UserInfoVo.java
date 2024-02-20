package esVo;

public class UserInfoVo {
	private int user_idx;
	private String user_id;
	private String user_regidence;
	private String user_image;
	private String introduce;
	private String interact;
	private String super_host;
	private String join_date;
	private String user_school;
	private String user_job;
	private String hometown;
	private String birthday;
	private String email;
	private String phone_number;
	private String second_number;
	private String password;
	private String active;
	
	public UserInfoVo(int user_idx, String user_id, String user_regidence, String user_image, String introduce,
			String interact, String super_host, String join_date, String user_school, String user_job, String hometown,
			String birthday, String email, String phone_number, String second_number, String password, String active) {
		this.user_idx = user_idx;
		this.user_id = user_id;
		this.user_regidence = user_regidence;
		this.user_image = user_image;
		this.introduce = introduce;
		this.interact = interact;
		this.super_host = super_host;
		this.join_date = join_date;
		this.user_school = user_school;
		this.user_job = user_job;
		this.hometown = hometown;
		this.birthday = birthday;
		this.email = email;
		this.phone_number = phone_number;
		this.second_number = second_number;
		this.password = password;
		this.active = active;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getUser_regidence() {
		return user_regidence;
	}

	public String getUser_image() {
		return user_image;
	}

	public String getIntroduce() {
		return introduce;
	}

	public String getInteract() {
		return interact;
	}

	public String getSuper_host() {
		return super_host;
	}

	public String getJoin_date() {
		return join_date;
	}

	public String getUser_school() {
		return user_school;
	}

	public String getUser_job() {
		return user_job;
	}

	public String getHometown() {
		return hometown;
	}

	public String getBirthday() {
		return birthday;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public String getSecond_number() {
		return second_number;
	}

	public String getPassword() {
		return password;
	}

	public String getActive() {
		return active;
	}
	
	
	
}
