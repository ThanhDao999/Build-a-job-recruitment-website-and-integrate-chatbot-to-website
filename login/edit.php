<?php
    include('../admin/db_connect.php');
    $sql = "select * from vacancy where id=" . $_GET['id'] . "";
    $result = mysqli_query($conn, $sql);
    $view  = [];
    while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
        $view[] = array(
          'view_position' => $row['position'],
          'view_availability' => $row['availability'],
          'view_description' => $row['description'],
          'view_status' => $row['status'],
          'view_name_company' => $row['name_company'],
          'view_logo_company' => $row['logo_company'],
          'view_time_company' => $row['time_company'],
          'view_date_company' => $row['date_company'],
          'view_address_company' => $row['address_company'],
          'view_email_company' => $row['email_company'],
          'view_money' => $row['money'],
        );
      }
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

<?php foreach ($view as $show) : ?>
    <div class="container-fluid">
        <form action="" id="manage-vacancy" method="POST" enctype="multipart/form-data">
        
            <div class="row form-group">
                <div class="col-md-10">
                
                    <label class="control-label">Tên công ty:</label>
                    <input type="text" name="name_company" class="form-control" 
                        value="<?= $show['view_name_company'] ?>">
                </div>
            </div>
            <div class="row form-group">
                <div class="col-md-10">
                    <label class="control-label"
                        for="image_company">Logo công ty:</label>
                    <input type="file" name="image_company" id="image_company" placeholder="Logo công ty" onchange="displayfname(this,$(this))" accept="image/*" >
                </div>
            </div>

            <div class="row form-group">
                <div class="col-md-10">
                    <label class="control-label">Giờ làm việc:</label>
                    <input type="time" name="time_company" class="form-control"
                        value="<?= $show['view_time_company'] ?>">
                </div>
            </div>

            <div class="row form-group">
                <div class="col-md-10">
                    <label class="control-label">Ngày làm việc trong tuần:</label>
                    <input type="text" name="date_company" class="form-control"
                        value="<?= $show['view_date_company'] ?>">
                </div>
            </div>

            <div class="row form-group">
                <div class="col-md-10">
                    <label class="control-label">Địa chỉ công ty:</label>
                    <input type="text" name="address_company" class="form-control"
                        value="<?= $show['view_address_company'] ?>">
                </div>
            </div>

            <div class="row form-group">
                <div class="col-md-10">
                    <label class="control-label">Email công ty:</label>
                    <input type="text" name="email_company" class="form-control"
                        value="<?= $show['view_email_company'] ?>">
                </div>
            </div>

            <div class="row form-group">
                <div class="col-md-10">
                    <label class="control-label">Vị trí:</label>
                    <input type="text" name="position" class="form-control"
                        value="<?= $show['view_position'] ?>">
                </div>
            </div>
            <div class="row form-group">
                <div class="col-md-10">
                    <label class="control-label">Số lượng cần tuyển:</label>
                    <input type="number" name="availability" min='1' class="form-control text-right"
                        value="<?= $show['view_availability'] ?>">
                </div>
            </div>

            <div class="row form-group">
                <div class="col-md-10">
                    <label class="control-label">Mức lương dự kiến:</label>
                    <input type="text" name="money" class="form-control"
                        value="<?= $show['view_money'] ?>">
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
                    <textarea id="inputbox" name="inputbox" <?=$show['view_description']?>></textarea>
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
<?php endforeach; ?>
</body>

</html>
<?php
    

    include('../admin/db_connect.php');
    if(isset($_POST['btnSave'])){
       
     //   $position_id = $_POST['position_id'];
        $name_company = $_POST['name_company']; 
        $logo =strtotime(date('y-m-d H:i')).'_'.$_FILES['image_company']['name'];
        @move_uploaded_file($_FILES['image_company']['tmp_name'],'../admin/assets/img/'.$logo);
        $time = $_POST['time_company'];
        $day = $_POST['date_company'];
        $position = $_POST['position'];
        $availability = $_POST['availability'];
        $address = $_POST['address_company'];
        $email = $_POST['email_company'];
        $money = $_POST['money'];
        $box = $_POST['inputbox'];
        $sql = "update vacancy set position = '$position', availability = '$availability', description = '$box', name_company = '$name_company', logo_company = '$logo', time_company = '$time', date_company = '$day', address_company = '$address', email_company = '$email', money = '$money' WHERE id=" . $_GET['id'] . " ";
        echo '<script>location.href = "list.php";</script>';
        $conn->query($sql);
        $conn->close();
    }
?>
