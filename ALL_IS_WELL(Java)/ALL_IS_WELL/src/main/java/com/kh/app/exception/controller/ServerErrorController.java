package com.kh.app.exception.controller;

import java.rmi.ServerException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ServerErrorController{

//	@RequestMapping("/**")
	public void acceptServerError() throws ServerException {
		throw new ServerException("Server Error~!");
	}
	
}
