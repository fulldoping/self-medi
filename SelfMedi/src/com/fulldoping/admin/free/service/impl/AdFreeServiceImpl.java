package com.fulldoping.admin.free.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.fulldoping.admin.free.dao.face.AdFreeDao;
import com.fulldoping.admin.free.dao.impl.AdFreeDaoImpl;
import com.fulldoping.admin.free.service.face.AdFreeService;
import com.fulldoping.common.JDBCTemplate;
import com.fulldoping.free.dto.Free;
import com.fulldoping.free.dto.FreeFile;
import com.fulldoping.paging.Paging;

public class AdFreeServiceImpl implements AdFreeService {

	//AdFreeDao 객체생성
	private AdFreeDao adfreeDao = new AdFreeDaoImpl();
	
	
	@Override
	public List<Free> getList(Paging paging) {
		//게시글 전체 조회 결과 처리 - 페이징 추가
		return adfreeDao.selectAll(JDBCTemplate.getConnection(), paging);
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
		int totalCount = adfreeDao.selectCntAll(JDBCTemplate.getConnection());
		
		//Paging객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;	}

	@Override
	public Free getboardNo(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Free view(Free boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FreeFile viewFile(Free viewFree) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Free free) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String getuserNick(Free viewFree) {
		// TODO Auto-generated method stub
		return null;
	}
}
