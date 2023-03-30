<?php
// hàm `session_id()` sẽ trả về giá trị SESSION_ID (tên file session do Web Server tự động tạo)
// - Nếu trả về Rỗng hoặc NULL => chưa có file Session tồn tại
if (session_id() === '') {
    // Yêu cầu Web Server tạo file Session để lưu trữ giá trị tương ứng với CLIENT (Web Browser đang gởi Request)
    session_start();
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin cá nhân</title>
    <script src="https://kit.fontawesome.com/32bbf4c910.js" crossorigin="anonymous"></script>
</head>
<style>
body {
    background-color: #17a2b8;
}

table {
    border-radius: 10px;
}

table,
th,
td {
    border: 2px solid black;
    border-collapse: collapse;
    padding-top: 12px;
    padding-bottom: 12px;
}

th,
td {
    background-color: white;
}

.hello {

    background-color: #272727;
    height: 100px;
    width: 1520px;
    padding-top: 20px;
}

li {
    float: right;
    text-decoration: none;
    margin-top: 28px;
    list-style: none;
}

.nav-link {
    text-decoration: none;
    padding-right: 60px;
}

.nav-link {
    color: gray;
    font-style: normal;
    font-family: "Merriweather", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    font-size: 1.5em;
    font-weight: 400;
    color: #17a2b8;
}

.nav-brand {
    float: right;
}

.add {
    border: none;
    color: white;
    padding: 16px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    transition-duration: 0.4s;
    cursor: pointer;
}

.add_new {
    background-color: #17a2b8;
    color: black;
    border: 2px solid #272727;
}

.add_new:hover {
    background-color: white;
    color: white;
}

.add_new a {
    text-decoration: none;
    color: black;
}
</style>

<body>

    <div class="hello">
        <?php
        // Đã đăng nhập rồi -> hiển thị tên Người dùng và menu Đăng xuất
        if (isset($_SESSION['user_login']) && !empty($_SESSION['user_login'])) :
        ?>
        <div class="div" style="width: 100%;background-color: #272727;height: 100px; ">
            <a class="navbar-brand" href="./"><img src="../assets/img/vnworks2.png" width="150px" height="70px"
                    style="margin-left:50px"></a>
            <li class="nav-item text-nowrap">
                <a class="nav-link">Chào <?= $_SESSION['user_login']; ?></a>
                <a class="nav-link" href="logout.php"> Đăng xuất</a>
            </li>
        </div>

        <?php
            include('../admin/db_connect.php');
            $id = $_SESSION['id_user'];
            $sql = "SELECT * FROM recruiter WHERE id_user= " . $_SESSION['id_user'] . " ";
            //$sql_list = "SELECT * FROM recruiter re JOIN vacancy va ON re.company_name = va.name_company WHERE id_user= " . $_GET['id_user'] . " ";
            $result = mysqli_query($conn, $sql);
            while ($row = $result->fetch_assoc()) {



                echo "
                        <div class='div1' style='width: 6%;margin-right: 0px;margin-left: auto;'>
                        <button class='add add_new' style='margin-right:5px'><a href='recruiter.php?id_user=" . $_SESSION['id_user'] . "'>Thêm</a></button>
                        </div>
                    
                        <div class='div2' style='float: left; margin-right: 10px;'>
                            <table border ='1' style='width: 300px;' >
                                <tr>
                                    <th style='text-align: left'>Họ tên:</th>
                                    <td>" . $row['name_user'] . "</td>
                                </tr>

                                <tr>
                                    <th style='text-align: left' >Năm sinh:</td>
                                    <td>" . $row['birthday'] . "</td>
                                </tr>

                                <tr>
                                    <th style='text-align: left'>Tên công ty:</th>
                                    <td>" . $row['company_name'] . "</td>
                                </tr>
                            
                                <tr>
                                    <th style='text-align: left'>Chức vụ:</th>
                                    <td>" . $row['position_user'] . "</td>
                                </tr>

                                <tr>
                                    <th style='text-align: left'>Phone:</th>
                                    <td>" . $row['phone'] . "</td>
                                </tr>

                                <tr>
                                    <th style='text-align: left'>Email:</th>
                                    <td>" . $row['email'] . "</td>
                                </tr>
                            </table>
                      </div>
                    ";

            ?>
        <?php } ?>


        <?php

            $sql_list = "SELECT * FROM recruiter re JOIN vacancy va ON re.id_user = va.fk_recruiter WHERE id_user= " . $_SESSION['id_user'] . " ";
            $result1 = mysqli_query($conn, $sql_list);
            echo "<div class='div3' style='display:grid; float:left; margin-right: 10px; ';>
            <table border='1' style=' width: 500px;'>
                <tr>
                    <th style='text-align: left'>Vị trí tuyển dụng</th>
                    <th style='text-align: left'>Thao tác xử lý bài đăng</th>
                </tr>";
            while ($row = $result1->fetch_assoc()) {
                echo "
        
                    <tr>
                        <td>" . $row['position'] . "</td>
                        <td> <a href='view.php?id=" . $row['id'] . " ' style ='margin-left:10px; text-decoration:none'> <i class='fa-solid fa-eye' style='width:80px; color: #17a2b8'></i> </a> 
                             <a href='edit.php?id=" . $row['id'] . "' style =' text-decoration:none'> <i class='fa-solid fa-file-pen'style='width:80px; color: #17a2b8'></i> </a>
                             <a href='delete.php?id=" . $row['id'] . "' style ='text-decoration:none'><i class='fa fa-trash' style=' color: #17a2b8'></i></a>
                        </td>
                         
                    </tr>
               
       
        ";
            ?>
        <?php }
            echo " </table>
                </div> " ?>

        <?php

            $sql_application = "SELECT * FROM `application` app
            INNER JOIN `vacancy` va ON app.position_id = va.id
            INNER JOIN `recruiter` re ON va.fk_recruiter = re.id_user
            WHERE id_user= " . $_SESSION['id_user'] . "
             ";
            $result1 = mysqli_query($conn, $sql_application);
            echo "<div class='div4' style='display:grid;';>
                <table border='1' >
                <tr>
                     <th style='text-align: left'>Nhân sự ứng tuyển</th>
                    <th style='text-align: left'>Sơ yếu lí lịch</th>
                </tr>";
                while ($row = $result1->fetch_assoc()) {
                echo "

                    <tr>
                        <td>" . $row['firstname'] . "</td>
                        <td><a target='_blank' href='download.php?id_user=" . $_GET['id_user'] . "'>" . $row['resume_path'] . " </a>  </td>
                      
                    
             
                    </tr>
   

";
            ?>
        <?php }
            echo " </table>
    </div> " ?>
        <?php else : ?>
    </div>
    <li class="nav-item text-nowrap">
        <a class="nav-link" href="login.php">Đăng nhập</a>
    </li>
    <?php endif; ?>

</body>

</html>