<%@ page import="cn.cug.laboratory.model.persistent.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <link rel="stylesheet" href="${cacheUrl}/assets/applyproject/css/style.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <%--<script src="${cacheUrl}/assets/applyproject/fileup/ajaxfileupload.js" type="text/javascript"></script>--%>

    <%--<link href="${cacheUrl}/assets/applyproject/fileup/bootstrap.min.css" rel="stylesheet">--%>
    <%--<link rel="stylesheet" type="text/css" href="${cacheUrl}/assets/applyproject/fileup/default.css">--%>
    <%--<link href="${cacheUrl}/assets/applyproject/fileup/fileinput.css" media="all" rel="stylesheet" type="text/css">--%>
    <!--[if IE]>
    <!--<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>-->
    <![endif]-->
    <script>
        window.onload = function(){
            alert("初始化");
            $("#input_lab_name").value=${sessionScope.applyprojectinfo.labId};
            $("#input_lab_theme").value=${sessionScope.applyprojectinfo.name};
            $("#lab_capacity").value=${sessionScope.applyprojectinfo.capacity};
            $("#lab_score").value=${sessionScope.applyprojectinfo.capacity};
            $("#lab_start_time").value=${sessionScope.applyprojectinfo.capacity};
            $("#lab_end_time").value=${sessionScope.applyprojectinfo.capacity};
            $('#decp').value=${sessionScope.applyprojectinfo.capacity};

            var cf_table=$(".cf_device_list");
            console.log(cf_table);
            <c:forEach items="${devicelist}" var="items">

            </c:forEach>
        }
    </script>
</head>
<body>
<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
        <!--面板-->
        <div class="panel panel-info">
            <div class="panel-heading">试验申请信息填写</div>
            <div class="panel-body row">
                <div class="col-md-6">
                    <div class="input-group" id="chose_lab">
                        <span class="input-group-addon" style="padding:0;border:0;">
                             <button style="background-color: #ededed" type="button"
                                     class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                     aria-expanded="false">实验室<span class="caret"></span></button>
                            <ul class="dropdown-menu dropdown-menu-left">
                                <c:forEach items="${lablist}" varStatus="i" var="item">
                                    <li><a href="#">${item.name}</a></li>
                                </c:forEach>
                            </ul></span>
                        <input id="input_lab_name" type="text" class="form-control" placeholder="Username"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="input-group">
                        <span style="background-color: #ededed" class="input-group-addon">输入实验主题</span>
                        <input type="text" id="input_lab_theme" class="form-control" placeholder="实验主题"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
            </div>
            <div class="panel-body row">
                <div class="col-md-6">
                    <div class="input-group">
                        <span style="background-color: #ededed" class="input-group-addon">学分</span>
                        <input type="text" id="lab_score" class="form-control" placeholder="学分"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="input-group">
                        <span style="background-color: #ededed" class="input-group-addon">容量</span>
                        <input type="text" id="lab_capacity" class="form-control" placeholder="容量"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
            </div>
            <div class="panel-body row">
                <div class="col-md-6">
                    <div class="input-group">
                        <span style="background-color: #ededed" class="input-group-addon">开始时间</span>
                        <input type="date" id="lab_start_time" class="form-control" placeholder="Username"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="input-group">
                        <span style="background-color: #ededed" class="input-group-addon">结束时间</span>
                        <input type="date" id="lab_end_time" class="form-control" placeholder="Username"
                               aria-describedby="basic-addon1">
                    </div>
                </div>
            </div>
            <div class="panel-body row">
                <form class="form-horizontal">
                    <div class="form-group form-group-lg">
                        <div class="col-lg-12" style="margin-right: 5px">
                            <textarea style="height: 200px;width: 920px;margin-left: 20px" class="form-control" type="" id="decp"
                                      placeholder="备注信息"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="panel-body row">
                <div class="col-lg-6">
                    <button style="margin-left: 80px" type="button" id="chose_device" data-toggle="modal" data-target="#adddevice"
                            class="btn btn-primary btn-lg">选择实验所需设备
                    </button>
                </div>
                <div class="col-lg-6">
                    <button id="saveinfo" style="margin-left: 50px;width:150px;" type="button" class="btn btn-success btn-lg" onclick="saveinfo()">提交信息
                    </button>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="col-md-1"></div>
</div>

