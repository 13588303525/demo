<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.lei.demo.dao.TravelExpenseDAO" %>
<%@ page import="com.lei.demo.entity.TravelExpense" %>
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
<title>查看差旅报销单</title>
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
			<a href="/demo/expense/see"" property="inpage">
				<div class="content_left-box1"><i class="fa fa-dot-circle-o" ></i></div>
				<div class="content_leftbox">我的报销单</div>			
			</a>
			<a href="/demo/project/see" property="inpage">
				<div class="content_left-box1"><i class="fa fa-home" ></i></div>
				<div class="content_leftbox">我的项目</div>
			</a>
		</div>
		<div class="content_right">
			<div class="content_rightbox1">
				<div class="content_rightbox_left">
					<div class="content_rightbox11">我的差旅单</div>
				</div>				
			</div>
		  <%               	
		  	TravelExpense travelexpense = (TravelExpense)request.getSession().getAttribute("travelexpensedetail");
		  	
	       %>	
	       <form  modelAttribute="travelexpense" action="/demo/travelexpense/edit" method="post"> 	       					
            <div class="info_box1">
            	<div class="typebox1">
            		<div class="typetitle">
						<div class="faretype">基本信息</div>						
					</div>   
	                <div class="writebox">
	                    <div class="writebox_title">单位：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="partment" value="<%=travelexpense.getPartment() %>"  />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">姓名：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="travellername" value="<%=travelexpense.getTravellername() %>"  />
	                    </div>
	                </div>                
					<div class="writebox">
	                    <div class="writebox_title">职务：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="travellertitle" value="<%=travelexpense.getTravellertitle() %>"  />
	                    </div>
	                </div>                
					<div class="writebox">
	                    <div class="writebox_title">经费代码：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="projectid" value="<%=travelexpense.getProjectid() %>"  />
	                    </div>
	                </div>   

					<div class="writebox">
                    	<div class="writebox_title">出差事由：</div>
                    	<div class="writebox_text">
                       		 <input type="text" class="textwrite" id="noName" name="travelreason" value="<%=travelexpense.getTravelreason() %>"  />
                   		 </div>
                	</div>

					<div class="writebox">
	                    <div class="writebox_title">附单据数：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="number" value="<%=travelexpense.getNumber() %>"  />
	                    </div>
	                </div> 
					<div class="writebox">
	                    <div class="writebox_title">出差地点：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="travelplace" value="<%=travelexpense.getTravelplace() %>" />
	                    </div>
	                </div>   

					<div class="writebox">
	                    <div class="writebox_title1">开始日期：</div>
	                    <div class="writebox_text1">
	                        <input type="date" class="textwrite2" id="noName" name="travelbegin" value="<%=travelexpense.getTravelbegin() %>" readonly="true" />
	                    </div>
	                </div> 

					<div class="writebox">
	                    <div class="writebox_title1">结束日期：</div>
	                    <div class="writebox_text1">
	                        <input type="date" class="textwrite2" id="noName" name="travelfinish" value="<%=travelexpense.getTravelfinish() %>"  />
	                    </div>
	                </div>    	                
					</div>
				<div class="typebox2">  
					<div class="typetitle">
						<div class="faretype">城市间交通费</div>
						
					</div>                                       
					<div class="writebox">
	                    <div class="writebox_title">飞机费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="plane" value="<%=travelexpense.getPlane() %>"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">火车费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="train" value="<%=travelexpense.getTrain() %>"  />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">其他费用：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="othertraffic" value="<%=travelexpense.getOthertraffic() %>"  />
	                    </div>
	                </div>  
                </div>
				<div class="typebox2">  
					<div class="typetitle">
						<div class="faretype">补贴报销</div>
						
					</div>                                       
					<div class="writebox">
	                    <div class="writebox_title">伙食补助费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="allowance" value="<%=travelexpense.getAllowance() %>"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">公杂费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="publicfees" value="<%=travelexpense.getPublicfees() %>"  />
	                    </div>
	                </div>   
                </div>
				<div class="typebox3">  
					<div class="writebox">
	                    <div class="writebox_title">住宿费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="hotelexpense" value="<%=travelexpense.getHotelexpense() %>"  />
	                    </div>
	                </div>    
					<div class="writebox">
	                    <div class="writebox_title">其他：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="otherfees" value="<%=travelexpense.getOtherfees() %>"  />
	                    </div>
	                </div>
	 				<div class="writebox">
	                    <div class="writebox_title">报销总金额：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="money" value="<%=travelexpense.getMoney() %>"  />
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
	                        <input type="text" class="textwrite" id="noName" name="teacherid"   value="<%=travelexpense.getTeacherid() %> " />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">姓名：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="cardname"   value="<%=travelexpense.getCardname() %>"  />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">转卡金额：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="cardamount"   value="<%=travelexpense.getCardamount() %>"   />
	                    </div>
	                </div>
	                <div class="writebox">
	                    <div class="writebox_title">建行卡号：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite1" id="noName" name="cardid" value="<%=travelexpense.getCardid() %>" />
	                    	<input type="hidden"  name="travelid" value="<%=travelexpense.getTravelid() %>"  />
	                    </div>
	                </div>   
                </div>
				<div class="typebox3" style="border-bottom:1px solid #6ba3f5;">  
					<div class="writebox">
	                    <div class="writebox_title">报销审批人：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="approver" value="" readonly="true"  />
	                    </div>
	                </div>    
					<div class="writebox">
	                    <div class="writebox_title1">报销日期：</div>
	                    <div class="writebox_text1">
	                        <input type="date"  class="textwrite2" id="noName" name="operatedate" value="<%=travelexpense.getOperatedate() %>" readonly="true" />
	                    </div>
	                </div>

	 				<div class="writebox">
	                    <div class="writebox_title">经办人：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName" name="operator" value="<%=travelexpense.getOperator() %>" readonly="true" />
	                    </div>
	                </div>                                                 
				</div> 
				<%if(travelexpense.getIspass().equals("待审核")) { %>
                <div class="typebox5">  
                    	<button type="submit" id="edit" style="margin-left: 300px;">修改</button>   
	    		</div>  
	    		<%} %>                       							                       
            </div>
		</form>
    </div>
</div>


<script type="text/javascript">
	$(function() {
		$("#edit").click(function(event) {
        	$("#travelexpense").attr("action", "/demo/travelexpense/edit")
			$("#travelexpense").submit();
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