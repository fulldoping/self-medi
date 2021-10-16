package dao.face;

import java.sql.Connection;
import java.util.List;

import common.Paging;
import dto.Free;


public interface AdFreeDao {

	
	public List<Free> selectAll(Connection conn);
	public List<Free> selectAll(Connection conn, Paging paging);
	public int selectCntAll(Connection conn);
	public Free selectBoardByBoardno(Connection conn, Free free);
	public int selectupdateHit(Connection conn, Free free);
	public String selectNickByUserid(Connection conn, Free viewfree);
	public int delete(Connection conn, Free free);
	public int commentsDelete(Connection conn, Free free);
	
}
