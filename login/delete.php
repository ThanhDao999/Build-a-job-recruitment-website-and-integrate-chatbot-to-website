<?php
session_start();
//echo $_SESSION['id_user'];
if(isset($_SESSION['id_user'])){
    
    include('../admin/db_connect.php');
            $sql="delete from vacancy where id = ".$_GET['id'].""; 
            $result=$conn->query($sql);
            
        echo '<script>location.href = "list.php";</script>';
}

?>