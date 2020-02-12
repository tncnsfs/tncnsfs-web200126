package org.zerock.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.mapper.TimeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TimeMapperTests {

	@Setter(onMethod=@__({@Autowired}))
		private TimeMapper timeMapper;
	
/*	@Test
	public void testGetTime() {
		
		log.info("---------------���⼭ MyBatis �׽�Ʈ �ϴ� ��");
		log.info(timeMapper.getClass().getName());
		log.info(timeMapper.getTime());
		log.info("---------------���⼭ MyBatis �׽�Ʈ �ϴ� ��");
		
	}*/
	
	@Test
	public void testGetTime2() {
		
		log.info("---------------���⼭ MyBatis �׽�Ʈ �ϴ� ��2");
		log.info(timeMapper.getClass().getName());
		log.info(timeMapper.getTime2());
		log.info("---------------���⼭ MyBatis �׽�Ʈ �ϴ� ��2");
	}
	
	@Test
	public void getStr() {
		log.info("---------------���⼭ MyBatis �׽�Ʈ �ϴ� ��3");
		log.info(timeMapper.getClass().getName());
		log.info(timeMapper.getStr());
		log.info("---------------���⼭ MyBatis �׽�Ʈ �ϴ� ��3");
	}
}
