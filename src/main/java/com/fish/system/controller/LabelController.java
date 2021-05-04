package com.fish.system.controller;

import com.fish.system.domain.Label;
import com.fish.system.domain.User;
import com.fish.system.utils.CommonReturnType;
import com.fish.system.utils.DataGridView;
import com.fish.system.utils.WebUtils;
import com.fish.system.vo.LabelVo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @ClassName LabelController
 * @Description 标签管理控制器
 * @Author 柚子茶
 * @Date 2021/1/16 12:29
 * @Version 1.0
 */
@RestController
@RequestMapping("label")
public class LabelController extends BaseController {


	/**
	 * @param labelVo 标签实体类对象
	 * @return CommonReturnType
	 * @description 添加标签
	 * @author 柚子茶
	 * @date 2021/1/16 14:45
	 **/
	@PostMapping("/addLabelInfo")
	public CommonReturnType addLabelInfo(LabelVo labelVo) {
		try {
			// 获取到当前登录的用户
			User user = (User) WebUtils.getHttpSession().getAttribute("user");
			labelVo.setCreateUserId(user.getUserId());
			labelVo.setModifyUserId(user.getUserId());
			this.labelService.addLabelInfo(labelVo);
			return CommonReturnType.ADD_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return CommonReturnType.ADD_FAILURE;
		}
	}

	/**
	 * @param labelVo 标签实体类对象
	 * @return CommonReturnType
	 * @description 校验是否存在重复标签名称
	 * @author 柚子茶
	 * @date 2021/1/16 16:58
	 **/
	@PostMapping("/checkLabelName")
	public CommonReturnType checkLabelName(LabelVo labelVo) {
		Label label = this.labelService.checkLabelName(labelVo);
		if (label != null) {
			return CommonReturnType.CODE_FAILURE;
		}
		return CommonReturnType.CODE_SUCCESS;
	}

	/**
	 * @param labelVo 标签实体类对象
	 * @return DataGridView
	 * @description 加载标签信息
	 * @author 柚子茶
	 * @date 2021/1/16 19:49
	 **/
	@RequestMapping("/loadLabelDataInfo")
	public DataGridView loadLabelDataInfo(LabelVo labelVo) {
		return this.labelService.loadLabelDataInfo(labelVo);
	}

	/**
	 * @param labelVo 标签实体类对象
	 * @return CommonReturnType
	 * @description 删除标签信息
	 * @author 柚子茶
	 * @date 2021/1/16 21:23
	 **/
	@RequestMapping("/deleteLabelInfo")
	public CommonReturnType deleteLabelInfo(LabelVo labelVo) {
		try {
			this.labelService.deleteLabelInfo(labelVo);
			return CommonReturnType.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return CommonReturnType.DELETE_FAILURE;
		}
	}

	/**
	 * @param labelVo 标签实体类对象
	 * @return CommonReturnType
	 * @description 修改标签信息
	 * @author 柚子茶
	 * @date 2021/1/16 21:30
	 **/
	@RequestMapping("/updateLabelInfo")
	public CommonReturnType updateLabelInfo(LabelVo labelVo) {
		try {
			User user = (User) WebUtils.getHttpSession().getAttribute("user");
			labelVo.setModifyUserId(user.getUserId());
			this.labelService.updateLabelInfo(labelVo);
			return CommonReturnType.MODIFY_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return CommonReturnType.MODIFY_FAILURE;
		}
	}


	/**
	 * @return List<Label>
	 * @description 获取标签分类信息
	 * @author 柚子茶
	 * @date 2021/3/9 21:34
	 **/
	@RequestMapping("getMediaClassLabel")
	public List<Label> getMediaClassLabel() {
		return this.labelService.queryMediaClassLabel();
	}


}
