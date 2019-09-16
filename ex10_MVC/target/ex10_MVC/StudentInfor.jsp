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
					<table class = "table table-blue table-striped">
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
						<h4 class="modal-title">Modal Heading</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					
					<!-- Modal body -->
					<div class="modal-body">
						Modal body..
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
						<h4 class="modal-title">Modal Heading</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					
					<!-- Modal body -->
					<div class="modal-body">
						<label>ID</label>
						<br>
						<input type="text" id="id">
						<br>
						<label>Họ tên</label>
						<br>
						<input type="text" id="name">
						<br>
						<label>Ngày sinh</label>
						<br>
						<input type="text" id="birthDay">
						<br>
						<label>Giới tính</label>
						<br>
						<input type="text" id="gender">
						<br>
						<label>Ngày nhập học</label>
						<br>
						<input type="text" id="dayIn">
						<br>
						
					</div>
					
					<!-- Modal footer -->
					<div class="modal-footer">
						<button id="add" type="button" class="btn btn-danger" data-dismiss="modal">Xác nhận</button>
					</div>
					
				</div>
			</div>
		</div>
	</body>
<script type="text/javascript">
$(document).ready(function() {
    $('#load-du-lieu').click(function(e) {
        e.preventDefault();
        let param = 'id=' + $('#id').val();
        param += '&name=' + $('#name').val();
        $.ajax({
            url: '/add?' + param,
            type: 'get',
            dataType: 'html',
        }).done(function(ketqua) {
            $('#noidung').html(ketqua);
        });
        
    });
    $('#add').click(function(e) {
        e.preventDefault();
        let param = 'id=' + $('#id').val();
        param += '&name=' + $('#name').val();
        console.log(param);
        $.ajax({
            url: '/add?' + param,
            type: 'get',
            dataType: 'html',
        }).done(function(data) {
        	let html = '';
        	$.each( data, function( key, item ) {
         		  html+= '<tr><td>'+item.id+'</td>';
           		  html+= '<td>'+item.name+'</td>';
           		  html+= '<td>'+item.birthDay+'</td>';
           		  html+= '<td>'+item.gender+'</td>';
           		  html+= '<td>'+item.dayIn+'</td></tr>';
       		});
        });
        
    });
});
</script>
</html>