<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>首页</title>
	<!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/jslib/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 自定义样式 -->
    <link href="${pageContext.request.contextPath}/user/css/index.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/jslib/jQuery/jquery-1.11.3.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/jslib/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <!-- bootstrap-notify -->
    <script src="${pageContext.request.contextPath}/jslib/bootstrap-notify/bootstrap-notify.min.js"></script>
    <!-- angularjs -->
     <script src="${pageContext.request.contextPath}/jslib/AngularJS-1.4.6/angular.min.js"></script>
    <!-- 必须的公共JS -->
    <script src="${pageContext.request.contextPath}/user/js/common.js"></script>
    <!-- 自定义JS -->
    <script src="${pageContext.request.contextPath}/user/js/index.js"></script>
    <!-- html5shiv.js和Respond.js为IE8提供HTML5元素以及媒体查询的支持 -->
    <!--[if lt IE 11]>
    	<script src="js/belowIE11.js"></script>
    <![endif]-->
      <!--  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>-->
</head>
<body>
	<!-- 整个页面外层container -->
	<div class="container">
		<!-- 公用的导航栏 -->
		<jsp:include page="./common_head.jsp"></jsp:include>
		<!-- 测试标题 -->
		<p class="lead" id="indexTitle">欢迎进入mysshba系统</p>
		<div id="index-content">
			
			<div class="form-group" ng-app="">
	          <div class="col-sm-3"></div>
	          <label style="top: 5px;right: -2rem;width: 7rem;" class="col-sm-1 control-label codeSubmitLabel" >请输入:</label>
			  <div class="col-sm-4">
				  <input type="text" class="form-control" id="username-input" aria-describedby="basic-addon2"  ng-model="name">
				   <h1>{{name}}</h1>
			   </div>
		   </div>
		</div>	
		<!-- 提示下载浏览器的弹出框 -->
		<div class="modal fade" id = "downloadModal">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">下载新浏览器</h4>
		      </div>
		      <div class="modal-body">
		        <p class="warningText">你的IE浏览器版本太低，本系统部分功能无法正常使用，请下载安装新浏览器再访问。</p>
		        <p class="warningText">是否下载新的浏览器？</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		       	<a type="button" class="btn btn-primary" href="${pageContext.request.contextPath}/resources/360.exe">下载</a>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
</body>
</html>