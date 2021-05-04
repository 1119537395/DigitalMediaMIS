<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>公告管理页面</title>
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
            <label class="layui-form-label">公告标题</label>
            <div class="layui-input-inline">
                <input type="text" name="title" autocomplete="off" class="layui-input" placeholder="请输入查询的标题名称">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">公告内容</label>
            <div class="layui-input-inline">
                <input type="text" name="content" autocomplete="off" class="layui-input" placeholder="请输入查询的内容">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">开始时间</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" name="startTime" id="startTime" readonly="readonly"
                       placeholder="请输入开始时间">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">结束时间</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" name="endTime" id="endTime" readonly="readonly"
                       placeholder="请输入结束时间">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <div class="layui-input-label">
                <button type="button" class="layui-btn layui-btn-sm layui-icon layui-icon-search" id="doSearch">
                    &nbsp;查询
                </button>
                <button type="reset" class="layui-btn layui-btn-sm layui-icon layui-btn-danger layui-icon-refresh">
                    &nbsp;重置
                </button>
            </div>
        </div>
    </div>
</form>
<!-- 搜索条件结束 -->


<!-- 数据表格开始 -->
<table class="layui-hide" id="newsTable" lay-filter="newsTable"></table>

<!-- 数据表格上方工具栏按钮 -->
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-containe">
        <button class="layui-btn layui-btn-normal layui-btn-sm" lay-event="addNewsDataBtn">发布公告</button>
        <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="deleteNewsDataBtn">批量删除</button>
    </div>
</script>

<!-- 数据表格内部操作按钮 -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="view">查看</a>
</script>

<!-- 数据表格结束 -->

<!-- 添加和修改的弹出层开始 -->
<div style="display: none" id="addAndEditModel">
    <form class="layui-form layui-form" action="" lay-filter="addAndEditFrame" id="addAndEditFrame"
          style="margin: 10px">
        <blockquote class="layui-elem-quote">
            <i class="layui-icon layui-blue">&#xe609;</i>
            公告内容管理
        </blockquote>

        <div class="layui-form-item">
            <label class="layui-form-label">公告标题：</label>
            <div class="layui-input-block">
                <%-- 隐藏的公告id --%>
                <input type="hidden" name="id" id="newsId">
                <input type="text" name="title" id="titleId" lay-verify="required" autocomplete="off"
                       placeholder="请输入公告名称" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">公告内容：</label>
            <div class="layui-input-block">
                <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="content"></textarea>
            </div>
        </div>

        <div class="layui-form-item" align="center">
            <div class="layui-input-label">
                <button type="button" class="layui-btn layui-icon layui-icon-ok-circle  layui-btn-radius" lay-submit=""
                        lay-filter="doAddSubmit" id="doAddSubmit">&nbsp;提交
                </button>
                <button type="reset"
                        class="layui-btn layui-icon layui-btn-danger layui-icon-refresh   layui-btn-radius">&nbsp;重置
                </button>
            </div>
        </div>
    </form>
</div>
<!-- 添加和修改的弹出层结束 -->

<!-- 查看公告内容的弹出层开始 -->
<div style="display: none;margin: 10px" id="viewNewsModel">
    <blockquote class="layui-elem-quote">
        <%--<i class="layui-icon layui-purple">&#xe609;</i>--%>
        <i class="layui-icon layui-blue">&#xe705;</i>&nbsp;标题：
        <span id="viewTitle" style="text-align: center"></span>
    </blockquote>
    <div class="layui-row">

        <div class="layui-col-md4">
            <div class="grid-demo grid-demo-bg1">
                <i class="layui-icon layui-blue">&#xe66f;</i>&nbsp;发布作者：
                <span id="viewCreateName"></span>
            </div>
        </div>

        <div class="layui-col-md2">
            <div class="grid-demo">&nbsp;</div>
        </div>

        <div class="layui-col-md6">
            <div class="grid-demo">
                <i class="layui-icon layui-blue">&#xe637;</i>&nbsp;创建时间：
                <span id="viewCreateTime"></span>
            </div>
        </div>

        <div class="layui-row">
            <div class="layui-col-md4" style="margin-top: 5px">
                <i class="layui-icon layui-blue">&#xe645;</i>&nbsp;公告内容：
            </div>
            <div class="layui-col-md8" style="background-color:#FFFFFF ">
                <div class="grid-demo">&nbsp;</div>
            </div>
        </div>

        <div class="layui-row">
            <div class="layui-col-md12 border" style="background-color:#FFFFFF;height: 320px; margin-top: 5px">
                <div id="viewContent"></div>
            </div>
        </div>

    </div>
</div>
<!-- 查看公告内容的弹出层结束 -->

