package com.fulldoping.member.service.impl;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.fulldoping.common.JDBCTemplate;
import com.fulldoping.member.dao.face.BusinessMemberDao;
import com.fulldoping.member.dao.impl.BusinessMemberDaoImpl;
import com.fulldoping.member.dto.Member;
import com.fulldoping.member.dto.MemberFile;
import com.fulldoping.member.service.face.BusinessMemberService;

public class BusinessMemberServiceImpl implements BusinessMemberService {

	//MemberDao 객체
	private BusinessMemberDao businessMemberDao = new BusinessMemberDaoImpl();
	
	@Override
	public Member getLoginBusinessMember(HttpServletRequest req) {
		
		try {
			//인코딩 처리하기
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//Member 객체 생성
		Member member = new Member();
		
		System.out.println("req.getParameter(\"userId\")========= " + req.getParameter("userId")   );
		
		//전달파라미터에서 가져오기
		member.setUserId( req.getParameter("userId") );
		member.setUserPw( req.getParameter("userPw") );
		
		//결과 반환
		return member;
	}

	
	@Override
	public boolean loginBusiness(Member member) {
		
		if ( businessMemberDao.selectCntBusinessMemberByUserIdUserPw(JDBCTemplate.getConnection(), member) > 0 ) {
			return true; //로그인 성공
		} else {	
			return false; //로그인 실패	
		}	
	}

	
	@Override
	public Member infoBusiness(Member member) {
		
		return businessMemberDao.selectBusinessMemberByUserNo(JDBCTemplate.getConnection(), member);
	}

	
	@Override
	public Member getJoinBusinessMember(HttpServletRequest req) {
		try {
			//인코딩 처리하기
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//Member 객체 생성
		Member member = new Member();

		//전달파라미터에서 가져오기
		member.setUserId(req.getParameter("userId"));
		member.setUserPw(req.getParameter("userPw"));
		member.setUserName( req.getParameter("userName"));
		member.setUserNick(req.getParameter("userNick"));
		member.setUserEm( req.getParameter("userEm"));
		member.setUserPh( req.getParameter("userPh"));
		member.setUserGen( req.getParameter("userGen"));
		member.setUserBirth( req.getParameter("userBirth"));
		member.setBusinessNo( Integer.parseInt(req.getParameter("businessNo")));
//		member.setBusinessNo( Integer.parseInt(req.getParameter("businessNo")));
		
		//결과 반환
		return member;
	}

	
	@Override
	public void joinBusiness(Member member) {		
		Connection conn = JDBCTemplate.getConnection();

		if( businessMemberDao.insertBusiness(conn, member) > 0 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
	}

	
	@Override
	public void businesMemberFileUpload(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("BusinessMember - FileUpload");
		
		
		//회원 정보 DTO 객체
		Member member = null;
		
		//회원파일 정보 DTO 객체
		MemberFile memberFile = null;


		//---------------------------------------------------------------------
		
		//파일 업도르 형식이 맞는지 검사
		// -> 요청메시지의 content-type이 multipart/form-data인지 확인한다
		boolean isMultipart = false;
		isMultipart = ServletFileUpload.isMultipartContent(req);
		
		//multipart/form-data가 아니면 파일 업로드 처리 중단하기
		if( !isMultipart ) {
			System.out.println("[ERROR] multipart/form-data 형식이 아님");
			
			return;	//BusinesMemberFileUpload() 메소드 중단
		}
		
		
		
		
		
		//회원 정보를 저장할 DTO객체 생성
		member = new Member();
		

		
		
		//디스크기반 파일아이템 처리하는 펙토리 클래스
		DiskFileItemFactory foctory = new DiskFileItemFactory();
		
		//메모리 처리 사이즈 지정
		foctory.setSizeThreshold(1 * 1024 * 1024); //1MB
		
		//임시 저장소 설정
		File repository = new File(req.getServletContext().getRealPath("tmp"));
		repository.mkdir(); //임시 저장소 폴더 생성
		foctory.setRepository(repository); //임시 저장소 폴더 저장
		

		
		
		
		
		//파일 업로드 객체 생성
		ServletFileUpload upload = new ServletFileUpload(foctory);
		
		//업로드 용량 제한
		upload.setFileSizeMax(10 * 1024 * 1024); //10MB
		
		
		
		
		
		//전달 데이터 파싱
		List<FileItem> items = null;
		
		try {
			items = upload.parseRequest(req);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		
		//파싱된 전달파라미터를 처리할 반복자
		Iterator<FileItem> iter = items.iterator();
		
		while( iter.hasNext() ) {	//모든 요청 정보 처리
			FileItem item = iter.next();
		
		
			
		
			//--- 1) 빈 파일에 대한 처리 ---
			if( item.getSize() <= 0 ) {
				continue;	//빈 파일을 무시하고 다음 FileItem처리로 넘긴다
			}
			
			
			
			
			
			//--- 2) form-data에 대한 처리 ---
			if( item.isFormField() ) {
				//키 추출하기
				String key = item.getFieldName();
				
				//값 추출하기
				String value = null;
				
				try {
					value = item.getString("UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				
				//키(name)에 따라서 value저장하기
				if( "pharmacy".equals(key) ) {
					memberFile.setPharmacy( value );
				}

				
			}	//if( item.isFormFieId() ) end
			
			
			
			
			
			//--- 3) 파일에 대한 처리 ---
			if( !item.isFormField() ) {
				
				
				//UUID 생성
				UUID uuid = UUID.randomUUID(); //랜덤 UUID
				String uid = uuid.toString().split("-")[0]; //8자리 uuid
				
				//로컬 저장소의 업로드 폴더
				File upFolder = new File(req.getServletContext().getRealPath("upload"));
				upFolder.mkdir();
				
				//업로드 파일 객체
				String origin = item.getName();	//원본파일명
				String stored = origin + "_" + uid; //원본파일명_uid
				File up = new File(upFolder, stored);
				
//				System.out.println("[TEST] 원본 파일명 :" + origin);
//				System.out.println("[TEST] 저장될 파일명 :" + stored);
				
				//-----------------------------------------------
				
						
				
				
			
				
				try {
					item.write(up); //실제 업로드(임시파일을 최종결과파일로 생성함)
					item.delete();  //임시파일을 삭제
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				
				
				
				//업로드된 파일의 정보 저장
				memberFile = new MemberFile();
				memberFile.setOriginName(origin);
				memberFile.setStoredName(stored);
				
				
			}	//if( !item.isFormField() ) end
			
		}	//while( iter.hasNext() ) end
		
		
		System.out.println("[TEST]"+ member );
		System.out.println("[TEST]"+ memberFile );
		
		
		
		//DB연결 객체
		Connection conn = JDBCTemplate.getConnection();

		//사용자 번호 생성 - DAO 이용
		int userNo = businessMemberDao.selectNextmemberNo(conn);
		
		//회원 정보가 있을 경우
		if( member != null ) {
			if(businessMemberDao.insertBusiness(conn, member) > 0 ) {
				JDBCTemplate.commit(conn);
			} else {
				JDBCTemplate.rollback(conn);
			}
		}
		
		//회원 첨부파일이 있을 경우
		if( memberFile != null ) {
			
			//사용자 userNo 입력
			memberFile.setUserNo((Integer)req.getSession().getAttribute("fileNo")); //사용자 번호 입력 (FK)
			
			if( businessMemberDao.insertParamFile(conn, memberFile) > 0 ) {
				JDBCTemplate.commit(conn);
			} else {
				JDBCTemplate.rollback(conn);
			}
		}
	

		//---------------------------------
		
	} //BusinesMemberFileUpload() end


	@Override
	public MemberFile businessFile(HttpServletRequest req) {
	
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		//MemberFile 객체 생성
		MemberFile memberFile = new MemberFile();

		
		
		////전달파라미터에서 가져오기
//		memberFile.setFileNo(Integer.parseInt(req.getParameter("fileNo")));
//		memberFile.setUserNo(Integer.parseInt(req.getParameter("userNo")));
		memberFile.setPharmacy(req.getParameter("pharmacy"));
		memberFile.setOriginName(req.getParameter("originName"));
		memberFile.setStoredName(req.getParameter("storedName"));
			
		return memberFile;
	}

	
	@Override
	public int insertBusinessMember(Member member, MemberFile memberFile ) {
		
		//DB에 데이터 삽입하기
		Connection conn = JDBCTemplate.getConnection();
		
		
		
		//사전에 제작한 코드 (아래와 같은 코드)
		int userNo = businessMemberDao.selectNextmemberNo(conn); 

		//강사님이 수업시간에 생성해주신 코드
//		int user_no = businessMemberDao.selectNextUserNo(conn);
				
		member.setUserNo(userNo);
		
		//사업자 회원 정보
		int memberSuccess = businessMemberDao.insertBusiness(JDBCTemplate.getConnection(), member);
			
		memberFile.setUserNo(userNo);
	
		
		
		//사업자 회원 파일 정보
		int memberFileSuccess = businessMemberDao.insertParamFile(JDBCTemplate.getConnection(), memberFile);
				
		
		//사업자 회원 정보 및 사업자 회원 파일 정보가 둘다 1이면 성공
		if( memberSuccess == 1 && memberFileSuccess == 1 ) {
			
			JDBCTemplate.commit(conn);
			return 1; 	//성공
		} else {
			JDBCTemplate.rollback(conn);
			return 0;	//실패
		}
	}

}





