<?php 
include 'db_connect.php';
$application = $conn->query("SELECT  a.*,v.position FROM application a inner join vacancy v on v.id = a.position_id where a.id=".$_GET['id'])->fetch_array();
foreach($application as $k => $v){
	$$k = $v;
}
       $fname = explode('_',$resume_path);
       unset($fname[0]);
       $fname = implode("",$fname);
?>
<div class="container-fluid">
	<div class="col-md-12">
		<p><b>Vị trí :</b><?php echo $position ?></p>
		<p><b>Họ tên :</b><?php echo ucwords($lastname.', '.$firstname.' '.$middlename) ?></p>
		<p><b>Giới tính :</b><?php echo $gender ?></p>
		<p><b>Địa chỉ :</b><?php echo $address ?></p>
		<p><b>Email :</b><?php echo $email ?></p>
		<p><b>Thư xin việc :</p>
			<hr>
		<?php echo !empty($cover_letter) ? str_replace("\n","<br>",html_entity_decode($cover_letter)) : 'None'; ?>
		<hr>
		<p><b>Sơ yếu lý lịch</p>
			<a href="download.php?id=<?php echo $_GET['id'] ?>" target="_blank"><?php echo $fname ?></a>

	</div>
</div>