<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>数字媒体作品管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${Path}/static/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="${Path}/static/css/public.css" media="all"/>
</head>
<body style="margin: 10px">

<!-- 搜索条件开始 -->
<blockquote class="layui-elem-quote">
    <i class="layui-icon layui-red">&#xe615;</i>
    查询条件
</blockquote>
<form class="layui-form layui-form-pane" method="post" id="searchFrom">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">名称</label>
            <div class="layui-input-inline">
                <input type="text" name="mediaName" autocomplete="on" class="layui-input" placeholder="请输入查询的作品名称">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">标签</label>
            <div class="layui-input-inline">
                <select name="mediaLabel" id="findMediaLabel">
                    <option value="">请选择查询的标签</option>
                </select>
            </div>
        </div>

        <div class="layui-inline">
            <div class="layui-input-label">
                <button type="button" class="layui-btn layui-icon layui-icon-search" id="doSearch">&nbsp;查询</button>
                <button type="reset" class="layui-btn layui-icon layui-btn-danger layui-icon-refresh">&nbsp;重置</button>
            </div>
        </div>
    </div>
</form>
<!-- 搜索条件结束 -->


<!-- 数据表格开始 -->
<table class="layui-hide" id="mediaTable" lay-filter="mediaTable"></table>

<!-- 数据表格内部操作按钮开始 -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="View">浏览</a>
</script>
<!-- 数据表格内部操作按钮结束 -->


<!-- 表格内嵌效果开始 -->
<script type="text/html" id="switchTpl1">
    <input type="checkbox" name="mediaTop" value="{{d.mediaTop}}" lay-filter="SetTop" lay-skin="switch" lay-text="是|否"
           {{ d.mediaTop==1?'checked':''}}>
</script>
<script type="text/html" id="switchTpl2">
    <input type="checkbox" name="mediaState" value="{{d.mediaState}}" lay-filter="SetState" lay-skin="switch"
           lay-text="开放|私密" {{
           d.mediaState==1?'checked':''}}>
</script>
<!-- 表格内嵌效果开始 -->


<!--  修改模态框  -->
<div style="display: none" id="addAndEditModel">
    <form class="layui-form layui-form-pane layui-col-space10" id="inputMediaInfoFrame"
          lay-filter="inputMediaInfoFrame" style="margin: 10px">
        <blockquote class="layui-elem-quote">
            <i class="layui-icon layui-blue">&#xe609;</i>
            数字媒体作品信息修改
        </blockquote>

        <div class="layui-col-md12 layui-col-xs12">
            <div class="layui-row layui-col-space10">
                <div class="layui-col-md9 layui-col-xs7">
                    <div class="layui-form-item">
                        <label class="layui-form-label">名称</label>
                        <div class="layui-input-block">
                            <input type="text" name="mediaId" id="mediaId" style="display: none">
                            <input type="text" name="mediaName" class="layui-input" lay-verify="required"
                                   placeholder="请输入录入作品名称">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">标签</label>
                        <div class="layui-input-block">
                            <select name="mediaLabel" id="mediaLabel" lay-verify="required">
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">公开度</label>
                        <div class="layui-input-block">
                            <select name="mediaState">
                                <option value="">请选择作品公开度</option>
                                <option value="1">开放浏览</option>
                                <option value="0">私密浏览</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="layui-col-md3 layui-col-xs5">
                    <div class="layui-upload-list thumbBox mag0 magt3" id="uploadImgId">
                        <img class="layui-upload-img thumbImg" id="showImgId">
                        <input type="hidden" name="mediaUrl" id="hiddenSrcURLId" value="">
                    </div>
                </div>

            </div>

            <div class="layui-form-item magb2">
                <label class="layui-form-label">置顶</label>
                <div class="layui-input-block">
                    <select name="mediaTop">
                        <option value="">请选择作品是否置顶</option>
                        <option value="1">是</option>
                        <option value="0">否</option>
                    </select>
                </div>
            </div>


            <div class="layui-form-item magb2">
                <label class="layui-form-label">关键字</label>
                <div class="layui-input-block">
                    <input type="text" name="mediaKeyword" class="layui-input" lay-verify="required"
                           placeholder="请输入作品关键字">
                </div>
            </div>

            <div class="layui-form-item magb2">
                <label class="layui-form-label">内容摘要</label>
                <div class="layui-input-block">
                    <input type="text" name="mediaInfo" class="layui-input" lay-verify="required"
                           placeholder="请输入作品的内容描述">
                </div>
            </div>


            <div class="layui-form-item" align="center">
                <div class="layui-input-label">
                    <button type="button" class="layui-btn layui-icon layui-icon-ok-circle  layui-btn-radius"
                            lay-submit="" lay-filter="toEditAndAddSubmit" id="toEditAndAddSubmit">&nbsp;提交
                    </button>
                    <button type="reset"
                            class="layui-btn layui-icon layui-btn-danger layui-icon-refresh layui-btn-radius">&nbsp;重置
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>


