package com.sc.spaceCollection.common;

public interface ConstUtil {
	//게시판 페이징 처리 관련 상수
	public static final int RECORD_COUNT=20;
	int BLOCK_SIZE=10;
	
	//파일 업로드 처리 관련 상수
	String FILE_UPLOAD_TYPE="test";
	//String FILE_UPLOAD_TYPE="deploy";
	
	//자료실 파일 저장 경로
	String FILE_UPLOAD_PATH="board_files";
	String FILE_UPLOAD_PATH_TEST="\\board_files";
	
	//관리자 페이지 - 상품 등록시 상품 이미지 저장 경로
	String IMAGE_FILE_UPLOAD_PATH="board_images";
	String IMAGE_FILE_UPLOAD_PATH_TEST="\\board_images";
	
	//자료실 업로드인지, 상품 등록시 업로드인지 구분값
	int UPLOAD_FILE_FLAG=1;  //자료실 업로드
	int UPLOAD_IMAGE_FLAG=2; //상품 등록시 이미지 업로드
	
	
	
}



