<%@ page language="java" contentType="text/html; charset=utf-8"
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
<link href="<%=basePath%>css/modelexpense.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/commonNew.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/myMY.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/loPrCenter.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>

<title>报销汇总单</title>
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
					<div class="content_rightbox11">我的报销单</div>
					<div class="content_rightbox12">查看、管理所有报销单</div>
				</div>
				<div class="content_rightbox_right">
				<input type="text" placeholder="  搜索差旅单" class="input1"><i class="fa fa-search" ></i>
				</div>				
			</div>
			<div class="content_rightbox2">
					<div class="content_rightbox21">全部报销</div>
					<div class="content_rightbox22"></div>		
			</div>

			<div class="content_rightbox3">
				<input type="button" value="填写报销单" id="question" class="butt">
			</div>

			<div class="content_rightbox4">	
				<c:if test="${not empty expense}">				
					<table class="table1">
						<tr class="tabletitle">
							<td >报销单号</td>
							<td>项目代码</td>
							<td>创建日期</td>
							<td>金额</td>
							<td>状态</td>
							<td>操作</td>
						</tr>
					<c:forEach var="current" items="${expense}">
						<tr class="tabletext">
							<td>${current.expenseid}</td>
							<td>${current.projectid}</td>
							<td>${current.operatedate}</td>
							<td>${current.totalexpense}</td>
							<td class="textcolor">${current.ispass}</td>
							<td class="textcolor"><a href="/demo/expense/look/${current.expenseid}">查看详情</a></td>
						</tr>
					</c:forEach>
					</table>
					</c:if>
				</div>
			
		</div>
	</div>
	
	<div id="sysNodeList" style="display: none" >
    <div class="grey_box Branch1">
        <form action="/demo/expense/create"  enctype="multipart/form-data"   method="post">
            <div class="info_box">
            	<div class="typebox6">
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
	                    <div class="writebox_title">项目代码：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName2" name="projectid" />
	                    </div>
	                </div>                
					<div class="writebox">
	                    <div class="writebox_title">单据张数：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName3" name="numbers" />
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
	                        <input type="text" class="textwrite" id="noName4" name="offices"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">市内交通费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName5" name="traffic"  />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">固定资产构建费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName6" name="asset"  />
	                    </div>
	                </div> 
					<div class="writebox">
	                    <div class="writebox_title">通讯邮寄费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName7" name="communication"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">燃油燃料费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName8" name="fuel"  />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">体育用品购置费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName9" name="sport"  />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">技术服务咨询费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName10" name="service"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">过路过桥费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName11" name="passload"  />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">日用品材料费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName12" name="daily"  />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">业务招待费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName13" name="entertain"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">机动车辆维修费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName14" name="carmodify"  />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">材料测试加工费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName15" name="test"  />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">宣传广告费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName16" name="advertising"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">机动车辆保险费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName17" name="insurance"  />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">设备维修费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName18" name="modify" />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">图书资料版面费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName19" name="book"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">会议会务费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName20" name="meeting"  />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">劳务费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName21" name="labor"  />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title">复印印刷费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName22" name="printing"  />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">培训费：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName23" name="training"   />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">其他：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName24" name="otherfare"  />
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
	                        <input type="text" class="textwrite" id="noName25" name="teacherid" />
	                    </div>
	                </div>  				     				     	
	 				<div class="writebox">
	                    <div class="writebox_title">姓名：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName26" name="teachername" />
	                    </div>
	                </div>  
	 				<div class="writebox">
	                    <div class="writebox_title">转卡金额：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName27" name="cardfare"  />
	                    </div>
	                </div>
	                <div class="writebox">
	                    <div class="writebox_title">建行卡号：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName28" name="card" />
	                    </div>
	                </div>   
                </div>
				<div class="typebox3">  
					<div class="writebox">
	                    <div class="writebox_title">经费主管：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName29" name="projectleader" />
	                    </div>
	                </div>   
	                <%               	
	                	User user=(User)request.getSession().getAttribute("user");
	                %> 
					<div class="writebox">
	                    <div class="writebox_title">经办人：</div>
	                    <div class="writebox_text">
	                        <input type="text" class="textwrite" id="noName30" name="operator" value="<%=user.getUserName() %>" readonly="true" />
	                    </div>
	                </div>
					<div class="writebox">
	                    <div class="writebox_title1">报销日期：</div>
	                    <div class="writebox_text1">
	                        <input type="date"  class="textwrite2" id="noName31" name="operatedate" />
	                    </div>
	                </div>
					<div class="typebox5" style="padding-left:0px;margin-left: -12px;">  
	              		<div >
	              			<input type="file" name="uploadFile"  style="border:1px dotted #ccc;margin-top: 10px;"/>						 
                		</div>                                       						                       
            		</div>
					<div class="typebox5">  
	              		<div class="box260 btn">
                    		<button type="submit" id="save" style="margin-top: 30px;">保存</button>             
              		  	</div>                               
					</div> 							                       
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

