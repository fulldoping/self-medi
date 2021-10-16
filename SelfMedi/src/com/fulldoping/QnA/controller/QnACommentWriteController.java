package com.fulldoping.QnA.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fulldoping.QnA.dto.QnA;
import com.fulldoping.QnA.dto.QnAComments;
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
		int commentno = qnaService.commentInsert(req);
    	
		//댓글 전체 조회
		List<QnAComments> commentList = qnaService.getCommentList(Integer.parseInt(req.getParameter("boardNo")));
								
		//조회결과 MODEL값 전달
		req.setAttribute("commentList", commentList);
		
		System.out.println(commentList);
		
		//VIEW 지정 및 응답 - forward
		req.getRequestDispatcher("/WEB-INF/views/QnAboard/comment.jsp").forward(req, resp);
		
    }

}
