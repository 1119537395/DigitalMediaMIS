package com.fish.system.service.impl;

import com.fish.system.domain.News;
import com.fish.system.service.NewsService;
import com.fish.system.utils.DataGridView;
import com.fish.system.vo.NewsVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName NewsServiceImpl
 * @Description 公告(news)业务层接口实现类
 * @Author 柚子茶
 * @Date 2020/11/28 22:49
 * @Version 1.0
 */
@Service
public class NewsServiceImpl extends BaseService implements NewsService {


	/**
	 * @param newsVo 公告实体类对象
	 * @return DataGridView
	 * @description 查询所有的公告
	 * @author 柚子茶
	 * @date 2020/12/1 14:05
	 **/
	@Override
	public DataGridView queryNewsByAll(NewsVo newsVo) {
		// 开启分页
		Page<Object> page = PageHelper.startPage(newsVo.getPage(), newsVo.getLimit());
		// 查询数据
		List<News> newsList = newsDao.queryNewsByAll(newsVo);
		// 返回查询结果的条数和数据
		return new DataGridView(page.getTotal(), newsList);
	}

	/**
	 * @param newsVo 公告实体类封装对象
	 * @return News
	 * @description 根据id查询公告信息
	 * @author 柚子茶
	 * @date 2020/12/1 14:25
	 **/
	@Override
	public News queryNewsById(NewsVo newsVo) {
		return newsDao.queryNewsById(newsVo.getId());
	}

	/**
	 * @param id 公告id
	 * @return void
	 * @description 根据id删除公告
	 * @author 柚子茶
	 * @date 2020/12/11 21:31
	 **/
	@Override
	public void deleteNewsById(Integer id) {
		newsDao.deleteNewsById(id);
	}

	/**
	 * @param newsVo 公告实例化对象
	 * @return void
	 * @description 添加公告信息
	 * @author 柚子茶
	 * @date 2020/12/11 22:16
	 **/
	@Override
	public void addNewsInfo(NewsVo newsVo) {
		this.newsDao.insertNewsInfo(newsVo);
	}

	/**
	 * @param newsVo 公告实例化对象
	 * @return void
	 * @description 修改公告信息
	 * @author 柚子茶
	 * @date 2020/12/11 22:16
	 **/
	@Override
	public void updateNewsInfo(NewsVo newsVo) {
		this.newsDao.updateNewsInfo(newsVo);
	}

	/**
	 * @param newsVo 公告实例化对象
	 * @return void
	 * @description 批量删除
	 * @author 柚子茶
	 * @date 2020/12/12 11:04
	 **/
	@Override
	public void deleteBatchNewsInfo(NewsVo newsVo) {
		Integer[] ids = newsVo.getIds();
		for (Integer id : ids) {
			deleteNewsById(id);
		}
	}
}
