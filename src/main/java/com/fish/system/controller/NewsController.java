package com.fish.system.controller;

import com.fish.system.domain.News;
import com.fish.system.domain.User;
import com.fish.system.utils.CommonReturnType;
import com.fish.system.utils.DataGridView;
import com.fish.system.utils.WebUtils;
import com.fish.system.vo.NewsVo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.xml.crypto.Data;
import java.util.Date;

/**
 * @ClassName NewsController
 * @Description 公告管理控制器
 * @Author 柚子茶
 * @Date 2020/12/1 13:32
 * @Version 1.0
 */
@RestController
@RequestMapping("news")
public class NewsController extends BaseController {


	/**
	 * @param newsVo 公告实例化对象
	 * @return CommonReturnType
	 * @description 发布新的公告
	 * @author 柚子茶
	 * @date 2020/12/11 22:13
	 **/
	@PostMapping("/addNewsData")
	public CommonReturnType addNewsData(NewsVo newsVo) {
		try {
			User user = (User) WebUtils.getHttpSession().getAttribute("user");
			newsVo.setId(0);
			newsVo.setCreateTime(new Date());
			newsVo.setOperName(user.getUserName());
			this.newsService.addNewsInfo(newsVo);
			return CommonReturnType.ADD_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return CommonReturnType.ADD_FAILURE;
		}
	}

	/**
	 * @param newsVo 公告实例化对象
	 * @return CommonReturnType
	 * @description 修改公告的内容
	 * @author 柚子茶
	 * @date 2020/12/11 22:13
	 **/
	@PostMapping("/updateNewsData")
	public CommonReturnType updateNewsData(NewsVo newsVo) {
		try {
			this.newsService.updateNewsInfo(newsVo);
			return CommonReturnType.MODIFY_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return CommonReturnType.MODIFY_FAILURE;
		}
	}

	/**
	 * @param newsVo 公告实例化对象
	 * @return CommonReturnType
	 * @description 批量删除公告信息
	 * @author 柚子茶
	 * @date 2020/12/12 11:01
	 **/
	@PostMapping("/deleteBatchNewsData")
	public CommonReturnType deleteBatchNewsInfo(NewsVo newsVo) {
		try {
			this.newsService.deleteBatchNewsInfo(newsVo);
			return CommonReturnType.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return CommonReturnType.DELETE_FAILURE;
		}
	}

	/**
	 * @return CommonReturnType
	 * @description 根据id删除公告信息
	 * @author 柚子茶
	 * @date 2020/12/11 21:13
	 **/
	@RequestMapping("/deleteNewsById")
	public CommonReturnType deleteNewsById(NewsVo newsVo) {
		try {
			this.newsService.deleteNewsById(newsVo.getId());
			return CommonReturnType.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return CommonReturnType.DELETE_FAILURE;
		}
	}

	/**
	 * @param newsVo 实例化对象
	 * @return DataGridView
	 * @description 查询所有公告
	 * @author 柚子茶
	 * @date 2020/12/1 14:23
	 **/
	@RequestMapping("/queryNewsByAll")
	public DataGridView queryNewsByAll(NewsVo newsVo) {
		return newsService.queryNewsByAll(newsVo);
	}

	/**
	 * @param newsVo 实例化对象
	 * @return News
	 * @description 根据id查询公告
	 * @author 柚子茶
	 * @date 2020/12/1 14:23
	 **/
	@RequestMapping("/queryNewsById")
	public News queryNewsById(NewsVo newsVo) {
		return newsService.queryNewsById(newsVo);
	}


}
