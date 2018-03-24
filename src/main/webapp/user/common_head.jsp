<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="edu.dhu.pageModel.SessionInfo"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="userId" value="${sessionScope.sessionInfo.userId}" />
<script type="text/javascript">
	// 获取路径
	var ctx = '${ctx}';
	var loginUserId = '${userId}';
</script>

<!-- 登录Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title text-center" id="loginModalLabel">登录</h4>
			</div>
			<div class="modal-body">
				<form>
					<div class="input-group form-group" id="usernameInputGroup">
						<span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span> 
						<input type="text" class="form-control" id="username" placeholder="用户名" aria-describedby="basic-addon1">
					</div>
					<div class="input-group form-group" id="passwordInputGroup">
						<span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span> 
						<input type="password" class="form-control" id="password" placeholder="请输入密码" aria-describedby="basic-addon1">
					</div>
					<div>
						<p style="margin:0 0 0 0";><span id="ray" style="color:red;">&nbsp;</span></p>
					</div>
					<button type="button" class="btn btn-info navbar-left-btn" id="loginModelLoginBtn">登录</button>&nbsp;&nbsp;&nbsp;&nbsp;
					
				</form>
			</div>
		</div>
	</div>
</div>

<!--最上面的响应式导航栏-->
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		
		<input id ="uid" type="hidden" value="${sessionScope.sessionInfo.userId}"/>
		<div class="collapse navbar-collapse navbar-responsive-collapse">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/user/index.jsp">首页</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">帮助 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">公司简介</a></li>
						<li><a href="#">发展历程</a></li>
						<li><a href="#">关于我们</a></li>
					</ul>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right" id="navbarRightBtns">
				<%
					SessionInfo sessionInfo = (SessionInfo)session.getAttribute("sessionInfo");
					if(sessionInfo == null) {
				    
	            %>
				<li>
					<button type="button" class="btn btn-info navbar-right-btn" id="loginBtn" data-toggle="modal" data-target="#loginModal">登录</button>
				</li>
				<%//out.close();
	          } 
					else {
					   
	           	%>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionInfo.chineseName} <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="text-center"><a href="#"><span class="glyphicon glyphicon-cog"></span> 个人设置</a></li>
					</ul>
				</li>
				<%
	                } 
	            %>
			</ul>
           
		</div>
	</div>
</div>
