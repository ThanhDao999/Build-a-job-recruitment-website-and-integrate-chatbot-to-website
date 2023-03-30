<?php 
include 'admin/db_connect.php'; 
if(isset($_GET['trang'])){
   echo $page = $_GET['trang'];
}else{
    $page = "";
}
if($page == "" || $page == 1){
    $begin = 0;
}else{
    $begin = ($page*8)-8;
}

?>
<style>
#portfolio .img-fluid{
    width: calc(100%);
    height: 30vh;
    z-index: -1;
    position: relative;
    padding: 1em;
}
.vacancy-list{
    float: left;
    margin-right: 20px;
    margin-top: 10px;
    margin-left: 90px;
}
span.hightlight{
    background: yellow;
}
img#cimg{
		            height: 20vh;
		            width: 10vw;
                    margin-left: 14px;
                    image-rendering: crisp-edges ;
                    
	                }
.card{
    border: none;
} 
.card-body {
    width: 250px;
    height: 400px;
    
}
.a{
    min-height: 950px;
    height: auto;
}
.card-body1 {
  flex: 1 1 auto;
  min-height: 1px;
  padding: 1.25rem;
}

</style>
        <header class="masthead">
            <div class="container-fluid h-100" >
                <div class="row h-100 align-items-center justify-content-center text-center"  >
                    <div class="col-lg-10  page-title"  >
                    <!--	<h3 class="text-white">Chào mừng đến <?php // echo $_SESSION['setting_name']; ?></h3> 
                        <hr class="divider my-4" /> -->
                    <div class="col-md-12 mb-2 text-left" >
                        <div class="card" style="background: linear-gradient(to top, #17a2b8, #17a2b8);">
                            <div class="card-body1" style="border:none">
                                  <h4 class="text-center" style="color:white;">VỊ TRÍ TUYỂN DỤNG</h4>
                               <div class="form-group">
                                   <div class="input-group" >
                                       <input type="text" class="form-control" id="filter" placeholder="Từ khóa tìm kiếm như Web, Lập trình,...">
                                       <div class="input-group-append">
                                           <span class="input-group-text"><i class="fa fa-search"></i></span>
                                       </div>
                                   </div>
                               </div>
                               <span style="color: white;">Kế toán, IT, kiến trúc,... và hàng ngàn công việc khác đang đợi bạn! Chúng tôi cần bạn, bạn cần chúng tôi!</span>
                            </div>
                        </div>
                    </div>                        
                    </div>
                    
                </div>
            </div>
        </header>
        <section id="list" style="background:#17a2b8 ; ">
        <h4 class="text-center" style="color: white; " >DANH SÁCH VỊ TRÍ TUYỂN DỤNG</h4>
        <div class="a">
            <div class="container-ds">
                <hr class="divider">
                <?php
                $vacancy = $conn->query("SELECT * FROM vacancy order by 'id' asc limit $begin,8 ");
                while($row = $vacancy->fetch_assoc()):
                    $trans = get_html_translation_table(HTML_ENTITIES,ENT_QUOTES);
                    unset($trans["\""], $trans["<"], $trans[">"], $trans["<h2"]);
                    $desc = strtr(html_entity_decode($row['description']),$trans);
                    $desc=str_replace(array("<li>","</li>"), array("",","), $desc);
                ?>
                <div class="card vacancy-list" data-id="<?php echo $row['id'] ?>" >
                    <div class="card-body">
                        <div class="col-lg-12">
                            <img src="<?php echo 'admin/assets/img/'.$row['logo_company'] ?> " id="cimg">
                        </div>
                        <br>
                        <h3 style="text-align: center; font-size:20px"><b class="filter-txt"><?php echo $row['position'] ?></b></h3>
                        <span style="padding-top: 50px"><small>Số lượng: <?php echo $row['availability'] ?></small></span>
                        <hr>
                        <larger class="truncate filter-txt1"><?php echo strip_tags($desc) ?></larger>
                        <br>
                        <br>
                      <!--  <hr class="divider"  style="max-width: calc(80%)"> -->
                    </div>
                </div>
                <?php endwhile; ?>
            </div>
        </div>
        </section>
<div style="clear: both;"></div>
<style>
    ul.list_page{
        padding: 0;
        margin: 0;
        list-style: none;
    }
    ul.list_page li{
        float: left;
        padding: 5px 13px;
        margin: 5px;
        background: burlywood;
        display: block;
    }
    ul.list_page li a{
        color: #000;
        text-align: center;
        text-decoration: none;
    }
</style>


<?php
 
$sql_page = mysqli_query($conn, "SELECT * FROM vacancy");
$row_count = mysqli_num_rows($sql_page);
$trang = ceil($row_count/8);
$current_page = isset($_GET['trang']) ? $_GET['trang'] : 1;
if ($current_page > $trang){
    $current_page = $trang;
    }
    else if ($current_page < 1){
    $current_page = 1;
    }
?>
<div class="pagination" style="margin-left : 700px; font-size:20px">
           <?php 
            // PHẦN HIỂN THỊ PHÂN TRANG
            // BƯỚC 7: HIỂN THỊ PHÂN TRANG
 
            // nếu current_page > 1 và total_page > 1 mới hiển thị nút prev
            if ($current_page > 1 && $trang > 1){
                echo '<a href="index.php?trang='.($current_page-1).'" style="margin-left: 20px">Trước</a> | ';
            }
 
            // Lặp khoảng giữa
            for ($i = 1; $i <= $trang; $i++){
                // Nếu là trang hiện tại thì hiển thị thẻ span
                // ngược lại hiển thị thẻ a
                if ($i == $current_page){
                    echo '<span>'.$i.'</span> | ';
                }
                else{
                    echo '<a href="index.php?trang='.$i.'">'.$i.'</a> | ';
                }
            }
 
            // nếu current_page < $total_page và total_page > 1 mới hiển thị nút prev
            if ($current_page < $trang && $trang > 1){
                echo '<a href="index.php?trang='.($current_page+1).'">Sau</a> | ';
            }
           ?>
        </div>  

<script>
    $('.card.vacancy-list').click(function(){
        location.href = "index.php?page=view_vacancy&id="+$(this).attr('data-id')
    })
    var count = 0;
    $('#filter').keyup(function(e){
        var filter = $(this).val()
        console.log(count++);
        $('.card.vacancy-list .filter-txt').each(function(){
            var txto = $(this).html();
            txt = txto
            if((txt.toLowerCase()).includes((filter.toLowerCase())) == true){
                $(this).closest('.card').toggle(true)
            }else{
                $(this).closest('.card').toggle(false)
               
            }
        })
    })
</script>