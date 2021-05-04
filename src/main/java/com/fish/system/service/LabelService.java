package com.fish.system.service;

import com.fish.system.domain.Label;
import com.fish.system.utils.DataGridView;
import com.fish.system.vo.LabelVo;

import java.util.List;

/**
 * @InterfaceName LabelService
 * @Description 标签(Label)业务层接口
 * @Author 柚子茶
 * @Date 2021/1/16 12:25
 * @Version 1.0
 */
public interface LabelService {

	/**
	 * @param labelVo 标签实体类实例化对象
	 * @return void
	 * @description 添加新的标签
	 * @author 柚子茶
	 * @date 2021/1/16 16:06
	 **/
	void addLabelInfo(LabelVo labelVo);

	/**
	 * @param labelVo 标签实体类实例化对象
	 * @return void
	 * @description 校验标签名称是否重复
	 * @author 柚子茶
	 * @date 2021/1/16 17:03
	 **/
	Label checkLabelName(LabelVo labelVo);

	/**
	 * @param labelVo 标签实体类实例化对象
	 * @return DataGridView
	 * @description 查询标签信息
	 * @author 柚子茶
	 * @date 2021/1/16 19:50
	 **/
	DataGridView loadLabelDataInfo(LabelVo labelVo);

	/**
	 * @param labelVo 标签实体类实例化对象
	 * @return void
	 * @description 删除标签信息
	 * @author 柚子茶
	 * @date 2021/1/16 21:25
	 **/
	void deleteLabelInfo(LabelVo labelVo);

	/**
	 * @param labelVo 标签实体类实例化对象
	 * @return void
	 * @description 修改标签信息
	 * @author 柚子茶
	 * @date 2021/1/16 21:31
	 **/
	void updateLabelInfo(LabelVo labelVo);

	/**
	 * @return List<Label>
	 * @description 获取标签分类信息
	 * @author 柚子茶
	 * @date 2021/3/9 21:34
	 **/
	List<Label> queryMediaClassLabel();
}
