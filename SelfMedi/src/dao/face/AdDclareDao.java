package dao.face;

import java.sql.Connection;
import java.util.List;

import common.Paging;
import dto.Dclare;


public interface AdDclareDao {

	
	public List<Dclare> selectAll(Connection conn);
	public List<Dclare> selectAll(Connection conn, Paging paging);
	public int selectCntAll(Connection conn);
	public Dclare selectBoardByBoardno(Connection conn, Dclare dclare);
	public int selectupdateHit(Connection conn, Dclare dclare);
	public String selectNickByUserid(Connection conn, Dclare viewdclare);
	public int delete(Connection conn, Dclare dclare);
	public int commentsDelete(Connection conn, Dclare dclare);
	
}
