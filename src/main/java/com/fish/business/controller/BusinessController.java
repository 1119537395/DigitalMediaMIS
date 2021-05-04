package com.fish.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName BusinessController
 * @Description 业务管理的路由控制器
 * @Author 柚子茶
 * @Date 2021/3/9 20:36
 * @Version 1.0
 */
@Controller
@RequestMapping("business")
public class BusinessController {


	/**
	 * @return String
	 * @description 跳转到作品上传界面
	 * @author 柚子茶
	 * @date 2021/3/9 20:40
	 **/
	@RequestMapping("toWorkUploadManager")
	public String toWorkUploadManager() {
		return "business/upload/WorkUploadManager";
	}

	/**
	 * @return String
	 * @description 跳转到批量上传界面
	 * @author 柚子茶
	 * @date 2021/3/14 17:46
	 **/
	@RequestMapping("toBulkUploadManager")
	public String toBulkUploadManager() {
		return "business/upload/BulkUploadManager";
	}

	/**
	 * @return String
	 * @description 跳转到作品管理界面
	 * @author 柚子茶
	 * @date 2021/3/15 17:14
	 **/
	@RequestMapping("toMediaManager")
	public String toMediaManager() {
		return "business/media/mediaManager";
	}

	/**
	 * @return String
	 * @description 跳转到作品浏览界面
	 * @author 柚子茶
	 * @date 2021/3/16 13:01
	 **/
	@RequestMapping("toMediaBrowseManager")
	public String toMediaBrowseManager() {
		return "business/media/mediaBrowseManager";
	}



}
