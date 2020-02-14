package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {

	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testGetList(){
		mapper.getList().forEach(board -> log.info(board));
	}
	
/*	@Test
	public void testInsert(){
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setWriter("newBie");
		
		mapper.insert(board);
		log.info(board);
	}*/
	
/*	@Test
	public void testInsertSelectKey(){
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글1 select Key");
		board.setContent("새로 작성하는 내용1 select Key");
		board.setWriter("newBie1");
		
		mapper.insertSelectKey(board);
		log.info(board);
	}*/
	
/*	@Test
	public void testRead(){
		BoardVO board = mapper.read(5l);
		
		log.info(board);
	}*/
	
	
/*	@Test
	public void testDelete(){
		
		log.info("mapper.delete : " + mapper.delete(18l));
	}*/
	
	
	@Test
	public void testUpdate(){
		
		BoardVO board = new BoardVO();
		
		board.setBno(5l);
		board.setTitle("Updatetitile");
		board.setContent("Updatecontent");
		board.setWriter("Updatewriter");
		
		int cnt = mapper.update(board);
		
		log.info("mapper.update: " + cnt);
	}
	
	
	
}
