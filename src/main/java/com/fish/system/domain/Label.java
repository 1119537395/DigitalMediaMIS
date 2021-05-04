package com.fish.system.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName Label
 * @Description 标签(label)实体类
 * @Author 柚子茶
 * @Date 2021/1/16 12:17
 * @Version 1.0
 */
public class Label implements Serializable {

	private static final long serialVersionUID = 1432074290880022719L;

	private Integer labelId;

	private String labelName;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date createTime;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
	private Date modifyTime;

	private Integer createUserId;

	private Integer modifyUserId;

	/**  媒体作品的数量  */
	private Integer mediaCount;

	private String createName;

	private String modifyName;


	public Integer getLabelId() {
		return labelId;
	}

	public void setLabelId(Integer labelId) {
		this.labelId = labelId;
	}

	public String getLabelName() {
		return labelName;
	}

	public void setLabelName(String labelName) {
		this.labelName = labelName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public Integer getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}

	public Integer getModifyUserId() {
		return modifyUserId;
	}

	public void setModifyUserId(Integer modifyUserId) {
		this.modifyUserId = modifyUserId;
	}

	public Integer getMediaCount() {
		return mediaCount;
	}

	public void setMediaCount(Integer mediaCount) {
		this.mediaCount = mediaCount;
	}

	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}

	public String getModifyName() {
		return modifyName;
	}

	public void setModifyName(String modifyName) {
		this.modifyName = modifyName;
	}

	@Override
	public String toString() {
		return "Label{" +
				"labelId=" + labelId +
				", labelName='" + labelName + '\'' +
				", createTime=" + createTime +
				", modifyTime=" + modifyTime +
				", createUserId=" + createUserId +
				", modifyUserId=" + modifyUserId +
				", mediaCount=" + mediaCount +
				", createName='" + createName + '\'' +
				", modifyName='" + modifyName + '\'' +
				'}';
	}

}