<!--设备添加-->
<div id="adddevice" class="modal fade" style="display:none;margin-top: 8%;position: absolute" role="dialog"
     aria-labelledby="...">
    <div class="modal-dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">选择实验所需设备</h4>
                <div id="add_Btn" onclick="addDevice();">+</div>
            </div>
            <div class="modal-body">
                <!--添加设备-->
                <table class="table table-striped" id="bo">
                    <thead>
                    <th>
                        <tr>
                            <td style="width: 50%">&nbsp;&nbsp;设备类型</td>
                            <td style="width: 25%">&nbsp;&nbsp;余量</td>
                            <td style="width: 25%">&nbsp;&nbsp;输入数量</td>
                        </tr>
                    </th>
                    </thead>
                    <tbody>
                    <tr class="base_add"
                        ><td
                        ><div class="input-group"
                            ><input type="text" class="form-control" aria-label="..."
                            ><div class="input-group-btn myshow"
                                ><button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                            aria-haspopup="true" aria-expanded="false">设备类型<span class="caret"></span
                        ></button
                                    ><ul class="dropdown-menu dropdown-menu-right apply_device_name" onclick="showLiText(event);"
                                    ><c:forEach items="${devicelist}" varStatus="i" var="item"
                                    ><li
                                        ><a href="#">${item.name}_${item.modelId}</a
                                        ><input type="hidden" value="${item.id}"
                                        ></li
                        ></c:forEach
                        ></ul
                    ></div
                                ></div
                            ></td
                        ><td
                        ><div class="form-group" id="device_left_num"
                            ><input type="text" class="form-control" placeholder="Email" disabled="disabled"
                            ></div
                            ></td
                        ><td
                        ><div class="form-group"
                            ><input type="text" id="apply_device_num" class="form-control apply_device_num"
                                    placeholder="0" value=""
                            ></div
                            ></td
                        ></tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">选定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<script>

    //添加设备
    function addDevice() {
//        var temp = document.getElementsByClassName("base_add")[0].innerHTML,//.clone(true)
        var table = document.getElementById("bo").childNodes[3];
        var _tablerow = '<tr class="base_add"><td><div class="input-group"><input type="text" class="form-control" aria-label="..."><div class="input-group-btn myshow"><button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">设备类型<span class="caret"></span></button><ul class="dropdown-menu dropdown-menu-right apply_device_name" onclick="showLiText(event);"><c:forEach items="${devicelist}" varStatus="i" var="item"><li><a href="#">${item.name}_${item.modelId}</a><input type="hidden" value="${item.id}"></li></c:forEach></ul></div><!-- /btn-group --></div><!-- /input-group --></td><td><div class="form-group" id="device_left_num"><input type="text" class="form-control" placeholder="Email" disabled="disabled"></div></td><td><div class="form-group"><input type="text" id="apply_device_num" class="form-control apply_device_num" placeholder="0" value=""></div></td></tr>';
        table.innerHTML += _tablerow;

    }

    //选择设备名称的时候将设备名称显示出来并从后台查询余量
    function showLiText() {
        var that = this.event.target,
                _text = that.innerHTML;
        var device_id = that.parentElement.childNodes[1].value;
//        console.log(device_id);
        var base_node = that.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode;
//        console.log(base_node.childNodes[1].childNodes[0].childNodes[0]);
        $.ajax({
            url: '/query/querydeviceleft',
            method: 'post',
            data: JSON.stringify({id: device_id}),
            success: function (data) {
                that.parentNode.parentNode.parentNode.parentNode.firstElementChild.value = _text;
                base_node.childNodes[1].childNodes[0].childNodes[0].value = data;
            },
            headers: {
                'Content-Type': 'application/json'
            },
            error: function () {
                alert("query failed");
            }
        });
    }

    //点击保存信息是获取全部的设备相关的信息
    var device_info = '';
    function getdapplydeviceinfo() {
        var adname = $(".apply_device_name");
        var adnum = $(".apply_device_num");
//        console.log(adname[0].parentNode.parentNode.childNodes[0].value)
        console.log(adnum[0].value)
        for (var i = 0; i < adname.length; i++){
            device_info+=adname[i].parentNode.parentNode.childNodes[0].value;
            device_info+='&';
            device_info+=adnum[i].value;
            device_info+='##';
        }

    }
    function saveinfo() {

        getdapplydeviceinfo();
        alert(device_info);

        var labid = $("#input_lab_name").val(),
                pro_name = $("#input_lab_theme").val(),
                pro_capacity = $("#lab_capacity").val(),
                pro_score = $("#lab_score").val(),
                pro_start_time = $("#lab_start_time").val(),
                pro_end_time = $("#lab_end_time").val(),
                pro_decp = $('#decp').val();
        console.log(pro_start_time, pro_end_time);

        $.ajax({
            url: "/teacher/saveprojectinfo",
            method: 'post',
            headers: {
                'Content-Type': 'application/json'
            },
            data: JSON.stringify({
                labId: labid,
                name: pro_name,
                startTime: pro_start_time,
                endTime: pro_end_time,
                capacity: pro_capacity,
                credit: pro_score,
                description: pro_decp,
                devices: device_info
            }),
            success: function (data) {
                if (data == 'success')
                    window.location.href = "/jump/applyproject3";
            },
            error: function () {
                alert("信息未提交成功,请尝试重新")
            }
        });
    }

</script>
<script src="${cacheUrl}/assets/applyproject/fileup/jquery.min.js"></script>
<script src="${cacheUrl}/assets/applyproject/fileup/fileinput.js" type="text/javascript"></script>
<script src="${cacheUrl}/assets/applyproject/fileup/fileinput_locale_zh.js" type="text/javascript"></script>
<%--<script src="${cacheUrl}/assets/applyproject/fileup/bootstrap.min.js" type="text/javascript"></script>--%>
<script>
    $("#chose_lab ul li").each(function () {
        $(this).on("click", function () {
            var liValue = this.firstChild.innerHTML;
            document.querySelector("#input_lab_name").value = liValue;
        })
    })
</script>
<script>
    function upfile() {
        alert("ok");
        $("#upform").submit();
    }


</script>
<script>

</script>
<script>

</script>
</body>
</html>