<?php 
include '../admin/db_connect.php';
$sql = "SELECT * FROM `application` app
INNER JOIN `vacancy` va ON app.position_id = va.id
INNER JOIN `recruiter` re ON va.fk_recruiter = re.id_user
WHERE id_user= ".$_GET['id_user']."
 ";
$qry = $conn->query($sql)->fetch_array();

extract($_POST);

 		$fname=$qry['resume_path'];   
       $file = ("../admin/assets/resume/".$fname);
       $fname = explode('_',$fname);
       unset($fname[0]);
       $fname = implode("",$fname);
       header ("Content-Type: ".filetype($file));
       header ("Content-Length: ".filesize($file));
       header ("Content-Disposition: attachment; filename=".$fname);

       readfile($file);
       ?>