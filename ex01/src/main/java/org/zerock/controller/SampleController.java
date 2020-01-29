package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.SampleDTO;
import org.zerock.domain.SampleDTO2;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {
	
	@RequestMapping
	public void basic() {
		System.out.println("basic001............");
		log.info("basic............");
	}
	
	
	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {
		
		log.info("" + dto);
		System.out.println("" + dto);
		return "ex01";
	}
	
    //--추가 코드--
	  @GetMapping("/ex02") 
	  public String ex02(@RequestParam("name") String name
			  			,@RequestParam("age")  int    age) 
	  { 
		  
		  System.out.println("name: "+ name);
		  System.out.println("age: "+ age);
	  
	  return "ex02"; 
	  }
	 
    //--추가 코드--
	  @GetMapping("/ex03") 
	  public String ex03(SampleDTO2 dto2) 
	  { 
		  
		  System.out.println("name: "+ dto2.getClass());
		  System.out.println("name: "+ dto2.getName());
		  dto2.setAge(155);
		  System.out.println("age: "+ dto2.getAge());
	  
	  return "ex03"; 
	  }

}
