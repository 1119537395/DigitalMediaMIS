package com.fish.business.domain;

import java.io.Serializable;

/**
 * @ClassName Media
 * @Description 数字媒体作品临时保存(Temp)实体类
 * @Author 柚子茶
 * @Date 2021/3/13 12:17
 * @Version 1.0
 */
public class Temp implements Serializable {

    private static final long serialVersionUID = -7012582178114903942L;

    /** 临时表ID */
    private Integer tempId;

    /** 数字媒体作品原始名称 */
    private String mediaName;

    /** 文件上传后的访问地址 */
    private String mediaUrl;

    public Integer getTempId() {
        return tempId;
    }

    public void setTempId(Integer tempId) {
        this.tempId = tempId;
    }

    public String getMediaName() {
        return mediaName;
    }

    public void setMediaName(String mediaName) {
        this.mediaName = mediaName == null ? null : mediaName.trim();
    }

    public String getMediaUrl() {
        return mediaUrl;
    }

    public void setMediaUrl(String mediaUrl) {
        this.mediaUrl = mediaUrl == null ? null : mediaUrl.trim();
    }

    @Override
    public String toString() {
        return "Temp{" +
                "tempId=" + tempId +
                ", mediaName='" + mediaName + '\'' +
                ", mediaUrl='" + mediaUrl + '\'' +
                '}';
    }
}