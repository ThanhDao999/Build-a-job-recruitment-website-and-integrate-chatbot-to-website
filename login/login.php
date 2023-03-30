<?php
// hàm `session_id()` sẽ trả về giá trị SESSION_ID (tên file session do Web Server tự động tạo)
// - Nếu trả về Rỗng hoặc NULL => chưa có file Session tồn tại
    if (session_id() === '') {
    // Yêu cầu Web Server tạo file Session để lưu trữ giá trị tương ứng với CLIENT (Web Browser đang gởi Request)
    session_start();
}
?>
<!doctype html>
<html>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!------ Include the above in your HEAD tag ---------->
    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">


    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="signup.css">


</head>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'poppins', 'sans-serif';
}

body {
    padding: 10px;
    display: flex;
    height: 100vh;
    justify-content: center;
    align-items: center;
    background-color: #17a2b8;
}

.box {
    position: absolute;
    top: 50%;
    height: 50%;
    transform: translate(-50%, -50%);
    max-width: 700px;
    background: #fff;
    border-radius: 5px;
    padding: 25px 30px;
    margin-top: 10px;
    margin-bottom: 50px;
    margin-left: 36%;
}

.box .titre {
    position: relative;
    font-size: 25px;
    font-weight: 1000px;
}

.box .titre::before {
    content: "";
    position: absolute;
    left: 0;
    bottom: 0;
    background-color: #12c6c5;
    width: 210px;
    height: 4px;
}

.box form .user-details {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin: 20px 0 12px 0;
}

form .user-details .input-box {
    width: calc(100% / 2 -20px);
    margin: 15px;
}

.user-details .input-box .details {
    display: block;
    margin-bottom: 5px;
    font-weight: 500px;
}

.user-details .input-box input {
    font-size: 16px;
    width: 100%;
    height: 40px;
    border-radius: 5px;
    border: solid #ccc 1px;
    padding-left: 15px;
    outline: none;
    border-bottom-width: 2px;
    transition: all 0.3s ease;
}

.user-details .input-box input:focus,
.user-details .input-box input:valid {
    border-color: #12c6c5;
}

form .gender-details .category {
    display: flex;
    width: 80%;
    margin: 14px 0;
    justify-content: space-around;
}

.gender-details .category label {
    display: flex;
    align-items: center;
}

.gender-details .category .dot {
    width: 18px;
    height: 18px;
    margin-right: 10px;
    background-color: #17a2b8;
    border-radius: 50%;
    border: solid 5px transparent;
}

#dot-1:checked~.category label .one,
#dot-2:checked~.category label .two,
#dot-3:checked~.category label .three {
    border-color: #fff;
    background: black;
}

form input[type="radio"] {
    display: none;
}

form .button {
    margin: 45px 0;
    height: 45px;
}

form .button input {
    width: 100%;
    height: 100%;
    outline: none;
    border: none;
    border-radius: 5px;
    color: #fff;
    font-size: 18px;
    font-weight: 500;
    letter-spacing: 1px;
    background: #12c6c5;
}

form .button input:hover {
    background: #12c6c5;
}

.dn {
    color: black;
    font-size: 20px;
    text-decoration: none;
}

.dn:hover {
    color: #12c6c5;
    text-decoration: none;
}
</style>

<body>
    
    <!-- form đăng nhập -->
    <div class="box">
        <div class="titre">Đăng nhập tài khoản</div>
        <div class="titre1"><a class="dn" href="../login/signup.php">Đăng ký tài khoản</a></div>
        <form action="" method="POST">
            <div class="user-details">
                <div class="input-box">
                    <span class="details">Họ tên</span>
                    <input type="text" placeholder="Nhập họ và tên" required name="user_login" id="">
                </div>

                <div class="input-box">
                    <span class="details">Mật khẩu</span>
                    <input type="password" placeholder="Nhập mật khẩu" required name="user_pass" id="">
                </div>
            </div>

            <div class="button">
                <input type="submit" name="btnsubmit" value="Đăng nhập">
            </div>


        </form>
    </div>

</body>

</html>

<?php
    include('../admin//db_connect.php');
    if(isset($_POST['btnsubmit'])){
        $user_login = $_POST['user_login'];
        $user_pass = $_POST['user_pass'];
         // Câu lệnh SELECT Kiểm tra đăng nhập...
         $sqlSelect = <<<EOT
         SELECT *
         FROM recruiter 
         WHERE name_login = '$user_login' AND pass = '$user_pass';
EOT;
                                 // Thực thi SELECT
                                 $result = mysqli_query($conn, $sqlSelect);

                                 // Sử dụng hàm `mysqli_num_rows()` để đếm số dòng SELECT được
                                 // Nếu có bất kỳ dòng dữ liệu nào SELECT được <-> Người dùng có tồn tại và đã đúng thông tin USERNAME, PASSWORD
                                 if (mysqli_num_rows($result) > 0) {
                                    while($row=$result->fetch_assoc()){
         
                                     // Lưu thông tin Tên tài khoản user đã đăng nhập
                                     $_SESSION['user_login'] = $user_login;
                                     $_SESSION['id_user'] = $row['id_user'];
                                     echo 'Đăng nhập thành công!';
                                     // Điều hướng (redirect) về trang chủ
                                     echo '<script>location.href = "list.php?id_user='.$row['id_user'].'";</script>';}
                                 } else {
                                     echo '<h2 style="color: red;">Đăng nhập thất bại!</h2>';
                                 }
    }
       
?>