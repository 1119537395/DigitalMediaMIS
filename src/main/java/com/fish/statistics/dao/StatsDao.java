package com.fish.statistics.dao;

import com.fish.statistics.domain.BaseEntity;

import java.util.List;

/**
 * @InterfaceName StatsDao
 * @Description 统计的数据访问层
 * @Author 柚子茶
 * @Date 2021/3/18 15:40
 * @Version 1.0
 */
public interface StatsDao {


	/**
	 * @return List<BaseEntity>
	 * @description 查询出柱形图统计数据
	 * @author 柚子茶
	 * @date 2021/3/18 15:53
	 **/
	List<BaseEntity> queryMediaCharData();

	/**
	 * @return List<BaseEntity>
	 * @description 查询出扇形图统计数据
	 * @author 柚子茶
	 * @date 2021/3/18 17:22
	 **/
	List<BaseEntity> loadMediaFanChartData();
}
