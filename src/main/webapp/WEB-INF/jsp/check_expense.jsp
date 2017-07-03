<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.lei.demo.dao.*" %>
<%@ page import="com.lei.demo.entity.Expense" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="com.lei.demo.entity.User" %>
<%@ page import="com.lei.demo.entity.Project" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.PrintWriter" %>
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
<title>审核报销单</title>
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

			<a href="/demo/expense/check" property="inpage">
				<div class="content_left-box1"><i class="fa fa-puzzle-piece" ></i></div>
				<div class="content_leftbox">审核差旅单</div>
			</a>
			<a href="/demo/expense/check" property="inpage">
				<div class="content_left-box1"><i class="fa fa-dot-circle-o" ></i></div>
				<div class="content_leftbox">审核报销单</div>
				
			</a>
			<a href="/demo/project/check" property="inpage">
				<div class="content_left-box1"><i class="fa fa-home" ></i></div>
				<div class="content_leftbox">项目管理</div>
			</a>
			<a href="/demo/user/manager_u" property="inpage">
				<div class="content_left-box1"><i class="fa fa-user-circle" aria-hidden="true"></i></div>
				<div class="content_leftbox">用户管理</div>
			</a>
			<a href="/demo/user/charts" property="inpage">
				<div class="content_left-box1"><i class="fa fa-bar-chart" aria-hidden="true"></i></div>
				<div class="content_leftbox">图表分析</div>
			</a>
		</div>
		<div class="content_right">
			<div class="content_rightbox1">
				<div class="content_rightbox_left">
					<div class="content_rightbox11">审核报销单</div>
				</div>	
				<div class="content_rightbox_right">
					
				</div>			
			</div>
		  <%               	
		  	Expense expense = (Expense)request.getSession().getAttribute("expensedetail");

	       %>		   
	       <form modelAttribute="expense" action="/demo/expense/ispass" method="post">    					
              <div class="info_box2">
            	<div class="typebox6">
            		<div class="typetitle">
						<div class="faretype">基本信息</div>								                					
					</div>   
	                <div class="writebox">
	                    <div class="writebox_title">单位：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="partment" value="<%=expense.getPartment() %>" readonly="true" />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">项目代码：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="projectid" value="<%=expense.getProjectid() %>" readonly="true"  />
	                    </div>
	                </div>                
					<div class="writebox">
	                    <div class="writebox_title">单据张数：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="numbers" value="<%=expense.getNumbers() %>" readonly="true"  />
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
	                        <input type="text" class="textwrite" id="noName" name="offices" value="<%=expense.getOffices() %>" readonly="true"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">市内交通费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="traffic" value="<%=expense.getTraffic() %>" readonly="true"  />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">固定资产构建费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="asset" value="<%=expense.getAsset() %>" readonly="true"  />
	                    </div>
	                </div> 
					<div class="writebox">
	                    <div class="writebox_title">通讯邮寄费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="communication" value="<%=expense.getCommunication() %>" readonly="true"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">燃油燃料费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="fuel" value="<%=expense.getFuel() %>" readonly="true"  />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">体育用品购置费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="sport" value="<%=expense.getSport() %>" readonly="true"  />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">技术服务咨询费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="service" value="<%=expense.getService() %>" readonly="true"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">过路过桥费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="passload" value="<%=expense.getPassload() %>" readonly="true"  />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">日用品材料费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="daily" value="<%=expense.getDaily() %>" readonly="true"  />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">业务招待费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="entertain" value="<%=expense.getEntertain() %>" readonly="true"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">机动车辆维修费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="carmodify" value="<%=expense.getCarmodify() %>" readonly="true"  />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">材料测试加工费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="test" value="<%=expense.getTest() %>" readonly="true"  />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">宣传广告费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="advertising" value="<%=expense.getAdvertising() %>" readonly="true"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">机动车辆保险费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="insurance" value="<%=expense.getInsurance() %>" readonly="true"  />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">设备维修费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="modify" value="<%=expense.getModify() %>" readonly="true"  />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">图书资料版面费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="book" value="<%=expense.getBook() %>" readonly="true"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">会议会务费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="meeting" value="<%=expense.getMeeting() %>" readonly="true"  />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">劳务费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="labor" value="<%=expense.getLabor() %>" readonly="true"  />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">复印印刷费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="printing" value="<%=expense.getPrinting() %>" readonly="true"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">培训费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="training" value="<%=expense.getTraining() %>" readonly="true"  />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">其他：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="otherfare" value="<%=expense.getOtherfare() %>" readonly="true"  />
	                        
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
	                        <input type="text" class="textwrite" id="noName" name="teacherid" value="<%=expense.getTeacherid() %>" readonly="true"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">姓名：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="teachername" value="<%=expense.getTeachername() %>" readonly="true"  />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">转卡金额：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="cardfare" value="<%=expense.getCardfare() %>" readonly="true"  />
	                    </div>
	                </div>
	                <div class="writebox">
	                    <div class="writebox_title">建行卡号：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="card" value="<%=expense.getCard() %>" readonly="true"  />
	                         <input type="hidden"  name="expenseid" value="<%=expense.getExpenseid() %>"  />
	                         <input type="hidden"  name="totalexpense" value="<%=expense.getTotalexpense() %>"  />
	                    </div>
	                </div>   
                </div>
				<div class="typebox3" style="border-bottom:1px solid #6ba3f5;">  
					<div class="writebox">
	                    <div class="writebox_title">经费主管：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="projectleader" value="<%=expense.getProjectleader() %>" readonly="true"  />
	                    </div>
	                </div>    
					<div class="writebox">
	                    <div class="writebox_title">经办人：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="operator" value=<%=expense.getOperator() %> readonly="true" />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title1">报销日期：</div>
	                    <div class="writebox_text1">
	                        <input type="date"  class="textwrite2" id="noName" name="operatedate" value="<%=expense.getOperatedate() %>" readonly="true"  />
	                    </div>
	                </div> 	
	                						                       
 	           </div>
 	           
 	           	<div class="typebox5">  
 	           		<input type="button" value="查看发票" id="question1" class="cfare">
 	           		<input type="button" id="check" class="cfare" value="检查经费">  
		           	<%if(expense.getIspass().equals("待审核")) { %>
                    	<button type="submit" id="passsucess" >通过审核</button>   
						<button type="submit" id="passfailure" >不通过审核</button>    
						<% } %>     
	    		</div>
	    		
	    	</div>
    </form>
