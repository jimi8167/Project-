<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 3 | Calendar</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">

<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

<!-- fullCalendar -->
<link rel="stylesheet" href="/resources/plugins/fullcalendar/main.min.css">
<link rel="stylesheet" href="/resources/plugins/fullcalendar-daygrid/main.min.css">
<link rel="stylesheet" href="/resources/plugins/fullcalendar-timegrid/main.min.css">
<link rel="stylesheet" href="/resources/plugins/fullcalendar-bootstrap/main.min.css">

<!-- Theme style -->
<link rel="stylesheet" href="/resources/dist/css/adminlte.min.css">

<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

<style type="text/css">
.require {
	color: red;
}
</style>





</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!-- Navbar -->
		<%@ include file="../../include/nav.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Calendar</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Calendar</li>
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
							<div class="sticky-top mb-3">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Draggable Events</h4>
									</div>
									<div class="card-body">
										<!-- the events -->
										<div id="external-events">
											<div class="external-event bg-success">Lunch</div>
											<div class="external-event bg-warning">Go home</div>
											<div class="external-event bg-info">Do homework</div>
											<div class="external-event bg-primary">Work on UI design</div>
											<div class="external-event bg-danger">Sleep tight</div>
											<div class="checkbox">
												<label for="drop-remove"> <input type="checkbox" id="drop-remove"> remove after drop
												</label>
											</div>
										</div>
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /.card -->
								<div class="card">
									<div class="card-header">
										<h3 class="card-title">Create Event</h3>
									</div>
									<div class="card-body">
										<div class="btn-group" style="width: 100%; margin-bottom: 10px;">
											<!--<button type="button" id="color-chooser-btn" class="btn btn-info btn-block dropdown-toggle" data-toggle="dropdown">Color <span class="caret"></span></button>-->
											<ul class="fc-color-picker" id="color-chooser">
												<li><a class="text-primary" href="#"><i class="fas fa-square"></i></a></li>
												<li><a class="text-warning" href="#"><i class="fas fa-square"></i></a></li>
												<li><a class="text-success" href="#"><i class="fas fa-square"></i></a></li>
												<li><a class="text-danger" href="#"><i class="fas fa-square"></i></a></li>
												<li><a class="text-muted" href="#"><i class="fas fa-square"></i></a></li>
											</ul>
										</div>
										<!-- /btn-group -->
										<div class="input-group">
											<input id="new-event" type="text" class="form-control" placeholder="Event Title">
											<!-- <div class="input-group-append">
												<button id="add-new-event" type="button"
													class="btn btn-primary">Add</button>
											</div> -->
											<!-- /btn-group -->
										</div>
										<!-- /input-group -->
									</div>
								</div>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-md-9">
							<div class="card card-primary">
								<div class="card-body p-0">
									<!-- THE CALENDAR -->
									<div id="calendar"></div>


									<div class="modal" tabindex="-1" role="dialog" id="eventModal">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title">Create an Event</h4>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>

												</div>
												<div class="modal-body">

													<!-- <div class="col-xs-12">
															<label class="col-xs-4" for="edit-allDay">AllDay</label> <input
																class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
														</div> -->

													<div class="form-group">
														<label class="col-form-label" for="edit-title">Title <span class="require">*</span>
														</label> <input class="form-control inputModal" type="text" name="edit-title" id="edit-title" required="required" placeholder="A title for your event" />
													</div>
													<div class="row">
														<div class="form-group col-md-6">
															<label class="col-form-label" for="edit-start">Start Time <span class="require">*</span>
															</label>

															<div class="input-group" id="edit-start-div">
																<input class="form-control inputModal" type="text" name="edit-start" id="edit-start" placeholder="Select a Start Time" />
																<div class="input-group-append">
																	<div class="input-group-text">
																		<i class="far fa-calendar-alt"></i>
																	</div>
																</div>
															</div>
														</div>
														<div class="form-group col-md-6">
															<label class="col-form-label" for="edit-end">End Time <span class="require">*</span>
															</label>
															<div class="input-group">
																<input class="form-control inputModal" type="text" name="edit-end" id="edit-end" placeholder="Select an End Time" />
																<div class="input-group-append">
																	<div class="input-group-text">
																		<i class="far fa-calendar-alt"></i>
																	</div>
																</div>
															</div>

														</div>
													</div>
													<div class="row"></div>
													<!-- 	<div class="row">
														<div class="col-xs-12">
															<label class="col-xs-4" for="edit-type">구분</label> <select
																class="inputModal" type="text" name="edit-type"
																id="edit-type">
																<option value="카테고리1">카테고리1</option>
																<option value="카테고리2">카테고리2</option>
																<option value="카테고리3">카테고리3</option>
																<option value="카테고리4">카테고리4</option>
															</select>
														</div>
													</div> -->

													<div class="form-group">
														<label for="comment">Comment</label>
														<textarea class="form-control" rows="5" id="comment"></textarea>
													</div>

													<div class="row">
														<div class="col-xs-12">
															<label class="col-xs-4" for="edit-color"></label>

															<div class="btn-group">
																<!--style="width: 100%; margin-bottom: 10px;"  -->
																<!--<button type="button" id="color-chooser-btn" class="btn btn-info btn-block dropdown-toggle" data-toggle="dropdown">Color <span class="caret"></span></button>-->
																<ul class="fc-color-picker" id="color-chooser">
																	<li><a class="text-primary" href="#"><i class="fas fa-square"></i></a></li>
																	<li><a class="text-warning" href="#"><i class="fas fa-square"></i></a></li>
																	<li><a class="text-success" href="#"><i class="fas fa-square"></i></a></li>
																	<li><a class="text-danger" href="#"><i class="fas fa-square"></i></a></li>
																	<li><a class="text-muted" href="#"><i class="fas fa-square"></i></a></li>
																</ul>
															</div>

															<!-- <select
																class="inputModal" name="color" id="edit-color">
																<option value="#D25565" style="color: #D25565;">빨간색</option>
																<option value="#9775fa" style="color: #9775fa;">보라색</option>
																<option value="#ffa94d" style="color: #ffa94d;">주황색</option>
																<option value="#74c0fc" style="color: #74c0fc;">파란색</option>
																<option value="#f06595" style="color: #f06595;">핑크색</option>
																<option value="#63e6be" style="color: #63e6be;">연두색</option>
																<option value="#a9e34b" style="color: #a9e34b;">초록색</option>
																<option value="#4d638c" style="color: #4d638c;">남색</option>
																<option value="#495057" style="color: #495057;">검정색</option>
															</select> -->
														</div>
													</div>
												</div>
												<div class="modal-footer modalBtnContainer-addEvent">
													<button type="button" class="btn btn-default" data-dismiss="modal">cancel</button>
													<div class="input-group-append">
														<button id="add-new-event" type="button" class="btn btn-primary" value="${principal.userId }">Add</button>
													</div>
												</div>
												<div class="modal-footer modalBtnContainer-modifyEvent">
													<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
													<button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
													<button type="button" class="btn btn-primary" id="updateEvent">저장</button>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>





								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
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
	<!-- Bootstrap -->
	<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- jQuery UI -->
	<script src="/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/resources/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/resources/dist/js/demo.js"></script>
	<!-- fullCalendar 2.2.5 -->
	<script src="/resources/plugins/moment/moment.min.js"></script>
	<script src="/resources/plugins/fullcalendar/main.min.js"></script>
	<script src="/resources/plugins/fullcalendar-daygrid/main.min.js"></script>
	<script src="/resources/plugins/fullcalendar-timegrid/main.min.js"></script>
	<script src="/resources/plugins/fullcalendar-interaction/main.min.js"></script>
	<script src="/resources/plugins/fullcalendar-bootstrap/main.min.js"></script>
	<!-- Page specific script -->

	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

	<script>
	 $(function () {

		    /* initialize the external events
		     -----------------------------------------------------------------*/
		    function ini_events(ele) {
		      ele.each(function () {

		        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
		        // it doesn't need to have a start or end
		        var eventObject = {
		          title: $.trim($(this).text()) // use the element's text as the event title
		        }
		        console.log(eventObject)

		        // store the Event Object in the DOM element so we can get to it later
		        $(this).data('eventObject', eventObject)

		        // make the event draggable using jQuery UI
		        $(this).draggable({
		          zIndex        : 1070,
		          revert        : true, // will cause the event to go back to its
		          revertDuration: 0  //  original position after the drag
		        })

		      })
		    }

		    ini_events($('#external-events div.external-event'))

		    /* initialize the calendar
		     -----------------------------------------------------------------*/
		    //Date for the calendar events (dummy data)
		    var date = new Date()
		    var d    = date.getDate(),
		        m    = date.getMonth(),
		        y    = date.getFullYear()

		    var Calendar = FullCalendar.Calendar;
		    var Draggable = FullCalendarInteraction.Draggable;

		    var containerEl = document.getElementById('external-events');
		    var checkbox = document.getElementById('drop-remove');
		    var calendarEl = document.getElementById('calendar');

		    // initialize the external events
		    // -----------------------------------------------------------------

		    new Draggable(containerEl, {
		      itemSelector: '.external-event',
		      eventData: function(eventEl) {
		        console.log(eventEl);
		        return {
		          title: eventEl.innerText,
		          backgroundColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
		          borderColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
		          textColor: window.getComputedStyle( eventEl ,null).getPropertyValue('color'),
		        };
		      }
		    });
		    
		   /*modal's variables  */ 
			var eventModal = $('#eventModal');
			var editTitle = $('#edit-title');
			var editStart = $('#edit-start');
			var editEnd = $('#edit-end');
			var comment = $('#comment');
			var editColor = $('#edit-color');
			var editDesc = $('#edit-desc');
			
			var addBtnContainer = $('.modalBtnContainer-addEvent');
			var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');
			 /*//modal's variables  */
			 
			 
		    var calendar = new Calendar(calendarEl, {
		    	dateClick: function(date,start,end, timezone,callback) {
		    		console.log(editStart.val(start))
		    		
		    	    editTitle.val('');
		    	    editStart.val(start);
		    	    editEnd.val(end);
		    	    editDesc.val('');
		    	    comment.val('');
		    	    
		    	    eventModal.modal('show');
		    	    addBtnContainer.show();
		    	    modifyBtnContainer.hide();
		    	    //새로운 일정 저장버튼 클릭
		    	    $('#add-new-event').unbind();
		    	    $('#add-new-event').on('click', function () {

		    	        var eventData = {
		    	        	userId : $('#add-new-event').val(),
		    	            title: editTitle.val(),
		    	            start: editStart.val(),
		    	            end: editEnd.val(),
		    	            description: comment.val(),
		    	            backgroundColor: currColor,
		    	            borderColor    : currColor,
		    	            textColor: '#ffffff',
		    	        };
		    	        console.log(eventData)

		    	        if (eventData.start > eventData.end) {
		    	            alert('끝나는 날짜가 앞설 수 없습니다.');
		    	            return false;
		    	        }

		    	        if (eventData.title === '') {
		    	            alert('일정명은 필수입니다.');
		    	            return false;
		    	        }
		    	        if (eventData.start === '') {
		    	            alert('시작 날짜를 선택해주세요.');
		    	            return false;
		    	        }
		    	        if (eventData.end === '') {
		    	            alert('마지막 날짜를 선택해주세요.');
		    	            return false;
		    	        }

		    	        var realEndDay;

		  /*   	        if (editAllDay.is(':checked')) {
		    	            eventData.start = moment(eventData.start).format('YYYY-MM-DD');
		    	            //render시 날짜표기수정  
		    	            eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
		    	            //DB에 넣을때(선택)
		    	            realEndDay = moment(eventData.end).format('YYYY-MM-DD');

		    	            eventData.allDay = true;
		    	        } */

		    	        /* $("#calendar").fullCalendar('renderEvent', eventData, true); */
		    	        eventModal.find('input, textarea').val('');
		    	        /* editAllDay.prop('checked', false); */
		    	        eventModal.modal('hide');

		    	        //새로운 일정 저장
		    	        $.ajax({
		    	            type : "POST",
		    	            url : "/calendar/save",
		    	            data : JSON.stringify(eventData),
		    	            contentType : 'application/json; charset=utf-8',
		    	            dataType : 'json',
		    	            
		    	            success: function (response) {
		    	            	alert('성공')
		    	                //DB연동시 중복이   벤트 방지를 위한
		    	                //$('#calendar').fullCalendar('removeEvents');
		    	                //$('#calendar').fullCalendar('refetchEvents');
		    	            }
		    	          
		    	        });
		    	    });
		    	   
		    	    
		    	    calendar.on('dateClick', function(info) {
			    		  console.log('clicked on ' + info.dateStr);
			    		});

		    	  },
		      plugins: [ 'bootstrap', 'interaction', 'dayGrid', 'timeGrid' ],
		      header    : {
		        left  : 'prev,next today',
		        center: 'title',
		        right : 'dayGridMonth,timeGridWeek,timeGridDay'
		      },
		      //Random default events
	      events    : function (start, end, timezone, callback) {
	    		 var timeData={
		    			   	dt_start : moment(start).format('YYYY/MM/DD hh:mm'),
				    	  	dt_end : moment(end).format('YYYY/MM/DD hh:mm')
		    		};
			   	 $.ajax({
			      type: "POST",
			      url: "/calendar/write",
			      data : JSON.stringify(timeData),
			      contentType:'application/json',
		          dataType:'json',
			      success: function (response) {
			    	  console.log(response);
			    	  console.log(response.obj);
			    	  console.log(response.obj.jsonArr);
			    	  console.log(response.obj.jsonArr[1].title);
			    	  console.log(JSON.stringify(response.obj.jsonArr));
			    	  
			    	  var ArrayObject=response.obj;
			    	  var Arraylist=response.obj.jsonArr;
			    	  var eventAdd = [];
		   				$.each(ArrayObject, function() {
		   					Arraylist.push({
		   	                    title:"hi",
		   	                    start:"2020/04/27 22:05"
		   	                });
		   	            });
		   				console.log(ArrayObject)
		   				console.log(Arraylist);
		   				callback(Arraylist);
			      },
			   	 error: function(){
			   		 alert('통신실패');
			   	 }
			    });
			  }, 
		      /* selectable: true,
		      selectHelper: true,*/
		      eventLimit: true, 
		      editable  : true,
		     /*  locale: 'ko',
		      navLinks: true,
		      allDaySlot: false,
		      minTime: '10:00:00',
		      maxTime: '24:00:00',
		      contentHeight: 'auto',
		       */
		      droppable : true, // this allows things to be dropped onto the calendar !!!
		      drop      : function(info) {
		        // is the "remove after drop" checkbox checked?
		        if (checkbox.checked) {
		        	
		          // if so, remove the element from the "Draggable Events" list
		          info.draggedEl.parentNode.removeChild(info.draggedEl);
		          
		        }
		        console.log(info);
		        console.log(info.draggedEl.innerHTML);
		        
		        
		      }    
		    });

		    calendar.render();
		    // $('#calendar').fullCalendar()

		    /* ADDING EVENTS */
		    var currColor = '#3c8dbc' //Red by default
		    //Color chooser button
		    var colorChooser = $('#color-chooser-btn')
		    $('#color-chooser > li > a').click(function (e) {
		      e.preventDefault()
		      //Save color
		      currColor = $(this).css('color')
		      //Add color effect to button
		      $('#add-new-event').css({
		        'background-color': currColor,
		        'border-color'    : currColor
		      })
		    })
		    $('#add-new-event').click(function (e) {
		      e.preventDefault()
		      //Get value and make sure it is not null
		      var val = $('#new-event').val()
		      if (val.length == 0) {
		        return
		      }

		      //Create events
		      var event = $('<div />')
		      event.css({
		        'background-color': currColor,
		        'border-color'    : currColor,
		        'color'           : '#fff'
		      }).addClass('external-event')
		      event.html(val)
		      $('#external-events').prepend(event)

		      //Add draggable funtionality
		      ini_events(event)

		      //Remove event from text input
		      $('#new-event').val('')
		    })
		  })
		  
		  $("#edit-start, #edit-end").datetimepicker({
				 format: 'YYYY-MM-DD HH:mm'
			});
		  
	</script>
</body>
</html>