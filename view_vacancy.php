<header class="masthead">
    <div class="container-fluid h-100">
        <div class="row h-100 align-items-center justify-content-center text-center">


        </div>
    </div>

</header>
<section id="">
    <?php include 'admin/db_connect.php' ?>

    <?php
	$qry = $conn->query("SELECT * FROM vacancy where id=" . $_GET['id'])->fetch_array();
	foreach ($qry as $k => $v) {
		$$k = $v;
	}
	?>
    <div class="container mb-2 pt-4 ">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-12">
                        <h4 class="text-center"> <b style="color: red;"><?php echo "VỊ TRÍ:  "  . $position ?></b></h4>
                        <hr class="divider" style="max-width: calc(10%)">
                        <p class="text-center">
                            <small>
                                <i><b>Số lượng: <larger><?php echo $availability ?></larger></b></i>
                            </small>
                            <?php if ($status == 1) : ?>
                            <span class="badge badge-success pt-2">Còn</span>
                            <?php else : ?>
                            <span class="badge badge-danger pt-2">Hết</span>
                            <?php endif; ?>

                        </p>

                    </div>
                </div>
                <hr class="divider" style="max-width: calc(100%)">
                <div class="row">
                    <div class="col-lg-2">
                        <img src="<?php echo 'admin/assets/img/' . $logo_company ?> " id="cimg">
                    </div>

                    <div class="col-lg-10">

                      
                        <i><b style="font-size: 40px; color:red">
                                <larger><?php echo $name_company ?></larger>
                            </b><i><br><br>

                                <table class="table table-borderless">
                                    <tr>

                                    </tr>
                                    <tr>
                                        <td> <i class="fas fa-clock" style="color:#2196F3"></i>
                                            <i><b style="font-size:15px;">Giờ làm việc: <larger>
                                                        <?php echo $time_company ?>
                                                    </larger></b></i><br>
                                        </td>

                                        <td> <i class="fas fa-calendar" style="color:#2196F3"></i>
                                            <i><b style="font-size:15px;">Ngày làm việc trong tuần: <larger>
                                                        <?php echo $date_company ?></larger></b></i><br>
                                        </td>
                                    </tr>



                                    <tr>
                                        <td>
                                            <i class="fa fa-address-card" style="color:#2196F3"></i>
                                            <i><b style="font-size:15px;">Địa chỉ công ty: <larger>
                                                        <?php echo $address_company ?></larger></b></i><br>
                                        </td>

                                        <td>
                                            <i class="fas fa-envelope" style="color:#2196F3"></i>
                                            <i><b style="font-size:15px;">Email liên hệ: <larger>
                                                        <?php echo $email_company ?>
                                                    </larger></b></i>
                                        </td>
                                    </tr>
                                    <td><i class="fas fa-money-check-alt" aria-hidden="true" style="color:#2196F3"></i>
                                            <i><b style="font-size:15px;">Mức lương dự kiến: <larger>
                                                        <?php echo $money ?>
                                                    </larger></b></i>
                                    </td>
                                    <tr>

                                    </tr>

                                </table>
                    </div>

                </div>
                <br>
                <style>
                img#cimg {
                    height: 17vh;
                    width: 10vw;
                    
                }
                </style>

                <div class="col-lg-12">
                    <b style="font-size: 20px; color:red;">Nội dung tuyển dụng: <larger></larger></b><br>
                    <?php echo html_entity_decode($description) ?>
                </div>
            </div>
            <hr class="divider" style="max-width: calc(100%)">
            <div class="row">
                <div class="col-lg-12">
                    <?php if ($status == 1) : ?>
                    <button class="btn btn-block col-md-4 btn-primary btn-sm float-right" type="button"
                        id="apply_now">Nộp đơn</button>

                    <?php else : ?>
                    <button class="btn btn-block col-md-4 btn-primary btn-sm float-right" type="button" disabled=""
                        id="">Dừng nhận đơn</button>
                    <?php endif; ?>

                </div>
            </div>
        </div>
    </div>
    </div>
</section>
<script>
$('html, body').animate({
    scrollTop: ($('section').offset().top - 72)
}, 1000);
$('#apply_now').click(function() {
    uni_modal('Đơn xin việc', 'submit_application.php?id=<?php echo $_GET['id'] ?>', 'large')
})
</script>