<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.lei.demo.dao.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="com.lei.demo.entity.*" %>
<%@ page import="java.util.List" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=basePath%>">
<link href="<%=basePath%>css/model.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/commonNew.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/myMY.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/loPrCenter.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<title>差旅报销单</title>
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
				<div class="content_left-box1"><i class="fa fa-home" ></i></div>
				<div class="content_leftbox">我的项目</div>
			</a>			
		</div>
		<div class="content_right">
			<div class="content_rightbox1">
				<div class="content_rightbox_left">
					<div class="content_rightbox11">我的差旅单</div>
					<div class="content_rightbox12">查看、管理所有报销单</div>
				</div>
				<div class="content_rightbox_right">
				<input type="text" placeholder="   搜索差旅单" class="input1"><i class="fa fa-search" ></i>
				</div>				
			</div>
			<div class="content_rightbox2">
					<div class="content_rightbox21">全部差旅单</div>
					<div class="content_rightbox22"></div>		
			</div>

			<div class="content_rightbox3">
				<input type="button" value="填写差旅单" id="question" class="butt">
			</div>	
			<div class="content_rightbox4">	
			<c:if test="${not empty travelexpense}">				
					<table class="table1">
						<tr class="tabletitle">
							<td >差旅单号</td>
							<td>项目代码</td>
							<td>创建日期</td>
							<td>金额</td>
							<td>状态</td>
							<td>操作</td>
						</tr>
					<c:forEach var="current" items="${travelexpense}">
						<tr class="tabletext">
							<td>${current.travelid}</td>
							<td>${current.projectid}</td>
							<td>${current.operatedate}</td>
							<td>${current.money}</td>
							<td class="textcolor">${current.ispass}</td>
							<td class="textcolor"><a href="/demo/travelexpense/look/${current.travelid}">查看详情</a></td>
						</tr>
					</c:forEach>
					</table>
					</c:if>
				</div>
			</div>			
		</div>
	
	<div id="sysNodeList" style="display: none" >
    <div class="grey_box Branch1">
        <form  action="/demo/travelexpense/create"  enctype="multipart/form-data"   method="post">
            <div class="info_box">
            	<div class="typebox1">
            		<div class="typetitle">
						<div class="faretype">基本信息</div>						
					</div>   
	                <div class="writebox">
	                    <div class="writebox_title">单位：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName1" name="partment" />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">姓名：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName2" name="travellername" />
	                    </div>
	                </div>                
					<div class="writebox">
	                    <div class="writebox_title">职务：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName3" name="travellertitle" />
	                    </div>
	                </div>                
					<div class="writebox">
	                    <div class="writebox_title">经费代码：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName4" name="projectid" />
	                    </div>
	                </div>   

					<div class="writebox">
                    	<div class="writebox_title">出差事由：</div>
                    	<div class="writebox_text">
                       		 <input type="text" class="textwrite" id="noName5" name="travelreason" />
                   		 </div>
                	</div>

					<div class="writebox">
	                    <div class="writebox_title">附单据数：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName6" name="number" />
	                    </div>
	                </div> 
					<div class="writebox">
	                    <div class="writebox_title">出差地点：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName7" name="travelplace" />
	                    </div>
	                </div>   

					<div class="writebox">
	                    <div class="writebox_title1">起止日期：</div>
	                    <div class="writebox_text1">
	                        <input type="date" class="textwrite2" id="noName8" name="travelbegin" />
	                    </div>
	                </div> 

					<div class="writebox">
	                    <div class="writebox_title1">结束日期：</div>
	                    <div class="writebox_text1">
	                        <input type="date" class="textwrite2" id="noName9" name="travelfinish" />
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
	                        <input type="text" class="textwrite" id="noName10" name="plane"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">火车费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName11" name="train" />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">其他费用：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName12" name="othertraffic"  />
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
	                        <input type="text" class="textwrite" id="noName13" name="allowance"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">公杂费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName14" name="publicfees"  />
	                    </div>
	                </div>   
                </div>
				<div class="typebox3" style="border-bottom:none;">  
					<div class="writebox">
	                    <div class="writebox_title">住宿费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName15" name="hotelexpense"  />
	                    </div>
	                </div>    
					<div class="writebox">
	                    <div class="writebox_title">其他：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName16" name="otherfees" />
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
	                        <input type="text" class="textwrite" id="noName17" name="teacherid"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">姓名：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName18" name="cardname"   />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">转卡金额：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName19" name="cardamount"  />
	                    </div>
	                </div>
	                <div class="writebox">
	                    <div class="writebox_title">建行卡号：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite1" id="noName20" name="cardid"  />
	                    </div>
	                </div>   
                </div>
				<div class="typebox3">  
					<div class="writebox">
	                    <div class="writebox_title">报销审批人：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName21" name="approver"  readonly="true"   />
	                    </div>
	                </div>    
					<div class="writebox">
	                    <div class="writebox_title1">报销日期：</div>
	                    <div class="writebox_text1">
	                        <input type="date"  class="textwrite2" id="noName22" name="operatedate" />
	                    </div>
	                </div>
	                <%               	
	                	User user=(User)request.getSession().getAttribute("user");
	                %>
	 				<div class="writebox">
	                    <div class="writebox_title">经办人：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName23" name="operator" value=<%=user.getUserName() %> readonly="true" />
	                    </div>
	                </div>                                                 
				</div> 
				<div class="typebox5" style="padding-left:0px;">  
	              	<div >
	              		<input type="file" name="uploadFile"  style="border:1px dotted #ccc"/>						 
                	</div>                                       						                       
            	</div>
            	<div class="typebox5">  
	              	<div >              		
	              		<button type="submit" id="save">保&nbsp;&nbsp;存</button>
                	</div>                                       						                       
            	</div>
             <div class="w_word1">  
	              <span id="noNameInf1"></span>	
			</div>	
        </form>

    </div>
