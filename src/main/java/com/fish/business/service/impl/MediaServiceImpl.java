package com.fish.business.service.impl;

import com.fish.business.domain.Media;
import com.fish.business.service.MediaService;
import com.fish.business.vo.MediaVo;
import com.fish.system.domain.Label;
import com.fish.system.domain.User;
import com.fish.system.service.impl.BaseService;
import com.fish.system.utils.AppFileUtils;
import com.fish.system.utils.DataGridView;
import com.fish.system.utils.MessageConstant;
import com.fish.system.utils.WebUtils;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @ClassName MediaServiceImpl
 * @Description 作品业务层接口实现类
 * @Author 柚子茶
 * @Date 2021/3/14 11:52
 * @Version 1.0
 */
@Service
public class MediaServiceImpl extends BaseService implements MediaService {


	/**
	 * @param mediaVo 作品实体类
	 * @return void
	 * @description 添加作品信息
	 * @author 柚子茶
	 * @date 2021/3/14 12:06
	 **/
	@Override
	public void addMediaInfo(MediaVo mediaVo) {
		// 获取当前登录的用户
		User user = (User) WebUtils.getHttpSession().getAttribute("user");
		mediaVo.setCreateTime(new Date());
		mediaVo.setModifyTime(new Date());
		mediaVo.setCreateUserId(user.getUserId());
		mediaVo.setModifyUserId(user.getUserId());

		// 判断是否上传了图片
		if (!mediaVo.getMediaUrl().equals(MessageConstant.IMG_DEFAULT_ADDRESS)) {
			// 上传了图片
			// 将上传图片的临时文件去除
			String modifyFileSuffix = AppFileUtils.modifyFileSuffix(mediaVo.getMediaUrl(), MessageConstant.FILE_UPLOAD_TEMP);
			mediaVo.setMediaUrl(modifyFileSuffix);
		}

		// 修改对应标签下的作品数量
		Label label = new Label();
		label.setLabelName(mediaVo.getMediaLabel());
		Label label1 = this.labelDao.queryLabelInfo(label);
		label1.setMediaCount(label1.getMediaCount()+1);
		this.labelDao.updateLabelInfo(label1);

		this.mediaDao.insertSelective(mediaVo);
	}

	/**
	 * @param mediaVo
	 * @return void
	 * @description 录入作品信息
	 * @author 柚子茶
	 * @date 2021/3/15 14:24
	 **/
	@Override
	public void addMediaInfoByInput(MediaVo mediaVo) {
		// 获取当前登录的用户
		User user = (User) WebUtils.getHttpSession().getAttribute("user");
		mediaVo.setCreateTime(new Date());
		mediaVo.setModifyTime(new Date());
		mediaVo.setCreateUserId(user.getUserId());
		mediaVo.setModifyUserId(user.getUserId());

		// 根据访问路径将临时表中的数据删除
		this.tempDao.deleteTempInfoByUrl(mediaVo.getMediaUrl());
		// 修改对应标签下的作品数量
		Label label = new Label();
		label.setLabelName(mediaVo.getMediaLabel());
		Label label1 = this.labelDao.queryLabelInfo(label);
		label1.setMediaCount(label1.getMediaCount()+1);
		this.labelDao.updateLabelInfo(label1);

		this.mediaDao.insertSelective(mediaVo);
	}

	/**
	 * @param mediaVo
	 * @return DataGridView
	 * @description 查询数字媒体作品信息
	 * @author 柚子茶
	 * @date 2021/3/15 16:48
	 **/
	@Override
	public DataGridView queryMediaInfo(MediaVo mediaVo) {
		// 开启分页
		Page<Object> page = PageHelper.startPage(mediaVo.getPage(), mediaVo.getLimit());
		List<Media> mediaList = this.mediaDao.queryMediaInfoByList(mediaVo);
		return new DataGridView(page.getTotal(), mediaList);
	}

	/**
	 * @param mediaVo 作品实体类
	 * @return void
	 * @description 删除
	 * @author 柚子茶
	 * @date 2021/3/16 10:20
	 **/
	@Override
	public void deleteMediaInfo(MediaVo mediaVo) {

		// 根据ID查询该作品信息
		Media media = this.mediaDao.queryMediaInfoById(mediaVo.getMediaId());
		// 根据作品标签修改标签的作品数量
		Label label = new Label();
		label.setLabelName(media.getMediaLabel());
		Label label1 = this.labelDao.queryLabelInfo(label);
		label1.setMediaCount(label1.getMediaCount()-1);
		this.labelDao.updateLabelInfo(label1);
		this.mediaDao.deleteByPrimaryKey(mediaVo.getMediaId());
	}

