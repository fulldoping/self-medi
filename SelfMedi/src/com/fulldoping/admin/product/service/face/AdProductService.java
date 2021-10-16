package com.fulldoping.admin.product.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.fulldoping.product.dto.NutrientInfo;
import com.fulldoping.product.dto.NutrientKind;
import com.fulldoping.product.dto.ProductInfo;
import com.fulldoping.product.dto.SymptomCode;
import com.fulldoping.product.dto.SymptomInfo;
import com.fulldoping.product.dto.TargetCode;
import com.fulldoping.product.dto.TargetInfo;
import com.fulldoping.util.Paging;

public interface AdProductService {

	
	/**
	 * 페이징 객체 생성
	 * 
	 * @param req
	 * @return
	 */
	Paging getPaging(HttpServletRequest req);

	/**
	 * 상품조회
	 * 
	 * @param paging
	 * @return
	 */
	List<ProductInfo> getProduct(Paging paging);

	
	/**
	 * TargetCode 테이블조회
	 * 
	 * @return
	 */
	List<TargetCode> getTargetCode();

	/**
	 * SymptomCode 테이블 조회
	 * 
	 * @return
	 */
	List<SymptomCode> getSymptomCode();

	/**
	 * NutrientKind 테이블 조회
	 * 
	 * @return
	 */
	List<NutrientKind> getNutrientKind();

	
	/**
	 * 상품 정보 추출하기
	 * 
	 * 
	 * @param req
	 * @return
	 */
	ProductInfo getAddProductInfo(HttpServletRequest req);

	
	/**
	 * 대상 정보 추출하기
	 * 
	 * @param req
	 * @return
	 */
	TargetInfo getAddTargetInfo(HttpServletRequest req);


	/**
	 * 증상 정보 추출하기
	 * 
	 * @param req
	 * @return
	 */
	List<SymptomInfo> getAddSymptomInfo(HttpServletRequest req);

	
	/**
	 * 영양소정보 추출하기
	 * 
	 * @param req
	 * @return
	 */
	List<NutrientInfo> getAddNutrientInfo(HttpServletRequest req);

	/**
	 * ProductInfo 테이블 상품 추가 
	 * 
	 * @param req
	 * @param productInfo
	 * @return
	 */
	boolean insertProductInfo(HttpServletRequest req, ProductInfo productInfo);

	/**
	 * TargetInfo 테이블 상품 추가 
	 * 
	 * @param req
	 * @param targetInfo
	 * @return
	 */
	boolean insertTargetInfo(HttpServletRequest req, TargetInfo targetInfo);

	/**
	 * SymptomInfo 테이블 상품 추가 
	 * 
	 * @param req
	 * @param symptomInfo
	 * @return
	 */
	boolean insertSymptomInfo(HttpServletRequest req, List<SymptomInfo> symptomInfo);

	/**
	 * NutrientInfo 테이블 상품 추가 
	 * 
	 * @param req
	 * @param nutrientInfo
	 * @return
	 */
	boolean insertNutrientInfo(HttpServletRequest req, List<NutrientInfo> nutrientInfo);

	
	
	/**
	 * 상품 제거
	 * 
	 * @param productId
	 * @return
	 */
	boolean deleteProduct(long productId);



}
