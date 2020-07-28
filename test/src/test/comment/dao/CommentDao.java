package test.comment.dao;

public class CommentDao {
	private static CommentDao dao;
	private CommentDao() {}
	public static CommentDao getInstance() {
		
		if(dao==null) {
			dao= new CommentDao();
		}
		return dao;
	}
	
}


