package org.zerock.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {
	
/*	@Select("SELECT sysdate FROM DUAL")
	public String getTime();*/
	
	/* xml ���۷� �����ϰ� ����ϱ� */
	public String getTime2();
	
	public String getStr();
	
}
