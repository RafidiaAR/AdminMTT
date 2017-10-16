<!-- Administration Start -->
<?php if($this->session->userdata('leveluser') == 1) : ?>
    <style type="text/css">
.hidden{
    display: none;
}
.showclass{
    display:block;
}
.alert-message
{
    margin: 20px 0;
    padding: 20px;
    border-left: 3px solid #eee;
}
.alert-message h4
{
    margin-top: 0;
    margin-bottom: 5px;
}
.alert-message p:last-child
{
    margin-bottom: 0;
}
.alert-message code
{
    background-color: #fff;
    border-radius: 3px;
}
.alert-message-success
{
    background-color: #F4FDF0;
    border-color: #3C763D;
}
.alert-message-success h4
{
    color: #3C763D;
}
.modal-headeer
{
    background:#ff3333;
    color:white;
    min-height: 16.42857143px;
    padding: 15px;
    border-bottom: 1px solid #e5e5e5;
}
.result{
    margin-top:20px;
}
.inner-block{
    padding: 3em 0em 0em 0em;
    background: #fafafa;
}
.search{
    padding-top: 5px;
}
.img-responsive{
    display: block;
    max-width: 100%;
    height: 210px;
}
.container{
    padding-right: 15px;
    padding-left: 15px;
    margin-right: 5px;
    margin-left: 5px;
}
.prod-info-main {
    border: 1px solid #CEEFFF;
    margin-bottom: 20px;
    margin-top: 10px;
    background: #fff;
    padding: 6px;
    -webkit-box-shadow: 0 1px 4px 0 rgba(21, 180, 255, 0.5);
    box-shadow: 0 1px 1px 0 rgba(21, 180, 255, 0.5);
    max-width: 450;
}
.prod-info-main .product-image {
    background-color: #EBF8FE;
    display: block; 
    min-height: 220px;
    overflow: hidden;
    position: relative;
    border: 1px solid #CEEFFF;
    padding: 5px 5px 5px 5px;
} 
.prod-info-main .product-deatil {
    border-bottom: 1px solid #dfe5e9;
    padding-bottom: 17px;
    padding-left: 16px;
    padding-top: 16px;
    position: relative;
    background: #fff
}
.product-content .product-deatil h5 a {
    color: #2f383d;
    font-size: 15px;
    line-height: 19px;
    text-decoration: none;
    padding-left: 0;
    margin-left: 0
}
.prod-info-main .product-deatil h5 a span {
    color: #9aa7af;
    display: block;
    font-size: 13px
}
.prod-info-main .product-deatil span.tag1 {
    border-radius: 50%;
    color: #fff;
    font-size: 15px;
    height: 50px;
    padding: 13px 0;
    position: absolute;
    right: 10px;
    text-align: center;
    top: 10px;
    width: 50px
}
.prod-info-main .product-deatil span.sale {
    background-color: #21c2f8
}
.prod-info-main .product-deatil span.discount {
    background-color: #71e134
}
.prod-info-main .product-deatil span.hot {
    background-color: #fa9442
}
.prod-info-main .description {
    font-size: 12px;
    line-height: 13px;
    padding: 5px 5px 0px 5px;
    margin-bottom: 5px;
    background: #fff;
}
.prod-info-main .product-info {
    padding: 5px 19px 10px 20px
}
.prod-info-main .product-info a.add-to-cart {
    color: #2f383d;
    font-size: 13px;
    padding-left: 16px
}
.prod-info-main name.a {
    padding: 5px 10px;
    margin-left: 16px
}
.product-info.smart-form .btn {
    font-size: 12px;
    padding: 4px 3px;   
    margin-left: 0px;
    margin-top: 10px;
}
.load-more-btn {
    background-color: #21c2f8;
    border-bottom: 2px solid #037ca5;
    border-radius: 2px;
    border-top: 2px solid #0cf;
    margin-top: 20px;
    padding: 92px 0;
    width: 100%
}
.product-block .product-deatil p.price-container span,
.prod-info-main .product-deatil p.price-container span,
.shipping table tbody tr td p.price-container span,
.shopping-items table tbody tr td p.price-container span {
    color: #21c2f8;
    font-family: Lato, sans-serif;
    font-size: 24px;
    line-height: 20px
}
.product-info.smart-form .rating label {
    margin-top: 15px;
}
.prod-wrap .product-image span.tag2 {
    position: absolute;
    top: 10px;
    right: 10px;
    width: 36px;
    height: 36px;
    border-radius: 50%;
    padding: 10px 0;
    color: #fff;
    font-size: 11px;
    text-align: center
}
.prod-wrap .product-image span.tag3 {
    position: absolute;
    top: 10px;
    right: 20px;
    width: 60px;
    height: 36px;
    border-radius: 50%;
    padding: 10px 0;
    color: #fff;
    font-size: 11px;
    text-align: center
}
.prod-wrap .product-image span.sale {
    background-color: #57889c;
}
.prod-wrap .product-image span.hot {
    background-color: #a90329;
}
.prod-wrap .product-image span.out {
    background-color: #25c401;
}
.prod-wrap .product-image span.special {
    background-color: #3B6764;
}
.shop-btn {
    position: relative
}
.shop-btn>span {
    background: #a90329;
    display: inline-block;
    font-size: 10px;
    box-shadow: inset 1px 1px 0 rgba(0, 0, 0, .1), inset 0 -1px 0 rgba(0, 0, 0, .07);
    font-weight: 700;
    border-radius: 50%;
    padding: 2px 4px 3px!important;
    text-align: center;
    line-height: normal;
    width: 19px;
    top: -7px;
    left: -7px
}
.product-deatil hr {
    padding: 0 0 5px!important
}
.product-deatil .glyphicon {
    color: #3276b1
}
.product-deatil .product-image {
    border-right: 0px solid #fff !important
}
.product-deatil .name {
    margin-top: 0;
    margin-bottom: 0
}
.product-deatil .name small {
    display: block
}
.product-deatil .name a {
    margin-left: 0
}
.product-deatil .price-container {
    font-size: 24px;
    margin: 0;
    font-weight: 300;
}
.product-deatil .price-container small {
    font-size: 12px;
}
.product-deatil .fa-2x {
    font-size: 16px!important
}
.product-deatil .fa-2x>h5 {
    font-size: 12px;
    margin: 0
}
.product-deatil .fa-2x+a,
.product-deatil .fa-2x+a+a {
    font-size: 13px
}
.product-deatil .certified {
    margin-top: 10px
}
.product-deatil .certified ul {
    padding-left: 0
}
.product-deatil .certified ul li:not(first-child) {
    margin-left: -3px
}
.product-deatil .certified ul li {
    display: inline-block;
    background-color: #f9f9f9;
    padding: 13px 19px
}
.product-deatil .certified ul li:first-child {
    border-right: none
}
.product-deatil .certified ul li a {
    text-align: left;
    font-size: 12px;
    color: #6d7a83;
    line-height: 16px;
    text-decoration: none
}
.product-deatil .certified ul li a span {
    display: block;
    color: #21c2f8;
    font-size: 13px;
    font-weight: 700;
    text-align: center
}
.product-deatil .message-text {
    width: calc(100% - 70px)
}
@media only screen and (min-width: 1024px) {
    .prod-info-main div[class*=col-md-4] {
        padding-right: 0
    }
    .prod-info-main div[class*=col-md-8] {
        padding: 0 13px 0 0
    }
    .prod-wrap div[class*=col-md-5] {
        padding-right: 0
    }
    .prod-wrap div[class*=col-md-7] {
        padding: 0 1px 0 0
    }
    .prod-info-main .product-image {
        border-right: 1px solid #dfe5e9
    }
    .prod-info-main .product-info {
        position: relative
    }
    .search-form .form-group {
  float: right !important;
  transition: all 0.35s, border-radius 0s;
  width: 32px;
  height: 32px;
  background-color: #fff;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
  border-radius: 25px;
  border: 1px solid #ccc;
}
.search-form .form-group input.form-control {
  padding-right: 20px;
  border: 0 none;
  background: transparent;
  box-shadow: none;
  display:block;
}
.search-form .form-group input.form-control::-webkit-input-placeholder {
  display: none;
}
.search-form .form-group input.form-control:-moz-placeholder {
  /* Firefox 18- */
  display: none;
}
.search-form .form-group input.form-control::-moz-placeholder {
  /* Firefox 19+ */
  display: none;
}
.search-form .form-group input.form-control:-ms-input-placeholder {
  display: none;
}
.search-form .form-group:hover,
.search-form .form-group.hover {
  width: 100%;
  border-radius: 4px 25px 25px 4px;
}
.search-form .form-group span.form-control-feedback {
  position: absolute;
  top: -1px;
  right: -2px;
  z-index: 2;
  display: block;
  width: 34px;
  height: 34px;
  line-height: 34px;
  text-align: center;
  color: #3596e0;
  left: initial;
  font-size: 14px;
}
}
    </style>
