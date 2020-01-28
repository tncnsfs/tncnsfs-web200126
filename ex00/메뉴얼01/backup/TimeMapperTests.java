package org.zerock.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
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
	
	@Test
	public void testGetTime() {
		
		log.info("---------------여기서 MyBatis 테스트 하는 중");
		log.info(timeMapper.getClass().getName());
		log.info(timeMapper.getTime());
		log.info("---------------여기서 MyBatis 테스트 하는 중");
		
	}
}
