<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>作品单次上传</title>
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
<form class="layui-form layui-row layui-col-space10" action="" lay-filter="addMediaFrame" id="addMediaFrame">
    <div class="layui-col-md9 layui-col-xs12">
        <div class="layui-row layui-col-space10">
            <div class="layui-col-md9 layui-col-xs7">
                <div class="layui-form-item magt3">
                    <label class="layui-form-label">作品名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="mediaName" class="layui-input" lay-verify="required" placeholder="请输入上传的作品名称">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">关键字</label>
                    <div class="layui-input-block">
                        <textarea name="mediaKeyword" lay-verify="required" placeholder="请输入作品的关键字" class="layui-textarea"></textarea>
                    </div>
                </div>
            </div>
            <div class="layui-col-md3 layui-col-xs5">
                <div class="layui-upload-list thumbBox mag0 magt3" id="uploadImgId">
                    <img class="layui-upload-img thumbImg" id="showImgId">
                    <input type="hidden" name="mediaUrl" id="hiddenUrl">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">内容摘要</label>
            <div class="layui-input-block">
                <textarea name="mediaInfo" lay-verify="required" placeholder="请输入作品的内容描述" class="layui-textarea" style="height: 310px"></textarea>
            </div>
        </div>
    </div>
    <div class="layui-col-md3 layui-col-xs12">
        <blockquote class="layui-elem-quote title"><i class="seraph icon-caidan"></i> 分类标签</blockquote>
        <div class="border category">
            <div class="" id="mediaLabel">
            </div>
        </div>
        <blockquote class="layui-elem-quote title magt10"><i class="layui-icon">&#xe609;</i> 发布</blockquote>
        <div class="border">
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="seraph icon-look"></i> 公开度</label>
                <div class="layui-input-block">
                    <input type="radio" name="mediaState" value="1" title="开放浏览" lay-skin="primary" checked />
                    <input type="radio" name="mediaState" value="0" title="私密浏览" lay-skin="primary" />
                </div>
            </div>
            <div class="layui-form-item newsTop">
                <label class="layui-form-label"><i class="seraph icon-zhiding"></i> 置　顶</label>
                <div class="layui-input-block">
                    <input type="radio" name="mediaTop" value="1" title="是" lay-skin="primary"  />
                    <input type="radio" name="mediaTop" value="0" title="否" lay-skin="primary" checked/>
                </div>
            </div>
            <hr class="layui-bg-gray" />
            <div class="layui-left">
                <a class="layui-btn layui-btn-sm" lay-filter="addMediaInfo" lay-submit="" id="addMediaInfo"><i class="layui-icon">&#xe609;</i>上传</a>
            </div>
        </div>
    </div>
</form>


<script src="${Path}/static/layui/layui.js" charset="utf-8"></script>
<script>
    var tableIns;
    layui.use(['table', 'layer', 'form', 'jquery','upload'], function () {
        var $ = layui.jquery;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var upload = layui.upload;
        
        // 默认加载
        getMediaClassLabel();

        form.on('submit(addMediaInfo)', function () {
            //序列化表单数据
            let params = $("#addMediaFrame").serialize();
            $.post("${Path}/media/addMediaInfo",params,function (result) {
                layer.msg(result.msg, {
                    icon: 6,
                });
                if (result.code === 200){
                    // 延迟刷新
                    setTimeout(function(){
                        location.reload(true);
                    },2000);
                }
            });
        });
        

        // 动态获取分类标签
        function getMediaClassLabel() {
            // 获取上传的默认图片
            //加载默认图片
            // $("#showImgId").attr("src", "${Path}/file/showImgFileInformation?path=images/defaultPicture.jpg");
            $("#hiddenUrl").val("images/defaultPicture.jpg");
            $.post("${Path}/label/getMediaClassLabel",function (result) {
                console.log(result);
                $.each(result,function (index, item) {
                    $("#mediaLabel").append("<p><input type='radio' name='mediaLabel' value='"+item.labelName+"' title='"+item.labelName+"' lay-skin='primary' checked /></p>");
                    form.render();
                });
            });
        }

        // 初始化图片上传功能
        upload.render({
            elem: '#uploadImgId',
            url: '${Path}/file/uploadFile',
            field: 'mf',
            acceptMime: 'image/*',
            method: "post",
            done: function (res, index, upload) {
                $('#showImgId').attr('src', "${Path}/file/showImgFileInformation?path=" + res.data.src);
                $("#hiddenUrl").val(res.data.src);
                $('#uploadImgId').css("background", "#fff");
            }
        });
        
    });

</script>

</body>
</html>
