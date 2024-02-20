package esVo;

public class LanguageVo {
	private String language_idx;
	private String location;
	private String language;
	
	public LanguageVo(String language_idx, String location, String language) {
		this.language_idx = language_idx;
		this.location = location;
		this.language = language;
	}
	
	public String getLanguage_idx() {
		return language_idx;
	}
	public String getLocation() {
		return location;
	}
	public String getLanguage() {
		return language;
	}
}
