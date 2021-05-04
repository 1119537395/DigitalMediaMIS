<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>数字媒体作品浏览</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${Path}/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${Path}/static/css/public.css" media="all"/>
    <style type="text/css">
        .dm-photo-list {
            list-style: none;
        }

        .dm-overall {
            width: 300px;
            height: 306px;
            background-color: #FFFFff;
            margin-bottom: 25px;
            height: 100%;
            display: inline-block;
            margin-left: 15px;
            margin-top: 10px;
            box-shadow: 0px 2px 4px 0px rgba(180, 185, 206, 0.5);
            border-radius: 1px;
            border: 1px solid #F3F3F3;
        }

        .dm-overall:hover {
            border-color: #0b96e7;
        }

        .dm-overall-img {
            width: 300px;
            height: 300px;
            background-color: #FFFFff;
            position: relative;
        }

        .dm-media-img {
            width: 300px;
            height: 300px;
            cursor: pointer;
        }

        .dm-overall-info {
            width: 290px;
            height: 118px;
            background-color: #FFFFff;
        }

        .dm-media-name {
            margin-left: 12px;
            margin-top: 11px;
        }

        .dm-media-name-style {
            width: 80px;
            height: 22px;
            float: left !important;
            overflow: hidden !important;
            white-space: nowrap !important;
            text-overflow: ellipsis !important;
            font-size: 16px;
            font-family: PingFangSC-Medium, PingFang SC;
            font-weight: 500;
            color: #4A4A4A;
            line-height: 22px;
            cursor: pointer;
        }

        .dm-media-name-style:hover {
            color: #0b96e7;
        }

        .dm-media-time {
            margin-top: 12px;
        }

        .font-size {
            margin-left: 14px;
            font-family: MicrosoftYaHei;
            color: #808183;
            line-height: 17px;
        }

        .dm-media-time-style {
            font-family: MicrosoftYaHei;
            color: #808183;
            line-height: 17px;
            font-size: 14px;
        }

        .dm-media-label-style {
            font-family: MicrosoftYaHei;
            color: #FFFFff;
            font-size: 15px;
            background-color: #4ac829;
            border-radius: 6px;
        }

        .dm-media-label {
            margin-top: 10px;
        }

        .test {
            position: relative;
            width: 351px;
            height: 326px;
            left: 20px;
            top: 20px;
        }

        .dm-media-show {
            border: 1px solid gainsboro;
            width: 370px;
            height: 345px;
        }

        .dm-card {
            width: 360px;
            height: 345px;
            position: relative;
            top: 20px;
            right: -10px;
            border: 1px solid gainsboro;
        }

        .dm-download-style {
            height: 25px;
            width: 40px;
            background-color: #0b96e7;
            border: 1px solid #0b96e7;
            border-radius: 5px;
            color: #FFFFff;
            margin-left: 0px;
        }

    </style>
</head>
<body style="margin: 10px">

<!-- 搜索条件开始 -->
<blockquote class="layui-elem-quote">
    <form class="layui-form" method="post" id="searchFrom">

        <div class="layui-inline">
            <input type="text" name="mediaKeyword" autocomplete="on" class="layui-input"
                   placeholder="请输入查询的作品关键字">
        </div>

        <div class="layui-inline">
            <select name="mediaLabel" id="findMediaLabel">
                <option value="">请选择查询的标签</option>
            </select>
        </div>

        <div class="layui-inline">
            <button type="button" class="layui-btn" id="doSearch">查询</button>

        </div>

        <div class="layui-inline">
            <button type="reset" class="layui-btn layui-btn-danger ">重置</button>
        </div>
    </form>
</blockquote>

<!-- 搜索条件结束 -->

<div style="display: none" id="mediaInfoModel">
    <div class="layui-row">
        <div class="layui-col-md6">
            <div class="test">
                <img class="dm-media-show" id="showImgId">
                <%--<button type="button" class="layui-btn">&nbsp;查询</button>--%>
            </div>
        </div>
        <div class="layui-col-md6">
            <div class="dm-card">
                <div class="layui-card-header layui-icon layui-icon-form">&nbsp;作品信息</div>
                <div class="layui-card-body" id="mediaName"></div>
                <div class="layui-card-body" id="mediaLabel"></div>
                <div class="layui-card-body" id="mediaKeyword"></div>
                <div class="layui-card-body" id="mediaInfo"></div>
                <div class="layui-card-body" id="mediaTop"></div>
                <div class="layui-card-body" id="createUserName"></div>
                <div class="layui-card-body" id="createTime"></div>
            </div>
        </div>
    </div>