<div class="inner-block">
   <div class="product-block">
      <div class="pro-head">

         <h2>Daftar Produk di JualBeli MTT<a href="<?php echo base_url(); ?>progress/add_product"></a>
         </h2>
        <div>
        <div class="col-sm-5 col-md-5 " style="display: none;" id="alertdiv">
            <div class="alert-message alert-message-success">
            <button type="button" class="close" id="exitalert">×</button>
                <h4>
                    Delete Product Success</h4>
                <p>
                    You was deleted <strong id="pr_namee">Bubur Kuningan</strong> from jualBeli MTT</p>
            </div>
        </div>
        
            <div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-3">
            <form action="" class="search-form">
                <div class="form-group has-feedback">
                    <label for="search" class="sr-only">Search</label>
                    <input type="text" class="form-control" name="search" id="search" placeholder="search">
                    <span class="glyphicon glyphicon-search form-control-feedback"></span>
                </div>
            </form>
        </div>
    </div>
</div>
        </div>
      </div>
    <?php foreach ($product as $aw ) :?>
      <!-- Product Start -->
      <div class="prod-info-main prod-wrap clearfix col-md-4">
   <div class="row">
      <div class="col-md-5 col-sm-12 col-xs-12">
         <div class="product-image">
            <img src="<?php echo base_url();?>/assets/images/pro1.jpg" class="img-responsive" height="500">
            <?php if($aw->stock >0){
                    echo '<span class="tag2 out">'.$aw->stock.'</span>';
                }else{
                    echo '<span class="tag2 hot">'.$aw->stock.'</span>';
                    } ?>
            <?php  ?>
            
         </div>
      </div>
      <div class="col-md-6 col-sm-12 col-xs-12">
         <div class="product-deatil">
            <h5 class="name">
               <a href="#">
               
               <?php echo substr($aw->product_name,0,20);?>

               </a>
               <a href="#">
               <span><?php echo $aw->name; ?></span>
               </a>                           
            </h5>
            <p class="price-container">
               <span>Rp.<?php echo $aw->price; ?></span>
            </p>
            <span class="tag1"></span>
         </div>
         <div class="description">
            
            <p><?php echo substr($aw->description,0,100)?></p>
         </div>
         <div class="product-info smart-form">
            <div class="row">
               <div class="col-md-20">
              <input type="hidden" name="adminpro" class="form-control" value="<?php echo $aw->proid;?>">
                <button type="button" class="btn btn-info" href="#" id="detailpro" data-toggle="modal" data-target="#myDetail"><i class="fa fa-search"></i> Lihat Produk</button>
                <input type="hidden" name="adminpro" class="form-control" value="<?php echo $aw->proid;?>">
                <button type="button" class="btn btn-danger" href="#" id="trash" data-toggle="modal" data-target="#myModall"><i class="fa fa-trash"></i> Hapus</button>

               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<!-- end product -->
