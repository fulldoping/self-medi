package service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.Paging;
import dto.Dclare;


public interface AdDclareService {

	public List<Dclare> getList();
	public List<Dclare> getList(Paging paging);
	public Paging getPaging(HttpServletRequest req);
	public Dclare getBoardno(HttpServletRequest req);
	public Dclare view(Dclare boardNo);
	public String getNick(Dclare viewDclare);
	public void delete(HttpServletRequest req);
	public void commentsDelete(HttpServletRequest req);
	
	
	
	
}
