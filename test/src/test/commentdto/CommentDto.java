package test.commentdto;

public class CommentDto {

	
	private int num;
	private String name;
	private String content;
	private String regdate;
	private String boardnum;
	
	public CommentDto() {}

	public CommentDto(int num, String name, String content, String regdate, String boardnum) {
		super();
		this.num = num;
		this.name = name;
		this.content = content;
		this.regdate = regdate;
		this.boardnum = boardnum;
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

	public String getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(String boardnum) {
		this.boardnum = boardnum;
	}
	
}
