package com.fish.statistics.controller;

import com.fish.statistics.domain.BaseEntity;
import com.fish.system.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * @ClassName StatsController
 * @Description 统计控制器
 * @Author 柚子茶
 * @Date 2021/3/18 15:35
 * @Version 1.0
 */
@Controller
@RequestMapping("stats")
public class StatsController extends BaseController {


	/**
	 * @return String
	 * @description 跳转到柱形图统计界面
	 * @author 柚子茶
	 * @date 2021/3/18 16:00
	 **/
	@RequestMapping("toMediaVisitNumberStatistics")
	public String toMediaVisitNumberStatistics() {
		return "statistics/MediaVisitNumberStatistics";
	}

	/**
	 * @return String
	 * @description 跳转到扇形图统计界面
	 * @author 柚子茶
	 * @date 2021/3/18 17:25
	 **/
	@RequestMapping("MediaTypeNumberStatistics")
	public String toMediaTypeNumberStatistics() {
		return "statistics/MediaTypeNumberStatistics";
	}


	/**
	 * @return Map<String, Object>
	 * @description 加载柱形图的统计数据
	 * @author 柚子茶
	 * @date 2021/3/18 15:51
	 **/
	@ResponseBody
	@RequestMapping("loadMediaChartData")
	public Map<String, Object> loadMediaChartData() {
		return this.statsService.loadMediaChartData();
	}

	/**
	 * @return List<BaseEntity>
	 * @description 加载扇形图统计数据
	 * @author 柚子茶
	 * @date 2021/3/18 17:19
	 **/
	@ResponseBody
	@RequestMapping("loadMediaFanChartData")
	public List<BaseEntity> loadMediaFanChartData() {
		return this.statsService.loadMediaFanChartData();
	}


}
