package com.fish.business.domain;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @ClassName Media
 * @Description 数字媒体作品(Media)实体类
 * @Author 柚子茶
 * @Date 2021/3/13 12:17
 * @Version 1.0
 */
public class Media implements Serializable {

    private static final long serialVersionUID = -4917744647126498724L;

    private Integer mediaId;

    private String mediaName;

    private String mediaLabel;

    private String mediaKeyword;

    private String mediaInfo;

    private String mediaUrl;

    private Integer mediaTop;

    private Integer mediaState;

    private Integer createUserId;

    private String createUserName;

    private String modifyUserName;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createTime;

    private Integer modifyUserId;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date modifyTime;

    private Integer viewCount;

    /** 记录视频上传的日期和当前日期的时间间隔 */
    private String intervalDate;

    public Integer getMediaId() {
        return mediaId;
    }

    public void setMediaId(Integer mediaId) {
        this.mediaId = mediaId;
    }

    public String getMediaName() {
        return mediaName;
    }

    public void setMediaName(String mediaName) {
        this.mediaName = mediaName == null ? null : mediaName.trim();
    }

    public String getMediaLabel() {
        return mediaLabel;
    }

    public void setMediaLabel(String mediaLabel) {
        this.mediaLabel = mediaLabel == null ? null : mediaLabel.trim();
    }

    public String getMediaKeyword() {
        return mediaKeyword;
    }

    public void setMediaKeyword(String mediaKeyword) {
        this.mediaKeyword = mediaKeyword == null ? null : mediaKeyword.trim();
    }

    public String getMediaInfo() {
        return mediaInfo;
    }

    public void setMediaInfo(String mediaInfo) {
        this.mediaInfo = mediaInfo == null ? null : mediaInfo.trim();
    }

    public String getMediaUrl() {
        return mediaUrl;
    }

    public void setMediaUrl(String mediaUrl) {
        this.mediaUrl = mediaUrl == null ? null : mediaUrl.trim();
    }

    public Integer getMediaTop() {
        return mediaTop;
    }

    public void setMediaTop(Integer mediaTop) {
        this.mediaTop = mediaTop;
    }

    public Integer getMediaState() {
        return mediaState;
    }

    public void setMediaState(Integer mediaState) {
        this.mediaState = mediaState;
    }

    public Integer getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Integer createUserId) {
        this.createUserId = createUserId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getModifyUserId() {
        return modifyUserId;
    }

    public void setModifyUserId(Integer modifyUserId) {
        this.modifyUserId = modifyUserId;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Integer getViewCount() {
        return viewCount;
    }

    public void setViewCount(Integer viewCount) {
        this.viewCount = viewCount;
    }

    public String getCreateUserName() {
        return createUserName;
    }

    public void setCreateUserName(String createUserName) {
        this.createUserName = createUserName;
    }

    public String getModifyUserName() {
        return modifyUserName;
    }

    public void setModifyUserName(String modifyUserName) {
        this.modifyUserName = modifyUserName;
    }

    public String getIntervalDate() {
        return intervalDate;
    }

    public void setIntervalDate(String intervalDate) {
        this.intervalDate = intervalDate;
    }

    @Override
    public String toString() {
        return "Media{" +
                "mediaId=" + mediaId +
                ", mediaName='" + mediaName + '\'' +
                ", mediaLabel='" + mediaLabel + '\'' +
                ", mediaKeyword='" + mediaKeyword + '\'' +
                ", mediaInfo='" + mediaInfo + '\'' +
                ", mediaUrl='" + mediaUrl + '\'' +
                ", mediaTop=" + mediaTop +
                ", mediaState=" + mediaState +
                ", createUserId=" + createUserId +
                ", createUserName='" + createUserName + '\'' +
                ", modifyUserName='" + modifyUserName + '\'' +
                ", createTime=" + createTime +
                ", modifyUserId=" + modifyUserId +
                ", modifyTime=" + modifyTime +
                ", viewCount=" + viewCount +
                ", intervalDate='" + intervalDate + '\'' +
                '}';
    }
}