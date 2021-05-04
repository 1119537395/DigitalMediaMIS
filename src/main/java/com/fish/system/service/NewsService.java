package com.fish.system.service;

import com.fish.system.domain.News;
import com.fish.system.utils.DataGridView;
import com.fish.system.vo.NewsVo;

/**
 * @InterfaceName NewsService
 * @Description 公告(news)业务层接口
 * @Author 柚子茶
 * @Date 2020/11/28 22:47
 * @Version 1.0
 */
public interface NewsService {


	/**
	 * @param newsVo 公告封装实体类对象
	 * @return DataGridView
	 * @description 查询所有的公告
	 * @author 柚子茶
	 * @date 2020/12/1 14:04
	 **/
	DataGridView queryNewsByAll(NewsVo newsVo);

	/**
	 * @param newsVo 公告封装实体类对象
	 * @return News
	 * @description 根据id查询公告
	 * @author 柚子茶
	 * @date 2020/12/1 14:24
	 **/
	News queryNewsById(NewsVo newsVo);

	/**
	 * @param id 公告id
	 * @return void
	 * @description 根据id删除公告
	 * @author 柚子茶
	 * @date 2020/12/11 21:30
	 **/
	void deleteNewsById(Integer id);


	/**
	 * @param newsVo 公告实例化对象
	 * @return void
	 * @description 添加公告信息
	 * @author 柚子茶
	 * @date 2020/12/11 22:14
	 **/
	void addNewsInfo(NewsVo newsVo);

	/**
	 * @param newsVo 公告实例化对象
	 * @return void
	 * @description 修改公告内容
	 * @author 柚子茶
	 * @date 2020/12/11 22:15
	 **/
	void updateNewsInfo(NewsVo newsVo);

	/**
	 * @param newsVo 公告实例化对象
	 * @return void
	 * @description 批量删除
	 * @author 柚子茶
	 * @date 2020/12/12 11:04
	 **/
	void deleteBatchNewsInfo(NewsVo newsVo);
}
