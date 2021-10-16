package dao.face;

import java.sql.Connection;
import java.util.List;

import common.Paging;
import dto.BoardFile;
import dto.Notice;


public interface AdNoticeDao {

	
	public List<Notice> selectAll(Connection conn);
	public List<Notice> selectAll(Connection conn, Paging paging);
	public int selectCntAll(Connection conn);
	public Notice selectBoardByBoardno(Connection conn, Notice notice);
	public int selectupdateHit(Connection conn, Notice notice);
	public String selectNickByUserid(Connection conn, Notice viewnotice);
	public int insert(Connection conn, Notice notice);
	public int delete(Connection conn, Notice notice);
	public int update(Connection conn, Notice notice);
	public int selectNextBoardno(Connection conn);
	public int selectinsertFile(Connection conn, BoardFile boardFile);
	public BoardFile selectFile(Connection conn, Notice viewBoard);
	public int commentsInsert(Connection conn, Notice notice);
	public int commentsDelete(Connection conn, Notice notice);
	
}
