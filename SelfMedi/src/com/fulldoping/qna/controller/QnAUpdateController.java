package com.fulldoping.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fulldoping.qna.dto.QnA;
import com.fulldoping.qna.dto.QnAFile;
import com.fulldoping.qna.service.face.QnAService;
import com.fulldoping.qna.service.impl.QnAServiceImpl;

@WebServlet("/QnA/update")
public class QnAUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//QnAService 객체 생성
    private QnAService qnaService = new QnAServiceImpl(); 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/QnA/update [GET]");
		//전달파라미터 얻기 - boardno
		QnA boardno = qnaService.getBoardno(req);

		//상세보기 결과 조회
		QnA updateBoard = qnaService.getview(boardno);
		
		//닉네임 전달
		req.setAttribute("nick", qnaService.getNick(updateBoard));
		
		//조회결과 MODEL값 전달
		req.setAttribute("updateBoard", updateBoard);

		//첨부파일 정보 VIEW에 전달
		QnAFile boardFile = qnaService.getviewFile(updateBoard);
		req.setAttribute("boardFile", boardFile);

		//VIEW 지정 및 응답 - forward
		req.getRequestDispatcher("/WEB-INF/views/QnAboard/update.jsp").forward(req, resp);		

		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/QnA/update [POST]");
		
		qnaService.update(req);
		
		resp.sendRedirect("/QnA/list");
	}

}
