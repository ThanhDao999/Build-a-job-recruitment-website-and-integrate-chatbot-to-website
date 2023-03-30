<?php include 'db_connect.php' ?>
<?php
if(isset($_GET['id'])){
	$qry = $conn->query("SELECT * FROM vacancy where id=".$_GET['id'])->fetch_array();
	foreach($qry as $k =>$v){
		$$k = $v;
	}
	$fname = explode('_',$logo_company);
	unset($fname[0]);
	$fname = implode("",$fname);
}

?>
<div class="container-fluid">
	<form action="" id="manage-vacancy">
				<input type="hidden" name="id" value="<?php echo isset($_GET['id']) ? $_GET['id']:'' ?>" class="form-control">
			
		<div class="row form-group">
			<div class="col-md-8">
				<label class="control-label">Tên công ty:</label>
				<input type="text" name="name_company" class="form-control" value="<?php echo isset($name_company) ? $name_company:'' ?>">
			</div>
		</div>

		<div class="row form-group">
			<div class="col-md-8">
				<label class="control-label" for="logo_company"><?php echo isset($fname) ? $fname:'Logo công ty:' ?></label>
				<input type="file" name="logo_company" class="form-control" onchange="displayfname(this,$(this))" accept="image/*">
			</div>
		</div>

		<div class="row form-group">
			<div class="col-md-8">
				<label class="control-label">Giờ làm việc:</label>
				<input type="time" name="time_company" class="form-control" value="<?php echo isset($time_company) ? $time_company:'' ?>">
			</div>
		</div>

		<div class="row form-group">
			<div class="col-md-8">
				<label class="control-label">Ngày làm việc trong tuần:</label>
				<input type="text" name="date_company" class="form-control" value="<?php echo isset($date_company) ? $date_company:'' ?>">
			</div>
		</div>

		<div class="row form-group">
			<div class="col-md-8">
				<label class="control-label">Địa chỉ công ty:</label>
				<input type="text" name="address_company" class="form-control" value="<?php echo isset($address_company) ? $address_company:'' ?>">
			</div>
		</div>

		<div class="row form-group">
			<div class="col-md-8">
				<label class="control-label">Email công ty:</label>
				<input type="text" name="email_company" class="form-control" value="<?php echo isset($email_company) ? $email_company:'' ?>">
			</div>
		</div>

		<div class="row form-group">
			<div class="col-md-8">
				<label class="control-label">Vị trí:</label>
				<input type="text" name="position" class="form-control" value="<?php echo isset($position) ? $position:'' ?>">
			</div>
		</div>
		<div class="row form-group">
			<div class="col-md-8">
				<label class="control-label">Số lượng cần tuyển:</label>
				<input type="number" name="availability" min='1' class="form-control text-right" value="<?php echo isset($availability) ? $availability:'' ?>">
			</div>
		</div>

		<div class="row form-group">
			<div class="col-md-8">
				<label class="control-label">Mức lương dự kiến:</label>
				<input type="text" name="money" class="form-control" value="<?php echo isset($money) ? $money:'' ?>">
			</div>
		</div>

		
		<?php if(isset($id)): ?>
		<div class="row form-group">
			<div class="col-md-8">
				<label class="control-label">Tình trạng</label>
				<select name="status" class="browser-default custom-select" id="">
					<option value="1" <?php echo $status == 1 ? "selected" :'' ?>>Còn</option>
					<option value="0" <?php echo $status == 0 ? "selected" :'' ?>>Hết</option>
				</select>
			</div>
		</div>
		<?php endif; ?>
		<div class="row form-group">
			<div class="col-md-12">
				<label class="control-label">Miêu tả chi tiết công việc:</label>
				<textarea name="description" class="text-jqte"><?php echo isset($description) ? $description : '' ?></textarea>
			</div>
		</div>
		
	</form>
</div>

<script>

function displayfname(input,_this) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
        	console.log(input.files[0].name)
        	_this.siblings('label').html(input.files[0].name);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

	$('.text-jqte').jqte();
	$('#manage-vacancy').submit(function(e){
		e.preventDefault()
		start_load()
		$.ajax({
			url:'ajax.php?action=save_vacancy',
			data: new FormData($(this)[0]),
			cache: false,
		    contentType: false,
		    processData: false,
			method:'POST',
			type: 'POST',
			error:err=>{
				console.log(err)
			},
			success:function(resp){
				if(resp == 1){
					alert_toast("Dữ liệu đã được lưu.",'success')
					setTimeout(function(){
						location.reload()
					},1000)
				}
			}
		})
	})
</script>

