package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;

public interface BoardMapper {

	public List<BoardVO> getList();
	
	// �Է� �۾�
	public void insert(BoardVO board);

	public void insertSelectKey(BoardVO board);
	
	// ��ȸ �۾� 
	public BoardVO read(Long bno);
	
	// ���� �۾� 
	public int delete(Long bno); 
	
	// ���� �۾�
	public int update(BoardVO board);
	
}
