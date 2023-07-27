package com.kh.app.summernote.uploadFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;


public class UploadFile {
	
	
	@PostMapping("/mail/summernoteUpload")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		
		
		
		JsonObject jsonObject = new JsonObject();
		
		//내부경로로 저장하기
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		
		String fileRoot = contextRoot+"resources/static/img/fileupload/";
		
		//원래 파일이름
		String originalFileName = multipartFile.getOriginalFilename();
		
		//파일 확장자
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		//저장될 파일명
		String savedFileName = UUID.randomUUID()+extension;
		
		File targetFile = new File(fileRoot + savedFileName);
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			
			jsonObject.addProperty("url", "/resources/static/img/fileUpload/");
			
			jsonObject.addProperty("responseCode", "success");
		} catch(IOException e) {
			//저장된 파일 삭제
			FileUtils.deleteQuietly(targetFile);
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		String result = jsonObject.toString();
		
		return result;
	}
}