<?php endforeach; ?>

 
      <div class="clearfix"> </div>
   </div>
</div>


<?php endif ;?>
<!-- Administraion End -->
<!-- Merchant Start -->
<?php if($this->session->userdata('leveluser') == 0 || $this->session->userdata('leveluser') == NULL ): ?>

<style type="text/css">
.modal-headeer
{
    background:#ff3333;
    color:white;
    min-height: 16.42857143px;
    padding: 15px;
    border-bottom: 1px solid #e5e5e5;
}
.alert-message
{
    margin: 20px 0;
    padding: 20px;
    border-left: 3px solid #eee;
}
.alert-message-success
{
    background-color: #F4FDF0;
    border-color: #3C763D;
}
.alert-message-success h4
{
    color: #3C763D;
}
</style>
<div class="inner-block">

    <div class="product-block">
        <div class="pro-head">
            <h2>Your Products  <a href="<?php echo base_url(); ?>progress/add_product"><i class="fa fa-plus"></i> </a>
            </h2> 
           
        </div>
        <?php if(!empty($notif)) {
            if($notif == 1)
            {
            echo '<div class="alert-message alert-message-success alert-dismissible" role="alert">
           
               
                    <h4>
                        Upload Product Success
                    </h4>
                    <p>Terimakasih telah mempercayakan JualBeli MTT untuk menjual produk anda. <b> Segera kirimkan produk anda 
                                            ke Sekretariat MTT untuk memperoleh approval. </b></p>
                                         <sub><b>Note : </b>Produk yang tidak dikirimkan ke Sekretariat MTT tidak akan diproses lebih lanjut dan 
                                            tidak dapat diperjualbelikan di JualBeli MTT</sub>
                
            </div>';
            }
            else{
            echo '<div class="alert alert-warning alert-dismissible" role="alert">

                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                '.$notif.'
            </div>';
             }
            } ?>

