package com.fish.business.controller;

import com.fish.business.domain.Media;
import com.fish.business.vo.MediaVo;
import com.fish.system.controller.BaseController;
import com.fish.system.utils.CommonReturnType;
import com.fish.system.utils.DataGridView;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @ClassName MediaController
 * @Description 数字媒体作品前端控制器
 * @Author 柚子茶
 * @Date 2021/3/14 11:56
 * @Version 1.0
 */
@RestController()
@RequestMapping("media")
public class MediaController extends BaseController {


	/**
	 * @param mediaVo
	 * @return DataGridView
	 * @description 查询数字媒体作品信息
	 * @author 柚子茶
	 * @date 2021/3/15 16:47
	 **/
	@RequestMapping("loadMediaInfo")
	public DataGridView loadMediaInfo(MediaVo mediaVo) {
		return this.mediaService.queryMediaInfo(mediaVo);
	}


	/**
	 * @param mediaVo
	 * @return Media
	 * @description 根据ID查询作品信息
	 * @author 柚子茶
	 * @date 2021/3/18 0:05
	 **/
	@RequestMapping("loadMediaInfoById")
	public Media loadMediaInfoById(MediaVo mediaVo) {
		return this.mediaService.queryMediaInfoById(mediaVo);
	}


	/**
	 * @param mediaVo
	 * @return CommonReturnType
	 * @description 保存数字媒体作品信息
	 * @author 柚子茶
	 * @date 2021/3/15 14:21
	 **/
	@RequestMapping("addMediaInfo")
	public CommonReturnType addMediaInfo(MediaVo mediaVo) {
		try {
			this.mediaService.addMediaInfo(mediaVo);
			return CommonReturnType.UPLOAD_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return CommonReturnType.UPLOAD_FAILURE;
		}
	}

	/**
	 * @param mediaVo
	 * @return CommonReturnType
	 * @description 更新
	 * @author 柚子茶
	 * @date 2021/3/18 13:02
	 **/
	@RequestMapping("updateMediaViewCount")
	public CommonReturnType updateMediaViewCount(MediaVo mediaVo) {
		try {
			this.mediaService.updateMediaViewCount(mediaVo);
			return CommonReturnType.MODIFY_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return CommonReturnType.MODIFY_FAILURE;
		}
	}

	/**
	 * @param mediaVo
	 * @return CommonReturnType
	 * @description 作品信息录入
	 * @author 柚子茶
	 * @date 2021/3/15 14:23
	 **/
	@RequestMapping("inputMediaInfo")
	public CommonReturnType inputMediaInfo(MediaVo mediaVo) {
		try {
			this.mediaService.addMediaInfoByInput(mediaVo);
			return CommonReturnType.ADD_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return CommonReturnType.ADD_FAILURE;
		}
	}


	/**
	 * @param mediaVo 数字媒体作品实体类
	 * @return CommonReturnType
	 * @description 删除
	 * @author 柚子茶
	 * @date 2021/3/16 10:18
	 **/
	@RequestMapping("deleteMediaInfo")
	public CommonReturnType deleteMediaInfo(MediaVo mediaVo) {
		try {
			this.mediaService.deleteMediaInfo(mediaVo);
			return CommonReturnType.DELETE_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return CommonReturnType.DELETE_FAILURE;
		}
	}


	/**
	 * @param mediaVo
	 * @return CommonReturnType
	 * @description 更新
	 * @author 柚子茶
	 * @date 2021/3/16 10:22
	 **/
	@RequestMapping("updateMediaInfo")
	public CommonReturnType updateMediaInfo(MediaVo mediaVo) {
		try {
			this.mediaService.updateMediaInfo(mediaVo);
			return CommonReturnType.MODIFY_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return CommonReturnType.MODIFY_FAILURE;
		}
	}

	/**
	 * @param mediaVo
	 * @return List<Media>
	 * @description 查询作品信息
	 * @author 柚子茶
	 * @date 2021/3/16 13:55
	 **/
	@RequestMapping("findMediaInfo")
	public List<Media> getMediaInfoByList(MediaVo mediaVo) {
		return mediaService.queryMediaInfoByList(mediaVo);
	}

}
