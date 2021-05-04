package com.fish.system.service.impl;

import com.fish.system.domain.Label;
import com.fish.system.service.LabelService;
import com.fish.system.utils.DataGridView;
import com.fish.system.vo.LabelVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @ClassName LabelServiceImpl
 * @Description 标签(Label)业务层接口实现类
 * @Author 柚子茶
 * @Date 2021/1/16 12:26
 * @Version 1.0
 */
@Service
public class LabelServiceImpl extends BaseService implements LabelService {


	/**
	 * @param labelVo 标签实体类实例化对象
	 * @return void
	 * @description 添加新的标签
	 * @author 柚子茶
	 * @date 2021/1/16 16:09
	 **/
	@Override
	public void addLabelInfo(LabelVo labelVo) {
		labelVo.setCreateTime(new Date());
		labelVo.setModifyTime(new Date());
		this.labelDao.insertLabelInfo(labelVo);
	}

	/**
	 * @param labelVo 标签实体类实例化对象
	 * @return void
	 * @description 校验是否存在重复的标签名称
	 * @author 柚子茶
	 * @date 2021/1/16 17:06
	 **/
	@Override
	public Label checkLabelName(LabelVo labelVo) {
		return this.labelDao.queryLabelInfo(labelVo);
	}

	/**
	 * @param labelVo 标签实体类实例化对象
	 * @return DataGridView
	 * @description 查询标签信息
	 * @author 柚子茶
	 * @date 2021/1/16 19:51
	 **/
	@Override
	public DataGridView loadLabelDataInfo(LabelVo labelVo) {
		Page<Object> page = PageHelper.startPage(labelVo.getPage(), labelVo.getLimit());
		List<Label> list = this.labelDao.selectLabelInfo(labelVo);
		return new DataGridView(page.getTotal(), list);
	}

	/**
	 * @param labelVo 标签实体类实例化对象
	 * @return void
	 * @description 删除标签信息
	 * @author 柚子茶
	 * @date 2021/1/16 21:25
	 **/
	@Override
	public void deleteLabelInfo(LabelVo labelVo) {
		this.labelDao.deleteLabelInfo(labelVo.getLabelId());
	}

	/**
	 * @param labelVo 标签实体类实例化对象
	 * @return void
	 * @description 修改标签信息
	 * @author 柚子茶
	 * @date 2021/1/16 21:31
	 **/
	@Override
	public void updateLabelInfo(LabelVo labelVo) {
		labelVo.setModifyTime(new Date());
		this.labelDao.updateLabelInfo(labelVo);
	}

	/**
	 * @return List<Label>
	 * @description 获取标签分类信息
	 * @author 柚子茶
	 * @date 2021/3/9 21:35
	 **/
	@Override
	public List<Label> queryMediaClassLabel() {
		return this.labelDao.queryMediaClassLabel();
	}
}
