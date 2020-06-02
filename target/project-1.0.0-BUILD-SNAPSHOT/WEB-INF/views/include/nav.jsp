<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<nav class="main-header navbar navbar-expand navbar-white navbar-light">
	<!-- Left navbar links -->
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" data-widget="pushmenu" href="/"><i class="fas fa-bars"></i></a></li>
		<li class="nav-item d-none d-sm-inline-block"><a href="/list" class="nav-link">Home</a></li>
		<%-- <c:if test="${not empty sessionScope.principal }">
			<li class="nav-item d-none d-sm-inline-block"><a href="/follow/contacts/${sessionScope.principal.userId }" class="nav-link">Contact</a></li>
		</c:if> --%>
	</ul>

	<!-- SEARCH FORM -->
	<form class="form-inline ml-3" role="form" method="get" action="/band/searchMyBandByTitle${pageMaker.makeQueryPage(pageMaker.cri.page)}" >
		<div class="input-group input-group-sm">
			<select class="form-control" name="searchType">
				<option value="n" <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
				<option value="t" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>title</option>
				<option value="c" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>contents</option>
				<option value="w" <c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>host</option>
				<option value="tc" <c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>title+contents</option>
			</select> <br /> 
			<input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search" name="keyword">
			<div class="input-group-append">
				<button class="btn btn-navbar" type="submit">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</div>
	</form>

	<!-- Right navbar links -->
	<ul class="navbar-nav ml-auto">
		<!-- Messages Dropdown Menu -->
		<li class="nav-item dropdown"><a class="nav-link" data-toggle="dropdown" href="#"> <i class="far fa-comments"></i> <span class="badge badge-danger navbar-badge">3</span>
		</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
				<a href="#" class="dropdown-item"> <!-- Message Start -->
					<div class="media">
						<img src="/resources/dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
						<div class="media-body">
							<h3 class="dropdown-item-title">
								Brad Diesel <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
							</h3>
							<p class="text-sm">Call me whenever you can...</p>
							<p class="text-sm text-muted">
								<i class="far fa-clock mr-1"></i> 4 Hours Ago
							</p>
						</div>
					</div> <!-- Message End -->
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <!-- Message Start -->
					<div class="media">
						<img src="/resources/dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
						<div class="media-body">
							<h3 class="dropdown-item-title">
								John Pierce <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
							</h3>
							<p class="text-sm">I got your message bro</p>
							<p class="text-sm text-muted">
								<i class="far fa-clock mr-1"></i> 4 Hours Ago
							</p>
						</div>
					</div> <!-- Message End -->
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <!-- Message Start -->
					<div class="media">
						<img src="/resources/dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
						<div class="media-body">
							<h3 class="dropdown-item-title">
								Nora Silvester <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
							</h3>
							<p class="text-sm">The subject goes here</p>
							<p class="text-sm text-muted">
								<i class="far fa-clock mr-1"></i> 4 Hours Ago
							</p>
						</div>
					</div> <!-- Message End -->
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
			</div></li>
		<!-- Notifications Dropdown Menu -->
		<li class="nav-item dropdown"><a class="nav-link" data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span class="badge badge-warning navbar-badge">15</span>
		</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
				<span class="dropdown-item dropdown-header">15 Notifications</span>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <i class="fas fa-envelope mr-2"></i> 4 new messages <span class="float-right text-muted text-sm">3 mins</span>
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <i class="fas fa-users mr-2"></i> 8 friend requests <span class="float-right text-muted text-sm">12 hours</span>
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i> 3 new reports <span class="float-right text-muted text-sm">2 days</span>
				</a>
				<div class="dropdown-divider"></div>
				<a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#"> <i class="fas fa-th-large"></i>
		</a></li>
	</ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="/list" class="brand-link"> <img src="/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8"> <span
		class="brand-text font-weight-light"> <b>Welcome </b>
	</span> <c:choose>
			<c:when test="${not empty sessionScope.principal }">
				<i class="fas fa-toggle-on"></i>
			</c:when>
			<c:otherwise>
				<i class="fas fa-toggle-off mx-9"></i>

			</c:otherwise>
		</c:choose>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image"></div>
			<div class="info">
				<c:choose>
					<c:when test="${not empty sessionScope.principal }">
						<a href="#" class="d-block"><h1>${principal.username }</h1></a>
					</c:when>
					<c:otherwise>
						<a class="btn btn-warning text-dark d-flex align-items-center " href="/user/login"><span>LOGIN</span></a>

					</c:otherwise>

				</c:choose>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

				<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->



				<c:if test="${not empty sessionScope.principal }">
					<li class="nav-item"><a href="/band/create" class="nav-link"> <i class="nav-icon fas fa-plus-circle"></i>
							<p>Create</p>
					</a></li>
					<li class="nav-item"><a href="/band/search" class="nav-link"> <i class="nav-icon fas fa-search"></i>
							<p>Search</p>
					</a></li>
					<li class="nav-item"><a href="/band/myband/${principal.userId}" class="nav-link"> <!-- pages/examples/profile.jsp --> <i class="nav-icon fas fa-spa"></i>
							<p>My Band</p>
					</a></li>


					<li class="nav-item">
						<%-- 
						<c:set var="band" target="${band}"  property="bandId" scope="session"/>
						<c:set var="band" value="<%=new RespBandandUsername.getBandId() %>"  property="bandId" scope="session"/> --%> <a href="/band/followingBand/${principal.userId}" class="nav-link"> <!-- pages/examples/profile.jsp -->
							<i class="nav-icon fas fa-spa"></i>
							<p>Following Band</p>
					</a>

					</li>

					<!-- 
						<li class="nav-item"><a href="/band/calendar"
							class="nav-link"> <i class="nav-icon far fa-calendar-alt"></i>
								<p>
									Calendar <span class="badge badge-info right">2</span>
								</p>
						</a></li> -->

					<li class="nav-item" style="height: 200px;"><a href="/follow/contacts/${principal.userId }" class="nav-link"> <i class="nav-icon fas fa-address-book"></i>
							<p>Contacts</p>
					</a></li>
					<a class="btn btn-warning text-dark " href="/user/logout"><span>LOGOUT</span></a>

				</c:if>




			</ul>

			</ul>
			</li>

			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>