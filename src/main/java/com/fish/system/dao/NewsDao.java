package com.fish.system.dao;

import com.fish.system.domain.News;
import com.fish.system.vo.NewsVo;

import java.util.List;

/**
 * @InterfaceName NewsDao
 * @Description (news)公告数据访问层
 * @Author 柚子茶
 * @Date 2020/11/28 22:46
 * @Version 1.0
 */
public interface NewsDao {

	/**
	 * @param newsVo 公告封装实体类对象
	 * @return List<News>
	 * @description 查询所有公告
	 * @author 柚子茶
	 * @date 2020/12/1 13:44
	 **/
	List<News> queryNewsByAll(NewsVo newsVo);

	/**
	 * @param id 公告ID
	 * @return News
	 * @description 根据id查询公告
	 * @author 柚子茶
	 * @date 2020/12/1 14:27
	 **/
	News queryNewsById(Integer id);

	/**
	 * @param id 公告id
	 * @return void
	 * @description 根据id删除公告
	 * @author 柚子茶
	 * @date 2020/12/11 21:40
	 **/
	void deleteNewsById(Integer id);

	/**
	 * @param newsVo 公告实例化对象
	 * @return void
	 * @description 添加公告
	 * @author 柚子茶
	 * @date 2020/12/11 22:18
	 **/
	void insertNewsInfo(NewsVo newsVo);

	/**
	 * @param newsVo 公告实例化对象
	 * @return void
	 * @description 修改公告
	 * @author 柚子茶
	 * @date 2020/12/11 22:19
	 **/
	void updateNewsInfo(NewsVo newsVo);
}