<!-- 查看大图弹出层开始 -->
<div style="display: none" id="viewLargerImage">
    <img alt="作品详情图" width="300" height="300" id="viewImage">
</div>
<!-- 查看大图弹出层结束 -->


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
        initMediaLabel1();


        // 渲染表格数据
        tableIns = table.render({
            elem: '#mediaTable'
            , url: '${Path}/media/loadMediaInfo'
            , height: 'full-145'
            , cellMinWidth: 100
            , page: true
            , text: {
                none: "暂无相关数据"
            }
            , title: '鲜花数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'mediaId', title: 'ID', align: "center"}
                , {field: 'mediaName', title: '名称', align: "center"}
                , {field: 'mediaLabel', title: '标签', align: "center"}
                , {field: 'mediaKeyword', title: '关键字', align: "center"}
                , {field: 'mediaInfo', title: '摘要', align: "center"}
                , {field: 'mediaTop', title: '是否置顶', align: "center", width: 105, templet: "#switchTpl1"}
                , {field: 'mediaState', title: '公开度', align: "center", width: 105, templet: "#switchTpl2"}
                , {
                    field: 'mediaUrl', title: '缩略图', align: "center", templet: function (data) {
                        return "<img width=40 height=30 src=${Path}/file/showImgFileInformation?path=" + data.mediaUrl + "/>";
                    }
                }
                , {field: 'viewCount', title: '浏览次数', align: "center"}
                , {field: 'createUserName', title: '创建人', align: "center"}
                , {field: 'createTime', title: '创建时间', align: "center"}
                , {field: 'modifyUserName', title: '修改人', align: "center"}
                , {field: 'modifyTime', title: '修改时间', align: "center"}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 180, align: "center"}
            ]]
        });

        //给查询按钮添加单击事件
        $("#doSearch").click(function () {
            // 获取表单提交的数据序列
            var parameter = $("#searchFrom").serialize();
            // 发送请求查询数据
            tableIns.reload({
                url: "${Path}/media/loadMediaInfo?" + parameter,
                page: {curr: 1}
            });
        });


        //监听行工具删除和修改和浏览按钮事件
        table.on('tool(mediaTable)', function (obj) {
            var mediaData = obj.data;  //获取到单击行的数据
            var layEvent = obj.event;
            if (layEvent === 'delete') {
                deleteMediaInfo(mediaData);
            } else if (layEvent === 'edit') {
                OpenUpdateModel(mediaData);
            } else if (layEvent === 'View') {
                OpenViewModel(mediaData);
            }
        });


        // 删除
        function deleteMediaInfo(mediaData) {
            layer.confirm('确定删除【' + mediaData.mediaName + '】的信息？', {
                icon: 3,
                title: "提示",
                skin: 'layui-layer-molv',
                btnAlign: 'c'
            }, function () {
                $.post("${Path}/media/deleteMediaInfo?", {mediaId: mediaData.mediaId}, function (returnValue) {
                    if (returnValue.code === 200) {
                        layer.msg(returnValue.msg, {
                            icon: 6
                        });
                        //刷新表格
                        tableIns.reload();
                    } else {
                        layer.msg(returnValue.msg, {
                            icon: 5
                        });
                    }
                });
            });
        }

        var maxIndex;
        var url;

        function OpenUpdateModel(mediaData) {
            maxIndex = layer.open({
                type: 1,
                title: "修改作品信息",
                content: $('#addAndEditModel'),
                area: ["980px", "510px"],
                anim: 5,                 //动画效果
                skin: "layui-layer-molv", //皮肤
                closeBtn: 2,
                success: function (index) {
                    // 初始化标签下拉框
                    $("#mediaLabel").empty();
                    initMediaLabel2(mediaData);
                    //给表单赋值
                    form.val("inputMediaInfoFrame", mediaData);
                    $("#mediaId").val(mediaData.mediaId);
                    //加载图片
                    $("#showImgId").attr("src", "${Path}/file/showImgFileInformation?path=" + mediaData.mediaUrl);
                    url = "${Path}/media/updateMediaInfo";
                }
            });
        }

        form.on('submit(toEditAndAddSubmit)', function () {
            //序列化表单数据
            var params = $("#inputMediaInfoFrame").serialize();
            $.post(url, params, function (obj) {
                //弹出成功或失败的提示信息
                layer.msg(obj.msg, {
                    icon: 6
                });
                //刷新表格
                tableIns.reload();
                //关闭弹出层
                layer.close(maxIndex);
            });
        });


        form.on('switch(SetState)', function (data) {
            var tipText;
            if (data.elem.checked) {
                tipText = "确定将该作品改为开放浏览？";
            } else {
                tipText = "确定将该作品改为私密浏览？";
            }
            layer.confirm(tipText, {
                icon: 3,
                title: '系统提示',
                cancel: function (index) {
                    data.elem.checked = !data.elem.checked;
                    form.render();
                    layer.close(index);
                }
            }, function (index) {
                var id = data.othis.parents('tr').find("td:eq(1)").text();
                var state = data.elem.checked ? 1 : 0;

                var formData = new FormData();
                formData.append("mediaId", id);
                formData.append("mediaState", state);
                $.ajax({
                    url: "${Path}/media/updateMediaInfo",
                    type: 'POST',
                    data: formData,
                    async: true,
                    cache: false,
                    processData: false,
                    contentType: false,
                    dataType: "json",
                    success: function (data) {
                    }
                });
                layer.close(index);
            }, function (index) {
                data.elem.checked = !data.elem.checked;
                form.render();
                layer.close(index);
            });
        });

        form.on('switch(SetTop)', function(data){
            var id = data.othis.parents('tr').find("td:eq(1)").text();
            var state = data.elem.checked ? 1 : 0;
            var index = layer.msg('修改中，请稍候',{icon: 16,time:false,shade:0.8});
            setTimeout(function(){
                layer.close(index);
                if(data.elem.checked){
                    layer.msg("置顶成功！");
                }else{
                    layer.msg("取消置顶成功！");
                }
            },500);
            var formData = new FormData();
            formData.append("mediaId", id);
            formData.append("mediaTop", state);
            $.ajax({
                url: "${Path}/media/updateMediaInfo",
                type: 'POST',
                data: formData,
                async: true,
                cache: false,
                processData: false,
                contentType: false,
                dataType: "json",
                success: function (data) {
                }
            });
        });

        // 获取搜索框的标签
        function initMediaLabel1() {
            $.post("${Path}/label/getMediaClassLabel", function (result) {
                $.each(result, function (index, item) {
                    $("#findMediaLabel").append("<option value='" + item.labelName + "'>" + item.labelName + "</option>");
                    layui.form.render("select");
                });
            });
        }

        // 获取修改模态框的标签
        function initMediaLabel2(mediaData) {
            $.post("${Path}/label/getMediaClassLabel", function (result) {
                $.each(result, function (index, item) {
                    $("#mediaLabel").append("<option value='" + item.labelName + "'>" + item.labelName + "</option>");
                    layui.form.render("select");
                });
                $("#mediaLabel").val(mediaData.mediaLabel);
                layui.form.render("select");
            });
        }

        //点击查看大图
        function OpenViewModel(mediaData) {
            maxIndex = layer.open({
                type: 1,
                title: "【" + mediaData.mediaName + "】大图",
                content: $('#viewLargerImage'),
                area: ["300px", "343px"],
                anim: 5,                 //动画效果
                skin: "layui-layer-lan", //皮肤
                closeBtn: 2,
                success: function (index) {
                    $("#viewImage").attr("src", "${Path}/file/showImgFileInformation?path=" + mediaData.mediaUrl);
                }
            });
        }


        //初始化上传图片功能
        upload.render({
            elem: '#uploadImgId',
            url: '${Path}/file/uploadFile',
            field: 'mf',
            acceptMime: 'image/*',
            method: "post",
            done: function (res, index, upload) {
                $('#showImgId').attr('src', "${Path}/file/showImgFileInformation?path=" + res.data.src);
                $("#hiddenSrcURLId").val(res.data.src);
                $('#uploadImgId').css("background", "#fff");
            }
        });
    });

</script>

</body>
</html>