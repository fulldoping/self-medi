package com.fulldoping.admin.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ad/qna/list")
public class AdQnaListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("[TEST] /ad/qna/list [GET]");
		
		req.getRequestDispatcher("/WEB-INF/views/admin/board/qna/qnalist.jsp").forward(req, resp);
	}

}
