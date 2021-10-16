package com.fulldoping.admin.product.dao.face;

import java.sql.Connection;
import java.util.List;

import com.fulldoping.product.dto.NutrientInfo;
import com.fulldoping.product.dto.NutrientKind;
import com.fulldoping.product.dto.ProductInfo;
import com.fulldoping.product.dto.SymptomCode;
import com.fulldoping.product.dto.SymptomInfo;
import com.fulldoping.product.dto.TargetCode;
import com.fulldoping.product.dto.TargetInfo;
import com.fulldoping.product.dto.CompBasket;
import com.fulldoping.util.Paging;

public interface AdProductDao {

	/**
	 * 총 상품갯수 조회
	 * 
	 * @param conn
	 * @return
	 */
	int selectCntAll(Connection conn);

	
	
	/**
	 * productinfo테이블 전체 조회
	 * 	페이징 처리 추가
	 * 
	 * @param paging - 페이징 정보 객체
	 * @param conn - DB연결 객체
	 * @return List<ProductInfo> - productinfo테이블 전체 조회 결과 리스트
	 */
	List<ProductInfo> selectAllProduct(Connection conn, Paging paging);



	/**
	 * 대상별 테이블 조회
	 * 
	 * @param connection
	 * @return List<TargetCode>
	 */
	List<TargetCode> selectAllTargetCode(Connection conn);


	/**
	 * 증상별 테이블 조회
	 * 
	 * @param connection
	 * @return
	 */
	List<SymptomCode> selectAllSymptomCode(Connection conn);


	/**
	 * 영양소 정보 테이블 조회
	 * 
	 * @param conn
	 * @return
	 */
	List<NutrientKind> selectAllNutrientKind(Connection conn);



	/**
	 * ProductInfo insert
	 * 
	 * @param connection
	 * @param productInfo
	 * @return
	 */
	int insertProductInfo(Connection connection, ProductInfo productInfo);


	/**
	 * TargetInfo insert
	 * 
	 * @param connection
	 * @param targetInfo
	 * @return
	 */
	int insertTargetInfo(Connection connection, TargetInfo targetInfo);


	/**
	 * SymptomInfo insert
	 * 
	 * @param connection
	 * @param symptomInfo
	 * @return
	 */
	int insertSymptomInfo(Connection connection, List<SymptomInfo> symptomInfo);


	/**
	 * NutrientInfo insert
	 * 
	 * @param connection
	 * @param nutrientInfo
	 * @return
	 */
	int insertNutrientInfo(Connection connection, List<NutrientInfo> nutrientInfo);


	/**
	 * deleteProduct targetinfo delete
	 * 
	 * @param connection
	 * @param productId
	 * @return
	 */
	int deleteProductTargetInfo(Connection conn, long productId);





	/**
	 * deleteProduct symptomInfo delete
	 * 
	 * @param connection
	 * @param productId
	 * @return
	 */
	int deleteProductSymptomInfo(Connection conn, long productId);


	/**
	 * deleteProduct nutrientInfo delete
	 * 
	 * @param connection
	 * @param productId
	 * @return
	 */
	int deleteProductNutrientInfo(Connection conn, long productId);

	/**
	 * deleteProduct CompBasket delete
	 * 
	 * @param connection
	 * @param productId
	 * @return
	 */
	int deleteProductCompBasket(Connection conn, long productId);
	
	/**
	 * deleteProduct productInfo delete
	 * 
	 * @param connection
	 * @param productId
	 * @return
	 */
	int deleteProductInfo(Connection conn, long productId);


}
