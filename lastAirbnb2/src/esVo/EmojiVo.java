package esVo;

public class EmojiVo {
	private int emoji_idx;
	private String emoji_url;

	public EmojiVo(int emoji_idx, String emoji_url) {
		this.emoji_idx = emoji_idx;
		this.emoji_url = emoji_url;
	}

	public int getEmoji_idx() {
		return emoji_idx;
	}

	public String getEmoji_url() {
		return emoji_url;
	}
	
}
