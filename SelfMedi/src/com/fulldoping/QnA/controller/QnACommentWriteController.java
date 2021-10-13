package com.fulldoping.QnA.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fulldoping.QnA.service.face.QnAService;
import com.fulldoping.QnA.service.impl.QnAServiceImpl;

@WebServlet("/QnA/Comment/write")
public class QnACommentWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//QnAService 객체 생성
    private QnAService qnaService = new QnAServiceImpl(); 
	
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	System.out.println("/QnA/Comment/write [POST]");
		
		req.setCharacterEncoding("utf-8");
		System.out.print(req.getParameter("boardNo"));
		System.out.println(req.getParameter("content"));
		
		//작성댓글 삽입
		qnaService.commentInsert(req);
		
		//댓글 목록 
		resp.sendRedirect("/QnA/Comment");
		
    }

}
