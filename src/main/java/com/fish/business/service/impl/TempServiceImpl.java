package com.fish.business.service.impl;

import com.fish.business.domain.Temp;
import com.fish.business.service.TempService;
import com.fish.business.vo.TempVo;
import com.fish.system.service.impl.BaseService;
import com.fish.system.utils.DataGridView;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName TempServiceImpl
 * @Description 业务层接口实现类
 * @Author 柚子茶
 * @Date 2021/3/15 9:51
 * @Version 1.0
 */
@Service
public class TempServiceImpl extends BaseService implements TempService {


	/**
	 * @param tempVo
	 * @return DataGridView
	 * @description 加载临时表信息
	 * @author 柚子茶
	 * @date 2021/3/15 9:59
	 **/
	@Override
	public DataGridView queryTempInfo(TempVo tempVo) {
		// 开启分页
		Page<Object> page = PageHelper.startPage(tempVo.getPage(), tempVo.getLimit());
		List<Temp> tempList = this.tempDao.selectTempInfoByList(tempVo);
		return new DataGridView(page.getTotal(), tempList);
	}

	/**
	 * @param originalFilename
	 * @param mediaUrl
	 * @return void
	 * @description 添加数字媒体作品的临时信息
	 * @author 柚子茶
	 * @date 2021/3/15 10:21
	 **/
	@Override
	public void addMediaTempInfo(String originalFilename, String mediaUrl) {
		Temp temp = new Temp();
		temp.setMediaName(originalFilename);
		temp.setMediaUrl(mediaUrl);
		this.tempDao.insertSelective(temp);
	}
}
