<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="header" id="header">
     <div class="container">
         <div class="row">
             <div class="col-sm-12 overflow">
                <div class="social-icons pull-right">
                     <ul class="nav nav-pills">
							<c:if test="${pageContext.request.userPrincipal.name != null}">
		                       <form:form action="${pageContext.request.contextPath }/logout" method="POST">
		                          <b>${pageContext.request.userPrincipal.name }</b>님 안녕하세요
		                          <button type="submit" class = "btn btn-sm btn-default">LOGOUT</button>
		                       </form:form>
		                    </c:if>
		                    <c:if test="${pageContext.request.userPrincipal.name ==null}">
		                       <li><a href="/member/logIn"><h5><b><x>Login</x></b></h5></a></li>
		                       <li><a href="/member/signIn"><h5><b><x>SignIn</x></b></h5></a></li>
		                    </c:if>                        
		         	</ul>
                 </div>
             </div>
          </div>
     </div>
     <div class="navbar navbar-inverse" role="banner">
         <div class="container">
             <div class="navbar-header">
                 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                     <span class="sr-only">Toggle navigation</span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                 </button>

                 <a class="navbar-brand" href="/">
                     <h1><img src="/SKHUBooks/resources/bootstrap/images/logo.PNG" alt="logo"></h1>
                 </a>

             </div>
             <div class="collapse navbar-collapse">
                 <ul class="nav navbar-nav navbar-left">
                     <li class="active"><a href="/"><h3><b><x>Home</x></b></h3></a></li>
                     <li class="dropdown"><a><h3><b><p>공지사항<i class="fa fa-angle-down "></i></p></b></h3></a>
                       <ul role="menu" class="sub-menu">
                           <li><a href="/board/boardList?board_category=1">카테고리1</a></li>
                           <li><a href="/board/boardList?board_category=2">카테고리2</a></li>
                       </ul></li>

                 </ul>
             </div>
            </div>
         </div>
</header>



