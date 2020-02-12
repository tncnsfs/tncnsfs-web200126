package org.zerock.sample;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@lombok.extern.log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class SampleTests {

	//@Setter(onMethod = @Autowired)
	@Setter(onMethod=@__({@Autowired}))
	private Restaurant restaurant;
	
	@Test
	public void testExist() {
		
		assertNotNull(restaurant);
		
		log.info(restaurant);
		log.info("-------------------");
		log.info(restaurant.getChef());
		
	}
}
