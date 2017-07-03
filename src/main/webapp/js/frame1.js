/**
 * Created by anps0907 on 2/6/2017.
 */

var nodeDialg;
$("#adduser").live("click", function () {
    nodeDialg = $.alertDialog({
        type : 1,
        title : ['添加用户'],
        fix : false,
        offset:["50px" , '50%'],
        area : ['400px','400px'],
        shadeClose : false,
        page : {dom : '#sysNodeList'}//在sysNodeList是弹出对象id
    });
});

$("#edituser").live("click", function () {
	nodeDialg = $.alertDialog({
        type : 1,
        title : ['修改信息'],
        fix : false,
        offset:["50px" , '50%'],
        area : ['400px','400px'],
        shadeClose : false,
        page : {dom : '#sysNodeList1'}//在sysNodeList是弹出对象id
    });
});

$("#querySysNodeList").live("click", function () {
    //alert("querySysNodeList");
    $.alertPlus("ddf",1,"df", function (index) {
        $.closeDialog(index);
    });
    $("#noCode").attr("value","anps");
});

$("#clearSysNodeList").live("click", function () {
    alert("确认重置吗?");
    $.updateTitle("anps",nodeDialg);

});
/*
$("#confirm").live("click", function () {
    $.layerConfirm("确认保存吗？", function (index) {
        $.alertPlus("保存成功",1,"提示");
    },"提示", function (index) {
        $.closeDialog(index);
    });
});*/

$("#tips").live("mouseover",function(){
    $.loadTip("我爱你,亲爱的",this,{
        style: ['background-color:#0FA6D8; color:#fff', '#0FA6D8'],
        maxWidth:150
    });
});

$("#tips").live("mouseout", function () {
    $.closeTip();
});

$("#ftp").live("click",function(){
    $.loadTier(2,0,true);
});

