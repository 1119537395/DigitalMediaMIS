package com.fish.statistics.service.impl;

import com.fish.statistics.domain.BaseEntity;
import com.fish.statistics.service.StatsService;
import com.fish.system.service.impl.BaseService;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName StatsServiceImpl
 * @Description 统计业务层接口实现类
 * @Author 柚子茶
 * @Date 2021/3/18 15:39
 * @Version 1.0
 */
@Service
public class StatsServiceImpl extends BaseService implements StatsService {


	/**
	 * @return Map<String, Object>
	 * @description 加载柱形图的统计数据
	 * @author 柚子茶
	 * @date 2021/3/18 15:52
	 **/
	@Override
	public Map<String, Object> loadMediaChartData() {

		// 查询出需要统计的数据
		List<BaseEntity> baseEntityList = this.statsDao.queryMediaCharData();

		List<String> names = new ArrayList<>();
		List<Integer> values = new ArrayList<>();

		for (BaseEntity entity : baseEntityList) {
			names.add(entity.getName());
			values.add((Integer) entity.getValue());
		}

		Map<String, Object> map = new HashMap<>(16);
		map.put("name", names);
		map.put("value", values);


		return map;
	}

	/**
	 * @return List<BaseEntity>
	 * @description 加载扇形图的统计数据
	 * @author 柚子茶
	 * @date 2021/3/18 17:21
	 **/
	@Override
	public List<BaseEntity> loadMediaFanChartData() {
		return this.statsDao.loadMediaFanChartData();
	}
}
