<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>工作台页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${Path}/static/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${Path}/static/css/public.css" media="all" />
</head>
<body class="childrenBody">

<blockquote class="layui-elem-quote layui-bg-green">
    <div id="nowTime"></div>
</blockquote>

<div class="layui-col-md6">
    <blockquote class="layui-elem-quote"><i class="layui-icon layui-red">&#xe756;</i> 系统公告</blockquote>
    <table class="layui-table mag0" lay-skin="line">
        <colgroup>
            <col>
            <col width="110">
        </colgroup>
        <tbody class="hot_news"></tbody>
    </table>
</div>

<!-- 查看公告内容的弹出层开始 -->
<div style="display: none;margin: 10px"  id="indexViewNewsModel">
    <blockquote class="layui-elem-quote">
        <%--<i class="layui-icon layui-purple">&#xe609;</i>--%>
        <i class="layui-icon layui-blue">&#xe705;</i>&nbsp;标题：
        <span id="viewTitle" style="text-align: center"></span>
    </blockquote>

    <!-- 第一行 -->
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

    </div>

    <!-- 第二行 -->
    <div class="layui-row">
        <div class="layui-col-md4" style="margin-top: 10px">
            <i class="layui-icon layui-blue">&#xe645;</i>&nbsp;公告内容：
        </div>
    </div>

    <!-- 第三行 -->
    <div class="layui-row" >
        <div class="layui-col-md12" style="background-color:#f2f2f2;height:320px;margin-top:10px;padding: 10px">
            <div id="viewContent"></div>
        </div>
    </div>

</div>
<!-- 查看公告内容的弹出层结束 -->


<script type="text/javascript" src="${Path}/static/layui/layui.js"></script>
<script type="text/javascript">
    //获取系统时间
    var newDate = '';
    getLangDate();
    //值小于10时，在前面补0
    function dateFilter(date){
        if(date < 10){return "0"+date;}
        return date;
    }
    function getLangDate(){
        var dateObj = new Date(); //表示当前系统时间的Date对象
        var year = dateObj.getFullYear(); //当前系统时间的完整年份值
        var month = dateObj.getMonth()+1; //当前系统时间的月份值
        var date = dateObj.getDate(); //当前系统时间的月份中的日
        var day = dateObj.getDay(); //当前系统时间中的星期值
        var weeks = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
        var week = weeks[day]; //根据星期值，从数组中获取对应的星期字符串
        var hour = dateObj.getHours(); //当前系统时间的小时值
        var minute = dateObj.getMinutes(); //当前系统时间的分钟值
        var second = dateObj.getSeconds(); //当前系统时间的秒钟值
        var timeValue = "" +((hour >= 12) ? (hour >= 18) ? "晚上" : "下午" : "上午" );
        newDate = dateFilter(year)+"年"+dateFilter(month)+"月"+dateFilter(date)+"日 "+" "+dateFilter(hour)+":"+dateFilter(minute)+":"+dateFilter(second);
        document.getElementById("nowTime").innerHTML = "亲爱的${user.userName}，"+timeValue+"好！ 欢迎登陆数字媒体管理系统，当前时间为： "+newDate+"　"+week;
        setTimeout("getLangDate()",1000);
    }

    layui.use(['form','element','layer','jquery'],function(){
        var form = layui.form,
            layer = parent.layer === undefined ? layui.layer : top.layer,
            element = layui.element;
            $ = layui.jquery;

        //最新公告列表
        $.get("${Path}/news/queryNewsByAll?page=1&limit=10",function(data){
            var hotNewsHtml = '';
            for(var i=0; i< data.data.length;i++){
                    hotNewsHtml += '<tr ondblclick=showNews('+data.data[i].id+')>'
                    +'<td align="left"><a href="javascript:;"> '+data.data[i].title+'</a></td>'
                    +'<td>'+data.data[i].createTime.substring(0,10)+'</td>'
                    +'</tr>';
            }
            $(".hot_news").html(hotNewsHtml);
            $(".userAll span").text(data.length);
        });
    });

    //查看最新公告
    function showNews(id) {
        $.get("${Path}/news/queryNewsById",{id:id},function(news) {
            layer.open({
                type:1,
                title:"查看公告内容",
                content:$('#indexViewNewsModel'),
                area:["700px","520px"],
                anim:4,
                skin:"layui-layer-molv",
                closeBtn:2,
                success:function (index) {
                    $("#viewTitle").html(news.title);
                    $("#viewCreateName").html(news.operName);
                    $("#viewCreateTime").html(news.createTime);
                    $("#viewContent").html(news.content);
                }
            });
        });
    }

</script>
</body>
</html>
