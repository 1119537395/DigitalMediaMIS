package com.fish.business.controller;

import com.fish.business.vo.TempVo;
import com.fish.system.controller.BaseController;
import com.fish.system.utils.DataGridView;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @ClassName TempController
 * @Description 前端控制器
 * @Author 柚子茶
 * @Date 2021/3/15 9:53
 * @Version 1.0
 */
@RestController
@RequestMapping("temp")
public class TempController extends BaseController {


	/**
	 * @param tempVo
	 * @return DataGridView
	 * @description 加载临时表信息
	 * @author 柚子茶
	 * @date 2021/3/15 9:58
	 **/
	@RequestMapping("loadTempInfo")
	public DataGridView loadTempInfo(TempVo tempVo) {
		return this.tempService.queryTempInfo(tempVo);
	}

}
