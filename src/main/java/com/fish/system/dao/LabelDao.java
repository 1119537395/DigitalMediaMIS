package com.fish.system.dao;

import com.fish.system.domain.Label;
import com.fish.system.vo.LabelVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @InterfaceName LabelDao
 * @Description (Label)数据库访问层接口
 * @Author 柚子茶
 * @Date 2021/1/16 12:24
 * @Version 1.0
 */
public interface LabelDao {


	/**
	 * @param labelVo 标签实体类实例化对象
	 * @return void
	 * @description 添加新标签
	 * @author 柚子茶
	 * @date 2021/1/16 16:16
	 **/
	void insertLabelInfo(LabelVo labelVo);

	/**
	 * @param label 标签实体类实例化对象
	 * @return List<Label>
	 * @description 根据条件查询标签的信息
	 * @author 柚子茶
	 * @date 2021/1/16 17:15
	 **/
	Label queryLabelInfo(Label label);

	/**
	 * @param labelVo 标签实体类实例化对象
	 * @return List<Label>
	 * @description 查询所有标签信息
	 * @author 柚子茶
	 * @date 2021/1/16 19:53
	 **/
	List<Label> selectLabelInfo(LabelVo labelVo);

	/**
	 * @param labelId 标签实体类实例化对象
	 * @return void
	 * @description 删除标签
	 * @author 柚子茶
	 * @date 2021/1/16 21:26
	 **/
	void deleteLabelInfo(Integer labelId);

	/**
	 * @param label 标签实体类实例化对象
	 * @return void
	 * @description 修改标签
	 * @author 柚子茶
	 * @date 2021/1/16 21:34
	 **/
	void updateLabelInfo(Label label);

	/**
	 * @return List<Label>
	 * @description 获取标签分类信息
	 * @author 柚子茶
	 * @date 2021/3/9 21:35
	 **/
	List<Label> queryMediaClassLabel();

}
