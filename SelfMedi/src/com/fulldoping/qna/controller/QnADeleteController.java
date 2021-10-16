package com.fulldoping.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fulldoping.qna.dto.QnA;
import com.fulldoping.qna.service.face.QnAService;
import com.fulldoping.qna.service.impl.QnAServiceImpl;

@WebServlet("/QnA/delete")
public class QnADeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//QnAService 객체 생성
    private QnAService qnaService = new QnAServiceImpl();   
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/QnA/delete [GET]");
		
		QnA board = qnaService.getBoardno(req);
		
		qnaService.delete(board);
		
		//목록으로 리다이렉트
		resp.sendRedirect("/QnA/list");
	}

}