<?php foreach ($product as $aw ) : ?>

            <div class="col-md-3 product-grid">
            <div class="product-items">
                <input type="hidden" name="product_id" placeholder="Nama Produk" class="form-control" value="<?php echo $aw->pro_id;?>">
                <button data-toggle="modal" data-target="#myModall" class="btn btn-danger" id="trash"><i class="fa fa-trash-o" ></i></button>
                    <div class="project-eff">
                        <div id="nivo-lightbox-demo"> <p> <a href="#" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo"><span class="rollover1"> </span> </a></p></div>     
                            <img class="img-responsive" src="<?php echo base_url();?>/assets/images/pro1.jpg" alt="" width="200px">
                    </div>
                <div class="produ-cost" >

                    <h4 class="aw"><?php echo $aw->product_name; ?></h4>
                    <h5>Rp.<?php echo $aw->price; ?></h5><br>
                    <h6>Stok:<span> <?php echo $aw->stock; ?></span></h6>
                    <br/>
                    <input type="hidden" name="product_id" placeholder="Nama Produk" class="form-control" value="<?php echo $aw->pro_id;?>">
                    <button type="button" class="btn btn-primary" href="#" id="quickview" data-toggle="modal" data-target="#quickvieww"><i class="fa fa-search"></i> Quick View</button>
                </div>
            </div>
        </div>
        <?php endforeach; ?>
      <div class="clearfix"> </div>
    </div>
</div>
<?php endif ;?>
<!-- Merchant End -->
<!-- modal detail produk -->