</div>


<ul class="dm-photo-list" id="mediaPhoto">
    <!-- 显示作品图片信息的整体框 -->
    <%--<div class="dm-overall">

        <!-- 显示作品图片 -->
        <div class="dm-overall-img">
            <input type="hidden" class="mediaId" name="mediaId" value="123" >
            <img class="dm-media-img" src="${Path}/file/showImgFileInformation?path=2021-03-18/202103181206442467265.jpg">
        </div>

        <!-- 显示作品内容 -->
        <div class="dm-overall-info">
            <!-- 作品名称 -->
            <div class="dm-media-name">
                <span class="dm-media-name-style">LOGO设计的的顶顶顶顶顶多</span>
                <button class="dm-download-style" onclick="test11()">下载</button>
            </div>

            <!-- 作品浏览次数和上传时间 -->
            <div class="dm-media-time">
                <label class="font-size">浏览次数：</label>
                <span class="dm-media-time-style">100</span>
                <label class="font-size">上传时间：</label>
                <span class="dm-media-time-style">3个月</span>
            </div>


            <!-- 标签 -->
            <div class="dm-media-label">
                <label class="font-size">标签：</label>
                <span class="dm-media-label-style">包装设计</span>
            </div>

            <!-- 关键字 -->
            <div class="dm-media-label">
                <label class="font-size">关键字：</label>
                <span class="dm-media-time-style">简约、时尚、大方</span>
            </div>

        </div>
    </div>--%>
</ul>