</div>  
		  <%               			  	
		  	List<Project> projectlist=(List<Project>)request.getSession().getAttribute("projectlist");	         
	       %>
<script type="text/javascript">
	function checkPartment(){
 		var partmentinfo=document.getElementById("noNameInf1");
 		var partment = document.getElementById("noName1").value;
 		
 		if (partment == "" || partment.length==0 ) 
		{
			partmentinfo.innerHTML =  "单位不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			for (var i = 0; i < partment.length; i++) 
			{
				var s = partment.toLowerCase().substring(i, i + 1);
				if ((s >= 0 && s <= 9) || (s >= "a" && s <= "z") || (s == "_")) 
				{
					partmentinfo.innerHTML = "单位不能包含字母、数字和下划线";
					partmentinfo.style.color = "red";
					return false;
				} 
				else 
				{
					
					partmentinfo.innerHTML = "";
				}
			}
 		}		
 		return true;		
}	
	function checkTravellerName(){
		var partmentinfo=document.getElementById("noNameInf1");
		var travellername = document.getElementById("noName2").value;
		
		if(travellername == "" || travellername.length==0)
 		{
 			partmentinfo.innerHTML =  "姓名不能为空！";
 			partmentinfo.style.color = "red";
 			return false;			
 		}
		else{
			for (var i = 0; i < travellername.length; i++) 
			{
				var s = travellername.toLowerCase().substring(i, i + 1);
				if ((s >= 0 && s <= 9) || (s >= "a" && s <= "z") || (s == "_")) 
				{
					partmentinfo.innerHTML = "姓名不能包含字母、数字和下划线";
					partmentinfo.style.color = "red";
					return false;
				} 
				else 
				{
					partmentinfo.innerHTML = "";
				}
			}
		}		
		return true;
	}
	
	function checkTravellerTitle(){
		var partmentinfo=document.getElementById("noNameInf1");
		var travellertitle = document.getElementById("noName3").value;
		
		if (travellertitle == "" || travellertitle.length==0 ) 
		{
			partmentinfo.innerHTML =  "职务不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			for (var i = 0; i < travellertitle.length; i++) 
			{
				var s = travellertitle.toLowerCase().substring(i, i + 1);
				if ((s >= 0 && s <= 9) || (s >= "a" && s <= "z") || (s == "_")) 
				{
					partmentinfo.innerHTML = "职务不能包含字母、数字和下划线";
					partmentinfo.style.color = "red";
					return false;
				} 
				else 
				{
					partmentinfo.innerHTML = "";
				}
			}
 		} 		
 		return true;
	}
	
	function checkProjectId(){
		var partmentinfo=document.getElementById("noNameInf1");
		var projectid = document.getElementById("noName4").value;
		var flag1=true;
		if (projectid == "" || projectid.length==0 ) 
		{
			partmentinfo.innerHTML =  "经费代码不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			for (var i = 0; i < projectid.length; i++) 
				{
					var s = projectid.toLowerCase().substring(i, i + 1);
					if (!(s >= "0" && s <= "9") ) 
					{
						partmentinfo.innerHTML = "经费代码必须是数字！";
						partmentinfo.style.color = "red";
						return false;
					} 
				}
 			}
					<%
					Integer p;
					 for(Project cl : projectlist){
						 p=cl.getProjectid();
					%>
						 if(projectid==<%=p%>){
							 flag1=false;
						 }
					<%
					 }
					%>
			if(flag1){
				partmentinfo.innerHTML = "经费代码不存在！";
				partmentinfo.style.color = "red";
				return false;
					}
			else{
				partmentinfo.innerHTML = "";
					}					
 		return true;
	}
	
	function checkTravelReason(){
		var partmentinfo=document.getElementById("noNameInf1");
		var travelreason = document.getElementById("noName5").value;
		
		if (travelreason == "" || travelreason.length==0 ) 
		{
			partmentinfo.innerHTML =  "出差事由不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			for (var i = 0; i < travelreason.length; i++) 
			{
				var s = travelreason.toLowerCase().substring(i, i + 1);
				if ((s >= 0 && s <= 9) || (s >= "a" && s <= "z") || (s == "_")) 
				{
					partmentinfo.innerHTML = "出差事由不能包含字母、数字和下划线";
					partmentinfo.style.color = "red";
					return false;
				} 
				else 
				{
					partmentinfo.innerHTML = "";
				}
			}
 		}		
 		return true;
	}
	
	function checkNumber(){
		var partmentinfo=document.getElementById("noNameInf1");
		var number = document.getElementById("noName6").value;
		
		if (number == "" || number.length==0 ) 
		{
			partmentinfo.innerHTML =  "附单据数不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			for (var i = 0; i < number.length; i++) 
			{
				var s = number.toLowerCase().substring(i, i + 1);
				if ( !(s >= "0" && s <= "9") ) 
				{
					partmentinfo.innerHTML = "附单据数必须是数字！";
					partmentinfo.style.color = "red";
					return false;
				} 
				else 
				{
					partmentinfo.innerHTML = "";
				}
			}
 		}		
 		return true;
	}
	
	function checkTravelPlace(){
		var partmentinfo=document.getElementById("noNameInf1");
		var travelplace = document.getElementById("noName7").value;
		
		if (travelplace == "" || travelplace.length==0 ) 
		{
			partmentinfo.innerHTML =  "出差地点不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			for (var i = 0; i < travelplace.length; i++) 
			{
				var s = travelplace.toLowerCase().substring(i, i + 1);
				if ((s >= 0 && s <= 9) || (s >= "a" && s <= "z") || (s == "_")) 
				{
					partmentinfo.innerHTML = "出差地点不能包含字母、数字和下划线";
					partmentinfo.style.color = "red";
					return false;
				} 
				else 
				{
					partmentinfo.innerHTML = "";
				}
			}
 		}		
 		return true;
	}
	
	function checkTravelBegin(){
		var partmentinfo=document.getElementById("noNameInf1");
		var travelbegin = document.getElementById("noName8").value;
		
		if (travelbegin == "" || travelbegin.length==0 ) 
		{
			partmentinfo.innerHTML =  "起止日期不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			var myDate = new Date();
 			var seperator = "-";
 			var year = myDate.getFullYear();
 			var month = myDate.getMonth()+1;
 			var strDate = myDate.getDate();
 			if(month>=1 && month<=9){
 				month="0" + month;
 			}
 			if(strDate>=0&&strDate<=9){
 				strDate = "0" + strDate;
 			}
 			var currentdate = year + seperator + month + seperator + strDate;
 			if(travelbegin>currentdate){
 				partmentinfo.innerHTML =  "起止日期不能在当前日期之后！";
 				partmentinfo.style.color = "red";
 				return false;
 			}
 			else 
			{
				partmentinfo.innerHTML = "";
			}
 		}		
 		return true;
	}
	
	function checkTravelFinish(){
		var partmentinfo=document.getElementById("noNameInf1");
		var travelbegin = document.getElementById("noName8").value;
		var travelfinish = document.getElementById("noName9").value; 
		
		if (travelfinish == "" || travelfinish.length==0 ) 
		{
			partmentinfo.innerHTML =  "结束日期不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
		else{
 			var myDate = new Date();
 			var seperator = "-";
 			var year = myDate.getFullYear();
 			var month = myDate.getMonth()+1;
 			var strDate = myDate.getDate();
 			if(month>=1 && month<=9){
 				month="0" + month;
 			}
 			if(strDate>=0&&strDate<=9){
 				strDate = "0" + strDate;
 			}
 			var currentdate = year + seperator + month + seperator + strDate;
 			if(travelfinish>currentdate){
 				partmentinfo.innerHTML =  "结束日期不能在当前日期之后！";
 				partmentinfo.style.color = "red";
 				return false;
 			}
 			else if(travelbegin>=travelfinish){
 				partmentinfo.innerHTML =  "结束日期不能在起止日期之前！";
 				partmentinfo.style.color = "red";
 				return false;
 			}
 			else 
			{
				partmentinfo.innerHTML = "";
			}
 		}		
 		return true;
	}
	function checkPlane(){
		var partmentinfo=document.getElementById("noNameInf1");
		var plane = document.getElementById("noName10").value;
		
		if (plane == "" || plane.length==0 ) 
		{
			partmentinfo.innerHTML =  "飞机费不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			for (var i = 0; i < plane.length; i++) 
			{
				var s = plane.toLowerCase().substring(i, i + 1);
				if ( !(s >= "0" && s <= "9") ) 
				{
					partmentinfo.innerHTML = "飞机费必须是数字！";
					partmentinfo.style.color = "red";
					return false;
				} 
				else 
				{
					partmentinfo.innerHTML = "";
				}
			}
 		}		
 		return true;
	}
	function checkTrain(){
		var partmentinfo=document.getElementById("noNameInf1");
		var train = document.getElementById("noName11").value;
		
		if (train == "" || train.length==0 ) 
		{
			partmentinfo.innerHTML =  "火车费不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			for (var i = 0; i < train.length; i++) 
			{
				var s = train.toLowerCase().substring(i, i + 1);
				if ( !(s >= "0" && s <= "9") ) 
				{
					partmentinfo.innerHTML = "火车费必须是数字！";
					partmentinfo.style.color = "red";
					return false;
				} 
				else 
				{
					partmentinfo.innerHTML = "";
				}
			}
 		}		
 		return true;
	}
	function checkOtherTraffic(){
		var partmentinfo=document.getElementById("noNameInf1");
		var othertraffic = document.getElementById("noName12").value;
		
		if (othertraffic == "" || othertraffic.length==0 ) 
		{
			partmentinfo.innerHTML =  "其他费用不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			for (var i = 0; i < othertraffic.length; i++) 
			{
				var s = othertraffic.toLowerCase().substring(i, i + 1);
				if ( !(s >= "0" && s <= "9") ) 
				{
					partmentinfo.innerHTML = "其他费用必须是数字！";
					partmentinfo.style.color = "red";
					return false;
				} 
				else 
				{
					partmentinfo.innerHTML = "";
				}
			}
 		}		
 		return true;
	}
	function checkAllowance(){
		var partmentinfo=document.getElementById("noNameInf1");
		var allowance = document.getElementById("noName13").value;
		
		if (allowance == "" || allowance.length==0 ) 
		{
			partmentinfo.innerHTML =  "伙食补助费不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			for (var i = 0; i < allowance.length; i++) 
			{
				var s = allowance.toLowerCase().substring(i, i + 1);
				if ( !(s >= "0" && s <= "9") ) 
				{
					partmentinfo.innerHTML = "伙食补助费必须是数字！";
					partmentinfo.style.color = "red";
					return false;
				} 
				else 
				{
					partmentinfo.innerHTML = "";
				}
			}
 		}		
 		return true;
	}
	function checkPublicFees(){
		var partmentinfo=document.getElementById("noNameInf1");
		var publicfees = document.getElementById("noName14").value;
		
		if (publicfees == "" || publicfees.length==0 ) 
		{
			partmentinfo.innerHTML =  "公杂费不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			for (var i = 0; i < publicfees.length; i++) 
			{
				var s = publicfees.toLowerCase().substring(i, i + 1);
				if ( !(s >= "0" && s <= "9") ) 
				{
					partmentinfo.innerHTML = "公杂费必须是数字！";
					partmentinfo.style.color = "red";
					return false;
				} 
				else 
				{
					partmentinfo.innerHTML = "";
				}
			}
 		}		
 		return true;
	}
	function checkHotelExpense(){
		var partmentinfo=document.getElementById("noNameInf1");
		var hotelexpense = document.getElementById("noName15").value;
		
		if (hotelexpense == "" || hotelexpense.length==0 ) 
		{
			partmentinfo.innerHTML =  "住宿费不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			for (var i = 0; i < hotelexpense.length; i++) 
			{
				var s = hotelexpense.toLowerCase().substring(i, i + 1);
				if ( !(s >= "0" && s <= "9") ) 
				{
					partmentinfo.innerHTML = "住宿费必须是数字！";
					partmentinfo.style.color = "red";
					return false;
				} 
				else 
				{
					partmentinfo.innerHTML = "";
				}
			}
 		}		
 		return true;
	}
	
	function checkOtherFees(){
		var partmentinfo=document.getElementById("noNameInf1");
		var otherfees = document.getElementById("noName16").value;
		
		if (otherfees == "" || otherfees.length==0 ) 
		{
			partmentinfo.innerHTML =  "其他不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			for (var i = 0; i < otherfees.length; i++) 
			{
				var s = otherfees.toLowerCase().substring(i, i + 1);
				if ( !(s >= "0" && s <= "9") ) 
				{
					partmentinfo.innerHTML = "其他必须是数字！";
					partmentinfo.style.color = "red";
					return false;
				} 
				else 
				{
					partmentinfo.innerHTML = "";
				}
			}
 		}		
 		return true;
	}
	function checkTeacherId(){
		var partmentinfo=document.getElementById("noNameInf1");
		var teacherid = document.getElementById("noName17").value;
		
		if (teacherid == "" || teacherid.length==0 ) 
		{
			partmentinfo.innerHTML =  "工号不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			for (var i = 0; i < teacherid.length; i++) 
			{
				var s = teacherid.toLowerCase().substring(i, i + 1);
				if ( !(s >= "0" && s <= "9") ) 
				{
					partmentinfo.innerHTML = "老师工号必须是数字！";
					partmentinfo.style.color = "red";
					return false;
				} 
				else if(!(teacherid.length==8))
				{
					partmentinfo.innerHTML = "老师工号必须是8位数字！";
					partmentinfo.style.color = "red";
					return false;
				}
				else{
					partmentinfo.innerHTML = "";
				}
			}
 		}		
 		return true;
	}
	function checkCardName(){
		var partmentinfo=document.getElementById("noNameInf1");
		var cardname = document.getElementById("noName18").value;
		
		if (cardname == "" || cardname.length==0 ) 
		{
			partmentinfo.innerHTML =  "持卡人姓名不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			for (var i = 0; i < cardname.length; i++) 
			{
				var s = cardname.toLowerCase().substring(i, i + 1);
				if ((s >= 0 && s <= 9) || (s >= "a" && s <= "z") || (s == "_")) 
				{
					partmentinfo.innerHTML = "持卡人姓名不能包含字母、数字和下划线";
					partmentinfo.style.color = "red";
					return false;
				} 
				else 
				{
					partmentinfo.innerHTML = "";
				}
			}
 		} 		
 		return true;
	}
	function checkCardAmount(){
		var partmentinfo=document.getElementById("noNameInf1");
		var cardamount = document.getElementById("noName19").value;
		
		if (cardamount == "" || cardamount.length==0 ) 
		{
			partmentinfo.innerHTML =  "转卡金额不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			for (var i = 0; i < cardamount.length; i++) 
			{
				var s = cardamount.toLowerCase().substring(i, i + 1);
				if ( !(s >= "0" && s <= "9") ) 
				{
					partmentinfo.innerHTML = "转卡金额必须是数字！";
					partmentinfo.style.color = "red";
					return false;
				} 
				else 
				{
					partmentinfo.innerHTML = "";
				}
			}
 		}		
 		return true;
	}
	function checkCardId(){
		var partmentinfo=document.getElementById("noNameInf1");
		var cardid = document.getElementById("noName20").value;
		
		if (cardid == "" || cardid.length==0 ) 
		{
			partmentinfo.innerHTML =  "建行卡号不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			for (var i = 0; i < cardid.length; i++) 
			{
				var s = cardid.toLowerCase().substring(i, i + 1);
				if ( !(s >= "0" && s <= "9") ) 
				{
					partmentinfo.innerHTML = "建行卡号必须是数字！";
					partmentinfo.style.color = "red";
					return false;
				} 
				else if(!(cardid.length==19))
				{
					partmentinfo.innerHTML = "建行卡号必须是19位数字！";
					partmentinfo.style.color = "red";
					return false;
				}
				else{
					partmentinfo.innerHTML = "";
				}
			}
 		}		
 		return true;
	}
	function checkOperateDate(){
		var partmentinfo=document.getElementById("noNameInf1");
		var operatedate = document.getElementById("noName22").value;
		
		if (operatedate == "" || operatedate.length==0 ) 
		{
			partmentinfo.innerHTML =  "报销日期不能为空！";
			partmentinfo.style.color = "red";
			return false;
		}
 		else{
 			var myDate = new Date();
 			var seperator = "-";
 			var year = myDate.getFullYear();
 			var month = myDate.getMonth()+1;
 			var strDate = myDate.getDate();
 			if(month>=1 && month<=9){
 				month="0" + month;
 			}
 			if(strDate>=0&&strDate<=9){
 				strDate = "0" + strDate;
 			}
 			var currentdate = year + seperator + month + seperator + strDate;
 			if(operatedate>currentdate){
 				partmentinfo.innerHTML =  "报销日期不能在当前日期之后！";
 				partmentinfo.style.color = "red";
 				return false;
 			}
 			else 
			{
				partmentinfo.innerHTML = "";
			}
 		}		
 		return true;
	}
	$(function() {
		$("#save").click(function(event) {
			Flag =checkPartment()&&checkTravellerName()&&checkTravellerTitle()&&checkProjectId()&&checkTravelReason()&&checkNumber()&&checkTravelPlace()&&checkTravelBegin()&&checkTravelFinish()
			&&checkPlane()&&checkTrain()&&checkOtherTraffic()&&checkAllowance()&&checkPublicFees()&&checkHotelExpense()&&checkOtherFees()&&checkTeacherId()&&checkCardName()
			&&checkCardAmount()&&checkCardId()&&checkOperateDate();
			if(Flag){
				$("#travelexpense").attr("action", "/demo/travelexpense/create")
				$("#travelexpense").submit();
			}
			else{
				return false;
			}
        	
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