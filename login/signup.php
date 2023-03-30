<!doctype html>
<html>

<head>


    <!-- Bootstrap CSS -->

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="signup.css">


</head>
<style>
    *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'poppins', 'sans-serif';
}
    body{
    padding: 10px;
    display: flex;
    height: 100vh;
    justify-content: center;
    align-items: center;
    background-color: #17a2b8;
}
.box{
    position: absolute;
    top: 50%;
    height: 105%;
    transform: translate(-50%,-50%);
    max-width: 700px;
    background: #fff;
    border-radius: 5px;
    padding: 25px 30px;
    margin-top: 30px;
    margin-bottom: 50px;
    margin-left: 50%;
}
.box .titre{
    position: relative;
    font-size: 25px;
    font-weight: 1000px;
}
.box .titre::before{
    content: "";
    position: absolute;
    left: 0;
    bottom: 0;
    background-color: #12c6c5;
    width: 190px;
    height: 4px;
}
.box form .user-details{
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin: 20px 0 12px 0;
}
form .user-details .input-box{
    width: calc(100% / 2 -20px);
    margin: 15px;
}
.user-details .input-box .details{
    display: block;
    margin-bottom: 5px;
    font-weight: 500px;
}
.user-details .input-box input{
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
.user-details .input-box input:valid{
    border-color: #12c6c5;
}
form .gender-details .category{
    display: flex;
    width: 80%;
    margin: 14px 0;
    justify-content: space-around;
}
.gender-details .category label{
    display: flex;
    align-items: center;
}
.gender-details .category .dot{
    width: 18px;
    height: 18px;
    margin-right: 10px;
    background-color: #17a2b8;
    border-radius: 50%;
    border: solid 5px transparent;
}
#dot-1:checked ~ .category label .one,
#dot-2:checked ~ .category label .two,
#dot-3:checked ~ .category label .three{
    border-color: #fff;
    background: black;
}
form input[type="radio"]{
    display: none;
}
form .button{
    margin: 45px 0;
    height: 45px;
}
form .button input{
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
form .button input:hover{
    background: #12c6c5;
}
.dn{
    color: black;
    font-size: 20px;
    text-decoration: none;
}
.dn:hover{
    color: #12c6c5;
    text-decoration: none;
}
</style>
<body>


    <!-- form đăng ký -->
    <div class="box">
        <div class="titre">Đăng ký tài khoản</div>
        <div class="titre1"><a class="dn" href="../login/login.php">Đăng nhập tài khoản</a></div>
        <form action="editsignup.php" method="POST">
            <div class="user-details">
                <div class="input-box">
                    <span class="details">Họ tên</span>
                    <input type="text" placeholder="Nhập họ và tên" required name="user_name" id="">
                </div>

                <div class="input-box">
                    <span class="details">Năm sinh</span>
                    <input type="text" placeholder="VD: 20/8/1999" required name="user_birthday" id="">
                </div>

                <div class="input-box">
                    <span class="details">Tên tài khoản</span>
                    <input type="text" placeholder="Nhập tên tài khoản" required name="user_account" id="">
                </div>

                <div class="input-box">
                    <span class="details">Mật khẩu</span>
                    <input type="password" placeholder="Nhập mật khẩu" required name="user_pass" id="">
                </div>

                <div class="input-box">
                    <span class="details">Tên công ty</span>
                    <input type="text" placeholder="Nhập tên công ty" required name="company_name" id="">
                </div>

                <div class="input-box">
                    <span class="details">Chức vụ</span>
                    <input type="text" placeholder="Nhập chức vụ trong công ty" required name="position_name" id="">
                </div>

                <div class="input-box">
                    <span class="details">Số điện thoại</span>
                    <input type="text" placeholder="Nhập số điện thoại" required name="user_phone" id="">
                </div>

                <div class="input-box">
                    <span class="details">Email</span>
                    <input type="text" placeholder="Nhập email cá nhân" required name="user_email" id="">
                </div>
            </div>

            <div class="gender-details">
                <input type="radio" name="gender" value="Nam" id="dot-1">
                <input type="radio" name="gender" value="Nữ" id="dot-2">
                <input type="radio" name="gender" vulue="Khác" id="dot-3">
                <span class="gender-titre">Giới tính</span>
                <div class="category">
                    <label for="dot-1">
                        <span class="dot one"></span>
                        <span class="gender">Nam</span>
                    </label>
                    <label for="dot-2">
                        <span class="dot two"></span>
                        <span class="gender">Nữ</span>
                    </label>
                    <label for="dot-3">
                        <span class="dot three"></span>
                        <span class="gender">Khác</span>
                    </label>
                </div>
            </div>
            <div class="button">
                <input type="submit" name="btnSave" value="Đăng ký">
            </div>


        </form>
    </div>

</body>

</html>