function checkProjectId(){
	var partmentinfo=document.getElementById("noNameInf1");
	var projectid = document.getElementById("noName2").value;
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
function checkNumbers(){
	var partmentinfo=document.getElementById("noNameInf1");
	var numbers = document.getElementById("noName3").value;
	
	if (numbers == "" || numbers.length==0 ) 
	{
		partmentinfo.innerHTML =  "单据张数不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < numbers.length; i++) 
		{
			var s = numbers.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "单据张数必须是数字！";
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
function checkOffices(){
	var partmentinfo=document.getElementById("noNameInf1");
	var offices = document.getElementById("noName4").value;
	
	if (offices == "" || offices.length==0 ) 
	{
		partmentinfo.innerHTML =  "办公用品不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < offices.length; i++) 
		{
			var s = offices.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "办公用品必须是数字！";
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
function checkTraffic(){
	var partmentinfo=document.getElementById("noNameInf1");
	var traffic = document.getElementById("noName5").value;
	
	if (traffic == "" || traffic.length==0 ) 
	{
		partmentinfo.innerHTML =  "市内交通费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < traffic.length; i++) 
		{
			var s = traffic.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "市内交通费必须是数字！";
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
function checkAsset(){
	var partmentinfo=document.getElementById("noNameInf1");
	var asset = document.getElementById("noName6").value;
	
	if (asset == "" || asset.length==0 ) 
	{
		partmentinfo.innerHTML =  "固定资产构建费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < asset.length; i++) 
		{
			var s = asset.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "固定资产构建费必须是数字！";
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
function checkCommunication(){
	var partmentinfo=document.getElementById("noNameInf1");
	var communication = document.getElementById("noName7").value;
	
	if (communication == "" || communication.length==0 ) 
	{
		partmentinfo.innerHTML =  "通讯邮寄费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < communication.length; i++) 
		{
			var s = communication.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "通讯邮寄费必须是数字！";
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
function checkFuel(){
	var partmentinfo=document.getElementById("noNameInf1");
	var fuel = document.getElementById("noName8").value;
	
	if (fuel == "" || fuel.length==0 ) 
	{
		partmentinfo.innerHTML =  "燃油燃料费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < fuel.length; i++) 
		{
			var s = fuel.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "燃油燃料费必须是数字！";
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
function checkSport(){
	var partmentinfo=document.getElementById("noNameInf1");
	var sport = document.getElementById("noName9").value;
	
	if (sport == "" || sport.length==0 ) 
	{
		partmentinfo.innerHTML =  "体育用品购置费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < sport.length; i++) 
		{
			var s = sport.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "体育用品购置费必须是数字！";
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
function checkService(){
	var partmentinfo=document.getElementById("noNameInf1");
	var service = document.getElementById("noName10").value;
	
	if (service == "" || service.length==0 ) 
	{
		partmentinfo.innerHTML =  "技术服务咨询费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < service.length; i++) 
		{
			var s = service.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "技术服务咨询费必须是数字！";
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
function checkPassload(){
	var partmentinfo=document.getElementById("noNameInf1");
	var passload = document.getElementById("noName11").value;
	
	if (passload == "" || passload.length==0 ) 
	{
		partmentinfo.innerHTML =  "过路过桥费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < passload.length; i++) 
		{
			var s = passload.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "过路过桥费必须是数字！";
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
function checkDaily(){
	var partmentinfo=document.getElementById("noNameInf1");
	var daily = document.getElementById("noName12").value;
	
	if (daily == "" || daily.length==0 ) 
	{
		partmentinfo.innerHTML =  "日用品材料费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < daily.length; i++) 
		{
			var s = daily.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "日用品材料费必须是数字！";
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
function checkEntertain(){
	var partmentinfo=document.getElementById("noNameInf1");
	var entertain = document.getElementById("noName13").value;
	
	if (entertain == "" || entertain.length==0 ) 
	{
		partmentinfo.innerHTML =  "业务招待费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < entertain.length; i++) 
		{
			var s = entertain.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "业务招待费必须是数字！";
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
function checkCarmodify(){
	var partmentinfo=document.getElementById("noNameInf1");
	var carmodify = document.getElementById("noName14").value;
	
	if (carmodify == "" || carmodify.length==0 ) 
	{
		partmentinfo.innerHTML =  "机动车辆维修费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < carmodify.length; i++) 
		{
			var s = carmodify.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "机动车辆维修费必须是数字！";
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
function checkTest(){
	var partmentinfo=document.getElementById("noNameInf1");
	var test = document.getElementById("noName15").value;
	
	if (test == "" || test.length==0 ) 
	{
		partmentinfo.innerHTML =  "材料测试加工费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < test.length; i++) 
		{
			var s = test.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "材料测试加工费必须是数字！";
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
function checkAdvertising(){
	var partmentinfo=document.getElementById("noNameInf1");
	var advertising = document.getElementById("noName16").value;
	
	if (advertising == "" || advertising.length==0 ) 
	{
		partmentinfo.innerHTML =  "宣传广告费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < advertising.length; i++) 
		{
			var s = advertising.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "宣传广告费必须是数字！";
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
function checkInsurance(){
	var partmentinfo=document.getElementById("noNameInf1");
	var insurance = document.getElementById("noName17").value;
	
	if (insurance == "" || insurance.length==0 ) 
	{
		partmentinfo.innerHTML =  "机动车辆保险费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < insurance.length; i++) 
		{
			var s = insurance.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "机动车辆保险费必须是数字！";
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
function checkModify(){
	var partmentinfo=document.getElementById("noNameInf1");
	var modify = document.getElementById("noName18").value;
	
	if (modify == "" || modify.length==0 ) 
	{
		partmentinfo.innerHTML =  "设备维修费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < modify.length; i++) 
		{
			var s = modify.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "设备维修费必须是数字！";
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
function checkBook(){
	var partmentinfo=document.getElementById("noNameInf1");
	var book = document.getElementById("noName19").value;
	
	if (book == "" || book.length==0 ) 
	{
		partmentinfo.innerHTML =  "图书资料版面费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < book.length; i++) 
		{
			var s = book.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "图书资料版面费必须是数字！";
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
function checkMeeting(){
	var partmentinfo=document.getElementById("noNameInf1");
	var meeting = document.getElementById("noName20").value;
	
	if (meeting == "" || meeting.length==0 ) 
	{
		partmentinfo.innerHTML =  "会议会务费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < meeting.length; i++) 
		{
			var s = meeting.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "会议会务费必须是数字！";
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
function checkLabor(){
	var partmentinfo=document.getElementById("noNameInf1");
	var labor = document.getElementById("noName21").value;
	
	if (labor == "" || labor.length==0 ) 
	{
		partmentinfo.innerHTML =  "劳务费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < labor.length; i++) 
		{
			var s = labor.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "劳务费必须是数字！";
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
function checkPrinting(){
	var partmentinfo=document.getElementById("noNameInf1");
	var printing = document.getElementById("noName22").value;
	
	if (printing == "" || printing.length==0 ) 
	{
		partmentinfo.innerHTML =  "复印印刷费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < printing.length; i++) 
		{
			var s = printing.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "复印印刷费必须是数字！";
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
function checkTraining(){
	var partmentinfo=document.getElementById("noNameInf1");
	var training = document.getElementById("noName23").value;
	
	if (training == "" || training.length==0 ) 
	{
		partmentinfo.innerHTML =  "培训费不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < training.length; i++) 
		{
			var s = training.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "培训费必须是数字！";
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
function checkOtherfare(){
	var partmentinfo=document.getElementById("noNameInf1");
	var otherfare = document.getElementById("noName24").value;
	
	if (otherfare == "" || otherfare.length==0 ) 
	{
		partmentinfo.innerHTML =  "其他不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < otherfare.length; i++) 
		{
			var s = otherfare.toLowerCase().substring(i, i + 1);
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
	var teacherid = document.getElementById("noName25").value;
	
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
function checkTeacherName(){
	var partmentinfo=document.getElementById("noNameInf1");
	var teachername = document.getElementById("noName26").value;
	
	if (teachername == "" || teachername.length==0 ) 
	{
		partmentinfo.innerHTML =  "姓名不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < teachername.length; i++) 
		{
			var s = teachername.toLowerCase().substring(i, i + 1);
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
function checkCardfare(){
	var partmentinfo=document.getElementById("noNameInf1");
	var cardfare = document.getElementById("noName27").value;
	
	if (cardfare == "" || cardfare.length==0 ) 
	{
		partmentinfo.innerHTML =  "转卡金额不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < cardfare.length; i++) 
		{
			var s = cardfare.toLowerCase().substring(i, i + 1);
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
function checkCard(){
	var partmentinfo=document.getElementById("noNameInf1");
	var card = document.getElementById("noName28").value;
	
	if (card == "" || card.length==0 ) 
	{
		partmentinfo.innerHTML =  "建行卡号不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < card.length; i++) 
		{
			var s = card.toLowerCase().substring(i, i + 1);
			if ( !(s >= "0" && s <= "9") ) 
			{
				partmentinfo.innerHTML = "建行卡号必须是数字！";
				partmentinfo.style.color = "red";
				return false;
			} 
			else if(!(card.length==19))
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
function checkProjectLeader(){
	var partmentinfo=document.getElementById("noNameInf1");
	var projectleader = document.getElementById("noName29").value;
	
	if (projectleader == "" || projectleader.length==0 ) 
	{
		partmentinfo.innerHTML =  "经费主管不能为空！";
		partmentinfo.style.color = "red";
		return false;
	}
		else{
			for (var i = 0; i < projectleader.length; i++) 
		{
			var s = projectleader.toLowerCase().substring(i, i + 1);
			if ((s >= 0 && s <= 9) || (s >= "a" && s <= "z") || (s == "_")) 
			{
				partmentinfo.innerHTML = "经费主管不能包含字母、数字和下划线";
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
function checkOperateDate(){
	var partmentinfo=document.getElementById("noNameInf1");
	var operatedate = document.getElementById("noName31").value;
	
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
			Flag=checkPartment()&&checkProjectId()&&checkNumbers()&&checkOffices()
			&&checkTraffic()&&checkAsset()&&checkCommunication()&&checkFuel()&&
			checkSport()&&checkService()&&checkPassload()&&checkDaily()&&checkEntertain()
			&&checkCarmodify()&&checkTest()&&checkAdvertising()&&checkInsurance()&&
			checkModify()&&checkBook()&&checkMeeting()&&checkLabor()&&checkPrinting()&&
			checkTraining()&&checkOtherfare()&&checkTeacherId()&&checkTeacherName()&&
			checkCardfare()&&checkCard()&&checkProjectLeader()&&checkOperateDate();
			if(Flag){
				$("#expense").attr("action", "/demo/expense/create")
				$("#expense").submit();
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