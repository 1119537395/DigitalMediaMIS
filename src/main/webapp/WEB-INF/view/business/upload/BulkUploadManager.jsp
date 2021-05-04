<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>作品批量上传</title>
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
<body class="childrenBody">

<!-- 多文件上传 -->
<div class="layui-upload">
    <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button>
    <div class="layui-upload-list">
        <table class="layui-table">
            <thead>
            <tr><th>文件名</th>
                <th>大小</th>
                <th>状态</th>
                <th>操作</th>
            </tr></thead>
            <tbody id="demoList"></tbody>
        </table>
    </div>
    <button type="button" class="layui-btn" id="testListAction">开始上传</button>
</div>
<!-- 数据表格 -->
<div style="margin-top: 15px">
<table class="layui-hide" id="tempTable" lay-filter="tempTable"></table>
</div>
<!--  数据表格行操作按钮  -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="input">录入</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>
<!--  作品上传信息录入模态框  -->
<div style="display: none" id="addAndEditModel">
    <form class="layui-form layui-form-pane layui-col-space10" id="inputMediaInfoFrame"
          lay-filter="inputMediaInfoFrame" style="margin: 10px">
        <blockquote class="layui-elem-quote">
            <i class="layui-icon layui-blue">&#xe609;</i>
            数字媒体作品上传信息录入
        </blockquote>

        <div class="layui-col-md12 layui-col-xs12">
            <div class="layui-row layui-col-space10">
                <div class="layui-col-md9 layui-col-xs7">
                    <div class="layui-form-item">
                        <label class="layui-form-label">名称</label>
                        <div class="layui-input-block">
                            <%--<input type="text" name="mediaId" id="mediaId" style="display: none">--%>
                            <input type="text" name="mediaName" class="layui-input" lay-verify="required"
                                   placeholder="请输入录入作品名称">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">标签</label>
                        <div class="layui-input-block">
                            <select name="mediaLabel" id="mediaLabel" lay-verify="required">
                                <option value="">请选择作品标签</option>
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


<script src="${Path}/static/layui/layui.js" charset="utf-8"></script>
<script>
    var tableIns;
    layui.use(['table', 'layer', 'form', 'jquery','upload'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var upload = layui.upload;

        // 渲染表格数据
        tableIns = table.render({
            elem: '#tempTable'
            , url: '${Path}/temp/loadTempInfo'
            , height: 'full-190'
            , cellMinWidth: 100
            , page: true
            , text: {
                none: "暂无相关数据"
            }
            , title: '临时数据表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'tempId', title: 'ID', align: "center"}
                , {field: 'mediaName', title: '原始文件名称', align: "center"}
                , {field: 'mediaUrl', title: '文件访问路径', align: "center"}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', align: "center"}
            ]]
        });

        //监听行工具删除和修改按钮事件
        table.on('tool(tempTable)', function (obj) {
            let tempData = obj.data;
            if (obj.event === 'delete') {
                layer.confirm('确定删除【' + tempData.mediaName + '】作品吗？', {
                    icon: 3,
                    title: "提示",
                    skin: 'layui-layer-molv',
                    btnAlign: 'c'
                }, function () {
                    $.post("${Path}/temp/deleteTempInfo?", {tempId: tempData.tempId}, function (value) {
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
            } else if (obj.event === 'input') {
                OpenUpdateModel(tempData);
            }
        });


        var maxIndex;
        var url;
        function OpenUpdateModel(tempData) {
            maxIndex = layer.open({
                type: 1,
                title: "数字媒体作品信息录入",
                content: $('#addAndEditModel'),
                area: ["980px", "510px"],
                anim: 5,
                skin: "layui-layer-molv",
                closeBtn: 2,
                success: function (index) {
                    // 初始化标签下拉框
                    initMediaLabel();
                    //给表单赋值
                    form.val("inputMediaInfoFrame", tempData);
                    //加载作品图片
                    $("#showImgId").attr("src", "${Path}/file/showImgFileInformation?path="+tempData.mediaUrl);
                    //设置隐藏输入框的值
                    $("#hiddenSrcURLId").val(tempData.mediaUrl);
                    url = "${Path}/media/inputMediaInfo";
                }
            });
        }

        form.on("submit(toEditAndAddSubmit)", function () {
            // 序列化表单数据
            var params = $("#inputMediaInfoFrame").serialize();
            $.post(url, params, function (value) {
                if (value.code === 200) {
                    layer.msg(value.msg,{
                        icon:6
                    });
                }
                //刷新表格
                tableIns.reload();
                //关闭弹出层窗口
                layer.close(maxIndex);

            });
        });

        // 获取标签数据
        function initMediaLabel() {
            $.post("${Path}/label/getMediaClassLabel",function (result) {
                $.each(result,function (index,item) {
                    $("#mediaLabel").append("<option value='" + item.labelName + "'>" + item.labelName + "</option>");
                    form.render("select");
                });
            });
        }


        //多文件列表上传
        var demoListView = $('#demoList')
            ,uploadListIns = upload.render({
            elem: '#testList'
            ,url:'${Path}/file/bulkUploadFile'
            ,field: 'mf'
            ,accept: 'file'
            ,multiple: true
            ,number: 5
            ,auto: false
            ,bindAction: '#testListAction'
            ,choose: function(obj){
                var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
                //读取本地文件
                obj.preview(function(index, file, result){
                    var tr = $(['<tr id="upload-'+ index +'">'
                        ,'<td>'+ file.name +'</td>'
                        ,'<td>'+ (file.size/1024).toFixed(1) +'kb</td>'
                        ,'<td>等待上传</td>'
                        ,'<td>'
                        ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
                        ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
                        ,'</td>'
                        ,'</tr>'].join(''));

                    //单个重传
                    tr.find('.demo-reload').on('click', function(){
                        obj.upload(index, file);
                    });

                    //删除
                    tr.find('.demo-delete').on('click', function(){
                        delete files[index]; //删除对应的文件
                        tr.remove();
                        uploadListIns.config.elem.next()[0].value = '';
                    });

                    demoListView.append(tr);
                });
            }
            ,done: function(res, index, upload){
                if(res.code === 200){ //上传成功
                    var tr = demoListView.find('tr#upload-'+ index)
                        ,tds = tr.children();
                    tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
                    tds.eq(3).html(''); //清空操作
                    tableIns.reload();  //刷新表格
                    return delete this.files[index]; //删除文件队列已经上传成功的文件
                }
                this.error(index, upload);
            }
            ,error: function(index, upload){
                var tr = demoListView.find('tr#upload-'+ index)
                    ,tds = tr.children();
                tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
            }
        });
    });

</script>

</body>
</html>
