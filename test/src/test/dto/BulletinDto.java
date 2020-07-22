package test.dto;

public class BulletinDto {
	private int num;
	private String name;
	private String title;
	private String content;
	private String regdate;
	private int lookup;
	private String kinds;
	private int startRowNum;
	private int endRowNum;
	
	public BulletinDto() {}

	public BulletinDto(int num, String name, String title, String content, String regdate, int lookup, String kinds,
			int startRowNum, int endRowNum) {
		super();
		this.num = num;
		this.name = name;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.lookup = lookup;
		this.kinds = kinds;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getLookup() {
		return lookup;
	}

	public void setLookup(int lookup) {
		this.lookup = lookup;
	}

	public String getKinds() {
		return kinds;
	}

	public void setKinds(String kinds) {
		this.kinds = kinds;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	
	
	
}
