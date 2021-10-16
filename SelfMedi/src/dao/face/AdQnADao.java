package dao.face;

import java.sql.Connection;
import java.util.List;

import common.Paging;
import dto.QnA;


public interface AdQnADao {

	
	public List<QnA> selectAll(Connection conn);
	public List<QnA> selectAll(Connection conn, Paging paging);
	public int selectCntAll(Connection conn);
	public QnA selectBoardByBoardno(Connection conn, QnA qna);
	public int selectupdateHit(Connection conn, QnA qna);
	public String selectNickByUserid(Connection conn, QnA viewqna);
	public int delete(Connection conn, QnA qna);
	public int commentsDelete(Connection conn, QnA qna);
	
}
