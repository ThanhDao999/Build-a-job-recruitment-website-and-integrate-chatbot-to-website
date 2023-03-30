<?php
if(isset($_POST['btnSave'])){
        include('../admin/db_connect.php');
        $user_name = $_POST['user_name'];
        $user_birthday = $_POST['user_birthday'];
        $user_account = $_POST['user_account'];
        $user_pass = $_POST['user_pass'];
        $company_name = $_POST['company_name'];
        $position_name = $_POST['position_name'];
        $user_phone = $_POST['user_phone'];
        $user_email = $_POST['user_email'];
        $user_gender = $_POST['gender'];
        $sql = "INSERT INTO `recruiter`(name_user, birthday, name_login, pass, company_name, position_user, phone, email, gender) VALUES('$user_name','$user_birthday','$user_account','$user_pass','$company_name','$position_name','$user_phone','$user_email','$user_gender');";
        $conn->query($sql);
        $conn->close();
        header('Location: login.php');
}
?>