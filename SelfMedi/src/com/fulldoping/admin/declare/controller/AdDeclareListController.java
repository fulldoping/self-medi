package com.fulldoping.admin.declare.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ad/declare/list")
public class AdDeclareListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("[TEST] /ad/declare/list [GET]");
		
		req.getRequestDispatcher("/WEB-INF/views/admin/board/declare/declarelist.jsp").forward(req, resp);
		
	}

}
