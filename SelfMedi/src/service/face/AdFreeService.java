package service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.Paging;
import dto.Free;


public interface AdFreeService {

	public List<Free> getList();
	public List<Free> getList(Paging paging);
	public Paging getPaging(HttpServletRequest req);
	public Free getBoardno(HttpServletRequest req);
	public Free view(Free boardNo);
	public String getNick(Free viewFree);
	public void delete(HttpServletRequest req);
	public void commentsDelete(HttpServletRequest req);
	
	
	
	
}
