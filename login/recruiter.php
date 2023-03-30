<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="../assets/ckeditor/ckeditor.js"></script>
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <link href="admin/assets/css/select2.min.css" rel="stylesheet">

    <script src="admin/assets/vendor/jquery/jquery.min.js"></script>
    <script src="admin/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <title>Tuyển dụng nhân sự</title>
</head>
<style>
body {
    background-color: #17a2b8;
}

#manage-vacancy {
    width: 700px;
    margin-top: 50px;
    margin-left: 400px;
    padding-left: 100px;
    padding-top: 50px;
    background-color: white;
    margin-bottom: 50px;
    padding-bottom: 50px;
}

.h2 {
    text-align: center;
}
</style>

<body>
 
    <div class="container-fluid">
        <form action="edit_recruiter.php" id="manage-vacancy" method="POST" enctype="multipart/form-data">
            
            <div class="row form-group">
                <div class="col-md-10">
                <input type="hidden" name="position_id" value="<?php echo $_GET['id_user'] ?>">
                    <label class="control-label">Tên công ty:</label>
                    <input type="text" name="name_company" class="form-control" 
                        value="">
                </div>
            </div>
            <div class="row form-group">
                <div class="col-md-10">
                    <label class="control-label"
                        for="image_company">Logo công ty:</label>
                    <input type="file" name="image_company" id="image_company" placeholder="Logo công ty" onchange="displayfname(this,$(this))" accept="image/*">
                </div>
            </div>

            <div class="row form-group">
                <div class="col-md-10">
                    <label class="control-label">Giờ làm việc:</label>
                    <input type="time" name="time_company" class="form-control"
                        value="">
                </div>
            </div>

            <div class="row form-group">
                <div class="col-md-10">
                    <label class="control-label">Ngày làm việc trong tuần:</label>
                    <input type="text" name="date_company" class="form-control"
                        value="">
                </div>
            </div>

            <div class="row form-group">
                <div class="col-md-10">
                    <label class="control-label">Địa chỉ công ty:</label>
                    <input type="text" name="address_company" class="form-control"
                        value="">
                </div>
            </div>

            <div class="row form-group">
                <div class="col-md-10">
                    <label class="control-label">Email công ty:</label>
                    <input type="text" name="email_company" class="form-control"
                        value="">
                </div>
            </div>

            <div class="row form-group">
                <div class="col-md-10">
                    <label class="control-label">Vị trí:</label>
                    <input type="text" name="position" class="form-control"
                        value="">
                </div>
            </div>
            <div class="row form-group">
                <div class="col-md-10">
                    <label class="control-label">Số lượng cần tuyển:</label>
                    <input type="number" name="availability" min='1' class="form-control text-right"
                        value="">
                </div>
            </div>

            <div class="row form-group">
                <div class="col-md-10">
                    <label class="control-label">Mức lương dự kiến:</label>
                    <input type="text" name="money" class="form-control"
                        value="">
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
                <div class="col-md-10">
                    <textarea id="inputbox" name="inputbox"></textarea>
                    <script>
                    CKEDITOR.replace('inputbox');
                    </script>
                </div>
            </div>
            <button type="submit" name="btnSave">Lưu</button>
            
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
</script>
</body>

</html>
