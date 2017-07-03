<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.lei.demo.dao.ExpenseDAO" %>
<%@ page import="com.lei.demo.entity.Expense" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="com.lei.demo.entity.User" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=basePath%>">
<link href="<%=basePath%>css/looktravelmodel.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/commonNew.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/myMY.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/loPrCenter.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<title>查看报销单</title>
</head>
<body>
	<div class="headerTop">
		<div class="model-container">
			<div class="header-container-left">
				<div class="header-li-box2"><i class="fa fa-eercast" ></i></div>茶叶蛋财务报销系统
			</div>				
			<div class="header-container-right">
				<ul class="header-list">
					<li class="header-lix">
						<a href="#" property="inpage">
							<div class="header-li-boxx1"><i class="fa fa-cog" ></i>设置</div>
						</a>
					</li>
					<li class="header-lix">
						<a href="#" property="inpage">
							<div class="header-li-boxx1"><i class="fa fa-envelope-o" ></i>消息</div>
							
						</a>
					</li>  
					<li class="header-lix">
						<a href="/demo/user/" property="inpage">
							<div class="header-li-boxx1"><i class="fa fa-sign-out" ></i>退出</div>
						</a>
					</li>										
				</ul>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="content_left">
			<a href="/demo/travelexpense/see" property="inpage">
				<div class="content_left-box1"><i class="fa fa-puzzle-piece" ></i></div>
				<div class="content_leftbox">我的差旅单</div>
			</a>
			<a href="/demo/expense/see" property="inpage">
				<div class="content_left-box1"><i class="fa fa-dot-circle-o" ></i></div>
				<div class="content_leftbox">我的报销单</div>				
			</a>
			<a href="/demo/project/see" property="inpage">
				<div class="content_left-box1"><i class="fa fa-dot-circle-o" ></i></div>
				<div class="content_leftbox">我的项目</div>				
			</a>			
		</div>
		<div class="content_right">
			<div class="content_rightbox1">
				<div class="content_rightbox_left">
					<div class="content_rightbox11">我的报销单</div>
				</div>				
			</div>
		  <%               	
		  	Expense expense = (Expense)request.getSession().getAttribute("expensedetail");
		  	
	       %>		       		
	       <form modelAttribute="expense" action="/demo/expense/edit" method="post">  		
              <div class="info_box2">
            	<div class="typebox6">
            		<div class="typetitle">
						<div class="faretype">基本信息</div>
						
					</div>   
	                <div class="writebox">
	                    <div class="writebox_title">单位：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="partment" value="<%=expense.getPartment() %>" />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">项目代码：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="projectid" value="<%=expense.getProjectid() %>"   />
	                    </div>
	                </div>                
					<div class="writebox">
	                    <div class="writebox_title">单据张数：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="numbers" value="<%=expense.getNumbers() %>"   />
	                    </div>
	                </div>                              
				</div>

				<div class="typebox7">  
					<div class="typetitle">
						<div class="faretype">费用项目</div>
						
					</div>                                       
					<div class="writebox">
	                    <div class="writebox_title">办公用品：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="offices" value="<%=expense.getOffices() %>"   />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">市内交通费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="traffic" value="<%=expense.getTraffic() %>"  />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">固定资产构建费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="asset" value="<%=expense.getAsset() %>"   />
	                    </div>
	                </div> 
					<div class="writebox">
	                    <div class="writebox_title">通讯邮寄费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="communication" value="<%=expense.getCommunication() %>"   />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">燃油燃料费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="fuel" value="<%=expense.getFuel() %>"   />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">体育用品购置费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="sport" value="<%=expense.getSport() %>"   />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">技术服务咨询费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="service" value="<%=expense.getService() %>"   />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">过路过桥费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="passload" value="<%=expense.getPassload() %>"   />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">日用品材料费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="daily" value="<%=expense.getDaily() %>"   />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">业务招待费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="entertain" value="<%=expense.getEntertain() %>"   />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">机动车辆维修费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="carmodify" value="<%=expense.getCarmodify() %>"   />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">材料测试加工费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="test" value="<%=expense.getTest() %>"   />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">宣传广告费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="advertising" value="<%=expense.getAdvertising() %>"   />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">机动车辆保险费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="insurance" value="<%=expense.getInsurance() %>"   />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">设备维修费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="modify" value="<%=expense.getModify() %>"   />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">图书资料版面费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="book" value="<%=expense.getBook() %>"   />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">会议会务费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="meeting" value="<%=expense.getMeeting() %>"   />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">劳务费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="labor" value="<%=expense.getLabor() %>"   />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">复印印刷费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="printing" value="<%=expense.getPrinting() %>"   />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">培训费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="training" value="<%=expense.getTraining() %>"   />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">其他：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="otherfare" value="<%=expense.getOtherfare() %>"   />
	                    </div>
	                </div>
                </div>
							  
				<div class="typebox4">  
					<div class="typetitle">
						<div class="faretype">转卡信息</div>
						
					</div>                                       
					<div class="writebox">
	                    <div class="writebox_title">工号：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="teacherid" value="<%=expense.getTeacherid() %>"   />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">姓名：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="teachername" value="<%=expense.getTeachername() %>"   />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">转卡金额：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="cardfare" value="<%=expense.getCardfare() %>"   />
	                    </div>
	                </div>
	                <div class="writebox">
	                    <div class="writebox_title">建行卡号：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite1" id="noName" name="card" value="<%=expense.getCard() %>"   />
	                         <input type="hidden"  name="expenseid" value="<%=expense.getExpenseid() %>"  />
	                    </div>
	                </div>   
                </div>
				<div class="typebox3" style="border-bottom:1px solid #6ba3f5;">  
					<div class="writebox">
	                    <div class="writebox_title">经费主管：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="projectleader" value="<%=expense.getProjectleader() %>"   />
	                    </div>
	                </div>   
	                <%               	
	                	User user=(User)request.getSession().getAttribute("user");
	                %> 
					<div class="writebox">
	                    <div class="writebox_title">经办人：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="operator" value=<%=expense.getOperator() %> readonly="true" />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title1">报销日期：</div>
	                    <div class="writebox_text1">
	                        <input type="date"  class="textwrite2" id="noName" name="operatedate" value="<%=expense.getOperatedate() %>"  />
	                    </div>
	                </div>							                       
            		</div>
            		<%if(expense.getIspass().equals("待审核")) { %>
                    <div class="typebox5">  
                    	<button type="submit" id="edit" style="margin-left: 300px;">修改</button>   
	    			</div> 
	    			<% } %>
		 </div>
    </form>
</div>


<script type="text/javascript">
	$(function() {
		$("#edit").click(function(event) {
        	$("#expense").attr("action", "/demo/expense/edit")
			$("#expense").submit();
		});
	});

</script>	
<script type="text/javascript" src="<%=basePath%>js/jquery1.9.js"></script>
<script type="text/javascript" src="<%=basePath%>layer/layer.min.js"></script>
<script type="text/javascript" src="<%=basePath%>layer/extend/layer.ext.js"></script>
<script type="text/javascript" src="<%=basePath%>js/commonNew.js"></script>
<script type="text/javascript" src="<%=basePath%>js/frame.js"></script>
</body>
</html>