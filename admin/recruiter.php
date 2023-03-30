<?php 

?>

<div class="container-fluid">
	
	<div class="row">
	<div class="col-lg-12">
			<!-- <button class="btn btn-primary float-right btn-sm" id="new_user"><i class="fa fa-plus"></i> Thêm</button> -->
	</div>
	</div>
	<br>
	<div class="row">
		<div class="card col-lg-12">
			<div class="card-body">
				<table class="table-striped table-bordered col-md-12">
			<thead>
				<tr>
					<th class="text-center">STT</th>
					<th class="text-center">Tên</th>
					<th class="text-center">Tên đăng nhập</th>
					<th class="text-center">Tên công ty</th>
                    <th class="text-center">Chức vụ</th>
                    <th class="text-center">Số điện thoại</th>
                    <th class="text-center">Email</th>
				</tr>
			</thead>
			<tbody>
				<?php
 					include 'db_connect.php';
 					$users = $conn->query("SELECT * FROM recruiter");
 					$i = 1;
 					while($row= $users->fetch_assoc()):
				 ?>
				 <tr>
				 	<td>
				 		<?php echo $i++ ?>
				 	</td>
				 	<td>
				 		<?php echo $row['name_user'] ?>
				 	</td>
				 	<td>
				 		<?php echo $row['name_login'] ?>
				 	</td>
				 	<td>
                     <?php echo $row['company_name'] ?>
				 	</td>
                     <td>
                     <?php echo $row['position_user'] ?>
				 	</td>
                     <td>
                     <?php echo $row['phone'] ?>
				 	</td>
                     <td>
                     <?php echo $row['email'] ?>
				 	</td>
				 </tr>
				<?php endwhile; ?>
			</tbody>
		</table>
			</div>
		</div>
	</div>

</div>