<script src="${Path}/static/layui/layui.js" charset="utf-8"></script>
<script>
    var tableIns;
    layui.use(['table', 'layer', 'form', 'jquery', 'laydate', 'layedit'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;
        var layedit = layui.layedit;
        var editIndex;        // 建立编辑器
        var maxIndex;
        var url;              // 请求的url

        // 渲染表格数据
        tableIns = table.render({
            elem: '#newsTable'
            , url: '${Path}/news/queryNewsByAll'
            , toolbar: '#toolbarDemo'
            , height: 'full-175'
            , cellMinWidth: 100
            , page: true
            , method: 'post'
            , text: {
                none: "暂无相关数据"
            }
            , title: '公告数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', fixed: 'left', unresize: true, sort: true, align: "center"}
                , {field: 'title', title: '公告标题', align: "center"}
                , {field: 'createTime', title: '创建时间', align: "center", templet: '#checkboxTpl'}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', align: "center"}
            ]]
        });

        // 查询功能
        $("#doSearch").click(function () {
            // 获取表单提交的数据
            let parameter = $("#searchFrom").serialize();
            // 重新加载表格
            tableIns.reload({
                url: "${Path}/news/queryNewsByAll?" + parameter,
                page: {curr: 1}
            });
        });

        // 监听表格头部的添加和删除按钮
        table.on('toolbar(newsTable)', function (obj) {
            switch (obj.event) {
                case 'addNewsDataBtn':
                    OpenAddNewsModel();
                    break;
                case 'deleteNewsDataBtn':
                    deleteBatchData(obj);
            }
            ;
        });

        // 监听表格行内的删除和修改和查看按钮
        table.on('tool(newsTable)', function (obj) {
            //获取到单击行的数据
            var data = obj.data;
            if (obj.event === 'delete') {
                layer.confirm('确定删除标题为【' + data.title + '】的公告吗？', {
                    icon: 3,
                    title: "提示",
                    skin: 'layui-layer-molv',
                    btnAlign: 'c'
                }, function () {
                    $.post("${Path}/news/deleteNewsById?", {id: data.id}, function (value) {
                        if (value.code == 200) {
                            layer.msg(value.msg, {
                                icon: 6
                            });
                            //刷新表格
                            tableIns.reload();
                        } else {
                            layer.msg(value.msg, {
                                icon: 5
                            });
                        }
                    });
                });
            } else if (obj.event === 'edit') {
                OpenUpdateModel(data);
            } else if (obj.event === 'view') {
                openViewModel(data);
            }
        });


        //查看公告信息的模态框
        function openViewModel(data) {
            maxIndex = layer.open({
                type: 1,
                title: "查看公告详情",
                content: $('#viewNewsModel'),
                area: ["700px", "520px"],
                skin: "layui-layer-molv",
                closeBtn: 2,
                success: function (index) {
                    $("#viewTitle").html(data.title);
                    $("#viewCreateName").html(data.operName);
                    $("#viewCreateTime").html(data.createTime);
                    $("#viewContent").html(data.content);
                }
            });
        }


        //发布公告信息模态框
        function OpenAddNewsModel() {
            maxIndex = layer.open({
                type: 1,
                title: "发布公告",
                content: $('#addAndEditModel'),
                area: ["700px", "562px"],
                skin: "layui-layer-molv",
                closeBtn: 2,
                success: function (index) {
                    // 给编辑器对象赋值
                    editIndex = layedit.build('content');
                    // 清空表单
                    $("#addAndEditFrame")[0].reset();
                    // 设置编辑器
                    layedit.setContent(editIndex, "", false);
                    url = "${Path}/news/addNewsData";
                }
            });
        }

        // 打开修改公告信息模态框
        function OpenUpdateModel(data) {
            maxIndex = layer.open({
                type: 1,
                title: "修改公告信息",
                content: $('#addAndEditModel'),
                area: ["700px", "562px"],
                skin: "layui-layer-molv", //皮肤
                closeBtn: 2,
                success: function (index) {
                    editIndex = layedit.build('content');
                    //给表单赋值
                    //form.val("addAndEditFrame",data);
                    layedit.setContent(editIndex, data.content, false);
                    $("#newsId").val(data.id);
                    $("#titleId").val(data.title);
                    url = "${Path}/news/updateNewsData";
                }
            });
        }

        // 保存添加或修改的公告数据
        form.on('submit(doAddSubmit)', function () {
            layedit.sync(editIndex);
            // 序列化表单数据
            var params = $("#addAndEditFrame").serialize();
            $.post(url, params, function (obj) {
                if (obj.code == 200) {
                    layer.msg(obj.msg, {
                        icon: 6
                    });
                }else {
                    layer.msg(obj.msg, {
                        icon: 5
                    });
                }
                //关闭弹出层
                layer.close(maxIndex);
                //刷新表格
                tableIns.reload();
            });
        });

        // 批量删除表格数据
        function deleteBatchData(obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            var data = checkStatus.data;
            var params = "";
            var newsName = "";

            if (data.length != 0) {
                $.each(data, function (i, item) {
                    if (i == 0) {
                        params += "ids=" + item.id;
                        newsName += item.title;
                    } else {
                        params += "&ids=" + item.id;
                        newsName += "，" + item.title;
                    }
                });
            }
            //判断在单击批量删除按钮之前是否有数据被选中
            if (newsName != "") {
                layer.confirm("确定删除标题为【" + newsName + "】这些公告吗?", {
                    icon: 3,
                    title: "提示",
                    skin: 'layui-layer-molv',
                    btnAlign: 'c'
                }, function (index) {
                    $.post("${Path}/news/deleteBatchNewsData", params, function (value) {
                        if (value.code == 200) {
                            layer.msg(value.msg, {
                                icon: 6
                            });
                            //刷新数据表格
                            tableIns.reload();
                        } else {
                            layer.msg(value.msg, {
                                icon: 5
                            });
                        }
                    });
                });
            } else {
                layer.msg("请先选中需要删除的公告！", {
                    icon: 5,
                    anim: 6
                });
            }

        }

        // 开始时间
        laydate.render({
            elem: '#startTime'
            , type: 'datetime'
        });

        // 结束时间
        laydate.render({
            elem: '#endTime'
            , type: 'datetime'
        });
    });

</script>

</body>
</html>