	/**
	 * @param mediaVo
	 * @return void
	 * @description 更新
	 * @author 柚子茶
	 * @date 2021/3/16 10:24
	 **/
	@Override
	public void updateMediaInfo(MediaVo mediaVo) {
		// 获取当前登录的用户
		User user = (User) WebUtils.getHttpSession().getAttribute("user");
		mediaVo.setModifyUserId(user.getUserId());
		mediaVo.setModifyTime(new Date());
		this.mediaDao.updateByPrimaryKeySelective(mediaVo);
	}

	/**
	 * @param mediaVo
	 * @return List<Media>
	 * @description 查询作品信息
	 * @author 柚子茶
	 * @date 2021/3/16 13:56
	 **/
	@Override
	public List<Media> queryMediaInfoByList(MediaVo mediaVo) {
		mediaVo.setMediaState(1);
		List<Media> mediaList = mediaDao.queryMediaInfoByList(mediaVo);
		for (Media media : mediaList) {
			Long[] datePoor = getDatePoor(new Date(), media.getCreateTime());
			if (datePoor[0] != 0 && datePoor[0] <= 30) {
				media.setIntervalDate(datePoor[0] + "天");
			} else if (datePoor[0] > 30) {
				int monthDiff = getMonthDiff(media.getCreateTime(), new Date());
				media.setIntervalDate(monthDiff + "个月");
			} else if (datePoor[1] != 0) {
				media.setIntervalDate(datePoor[1] + "小时");
			} else if (datePoor[2] != 0) {
				media.setIntervalDate(datePoor[2] + "分钟");
			} else {
				media.setIntervalDate("1分钟");
			}
		}
		return mediaList;
	}

	/**
	 * @param mediaVo
	 * @return Media
	 * @description 根据ID查询作品信息
	 * @author 柚子茶
	 * @date 2021/3/18 0:06
	 **/
	@Override
	public Media queryMediaInfoById(MediaVo mediaVo) {
		Media media = mediaDao.queryMediaInfoById(mediaVo.getMediaId());
		return media;
	}

	/**
	 * @param mediaVo
	 * @return void
	 * @description 更新作品的浏览次数
	 * @author 柚子茶
	 * @date 2021/3/18 13:04
	 **/
	@Override
	public void updateMediaViewCount(MediaVo mediaVo) {
		Media media = this.mediaDao.queryMediaInfoById(mediaVo.getMediaId());
		mediaVo.setViewCount(media.getViewCount()+1);
		this.mediaDao.updateByPrimaryKeySelective(mediaVo);
	}

	/**
	 * @param endDate 结束时间
	 * @param nowDate 开始时间
	 * @return String
	 * @description 计算两个日期相差的天数和小时以及分钟
	 * @author 柚子茶
	 * @date 2021/3/16 13:23
	 **/
	public Long[] getDatePoor(Date endDate, Date nowDate) {

		Long[] longArr = new Long[3];

		long nd = 1000 * 24 * 60 * 60;//每天毫秒数

		long nh = 1000 * 60 * 60;//每小时毫秒数

		long nm = 1000 * 60;//每分钟毫秒数

		long diff = endDate.getTime() - nowDate.getTime();// 获得两个时间的毫秒时间差异

		long day = diff / nd;// 计算差多少天

		long hour = diff % nd / nh;// 计算差多少小时

		long min = diff % nd % nh / nm;// 计算差多少分钟

		longArr[0] = day;
		longArr[1] = hour;
		longArr[2] = min;

		return longArr;
	}

	/**
	 * @param d1 第一个日期
	 * @param d2 第二个日期
	 * @return int 相差的月份数
	 * @description 计算两个日期相差的月份数
	 * @author 柚子茶
	 * @date 2021/1/21 15:35
	 **/
	public int getMonthDiff(Date d1, Date d2) {
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		c1.setTime(d1);
		c2.setTime(d2);
		int year1 = c1.get(Calendar.YEAR);
		int year2 = c2.get(Calendar.YEAR);
		int month1 = c1.get(Calendar.MONTH);
		int month2 = c2.get(Calendar.MONTH);
		int day1 = c1.get(Calendar.DAY_OF_MONTH);
		int day2 = c2.get(Calendar.DAY_OF_MONTH);
		// 获取年的差值
		int yearInterval = year1 - year2;
		// 如果 d1的 月-日 小于 d2的 月-日 那么 yearInterval-- 这样就得到了相差的年数
		if (month1 < month2 || month1 == month2 && day1 < day2) {
			yearInterval--;
		}
		// 获取月数差值
		int monthInterval = (month1 + 12) - month2;
		if (day1 < day2) {
			monthInterval--;
		}
		monthInterval %= 12;
		int monthsDiff = Math.abs(yearInterval * 12 + monthInterval);
		return monthsDiff;
	}
}
