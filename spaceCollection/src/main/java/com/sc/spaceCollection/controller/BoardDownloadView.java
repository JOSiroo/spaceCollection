package com.sc.spaceCollection.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class BoardDownloadView extends AbstractView{
	private static final Logger logger = LoggerFactory.getLogger(BoardDownloadView.class);

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		File file = (File) model.get("file");
		logger.info("파일다운로드 로그 찍기 = {}", file);
		
		if(file==null || !file.exists() || !file.canRead()) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('파일이 존재하지 않거나 손상되었습니다.');history.back();</script>");
			
			return;
		}
		
		String fileName = file.getName();
		logger.info("다운로드할 파일명 : " +fileName);
		
		fileName = new String(fileName.getBytes("euc-kr"), "8859_1");
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-disposition", "attachment;filename=" + fileName);
		
		OutputStream os = response.getOutputStream();
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, os);
		} finally {
			if(fis!=null) {
				fis.close();
			}
		}
	}

}
