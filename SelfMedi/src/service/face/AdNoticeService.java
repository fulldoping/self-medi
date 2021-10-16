package service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.Paging;
import dto.BoardFile;
import dto.Notice;


public interface AdNoticeService {

	public List<Notice> getList();
	public List<Notice> getList(Paging paging);
	public Paging getPaging(HttpServletRequest req);
	public Notice getBoardno(HttpServletRequest req);
	public Notice view(Notice boardNo);
	public String getNick(Notice viewNotice);
	public void write(HttpServletRequest req);
	public void delete(HttpServletRequest req);
	public void update(HttpServletRequest req);
	public BoardFile viewFile(Notice viewNotice);
	public void commentsWrite(HttpServletRequest req);
	public void commentsDelete(HttpServletRequest req);
	
	
	
	
}
