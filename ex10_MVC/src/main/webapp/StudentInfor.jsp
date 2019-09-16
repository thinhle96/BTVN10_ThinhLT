<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Danh sách sinh viên</title>
		<meta name="viewport" content="width=device-width, initial-scale=1" charset="utf-8">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="container">
			<div class = "row">
				<div class=" col-12 text-center p-3">
					<h1>Danh sách Sinh viên</h1>
				</div>
				<div class="col-3">
					
					<button>Tìm kiếm</button>
					<input>
					
				</div>
				<div class="col-9">
					<div class="col-3">
					
					<button data-toggle="modal" data-target="#myModal1">Thêm</button>
					
				</div>
					<table id="student-table" class = "table table-blue table-striped">
						<thead>
							<tr>
								<th>ID</th>
								<th>Họ và tên</th>
								<th>Ngày sinh</th>
								<th>Giới tính</th>
								<th>Ngày nhập học</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td>
									<button data-toggle="modal" data-target="#myModal2">Sửa</button>
									<button class="delete">Xóa</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- The Modal -->
		<div class="modal" id="myModal2">
			<div class="modal-dialog">
				<div class="modal-content">
					
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Sửa thông tin</h4>
						<button type="button" class="close" data-dismiss="modal" >&times;</button>
					</div>
					
					<!-- Modal body -->
					<div class="modal-body">
						<label>ID</label>
						<br>
						<input type="text" id="id2">
						<br>
						<label>Họ tên</label>
						<br>
						<input type="text" id="name2">
						<br>
						<label>Ngày sinh</label>
						<br>
						<input type="text" id="birthDay2">
						<br>
						<label>Giới tính</label>
						<br>
						<input type="text" id="gender2">
						<br>
						<label>Ngày nhập học</label>
						<br>
						<input type="text" id="dayIn2">
						<br>
					</div>
					
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Xác nhận</button>
					</div>
					
				</div>
			</div>
		</div>
		
		<!-- The Modal -->
		<div class="modal" id="myModal1">
			<div class="modal-dialog">
				<div class="modal-content">
					
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Thêm sinh viên</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					
					<!-- Modal body -->
					<form action="add" method="get">
					<div class="modal-body">
						<label>ID</label>
						<br>
						<input type="text" id="id1">
						<br>
						<label>Họ tên</label>
						<br>
						<input type="text" id="name1">
						<br>
						<label>Ngày sinh</label>
						<br>
						<input type="text" id="birthDay1">
						<br>
						<label>Giới tính</label>
						<br>
						<input type="text" id="gender1">
						<br>
						<label>Ngày nhập học</label>
						<br>
						<input type="text" id="dateIn1">
						<br>
						
					</div>
					
					<!-- Modal footer -->
					<div class="modal-footer">
						<button id="add" type="button" class="btn btn-danger" data-dismiss="modal">Xác nhận</button>
					</div>
				</form>
				</div>
			</div>
		</div>
	</body>
<script type="text/javascript">
$(document).ready(function() {
    var table_header = '<thead><tr><th>ID</th><th>Họ và tên</th><th>Ngày sinh</th>';
    var students = null;
    table_header += '<th>Giới tính</th><th>Ngày nhập học</th><th></th></tr></thead>';
     $.ajax({
         url: '/get',
         type: 'get',
         contentType: "application/json",
     success: function(data) {
    	 let html = table_header + '<tbody>';
    	 console.log(data);
    	 students=data;
     	$.each( data, function( key, item ) {
     		let date = new Date(item.birthDay);
     		let format = date.getDate().toString().padStart(2, '0');
     		format += '/'+(date.getMonth()+1).toString().padStart(2, '0');
     		format += '/'+date.getFullYear();
      		  html+= '<tr><td>'+item.id+'</td>';
        		  html+= '<td>'+item.name+'</td>';
        		  html+= '<td>'+format+'</td>';
        		  html+= '<td>'+item.gender+'</td>';
        		  date = new Date(item.dateIn);
           		format = date.getDate().toString().padStart(2, '0');
           		format += '/'+(date.getMonth()+1).toString().padStart(2, '0');
           		format += '/'+date.getFullYear();
        		  html+= '<td>'+format+'</td>';
        		  html+= '<td><button data-toggle="modal" data-target="#myModal2" studeny-id="'+item.id+'" class="edit">Sửa</button>';
				html+= '<button class="delete">Xóa</button></td></tr>';
    		});
     	html += '</tbody>';
     	$('#student-table').html(html);
     },
     error: function(e){
    	 console.log(e);
     }
     });
        
    $('#add').click(function(e) {
        e.preventDefault();
        let param = 'id=' + $('#id1').val();
        param += '&name=' + $('#name1').val();
        param += '&birthDay=' + $('#birthDay1').val();
        param += '&gender=' + $('#gender1').val();
        param += '&dateIn=' + $('#dateIn1').val();
        console.log(param);
        $.ajax({
            url: '/add?' + param,
            type: 'get',
            contentType: 'application/json',
        }).done(function(data) {
        	window.location = "/";
        });
        
    });
    
});

</script>
</html>