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

	// ����Ʈ ��ĵ ���
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
	
	
	// ���� ���ε� ������ 
	@GetMapping("/exUpload")
	public void exUpload() {
		log.info("/exUpload...");
		System.out.println("exUpload..........-");
	}
	
	
	// ResponseEntity Ÿ�� :  HttpStatus, HttpHeaders , body  ���� ���� 
	// , HttpHeaders �� ���ϴ� ���� ���� ���� 
	// , html �߰� : json ���� ��� : {"name" : "ȫ�浿" }
	@GetMapping("/ex07")
	public ResponseEntity<String> ex07() {
		
		log.info("/ex07...");
		System.out.println("/ex07.....");
		
		// {"name" : "ȫ�浿" }
		String msg = "{\"name\": \"ȫ�浿11\"}";
		
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "application/json; charset=UTF-8");
		
		
		return new ResponseEntity<>(msg, header, HttpStatus.OK);
	}
	
	
	// JSON���� ���� ���� �ޱ� ����
	// JSON ���̺귯�� -> pom.xml �� �߰� 
	//, ����Ÿ���� ���� ��� ���� ��� ���� �ǰų� ������ ���ϰ� �ޱ� ����
	@GetMapping("/ex06")
	public @ResponseBody SampleDTO ex06() {
		
		SampleDTO dto = new SampleDTO();
		dto.setAge(10);
		dto.setName("ȫ�浿");
		
		System.out.println("dto--> : " + dto);
		log.info("/ex06..........");
		
		return dto;
	}

	//, �޼ҵ尡 void �� ��� ���ΰ�� �״����
	// ,/ex01/src/main/webapp/WEB-INF/views/ex05.jsp ��θ� ã������
	@GetMapping("/ex05")
	public void ex05() {
		
		System.out.println("ex05.... ");
		log.info("/ex06..........");
		
	}
	
	// Model ��� �׽�Ʈ, @ModelAttribute ���� ���ҽ� int page ����  "/sample1/ex04" ��ο� ���� �ȵ�
	// int page ���� Model �̶�� ��ü���� �����ؼ� ���� �Ǵ°����� �����ϸ� �� 
	@GetMapping("/ex04")
	public String ex04(SampleDTO dto, @ModelAttribute("page") int page) {
		
		System.out.println("dto : " + dto);
		System.out.println("page : " +  page);
		System.out.println("dto : " + dto + "\rn, page" +  page);
		
		return "/sample1/ex04";
	}
	
	
	// ��¥ ���� �Ķ���� �ޱ�
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
	// ��¥ ���� �Ķ���� �ޱ�

	// ObjectList ó��
	@GetMapping("/ex02Bean")
	public String ex02Bean(SampleDTOList clist) {

		System.out.println("clist dos1: " + clist);
		log.info("clist dos: " + clist);
		return "ex02Bean";
	}

	// ����Ʈ, �迭 ó��
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
	// ����Ʈ, �迭 ó��

	// ��ü 1�� ���� �ϱ�
	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {

		log.info("" + dto);
		System.out.println("" + dto);
		return "ex01";
	}

	// --�߰� �ڵ�--
	@GetMapping("/ex02")
	public String ex02(@RequestParam("name") String name
					, @RequestParam("age") int age) {

		System.out.println("name: " + name);
		System.out.println("age: " + age);

		return "ex02";
	}

	// --�߰� �ڵ�--
	@GetMapping("/ex01-1")
	public String ex01_1(SampleDTO2 dto2) {

		System.out.println("name: " + dto2.getClass());
		System.out.println("name: " + dto2.getName());
		dto2.setAge(155);
		System.out.println("age: " + dto2.getAge());

		return "ex01-1";
	}

}
