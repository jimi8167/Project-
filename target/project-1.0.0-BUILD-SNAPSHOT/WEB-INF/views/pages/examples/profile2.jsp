<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 3 | User Profile</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

<style type="text/css">
.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em;
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

/* imaged preview */
.filebox .upload-display {
	margin-bottom: 5px;
}

@media ( min-width : 768px) {
	.filebox .upload-display {
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 0;
	}
}

.filebox .upload-thumb-wrap {
	display: inline-block;
	width: 54px;
	padding: 2px;
	vertical-align: middle;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.filebox .upload-display img {
	display: block;
	max-width: 100%;
	width: 100% \9;
	height: auto;
}

.filebox.bs3-primary label {
	color: #fff;
	background-color: #337ab7;
	border-color: #2e6da4;
}
</style>
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!-- Navbar -->
		<%@include file="../../include/nav.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>나의 밴드</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">User Profile</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-3">

							<!-- Profile Image -->
							<div class="card card-primary card-outline">
								<div class="card-body box-profile">
									<div class="text-center">
										<img class="profile-user-img img-fluid img-circle" src="/resources/media/${band.bandFile}" alt="User profile picture" onerror="javascript:this.src = '/resources/img/_Unknown.webp' ">
									</div>


									<h3 class="profile-username text-center">${band.bandName}</h3>

									<p class="text-muted text-center">${band.bandInfo}</p>

									<!-- <ul class="list-group list-group-unbordered mb-3">
										<li class="list-group-item"><b>멤버 수</b> <a id="followNUM" class="float-right">1,322</a></li>
									</ul> -->





									<c:if test="${not empty sessionScope.principal}">
										<c:if test="${sessionScope.principal.userId ne band.userId}">
											<input type="hidden" value="${band.userId }" id="toId">
											<c:if test="${ empty FollowStatus  }">
												<button id="follow--btn" class="btn btn-primary btn-block" value="${sessionScope.principal.userId}">
													<b>Follow</b>
												</button>
												<%-- 'FollowStatus' : ${FollowStatus} <br />
											'FollowStatus[0].toId' : ${FollowStatus[0].toId}<br /> --%>
											</c:if>


											<c:set var="doneLoop" value="false" />


											<c:forEach items="${FollowStatus}" var="FollowId">
												<%-- Just FollowStatus is : ${FollowId}<br />
												1 : ${FollowId.toId } <br />
												1': ${band.userId } <br />
												2 : ${FollowId.fromId } <br />
												2': ${sessionScope.principal.userId} <br /> --%>



												<%-- <c:if test="${not loop_flag}"> --%>
												<c:choose>
													<c:when test="${FollowId.toId eq band.userId && FollowId.fromId eq sessionScope.principal.userId}">
														<button id="unfollow--btn" class="btn btn-outline-secondary btn-block" value="${sessionScope.principal.userId}">
															<b>Following</b>
														</button>

													</c:when>
													<c:otherwise>

														<%-- <c:set var="loop_flag" value="true" /> --%>
													</c:otherwise>
												</c:choose>
												<%-- </c:if> --%>
											</c:forEach>
										</c:if>
									</c:if>


								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->

							<!-- About Me Box -->
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">공지사항</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<p>
										<strong><i class="far fa-file-alt mr-1"></i> Notes</strong>
									</p>

									<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
						<div class="col-md-9">
							<div class="card">
								<div class="card-header p-2">
									<ul class="nav nav-pills">
										<li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">게시판</a></li>
										<li class="nav-item"><a class="nav-link" href="/band/calendar/${band.bandId}">일정</a></li>



										<c:if test="${sessionScope.principal.userId eq band.userId}">

											<li class="nav-item"><a class="nav-link" href="#settings" data-toggle="tab">수정</a></li>
										</c:if>


									</ul>
								</div>

								<!-- /.card-header -->




								<div class="card-body">
									<div class="tab-content">
										<div class="active tab-pane" id="activity">
											<!-- Post -->
											<div class="post">
												<div class="user-block">
													<img class="img-circle img-bordered-sm" src="/resources/dist/img/user1-128x128.jpg" alt="user image"> <span class="username"> <a href="#">Jonathan Burke Jr.</a> <a href="#"
														class="float-right btn-tool"><i class="fas fa-times"></i></a>
													</span> <span class="description">Shared publicly - 7:30 PM today</span>
												</div>
												<!-- /.user-block -->
												<p>Lorem ipsum represents a long-held tradition for designers, typographers and the like. Some people hate it and argue for its demise, but others ignore the hate as they create
													awesome tools to help create filler text for everyone from bacon lovers to Charlie Sheen fans.</p>

												<p>
													<a href="#" class="link-black text-sm mr-2"><i class="fas fa-share mr-1"></i> Share</a> <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i> Like</a> <span
														class="float-right"> <a href="#" class="link-black text-sm"> <i class="far fa-comments mr-1"></i> Comments (5)
													</a>
													</span>
												</p>

												<input class="form-control form-control-sm" type="text" placeholder="Type a comment">
											</div>
											<!-- /.post -->

											<!-- Post -->
											<div class="post clearfix">
												<div class="user-block">
													<img class="img-circle img-bordered-sm" src="/resources/dist/img/user7-128x128.jpg" alt="User Image"> <span class="username"> <a href="#">Sarah Ross</a> <a href="#"
														class="float-right btn-tool"><i class="fas fa-times"></i></a>
													</span> <span class="description">Sent you a message - 3 days ago</span>
												</div>
												<!-- /.user-block -->
												<p>Lorem ipsum represents a long-held tradition for designers, typographers and the like. Some people hate it and argue for its demise, but others ignore the hate as they create
													awesome tools to help create filler text for everyone from bacon lovers to Charlie Sheen fans.</p>

												<form class="form-horizontal">
													<div class="input-group input-group-sm mb-0">
														<input class="form-control form-control-sm" placeholder="Response">
														<div class="input-group-append">
															<button type="submit" class="btn btn-danger">Send</button>
														</div>
													</div>
												</form>
											</div>
											<!-- /.post -->

											<!-- Post -->
											<div class="post">
												<div class="user-block">
													<img class="img-circle img-bordered-sm" src="/resources/dist/img/user6-128x128.jpg" alt="User Image"> <span class="username"> <a href="#">Adam Jones</a> <a href="#"
														class="float-right btn-tool"><i class="fas fa-times"></i></a>
													</span> <span class="description">Posted 5 photos - 5 days ago</span>
												</div>
												<!-- /.user-block -->
												<div class="row mb-3">
													<div class="col-sm-6">
														<img class="img-fluid" src="/resources/dist/img/photo1.png" alt="Photo">
													</div>
													<!-- /.col -->
													<div class="col-sm-6">
														<div class="row">
															<div class="col-sm-6">
																<img class="img-fluid mb-3" src="/resources/dist/img/photo2.png" alt="Photo"> <img class="img-fluid" src="/resources/dist/img/photo3.jpg" alt="Photo">
															</div>
															<!-- /.col -->
															<div class="col-sm-6">
																<img class="img-fluid mb-3" src="/resources/dist/img/photo4.jpg" alt="Photo"> <img class="img-fluid" src="/resources/dist/img/photo1.png" alt="Photo">
															</div>
															<!-- /.col -->
														</div>
														<!-- /.row -->
													</div>
													<!-- /.col -->
												</div>
												<!-- /.row -->

												<p>
													<a href="#" class="link-black text-sm mr-2"><i class="fas fa-share mr-1"></i> Share</a> <a href="#" class="link-black text-sm"><i class="far fa-thumbs-up mr-1"></i> Like</a> <span
														class="float-right"> <a href="#" class="link-black text-sm"> <i class="far fa-comments mr-1"></i> Comments (5)
													</a>
													</span>
												</p>

												<input class="form-control form-control-sm" type="text" placeholder="Type a comment">
											</div>
											<!-- /.post -->
										</div>
										<!-- /.tab-pane -->


										<div class="tab-pane" id="settings">
											<form class="form-horizontal" action="/band/update/${band.bandId}" method="POST" enctype="multipart/form-data">

												<input type="hidden" id="bandId" name="bandId" value="${band.bandId}">

												<div class="form-group row">
													<label for="bandName" class="col-sm-2 col-form-label">밴드 이름</label>
													<div class="col-sm-10">
														<input name="bandName" type="text" class="form-control" value="${band.bandName}" id="bandName" placeholder="${band.bandName}">
													</div>
												</div>

												<div class="form-group row">
													<label for="bandInfo" class="col-sm-2 col-form-label">밴드 소개</label>
													<div class="col-sm-10">
														<textarea name="bandInfo" class="form-control" id="bandInfo">${band.bandInfo }</textarea>
													</div>
												</div>
												<div class="form-group">
													<!-- <div class="btn btn-default btn-file">
														<i class="fas fa-paperclip"></i> Attachment <input type="file" name="bandFile">
													</div> --> 
													
													<!-- 업로드 빌려온거 -->
													<div class="filebox bs3-primary preview-image">
														<input type="file" id="input_file" class="upload-hidden" name="bandFile"> <label for="input_file"><i class="fas fa-paperclip"></i> Attachment</label> <input class="upload-name"
															value="파일선택" disabled="disabled" style="width: 200px;">

													</div>
													<!-- 업로드 빌려온거 -->
													<p class="help-block">Max. 32MB</p>
													



													<!-- <div class="card-footer bg-white">
														<ul
															class="mailbox-attachments d-flex align-items-stretch clearfix">
															<li><span class="mailbox-attachment-icon"><i
																	class="far fa-file-pdf"></i></span>

																<div class="mailbox-attachment-info">
																	<a href="#" class="mailbox-attachment-name"><i
																		class="fas fa-paperclip"></i> Sep2014-report.pdf</a> <span
																		class="mailbox-attachment-size clearfix mt-1">
																		<span>1,245 KB</span> <a href="#"
																		class="btn btn-default btn-sm float-right"><i
																			class="fas fa-cloud-download-alt"></i></a>
																	</span>
																</div></li>
															<li><span class="mailbox-attachment-icon"><i
																	class="far fa-file-word"></i></span>

																<div class="mailbox-attachment-info">
																	<a href="#" class="mailbox-attachment-name"><i
																		class="fas fa-paperclip"></i> App Description.docx</a> <span
																		class="mailbox-attachment-size clearfix mt-1">
																		<span>1,245 KB</span> <a href="#"
																		class="btn btn-default btn-sm float-right"><i
																			class="fas fa-cloud-download-alt"></i></a>
																	</span>
																</div></li>
															<li><span class="mailbox-attachment-icon has-img"><img
																	src="/resources/dist/img/photo1.png" alt="Attachment"></span>

																<div class="mailbox-attachment-info">
																	<a href="#" class="mailbox-attachment-name"><i
																		class="fas fa-camera"></i> photo1.png</a> <span
																		class="mailbox-attachment-size clearfix mt-1">
																		<span>2.67 MB</span> <a href="#"
																		class="btn btn-default btn-sm float-right"><i
																			class="fas fa-cloud-download-alt"></i></a>
																	</span>
																</div></li>
															<li><span class="mailbox-attachment-icon has-img"><img
																	src="/resources/dist/img/photo2.png" alt="Attachment"></span>

																<div class="mailbox-attachment-info">
																	<a href="#" class="mailbox-attachment-name"><i
																		class="fas fa-camera"></i> photo2.png</a> <span
																		class="mailbox-attachment-size clearfix mt-1">
																		<span>1.9 MB</span> <a href="#"
																		class="btn btn-default btn-sm float-right"><i
																			class="fas fa-cloud-download-alt"></i></a>
																	</span>
																</div></li>
														</ul>
													</div> -->
												</div>
												<div class="form-group row">
													<div class="offset-sm-2 col-sm-10">
														<div class="checkbox">
															<label> <input type="checkbox" value="true" name="agree"> I agree to the <a href="#">terms and conditions</a>
															</label>
														</div>
													</div>
												</div>
												<div class="form-group row">
													<div class="offset-sm-2 col-sm-10"></div>
												</div>
												<button type="submit" class="btn btn-danger" id="band--Updatd--submit">완료</button>


											</form>


										</div>
										<!-- /.tab-pane -->
									</div>
									<!-- /.tab-content -->
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.nav-tabs-custom -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<div class="float-right d-none d-sm-block">
				<b>Version</b> 3.0.2
			</div>
			<strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="/resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/resources/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/resources/dist/js/demo.js"></script>

	<script type="text/javascript">
		/*follow -> unfollow */

		$('#follow--btn')
				.on(
						'click',
						function() {
							var data = {
								fromId : $('#follow--btn').val(),
								toId : $('#toId').val(),
								bandId : $('#bandId').val()
							}

							var bandId = $('#bandId').val()

							$button = $(this);

							if ($button
									.hasClass('btn btn-outline-secondary btn-block')) {
								/* Do Unfollow  */

								$
										.ajax(
												{
													type : 'delete',
													url : '/unfollow/'
															+ data.fromId,
													data : JSON.stringify(data),
													contentType : "application/json; charset=utf-8",
													dataType : 'json'
												})
										.done(
												function(r) {
													if (r.statusCode == 200) {
														alert('언팔로우 성공');

														$button
																.removeClass('btn btn-outline-secondary btn-block');
														$button
																.removeClass('btn-secondary Unfollow');
														$button
																.addClass('btn btn-primary btn-block');
														$button.text('Follow');

													} else {
														alert('11언팔로우 실패');
													}
												}).fail(function(r) {
											alert('22언팔로우 실패');
										});

							} else {
								/*Do Follow  */

								$
										.ajax(
												{
													type : 'POST',
													url : '/follow/'
															+ data.fromId,
													data : JSON.stringify(data),
													contentType : "application/json; charset=utf-8",
													dataType : 'json'
												})
										.done(
												function(r) {
													if (r.statusCode == 200) {
														alert('팔로우 성공1');
														$button
																.removeClass('btn btn-primary btn-block');

														$button
																.addClass('btn btn-outline-secondary btn-block');
														/*alert-light Following  */
														$button
																.text('Following');

													} else {
														alert('팔로우 실패1');
													}
												}).fail(function(r) {
											alert('팔로우 실패22');
										});

							}

						});

		$('#follow--btn').hover(function() {
			$button = $(this);
			if ($button.hasClass('btn btn-outline-secondary btn-block')) {
				/* alert-light Following  */
				$button.addClass('btn-secondary Unfollow');
				$button.text('Unfollow');
			}
		}, function() {
			if ($button.hasClass('btn btn-outline-secondary btn-block')) {
				$button.removeClass('btn-secondary Unfollow');
				$button.text('Following');
			}
		});
		/*follow -> unfollow 끝 */

		/*Unfollow -> follow 시작*/

		$('#unfollow--btn')
				.on(
						'click',
						function() {
							var data = {
								fromId : $('#unfollow--btn').val(),
								toId : $('#toId').val(),
								bandId : $('#bandId').val()
							}

							var bandId = $('#bandId').val()

							$button = $(this);

							if ($button
									.hasClass('btn btn-outline-secondary btn-block')) {
								/* Do Unfollow  */

								$
										.ajax(
												{
													type : 'delete',
													url : '/unfollow/'
															+ data.fromId,
													data : JSON.stringify(data),
													contentType : "application/json; charset=utf-8",
													dataType : 'json'
												})
										.done(
												function(r) {
													if (r.statusCode == 200) {
														alert('언팔로우 성공2');
														/* alert-light Following   */

														$button
																.removeClass('btn btn-outline-secondary btn-block');
														$button
																.removeClass('btn-secondary Unfollow');
														$button
																.addClass('btn btn-primary btn-block');
														$button.text('Follow');

													} else {
														alert('11언팔로우 실패');
													}
												}).fail(function(r) {
											alert('22언팔로우 실패');
										});

							} else {
								/*Do Follow  */

								$
										.ajax(
												{
													type : 'POST',
													url : '/follow/'
															+ data.fromId,
													data : JSON.stringify(data),
													contentType : "application/json; charset=utf-8",
													dataType : 'json'
												})
										.done(
												function(r) {
													if (r.statusCode == 200) {
														alert('팔로우 성공2');
														/* $button.attr('id','unfollow--btn') */
														$button
																.removeClass('btn btn-primary btn-block');
														$button
																.addClass('btn btn-outline-secondary btn-block');

														$button
																.text('Following');

													} else {
														alert('팔로우 실패1');
													}
												}).fail(function(r) {
											alert('팔로우 실패22');
										});

							}

						});

		$('#unfollow--btn').hover(function() {
			$button = $(this);
			if ($button.hasClass('btn btn-outline-secondary btn-block')) {
				$button.addClass('btn btn-secondary Unfollow');
				$button.text('Unfollow');
			}
		}, function() {
			if ($button.hasClass('btn btn-outline-secondary btn-block')) {
				$button.removeClass('btn-secondary Unfollow');
				$button.text('Following').bold();
			}
		});

		/* Unfollow -> follow 끝  */

		$('#followNUM').on('click', function() {
			var data = {
				fromId : $('#follow--btn').val(),
				toId : $('#toId').val()
			}
			alert(data.fromId)
			alert(data.toId)

			$.ajax({
				type : 'POST',
				url : '/follow/' + data.fromId,
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				dataType : 'json'
			}).done(function(r) {
				if (r.statusCode == 200) {
					alert('팔로우 성공');
					/* $('#follow--btn').style.backgroundColor='red'; */
					$("#follow--btn").attr("disabled", "disabled");
					/* location.href = '/'; */
				} else {
					alert('팔로우 실패');
				}
			}).fail(function(r) {
				alert('팔로우 실패');
			});

		});

		$(document)
				.ready(
						function() {
							//첨부파일
							var fileTarget = $('.filebox .upload-hidden');

							fileTarget.on('change', function() {
								if (window.FileReader) {
									// 파일명 추출
									var filename = $(this)[0].files[0].name;
								}

								else {
									// Old IE 파일명 추출
									var filename = $(this).val().split('/')
											.pop().split('\\').pop();
								}
								;

								$(this).siblings('.upload-name').val(filename);
							});

							//preview image 
							var imgTarget = $('.preview-image .upload-hidden');

							imgTarget
									.on(
											'change',
											function() {
												var parent = $(this).parent();
												parent.children(
														'.upload-display')
														.remove();

												if (window.FileReader) {
													//image 파일만
													if (!$(this)[0].files[0].type
															.match(/image\//))
														return;

													var reader = new FileReader();
													reader.onload = function(e) {
														var src = e.target.result;
														parent
																.append('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
													}
													reader
															.readAsDataURL($(this)[0].files[0]);
												}

												else {
													$(this)[0].select();
													$(this)[0].blur();
													var imgSrc = document.selection
															.createRange().text;
													parent
															.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

													var img = $(this).siblings(
															'.upload-display')
															.find('img');
													img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
															+ imgSrc + "\")";
												}
											});

						});
	</script>


</body>
</html>