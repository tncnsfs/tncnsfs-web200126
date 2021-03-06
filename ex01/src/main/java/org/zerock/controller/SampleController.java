package org.zerock.controller;

import java.io.Console;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.SampleDTO2;
import org.zerock.domain.SampleDTOList;
import org.zerock.domain.TodoDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {

	// 디폴트 스캔 방식
	@RequestMapping
	public void basic() {
		System.out.println("basic001............");
		log.info("basic............");
	}
	
	
	@PostMapping("/exUploadPost")
	public void exUploadPost(ArrayList<MultipartFile> files) {
		
		files.forEach(file -> {
			log.info("----------------------");
			 System.out.println("----------------------");
			 System.out.println("name:" + file.getOriginalFilename());
			 System.out.println("size:" + file.getSize());
		});
	}
	
	
	// 파일 업로드 페이지 
	@GetMapping("/exUpload")
	public void exUpload() {
		log.info("/exUpload...");
		System.out.println("exUpload..........-");
	}
	
	
	// ResponseEntity 타입 :  HttpStatus, HttpHeaders , body  내용 전달 
	// , HttpHeaders 에 원하는 내용 전달 가능 
	// , html 추가 : json 형식 출력 : {"name" : "홍길동" }
	@GetMapping("/ex07")
	public ResponseEntity<String> ex07() {
		
		log.info("/ex07...");
		System.out.println("/ex07.....");
		
		// {"name" : "홍길동" }
		String msg = "{\"name\": \"홍길동11\"}";
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "application/json; charset=UTF-8");
		
		
		return new ResponseEntity<>(msg, header, HttpStatus.OK);
	}
	
	
	// JSON으로 값을 리턴 받기 가능
	// JSON 라이브러리 -> pom.xml 에 추가 
	//, 리턴타입이 있을 경우 리턴 경로 변경 되거나 값으로 리턴값 받기 가능
	@GetMapping("/ex06")
	public @ResponseBody SampleDTO ex06() {
		
		SampleDTO dto = new SampleDTO();
		dto.setAge(10);
		dto.setName("홍길동");
		
		System.out.println("dto--> : " + dto);
		log.info("/ex06..........");
		
		return dto;
	}

	//, 메소드가 void 일 경우 매핑경로 그대로임
	// ,/ex01/src/main/webapp/WEB-INF/views/ex05.jsp 경로를 찾을거임
	@GetMapping("/ex05")
	public void ex05() {
		
		System.out.println("ex05.... ");
		log.info("/ex06..........");
		
	}
	
	// Model 사용 테스트, @ModelAttribute 설정 안할시 int page 값은  "/sample1/ex04" 경로에 전달 안됨
	// int page 값은 Model 이라는 객체에서 생성해서 전달 되는것으로 이해하면 됨 
	@GetMapping("/ex04")
	public String ex04(SampleDTO dto, @ModelAttribute("page") int page) {
		
		System.out.println("dto : " + dto);
		System.out.println("page : " +  page);
		System.out.println("dto : " + dto + "\rn, page" +  page);
		
		return "/sample1/ex04";
	}
	
	
	// 날짜 포맷 파라미터 받기
	/*
	 * @InitBinder public void initBinder(WebDataBinder binder) { SimpleDateFormat
	 * dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	 * binder.registerCustomEditor(java.util.Date.class, new
	 * CustomDateEditor(dateFormat, false)); }
	 */
	

	@GetMapping("/ex03")
	public String ex03(TodoDTO ctodo) {

		System.out.println("testDateFormat todo1 : " + ctodo);
		log.info("testDateFormat todo : " + ctodo);
		return "ex03";
	}
	// 날짜 포맷 파라미터 받기

	// ObjectList 처리
	@GetMapping("/ex02Bean")
	public String ex02Bean(SampleDTOList clist) {

		System.out.println("clist dos1: " + clist);
		log.info("clist dos: " + clist);
		return "ex02Bean";
	}

	// 리스트, 배열 처리
	@GetMapping("/ex02List")
	public String ex02List(@RequestParam("ids") ArrayList<String> ids) {

		System.out.println("ids01 :" + ids);
		log.info("ids :" + ids);
		return "ex02List";
	}

	@GetMapping("/ex02Array")
	public String ex02Array(@RequestParam("ids") String[] ids) {

		System.out.println("ids02 :" + Arrays.toString(ids));
		log.info("ids :" + ids);
		return "ex02Array";
	}
	// 리스트, 배열 처리

	// 객체 1개 전달 하기
	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {

		log.info("" + dto);
		System.out.println("" + dto);
		return "ex01";
	}

	// --추가 코드--
	@GetMapping("/ex02")
	public String ex02(@RequestParam("name") String name
					, @RequestParam("age") int age) {

		System.out.println("name: " + name);
		System.out.println("age: " + age);

		return "ex02";
	}

	// --추가 코드--
	@GetMapping("/ex01-1")
	public String ex01_1(SampleDTO2 dto2) {

		System.out.println("name: " + dto2.getClass());
		System.out.println("name: " + dto2.getName());
		dto2.setAge(155);
		System.out.println("age: " + dto2.getAge());

		return "ex01-1";
	}

}
