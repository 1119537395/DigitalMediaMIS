package com.fish.statistics.service;

import com.fish.statistics.domain.BaseEntity;

import java.util.List;
import java.util.Map;

/**
 * @InterfaceName StatsService
 * @Description 统计业务层接口
 * @Author 柚子茶
 * @Date 2021/3/18 15:38
 * @Version 1.0
 */
public interface StatsService {


	/**
	 * @return Map<String, Object>
	 * @description 加载柱形图的统计数据
	 * @author 柚子茶
	 * @date 2021/3/18 15:51
	 **/
	Map<String, Object> loadMediaChartData();

	/**
	 * @return List<BaseEntity>
	 * @description 加载扇形图的统计数据
	 * @author 柚子茶
	 * @date 2021/3/18 17:21
	 **/
	List<BaseEntity> loadMediaFanChartData();
}
