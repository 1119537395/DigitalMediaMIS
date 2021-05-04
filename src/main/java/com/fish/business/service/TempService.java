package com.fish.business.service;

import com.fish.business.vo.TempVo;
import com.fish.system.utils.DataGridView;

/**
 * @InterfaceName TempService
 * @Description 数字媒体作品临时存放的业务层接口
 * @Author 柚子茶
 * @Date 2021/3/15 9:50
 * @Version 1.0
 */
public interface TempService {


	/**
	 * @param tempVo
	 * @return DataGridView
	 * @description 加载临时表信息
	 * @author 柚子茶
	 * @date 2021/3/15 9:59
	 **/
	DataGridView queryTempInfo(TempVo tempVo);

	/**
	 * @param originalFilename
	 * @param mediaUrl
	 * @return void
	 * @description 添加数字媒体作品的临时信息
	 * @author 柚子茶
	 * @date 2021/3/15 10:20
	 **/
	void addMediaTempInfo(String originalFilename, String mediaUrl);
}
