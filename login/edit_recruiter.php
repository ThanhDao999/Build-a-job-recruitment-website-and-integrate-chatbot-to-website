<?php
  // trang này chỗ nào gọi
    session_start();    
    $id = $_POST['position_id'];
    include('../admin/db_connect.php');
    if(isset($_POST['btnSave'])){
        $position_id = $_POST['position_id'];
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
        $sql = "INSERT INTO vacancy (position, availability, description, name_company, logo_company, time_company, date_company, address_company, email_company, money, fk_recruiter) VALUES ('$position', '$availability','$box','$name_company','$logo','$time','$day','$address','$email','$money','$position_id')";
        $conn->query($sql);
        $conn->close();
        echo '<script>location.href = "list.php?id_user='.$position_id.'";</script>';
    }
?>