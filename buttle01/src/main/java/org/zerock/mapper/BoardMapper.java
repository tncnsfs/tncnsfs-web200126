package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;

public interface BoardMapper {

	public List<BoardVO> getList();
	
	// 입력 작업
	public void insert(BoardVO board);

	public void insertSelectKey(BoardVO board);
	
	// 조회 작업 
	public BoardVO read(Long bno);
	
	// 삭제 작업 
	public int delete(Long bno); 
	
	// 수정 작업
	public int update(BoardVO board);
	
}
