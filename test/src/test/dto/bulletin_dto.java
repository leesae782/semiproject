package test.dto;

public class bulletin_dto {
	private int num;
	private String name;
	private String bulletin_title;
	private String bulletin_content;
	private String regdate;
	private int recom;
	private int lookup;
	
	public bulletin_dto() {}

	public bulletin_dto(int num, String name, String bulletin_title, String bulletin_content, String regdate, int recom,
			int lookup) {
		super();
		this.num = num;
		this.name = name;
		this.bulletin_title = bulletin_title;
		this.bulletin_content = bulletin_content;
		this.regdate = regdate;
		this.recom = recom;
		this.lookup = lookup;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBulletin_title() {
		return bulletin_title;
	}

	public void setBulletin_title(String bulletin_title) {
		this.bulletin_title = bulletin_title;
	}

	public String getBulletin_content() {
		return bulletin_content;
	}

	public void setBulletin_content(String bulletin_content) {
		this.bulletin_content = bulletin_content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getRecom() {
		return recom;
	}

	public void setRecom(int recom) {
		this.recom = recom;
	}

	public int getLookup() {
		return lookup;
	}

	public void setLookup(int lookup) {
		this.lookup = lookup;
	}
	
}
