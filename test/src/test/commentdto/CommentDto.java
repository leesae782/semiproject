package test.commentdto;

public class CommentDto {

	
	private int num;
	private String name;
	private String content;
	private String regdate;
	private int boardnum;
	private int startRowNum;
	private int endRowNum;
	private int prevNum; //이전글의 글번호
	private int nextNum;//다음글의 글번호
	public CommentDto() {}
	public CommentDto(int num, String name, String content, String regdate, int boardnum, int startRowNum,
			int endRowNum, int prevNum, int nextNum) {
		super();
		this.num = num;
		this.name = name;
		this.content = content;
		this.regdate = regdate;
		this.boardnum = boardnum;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
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
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
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
	public int getPrevNum() {
		return prevNum;
	}
	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}
	public int getNextNum() {
		return nextNum;
	}
	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}

	
	

}