package com.fish.business.dao;

import com.fish.business.domain.Media;
import com.fish.business.vo.MediaVo;

import java.util.List;

/**
 * @InterfaceName MediaDao
 * @Description (Media)数据库访问层接口
 * @Author 柚子茶
 * @Date 2021/3/14 11:24
 * @Version 1.0
 */
public interface MediaDao {

	/**
	 * @param mediaId
	 * @return int
	 * @description 删除作品信息
	 * @author 柚子茶
	 * @date 2021/3/14 11:48
	 **/
	int deleteByPrimaryKey(Integer mediaId);

	/**
	 * @param record
	 * @return int
	 * @description 添加
	 * @author 柚子茶
	 * @date 2021/3/14 11:48
	 **/
	int insert(Media record);

	/**
	 * @param record
	 * @return int
	 * @description 添加作品
	 * @author 柚子茶
	 * @date 2021/3/14 11:49
	 **/
	int insertSelective(Media record);

	/**
	 * @param mediaId
	 * @return Media
	 * @description 查询
	 * @author 柚子茶
	 * @date 2021/3/14 11:49
	 **/
	Media selectByPrimaryKey(Integer mediaId);

	/**
	 * @param record
	 * @return int
	 * @description 更新
	 * @author 柚子茶
	 * @date 2021/3/14 11:49
	 **/
	int updateByPrimaryKeySelective(Media record);

	/**
	 * @param record
	 * @return int
	 * @description 更新
	 * @author 柚子茶
	 * @date 2021/3/14 11:49
	 **/
	int updateByPrimaryKey(Media record);

	/**
	 * @param media
	 * @return List<Media>
	 * @description 查询所有的作品信息
	 * @author 柚子茶
	 * @date 2021/3/18 11:37
	 **/
	List<Media> queryMediaInfoByList(Media media);

	/**
	 * @param mediaId
	 * @return Media
	 * @description 根据ID查询作品信息
	 * @author 柚子茶
	 * @date 2021/3/18 11:37
	 **/
	Media queryMediaInfoById(Integer mediaId);
}