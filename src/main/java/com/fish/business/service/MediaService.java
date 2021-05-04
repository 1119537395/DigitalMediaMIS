package com.fish.business.service;

import com.fish.business.domain.Media;
import com.fish.business.vo.MediaVo;
import com.fish.system.utils.DataGridView;

import java.util.List;

/**
 * @InterfaceName MediaService
 * @Description 媒体作品业务层接口
 * @Author 柚子茶
 * @Date 2021/3/14 11:51
 * @Version 1.0
 */
public interface MediaService {


	/**
	 * @param mediaVo
	 * @return void
	 * @description 添加作品信息
	 * @author 柚子茶
	 * @date 2021/3/14 12:03
	 **/
	void addMediaInfo(MediaVo mediaVo);

	/**
	 * @param mediaVo
	 * @return void
	 * @description 录入作品信息
	 * @author 柚子茶
	 * @date 2021/3/15 14:24
	 **/
	void addMediaInfoByInput(MediaVo mediaVo);

	/**
	 * @param mediaVo
	 * @return DataGridView
	 * @description 查询
	 * @author 柚子茶
	 * @date 2021/3/15 16:47
	 **/
	DataGridView queryMediaInfo(MediaVo mediaVo);

	/**
	 * @param mediaVo
	 * @return void
	 * @description 删除
	 * @author 柚子茶
	 * @date 2021/3/16 10:19
	 **/
	void deleteMediaInfo(MediaVo mediaVo);

	/**
	 * @param mediaVo
	 * @return void
	 * @description 更新
	 * @author 柚子茶
	 * @date 2021/3/16 10:23
	 **/
	void updateMediaInfo(MediaVo mediaVo);

	/**
	 * @param mediaVo
	 * @return List<Media>
	 * @description 查询
	 * @author 柚子茶
	 * @date 2021/3/16 13:56
	 **/
	List<Media> queryMediaInfoByList(MediaVo mediaVo);

	/**
	 * @param mediaVo
	 * @return Media
	 * @description 根据ID查询作品信息
	 * @author 柚子茶
	 * @date 2021/3/18 0:06
	 **/
	Media queryMediaInfoById(MediaVo mediaVo);

	/**
	 * @param mediaVo
	 * @return void
	 * @description 更新浏览次数
	 * @author 柚子茶
	 * @date 2021/3/18 13:04
	 **/
	void updateMediaViewCount(MediaVo mediaVo);
}
