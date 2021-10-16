package com.fulldoping.admin.free.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fulldoping.free.dto.Free;
import com.fulldoping.free.service.face.FreeService;
import com.fulldoping.free.service.impl.FreeServiceImpl;
import com.fulldoping.paging.Paging;


@WebServlet("/ad/free/list")
public class AdFreeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//FreeService 객체생성
	private FreeService freeService = new FreeServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("[TEST] /ad/free/list [GET]");
		
		//요청파라미터를 전달하여 Paging객체 생성하기
		Paging paging = freeService.getPaging(req);
		
		//게시글 전체 조회
		List<Free> freeList = freeService.getList(paging);
		
		//조회결과 MODEL값 전달
		req.setAttribute("freeList", freeList);
	
		//페이징 정보 MODEL값 전달
		req.setAttribute("paging", paging);
		
		//VIEW 지정 및 응답 - forward
		req.getRequestDispatcher("/WEB-INF/views/admin/board/free/freelist.jsp").forward(req, resp);		
		
	}
}















