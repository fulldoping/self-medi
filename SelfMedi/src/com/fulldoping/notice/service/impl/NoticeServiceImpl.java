package com.fulldoping.notice.service.impl;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.fulldoping.common.JDBCTemplate;
import com.fulldoping.free.dto.Free;
import com.fulldoping.notice.dao.face.NoticeDao;
import com.fulldoping.notice.dao.impl.NoticeDaoImpl;
import com.fulldoping.notice.dto.Notice;
import com.fulldoping.notice.dto.NoticeFile;
import com.fulldoping.notice.service.face.NoticeService;
import com.fulldoping.paging.Paging;

public class NoticeServiceImpl implements NoticeService {

	//NoticeDao 객체 생성
	private NoticeDao noticeDao = new NoticeDaoImpl();
	
	@Override
	public List<Notice> getList(Paging paging) {
		
		//게시글 전체 조회 결과 처리 - 페이징 추가 
		return noticeDao.selectAll(JDBCTemplate.getConnection(), paging);
	}
	
	@Override
	public Paging getPaging(HttpServletRequest req) {
		
		//전달파라미터 curPage 파싱
		String param = req.getParameter("curPage");
		int curPage = 0;
		if(param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		} else {
			System.out.println("[WARNING] curPage값이 null이거나 비어있습니다");
		}
		
		//Free 테이블의 총 게시글 수를 조회한다
		int totalCount = noticeDao.selectCntAll(JDBCTemplate.getConnection());
		
		//Paging객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}	
	
	@Override
	public Notice getboardNo(HttpServletRequest req) {
		
		//boardNo를 저장할 객체 생성
		Notice boardNo = new Notice();	
		
		//boardNo 전달파라미터 검증 - null, ""
		String param = req.getParameter("boardNo");
		if(param!=null && !"".equals(param)) {
			
			//boardNo 전달파라미터 추출
			boardNo.setBoardNo( Integer.parseInt(param) );
		}
		
		//결과 객체 반환
		return boardNo;
		
	}

	@Override
	public Notice view(Notice boardNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		//조회수 증가
		if( noticeDao.updateHit(conn, boardNo) == 1 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		//게시글 조회
		Notice notice = noticeDao.selectFreeByBoardNo(conn, boardNo); 
			
		return notice;
	}

	@Override
	public String getuserNick(Notice viewNotice) {
		return noticeDao.selectuserNickByUserId(JDBCTemplate.getConnection(), viewNotice);
	}

	@Override
	public NoticeFile viewFile(Notice viewNotice) {
		return noticeDao.selectFile(JDBCTemplate.getConnection(), viewNotice);
	}






}
