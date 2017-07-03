<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=basePath%>">
<link href="<%=basePath%>css/model1.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/commonNew.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/myMY.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>css/loPrCenter.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
    <title>Charts</title>
    <!--从当前页面，引入模块加载器esl.js-->
    <script type="text/javascript" src="<%=basePath%>js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/esl.js"></script>
    
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

		<a href="/demo/travelexpense/check" property="inpage">
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
					<div class="content_rightbox11">图形查看 <span style="font-size:12px">(单位:元)</span></div>
				</div>	
				<div class="content_rightbox3">
				<a href="/demo/user/print"><input type="button" value="导出报表" id="out" class="butt"></a>
			</div>			
			</div>
			
			<div class="content_rightbox4">	
				<div id="main" style="height:400px"></div>
    <script type="text/javascript">
        // 为模块加载器配置echarts的路径，从当前页面链接到echarts.js，定义所需的图表路径
        require.config({
            paths:{ 
                'echarts' : 'http://localhost:8080/demo/js/echarts',
                'echarts/chart/bar' : 'http://localhost:8080/demo/js/echarts'
            }
        });
        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var c_eva;             //类型信息
		        var c_rain;                //软板块销售数据
		        var c_avgt;               //网板块销售数据
		        $.ajax({
		            url: "<%=basePath%>view/",
		            async: false,
		            type: 'POST',
		            dataType: 'json',
		            timeout: 1000,
		            cache: false,
		            success: function (data) { 
		                  //成功时执行的回调方法
		                c_eva = data.c_eva;
		                c_rain = data.c_rain;
		                c_avgt = data.c_avgt;
		            },
		            error: erryFunction                 //错误时执行方法
		        });
		
		
		        function erryFunction() {
		            alert("数据没返回成功！");
		        };
        
        
                var myChart = ec.init(document.getElementById('main')); 
                
                var   option = {
                        tooltip : {
                            trigger: 'axis',
                            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                            }
                        },
                        legend: {
                            data:['已报销额', '剩余可报销额']
                        },
                        grid: {
                            left: '3%',
                            right: '4%',
                            bottom: '3%',
                            containLabel: true
                        },
                        xAxis : [
                            {
                                type : 'value',
                                splitNumber:15,
                                min: -3000,
                                max: 3000
                            }
                        ],
                        yAxis : [
                            {
                                type : 'category',
                                axisTick : {show: false},
                                data : c_eva
                            }
                        ],
                        series : [
                            {
                                name:'已报销额',
                                type:'bar',
                                stack: '总量',
                                label: {
                                    normal: {
                                        show: true
                                    }
                                },
                                data:c_rain
                            },
                            {
                                name:'剩余可报销额',
                                type:'bar',
                                stack: '总量',
                                label: {
                                    normal: {
                                        show: true,                              
                                    }
                                },
                                data:c_avgt
                            }
                        ]
                    };
        
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        );
    </script>
				</div>				
			</div>
		</div>
</body>
</html>