<script src="${Path}/static/layui/layui.js" charset="utf-8"></script>
<script>
    var tableIns;
    layui.use(['table', 'layer', 'form', 'jquery', 'upload'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var upload = layui.upload;

        // 默认加载
        initMediaList();
        initMediaLabelList();

        //给查询按钮添加单击事件
        $("#doSearch").click(function () {
            // 获取表单提交的数据序列
            var parameter = $("#searchFrom").serialize();
            // 移除之前生成的作品信息列表
            $("div.dm-overall").remove();
            $.post("${Path}/media/findMediaInfo", parameter, function (result) {
                $(result).each(function (index, item) {
                    $("#mediaPhoto").append("<!-- 显示作品图片信息的整体框 -->\n" +
                        "    <div class='dm-overall'>\n" +
                        "\n" +
                        "        <!-- 显示作品图片 -->\n" +
                        "        <div class='dm-overall-img'>\n" +
                        "            <input type='hidden' class='mediaId' name='mediaId' value='" + item.mediaId + "'>" +
                        "            <img class='dm-media-img' src='${Path}/file/showImgFileInformation?path=" + item.mediaUrl + "'>\n" +
                        "        </div>\n" +
                        "\n" +
                        "        <!-- 显示作品内容 -->\n" +
                        "        <div class='dm-overall-info'>\n" +
                        "            <!-- 作品名称 -->\n" +
                        "            <div class='dm-media-name'>\n" +
                        "                <span class='dm-media-name-style'>" + item.mediaName + "</span>\n" +
                        "                <input type='hidden' value='" + item.mediaUrl + "'>" +
                        "                <button class='dm-download-style'>下载</button>" +
                        "            </div>\n" +
                        "\n" +
                        "            <!-- 作品浏览次数和上传时间 -->\n" +
                        "            <div class='dm-media-time'>\n" +
                        "                <label class='font-size'>浏览次数：</label>\n" +
                        "                <span class='dm-media-time-style'>" + item.viewCount + "</span>\n" +
                        "                <label class='font-size'>上传时间：</label>\n" +
                        "                <span class='dm-media-time-style'>" + item.intervalDate + "</span>\n" +
                        "            </div>\n" +
                        "\n" +
                        "            <!-- 标签 -->\n" +
                        "            <div class='dm-media-label'>\n" +
                        "                <label class='font-size'>标签：</label>\n" +
                        "                <span class='dm-media-label-style'>" + item.mediaLabel + "</span>\n" +
                        "            </div>" +
                        "            <!-- 关键字 -->\n" +
                        "            <div class='dm-media-label'>\n" +
                        "                <label class='font-size'>关键字：</label>\n" +
                        "                <span class='dm-media-time-style'>" + item.mediaKeyword + "</span>\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "    </div>");
                });
            });
        });

        // 给图片添加单击事件
        $(".dm-photo-list").on("click", ".dm-overall-img", function () {
            initWorkDetailInfo($(this).find("input").val());
        });

        // 给下载按钮添加单击事件
        $(".dm-photo-list").on("click", ".dm-download-style", function () {
            downloadMedia($(this).prev().val());
        });

        // 加载作品列表
        function initMediaList() {
            $.post("${Path}/media/findMediaInfo", function (result) {
                $(result).each(function (index, item) {
                    $("#mediaPhoto").append("<!-- 显示作品图片信息的整体框 -->\n" +
                        "    <div class='dm-overall'>\n" +
                        "\n" +
                        "        <!-- 显示作品图片 -->\n" +
                        "        <div class='dm-overall-img'>\n" +
                        "            <input type='hidden' class='mediaId' name='mediaId' value='" + item.mediaId + "'>" +
                        "            <img class='dm-media-img' src='${Path}/file/showImgFileInformation?path=" + item.mediaUrl + "'>\n" +
                        "        </div>\n" +
                        "\n" +
                        "        <!-- 显示作品内容 -->\n" +
                        "        <div class='dm-overall-info'>\n" +
                        "            <!-- 作品名称 -->\n" +
                        "            <div class='dm-media-name'>\n" +
                        "                <span class='dm-media-name-style'>" + item.mediaName + "</span>\n" +
                        "                <input type='hidden' value='" + item.mediaUrl + "'>" +
                        "                <button class='dm-download-style'>下载</button>" +
                        "            </div>\n" +
                        "\n" +
                        "            <!-- 作品浏览次数和上传时间 -->\n" +
                        "            <div class='dm-media-time'>\n" +
                        "                <label class='font-size'>浏览次数：</label>\n" +
                        "                <span class='dm-media-time-style'>" + item.viewCount + "</span>\n" +
                        "                <label class='font-size'>上传时间：</label>\n" +
                        "                <span class='dm-media-time-style'>" + item.intervalDate + "</span>\n" +
                        "            </div>\n" +
                        "\n" +
                        "            <!-- 标签 -->\n" +
                        "            <div class='dm-media-label'>\n" +
                        "                <label class='font-size'>标签：</label>\n" +
                        "                <span class='dm-media-label-style'>" + item.mediaLabel + "</span>\n" +
                        "            </div>" +
                        "            <!-- 关键字 -->\n" +
                        "            <div class='dm-media-label'>\n" +
                        "                <label class='font-size'>关键字：</label>\n" +
                        "                <span class='dm-media-time-style'>" + item.mediaKeyword + "</span>\n" +
                        "            </div>\n" +
                        "        </div>\n" +
                        "    </div>");
                });
            });
        }

        // 加载标签列表
        function initMediaLabelList() {
            $.post("${Path}/label/getMediaClassLabel", function (result) {
                $.each(result, function (index, item) {
                    $("#findMediaLabel").append("<option value='" + item.labelName + "'>" + item.labelName + "</option>");
                    form.render("select");
                });
            });
        }

        // 加载作品详情信息
        function initWorkDetailInfo(mediaId) {
            $.post("${Path}/media/loadMediaInfoById?", {mediaId: mediaId}, function (media) {
                layer.open({
                    type: 1,
                    title: '详情页面',
                    content: $('#mediaInfoModel'),
                    area: ["780px", "450px"],
                    anim: 5,                 //动画效果
                    skin: "layui-layer-molv", //皮肤
                    closeBtn: 2,
                    success: function (index) {
                        $.post("${Path}/media/updateMediaViewCount?", {mediaId: mediaId}, function (data) {
                        });
                        // 加载图片
                        $("#showImgId").attr("src", "${Path}/file/showImgFileInformation?path=" + media.mediaUrl);
                        // 加载作品信息
                        $("#mediaName").html("名称：" + media.mediaName);
                        $("#mediaLabel").html("标签：" + media.mediaLabel);
                        $("#mediaKeyword").html("关键字：" + media.mediaKeyword);
                        $("#mediaInfo").html("摘要：" + media.mediaInfo);
                        $("#mediaTop").html("状态：" + (media.mediaTop === 1 ? '置顶' : '未置顶'))
                        $("#createUserName").html("上传者：" + media.createUserName);
                        $("#createTime").html("上传时间：" + media.createTime);
                    }
                });
            });
        }

        // 下载作品
        function downloadMedia(mediaUrl) {
            layer.confirm("是否下载该作品？", {
                icon: 3,
                title: "提示",
                skin: 'layui-layer-lan',
                btnAlign: 'c'
            }, function (index) {
                window.location.href = "${Path}/file/downloadFile?path=" + mediaUrl;
                layer.close(index);
            });
        }

    });
</script>

</body>
</html>