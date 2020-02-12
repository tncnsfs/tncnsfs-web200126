package org.zerock.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {
	
/*	@Select("SELECT sysdate FROM DUAL")
	public String getTime();*/
	
	/* xml 매퍼로 설정하고 사용하기 */
	public String getTime2();
	
	public String getStr();
	
}
