package com.fish.system.vo;

import com.fish.system.domain.News;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @ClassName NewsVO
 * @Description 实体类(News)属性扩展
 * @Author 柚子茶
 * @Date 2020/12/1 13:42
 * @Version 1.0
 */
public class NewsVo extends News {

	/**
	 * 分页参数
	 */
	private Integer page;

	/**
	 * 分页参数
	 */
	private Integer limit;

	/**
	 * 用于接收多个id
	 */
	private Integer[] ids;

	/**
	 * 将从界面获取到的时间进行格式化传到数据
	 */
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date startTime;

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date endTime;

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Integer[] getIds() {
		return ids;
	}

	public void setIds(Integer[] ids) {
		this.ids = ids;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

}