<div class="modal fade product_view" id="quickvieww">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <a href="" data-dismiss="modal" class="class pull-right"><span class="glyphicon glyphicon-remove"></span></a>
                <h3 class="modal-title" id="pro_name"></h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6 product_img">
                        <img id="pro_image" src="http://img.bbystatic.com/BestBuy_US/images/products/5613/5613060_sd.jpg" class="img-responsive">
                    </div>
                    <div class="col-md-6 product_content">
                    <h5><span id="pro_status"></span></h5>
                        <h4>Stock:<span id="pro_stock"></span></h4>
                        <!--  <div class="rating">
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            <span class="glyphicon glyphicon-star"></span>
                            (10 reviews)
                        </div> -->
                        <h3 class="cost" id="pro_price"></h3><br>
                        <h5 id="pro_last_update"></h5>
                        <p>Deskripsi : </p>
                        <p id="pro_description"></p>
                        
                        <div class="clearfix"></div>
                        <div class="space-ten"></div>
                        <div class="btn-ground">
                        <a href="<?php echo base_url();?>/page/edit_product/" id="pro_id"> <button type="button" class="btn btn-primary"> <span class="glyphicon glyphicon-pencil"></span> Edit Produk </button></a>
                        </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- modul detail produk end -->
<!--inner block end here-->
<!-- Modal -->
            <div class="modal" id="myDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="text-danger fa fa-times"></i></button>
                    <h4 class="modal-title" id="myModalLabel"><i class="text-muted fa fa-shopping-cart"></i> <strong id="a_pro_id"></strong> <i id="a_pro_name"> Nasi Bakar MTT</i> </h4>
                  </div>
                  <div class="modal-body">
                  
                    <table class="pull-left col-md-8 ">
                         <tbody>
                             <tr>
                                 <td class=""><p><strong>Merchant</strong></p></td>
                                 <td> </td>
                                 <td class="h5" id="a_mer_name">Rafid</td>
                             </tr>
                             
                             <tr>
                                 <td class=""><p><strong>Kategori</strong></p></td>
                                 <td> </td>
                                 <td class="h5" id="a_pro_cat">TSO Cafe</td>
                             </tr>
                             <tr>
                                 <td class=""><p><strong>Status</strong></p></td>
                                 <td> </td>
                                 <td><i id="a_pro_status"></i></td>
                             </tr>
                            <tr>
                                 <td class="btn-mais-info text-primary">
                                     <br><br><br><i class=""></i>Deskripsi
                                 </td>
                             </tr>
                         </tbody>
                    </table>
                             
                         
                    <div class="col-md-4"> 
                        <img src="http://lorempixel.com/150/150/technics/" alt="teste" class="img-thumbnail">  
                    </div>
                    
                    <div class="clearfix"></div>
                   <p class="open_info" id="a_pro_desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                  </div>
                    
                  <div class="modal-footer">       
                     
                    <div class="text-right pull-right col-md-3">
                        Stock: <br/> 
                        <span class="h3 text-muted"><strong id="a_pro_stock">100</strong></span></span> 
                    </div> 
                      
                    <div class="text-right pull-right col-md-3">
                        Harga: <br/> 
                        <span class="h3 text-muted"><strong id="a_pro_price">Rp.15000</strong></span>
                    </div>
                    <div class="text-left pull-left col-md-3">
                       <a href="<?php echo base_url()?>Admin/Edit_Product/" id="product_id"> <button type="button" class="btn btn-primary"><i class="fa fa-pencil-square-o"></i> Edit Produk</button>
                    </div>
                     
                </div>
              </div>
            </div>
            </div>
<!-- fim Modal--> 
<!-- Modal Delete -->
<div id="myModall" class="modal fade" role="dialog">
             <div class="modal-dialog">
                        <div class="modal-content">
                                   <div class="modal-headeer">
                                         <button type="button" class="close" data-dismiss="modal">×</button>
                                         <h4 class="modal-title"><i class="fa fa-hdd-o"></i>  Delete Product</h4>
                                   </div>
                                   <div class="modal-body">
                                         <p>Are you sure to delete <b id="pr_name"></b> from JualBeli MTT ?</p>

                                   </div>
                                   <div class="modal-footer">
                                         <input type="hidden" class="form-control" name="search" id="pr_id" value="">
                                         <button type="button" class="btn btn-danger" id="delete">Yes</button>
                                         <button type="button" class="btn btn-info" data-dismiss="modal">No</button>
                                   </div>
                        </div>

            </div>
     </div>
