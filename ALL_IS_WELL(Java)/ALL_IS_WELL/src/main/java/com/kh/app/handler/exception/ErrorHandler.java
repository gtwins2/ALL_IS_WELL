package com.kh.app.handler.exception;

import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.server.ServerErrorException;


@ControllerAdvice(annotations = Controller.class)
public class ErrorHandler {

	@ExceptionHandler(Exception.class)
	public String handle() {
		return "error/errorPage";
	}
	
	@ExceptionHandler(NotFoundException.class)
	public String handleNotFound() {
		return "error/404page";
	}
	
	@ExceptionHandler(ServerErrorException.class)
	public String handleServerError() {
		return "error/500page";
	}
	
}
