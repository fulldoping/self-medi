package service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.Paging;
import dto.QnA;


public interface AdQnAService {

	public List<QnA> getList();
	public List<QnA> getList(Paging paging);
	public Paging getPaging(HttpServletRequest req);
	public QnA getBoardno(HttpServletRequest req);
	public QnA view(QnA boardNo);
	public String getNick(QnA viewQnA);
	public void delete(HttpServletRequest req);
	public void commentsDelete(HttpServletRequest req);
	
	
	
	
}