<!-- Modal Delete End -->







<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/css/magnific-popup.css">
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/nivo-lightbox.min.js"></script>

<script type="text/javascript">
$(function() {

    $('#search').on('keyup', function() {
        var pattern = $(this).val();
        $('.searchable-container .items').hide();
        $('.searchable-container .items').filter(function() {
            return $(this).text().match(new RegExp(pattern, 'i'));
        }).show();
    });
});
$("button#exitalert").click(function(event)
{
    $('#alertdiv').addClass('hidden');
});
$("button#quickview").click(function(event) {
    var product_id = $(this).prev().val();
    // alert(product_id);
    if (product_id != "") {
        $.ajax({
            url: "<?php echo base_url()?>Progress/CariProduk",
            type: 'post',
            data: {
                id: product_id
            },
            success: function(e) {
                var data = e.split("|");
                $('#pro_id').attr('href', '<?php echo base_url()?>Page/edit_product/' + data[0]);
                $('#pro_name').html(data[1]);
                $('#pro_stock').html(data[2]);
                $('#pro_price').html('Rp. ' + data[3]);
                $('#pro_description').html(data[4]);
                $('#pro_status').html(data[5]);
                var data = {
                    "date_created": data[6]
                };
                var date = new Date(parseInt(data.date_created, 10) * 1000);
                $('#pro_last_update').html('Last_Update : ' + date.toLocaleString());
                $('#pro_image').attr('src', '<?php echo base_url()?>assets/images/' + data[7]);
            }
        });
    } else {
        $('#pro_name').html();
    }
});
$("button#detailpro").click(function(event) {
    var product_id = $(this).prev().val();
    // alert(product_id);
    if (product_id != "") {
        $.ajax({
            url: "<?php echo base_url()?>Admin/CariProduk",
            type: 'post',
            data: {
                id: product_id
            },
            success: function(e) {
                var data = e.split("|");
                $('#product_id').attr('href', '<?php echo base_url()?>Admin/edit_product/' + data[0]);
                $('#a_pro_id').html(data[0] + ' - ');
                $('#a_pro_name').html(data[1]);
                $('#a_mer_name').html(data[2]);
                $('#a_pro_cat').html(data[3]);
                $('#a_pro_desc').html(data[5]);
                $('#a_pro_price').html('Rp.'+ data[6]);
                $('#a_pro_stock').html(data[7]);
                if (data[7] > 0) {
                    $('#a_pro_status').html('<span class="label label-success">Ready stock</span>');
                } else {
                    $('#a_pro_status').html('<span class="label label-danger">Out Of Stock</span>');

                }
            }
        });
    } else {
        $('#a_pro_id').html();
    }
});
$("button#trash").click(function(event) {
    var product_id = $(this).prev().val();
    // alert(product_id);
    if (product_id != "") {
        $.ajax({
            url: "<?php echo base_url()?>Progress/CariProduk",
            type: 'post',
            data: {
                id: product_id
            },
            success: function(e) {
                var data = e.split("|");
                $('#alertdiv').addClass('showclass');
                $('#pr_id').val(data[0]);
                $('#pr_name').html(data[1]);
                $('#pr_namee').html(data[1]);
               }
        });
    } else {
        $('#pro_name').html();
    }
});




$('button#delete').click(function(event) {
    var product_id = $(this).prev().val();
    /*alert(product_id);*/
    $.ajax({
        url: '<?php echo base_url(); ?>Page/Delete_Product',
        type: 'post',
        data: {
            id: product_id
        },
        success: function(e)     {
            if (e == "true") {
                setTimeout(function() { // wait for 5 secs(2)
                    location.reload(); // then reload the page.(3)
                }, 001);

                
                // $('body').load('<?php echo base_url(); ?>Page');
                // $("#opencart").attr('class', "dropdown open");
                // $("#openexpanded").attr('aria-expanded', "true");
            } else {
                alert('Hapus Gagal');
            }
        }
    });
});
</script>