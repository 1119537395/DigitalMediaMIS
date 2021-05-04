package com.fish.business.dao;

import com.fish.business.domain.Temp;
import com.fish.business.vo.TempVo;

import java.util.List;

/**
 * @InterfaceName MediaDao
 * @Description (Temp)数据库访问层接口
 * @Author 柚子茶
 * @Date 2021/3/14 11:24
 * @Version 1.0
 */
public interface TempDao {

	int deleteByPrimaryKey(Integer tempId);

	int insert(Temp record);

	int insertSelective(Temp record);

	Temp selectByPrimaryKey(Integer tempId);

	int updateByPrimaryKeySelective(Temp record);

	int updateByPrimaryKey(Temp record);

	/**
	 * @param tempVo
	 * @return List<Temp>
	 * @description 查询临时表的信息
	 * @author 柚子茶
	 * @date 2021/3/15 10:01
	 **/
	List<Temp> selectTempInfoByList(TempVo tempVo);

	/**
	 * @param mediaUrl
	 * @return void
	 * @description 根据访问路径将临时表中的数据删除
	 * @author 柚子茶
	 * @date 2021/3/15 14:30
	 **/
	void deleteTempInfoByUrl(String mediaUrl);
}