</div>
	<div id="sysNodeList1" style="display: none;width:700px;height:500px;" >
    <div class="grey_box Branch1">
       <%
       File file = new File("C:/Users/Administrator/Desktop/备份/demo/src/main/webapp/image");
       File [] files = file.listFiles();
       String filename=expense.getFilename();
       for (int i = 0; i < files.length; i++)
       {
           File file1 = files[i];
          if(filename.equals(file1.getName())){
			 //根据后缀判断
        	%>
        	<img src="image/<%=file1.getName()%>" style="width:670px;height:340px;margin:15px;" />
        	<% 
          }
       }
       %>

    </div>
</div>  

<%
Integer total=expense.getTotalexpense();
Project project=(Project)request.getSession().getAttribute("projectdetail");
Integer restexpense=project.getRestexpense();	

%>
<script type="text/javascript">
$(function() {
	$("#check").click(function(event) {
    	var restexpense=<%=restexpense %>
    	var total=<%=total %>
    	if(total>restexpense){
    		alert("报销费用已超过项目经费！")
    	}
    	else{
    		alert("报销费用未超过项目经费！")
    	}
	});
});
	$(function() {
		$("#passsucess").click(function(event) {
        	$("#expense").attr("action", "/demo/expense/ispass")
			$("#expense").submit();
		});
	});
	$(function() {
		$("#passfailure").click(function(event) {
        	$("#expense").attr("action", "/demo/expense/notpass")
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