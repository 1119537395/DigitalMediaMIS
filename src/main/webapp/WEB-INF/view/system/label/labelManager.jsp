<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>标签管理</title>
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
    <i class="layui-icon layui-purple">&#xe615;</i>
    查询条件
</blockquote>
<form class="layui-form layui-form-pane" method="post" id="searchFrom">
    <div class="layui-form-item">
        <div class="layui-inline">
            <div class="layui-input-inline">
                <input type="text" name="labelName" autocomplete="off" class="layui-input" placeholder="请输入需要搜索的标签名称">
            </div>
        </div>

        <div class="layui-inline">
            <div class="layui-input-label">
                <button type="button" class="layui-btn layui-icon layui-icon-search" id="doSearch">&nbsp;搜索</button>
                <button type="button" class="layui-btn layui-icon layui-btn-danger layui-icon-addition addLabel_Btn">
                    添加标签
                </button>
            </div>
        </div>
    </div>
</form>
<!-- 搜索条件结束 -->

<!-- 数据表格开始 -->
<table class="layui-hide" id="labelTable" lay-filter="labelTable"></table>
<!-- 数据表格内部操作按钮开始 -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>
<!-- 数据表格内部操作按钮结束 -->
<!-- 数据表格结束 -->

<!-- 添加和修改的弹出层开始 -->
<div style="display: none" id="addAndEditModel">

    <form class="layui-form" action="" lay-filter="addLabelForm" id="addLabelForm" style="margin: 20px">
        <blockquote class="layui-elem-quote">
            <i class="layui-icon layui-blue">&#xe609;</i>
            标签管理
        </blockquote>

        <div class="layui-form-item">
            <label class="layui-form-label">标签名称</label>
            <div class="layui-input-block">
                <input type="text" id="labelName" name="labelName" lay-verify="labelName" autocomplete="off" placeholder="请输入标签名称"
                       class="layui-input">
                <input type="text" value="" id="labelId" name="labelId" style="display: none">
            </div>
        </div>

        <div class="layui-form-item" align="center">
            <div class="layui-input-label">
                <button type="button" class="layui-btn layui-icon layui-icon-ok-circle" lay-submit=""
                        lay-filter="doAddSubmit" id="doAddSubmit">&nbsp;提交
                </button>
                <button type="reset" class="layui-btn layui-icon layui-btn-danger layui-icon-refresh">&nbsp;重置
                </button>
            </div>
        </div>
    </form>
</div>
<!-- 添加和修改的弹出层结束 -->


<script src="${Path}/static/layui/layui.js" charset="utf-8"></script>
<script>
    var tableIns;
    layui.use(['table', 'layer', 'form', 'jquery', 'laydate'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;

        // 渲染表格数据
        tableIns = table.render({
            elem: '#labelTable'
            , url: '${Path}/label/loadLabelDataInfo'
            , height: 'full-190'
            , toolbar: '#toolbarDemo'
            , cellMinWidth: 100
            , page: true
            , text: {
                none: "暂无相关数据"
            }
            , title: '标签数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'labelId', title: '标签ID', align: "center"}
                , {field: 'labelName', title: '名称', align: "center"}
                , {field: 'createName', title: '创建人', align: "center"}
                , {field: 'createTime', title: '创建时间',width: 200,align: "center"}
                , {field: 'modifyName', title: '修改人', align: "center"}
                , {field: 'modifyTime', title: '修改时间',width: 200,align: "center"}
                , {field: 'mediaCount', title: '作品数量', align: "center"}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', align: "center"}
            ]]
        });

        //给查询按钮添加单击事件
        $("#doSearch").click(function () {
            //获取表单提交的数据序列
            var parameter = $("#searchFrom").serialize();
            console.log(parameter);
            tableIns.reload({
                url: "${Path}/label/loadLabelDataInfo?" + parameter,
                page: {curr: 1}
            });
        });

        // 给添加标签按钮添加单击事件
        $(".addLabel_Btn").click(function () {
            OpenAddLabelModel();
        });

        //自定义验证规则
        form.verify({
            labelName: function (value) {
                if (value === "") {
                    return '标签名称不能空';
                }
            }
        });

        //监听行工具删除和修改按钮事件
        table.on('tool(labelTable)', function (obj) {
            let labelData = obj.data;
            if (obj.event === 'delete') {
                layer.confirm('确定删除【' + labelData.labelName + '】标签吗？', {
                    icon: 3,
                    title: "提示",
                    skin: 'layui-layer-molv',
                    btnAlign: 'c'
                }, function () {
                    $.post("${Path}/label/deleteLabelInfo?", {labelId: labelData.labelId}, function (value) {
                        if (value.code === 200) {
                            layer.msg(value.msg, {
                                icon: 6
                            });
                            tableIns.reload();
                        } else {
                            layer.msg(value.msg, {
                                icon: 5
                            });
                        }
                    });
                });
            } else if (obj.event === 'edit') {
                OpenUpdateModel(labelData);
            }
        });



        //打开添加用户信息模态框
        var maxIndex;
        var url;

        //添加标签信息模态框
        function OpenAddLabelModel() {
            maxIndex = layer.open({
                type: 1,
                title: "添加新标签",
                content: $('#addAndEditModel'),
                area: ["700px", "430px"],
                anim: 5,
                skin: "layui-layer-molv",
                closeBtn: 2,
                success: function (index) {
                    // 清空表单
                    $("#addLabelForm")[0].reset();
                    url = "${Path}/label/addLabelInfo";
                }
            });
        }

        //修改标签信息模态框
        function OpenUpdateModel(data) {
            maxIndex = layer.open({
                type: 1,
                title: "修改标签信息",
                content: $('#addAndEditModel'),
                area: ["700px", "430px"],
                anim: 5,
                skin: "layui-layer-molv",
                closeBtn: 2,
                success: function (index) {
                    //给表单赋值
                    form.val("addLabelForm", data);
                    $("#labelId").val(data.labelId);
                    url = "${Path}/label/updateLabelInfo";
                }
            });
        }

        //保存添加或修改的标签数据
        form.on('submit(doAddSubmit)', function () {
            let formData = new FormData();
            formData.append("labelName",$("#labelName").val());
            //序列化表单数据
            let params = $("#addLabelForm").serialize();
            $.ajax({
                url: "${Path}/label/checkLabelName",
                type: 'post',
                cache: false,
                data: formData,
                processData: false,
                contentType: false,
                dataType: "json",
                success: function (result) {
                    console.log(result.code);
                    if (result.code == '404'){
                        layer.msg("该标签名称已经存在", {
                            icon: 5
                        });
                    }else {
                        $.post(url, params, function (obj) {
                            //弹出成功或失败的提示信息
                            layer.msg(obj.msg, {
                                icon: 6
                            });
                            //关闭弹出层
                            layer.close(maxIndex);
                            //刷新表格
                            tableIns.reload();
                        });
                    }
                }
            });
        });

    });

</script>

</body>
</html>
