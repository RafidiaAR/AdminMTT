
<?php if($this->session->userdata('leveluser') == 1) : ?>
	<style type="text/css">
.modal-header
{
    background:  #47d147;
    color:white;
    min-height: 16.42857143px;
    padding: 15px;
    border-bottom: 1px solid #e5e5e5;
}
   .modal-headeer
{
    background:#ff3333;
    color:white;
    min-height: 16.42857143px;
    padding: 15px;
    border-bottom: 1px solid #e5e5e5;
}
</style>
<div class="inner-block">

    <div class="col-md-12 chart-layer2-left">
               <div class="work-progres">
                            <div class="chit-chat-heading">
                                  Produk Pending JualBeli MTT
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                  <thead>
                                    <tr>
                                      <th style="width: 1%;">No</th>
                                      <th style="width: 3%;">Merchant</th>
                                      <th style="width: 10%;">Produk</th>
                                      <th style="width: 2%;">Stok	</th>
                                      <th style="width: 5%;">Harga</th>
                                      <th style="width: 5%;">Admin Fee</th>
                                      <th style="width: 13%;">Deskripsi</th>
                                      <th style="width: 3%;">Status</th>
                                      <th style="width: 10%; text-align: center;">Action</th>

                                  </tr>
                              </thead>
                              <tbody>
                                 
                                 <?php 
                                 $i = 1;
                                 foreach ($A_Transaction as $data):?>
                                <tr>
                                  <td><?php echo $i++;?></td>
                                  <td><?php echo $data->username;?></td>
                                  <td><?php echo $data->product_name;?></td>
                                  <td><?php echo $data->stock;?></td>
                                  <td><?php echo $data->price;?></td>
                                  <td><?php echo $data->fee;?></td>
                                  <td><?php echo $data->description;?></td>
                                  <td><?php
                                  if($data->approve == 0)
                                  	{
                                  		echo 'PENDING';
                                  	}
                                  	else{
                                  		echo 'APPROVED';
                                  		}?></td>
                                  <td>
                                  
                                  <!-- <button id="detail" class="btn btn-info" data-toggle="modal" data-target="modal-body">
                                  <i class="fa fa-search"></i>&nbsp Detail</button> -->
                                  <!-- <a href="<?php echo base_url();?>Admin/DetailTransaction/<?php echo $data->id_product;?>"><button id="detail" class="btn btn-info" data-toggle="modal" data-target="modal-body">
                                  <i class="fa fa-search"></i>&nbsp Detail</button></a> -->
                                  <!-- <input type="hidden" name="amount" placeholder="Nama Produk" class="form-control" value="<?php echo $data->amount;?>"> -->
                                  <button id="showaccept" class="btn btn-success" data-toggle="modal" data-target="#myModalll">
                                  <i class="fa fa-check"></i>&nbsp Accept</button>
                                  <input type="hidden" name="product_id" placeholder="Nama Produk" class="form-control" value="<?php echo $data->id_product;?>">
                                  <button id="deleteapp" class="btn btn-danger" data-toggle="modal" data-target="#myModall">
                                  <i class="fa fa-close"></i>&nbsp Decline</button>
                                <!--   <input type="hidden" class="form-control" value="<?php echo $data->id_detail;?>"> -->
                                  </td>
                              </tr>
                            <?php endforeach; ?>
                              
                              <input id="last_update" type="hidden" name="last_update" placeholder="" class="form-control" value="<?php echo strtotime(date('Y-m-d H:i:s'))?>">
                          </tbody>
                      </table>
                      <div class="text-center">
                         <?php 
                          echo "<br /><div>" .$this->pagination->create_links() ."</div>";
                      ?>
                      </div>
                  </div>
             </div>
      </div>
      <div class="clearfix"></div>
</div>
<?php endif; ?>
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
            <h2>Your Pending Products  
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

<?php foreach ($pending as $aw ) : ?>

            <div class="col-md-3 product-grid">
            <div class="product-items">
                <input type="hidden" name="product_id" placeholder="Nama Produk" class="form-control" value="<?php echo $aw->id_product;?>">
                <button data-toggle="modal" data-target="#myModall" class="btn btn-danger" id="trash"><i class="fa fa-trash-o" ></i></button>
                    <div class="project-eff">
                        <div id="nivo-lightbox-demo"> <p> <a href="#" data-lightbox-gallery="gallery1" id="nivo-lightbox-demo"><span class="rollover1"> </span> </a></p></div>     
                            <img class="img-responsive" src="<?php echo base_url();?>/assets/images/pro1.jpg" alt="" width="200px">
                    </div>
                <div class="produ-cost" >

                    <h4 class="aw"><?php echo $aw->product_name; ?></h4>
                    <h5>Rp.<?php echo $aw->price; ?></h5><br>
                    <h6>Stock:<span> <?php echo $aw->stock; ?></span></h6>
                    <br/>
                    <input type="hidden" name="product_id" placeholder="Nama Produk" class="form-control" value="<?php echo $aw->id_product;?>">
                    <button type="button" class="btn btn-primary" href="#" id="quickview" data-toggle="modal" data-target="#quickvieww"><i class="fa fa-search"></i> Quick View</button>
                </div>
            </div>
        </div>
        <?php endforeach; ?>
      <div class="clearfix"> </div>
    </div>
</div>
<?php endif ;?>
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
                        <!-- <a href="<?php echo base_url();?>/page/edit_product/" id="pro_id"> <button type="button" class="btn btn-primary"> <span class="glyphicon glyphicon-pencil"></span> Edit Produk </button></a> -->
                        </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="myModalll" class="modal fade" role="dialog">
             <div class="modal-dialog">
                        <div class="modal-content">
                                   <div class="modal-header">
                                         <button type="button" class="close" data-dismiss="modal">×</button>
                                         <h4 class="modal-title"><i class="fa fa-hdd-o"></i>  Konfirmasi Produk</h4>
                                   </div>
                                   <div class="modal-body">

                                         <p>Pastikan anda telah menerima barang dari <b id="merchant"></b>, dengan produk <b id="product"></b> sejumlah <b id="stock"> 3 </b></p>

                                   </div>
                                   <div class="modal-footer">
                                         <button id="Accept" type="button" class="btn btn-success" >Yes</button>
                                         <input type="hidden" class="form-control" name="search" id="id" value="" placeholder="">
                                         <button id="ADecline" type="button" class="btn btn-danger" data-dismiss="modal">No</button>
                                        
                                   </div>
                        </div>

            </div>
</div>
<div id="myModall" class="modal fade" role="dialog">
             <div class="modal-dialog">
                        <div class="modal-content">
                                   <div class="modal-headeer">
                                         <button type="button" class="close" data-dismiss="modal">×</button>
                                         <h4 class="modal-title"><i class="fa fa-hdd-o"></i>  Tolak Product</h4>
                                   </div>
                                   <div class="modal-body">
                                         <p>Tolak Produk <b id="pr_name"></b> dari <b id="pr_merc"></b> ?</p>

                                   </div>
                                   <div class="modal-footer">
                                         <input type="hidden" class="form-control" name="search" id="pr_id" value="">
                                         <button type="button" class="btn btn-danger" id="delete">Yes</button>
                                         <button type="button" class="btn btn-info" data-dismiss="modal">No</button>
                                   </div>
                        </div>

            </div>
     </div>
<script type="text/javascript">
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
$("button#deleteapp").click(function(event) {
    var product_id = $(this).prev().val();
    //alert(product_id);
    if (product_id != "") {
        $.ajax({
            url: "<?php echo base_url()?>Admin/CariPending",
            type: 'post',
            data: {
                id: product_id,
            },
            success: function(e) {
                var data = e.split("|");
                $('#ap_id').val(data[0]);  
                $('#ap_merchant').html(data[4]);
                $('#ap_product').html(data[1]);
                $('#ap_stock').html(data[2]);
            }
        });
    } else {
        $('#trans_code').html();
    }
});
$("button#showaccept").click(function(event) {
    var product_id = $(this).next().val();
    //alert(product_id);
    if (product_id != "") {
        $.ajax({
            url: "<?php echo base_url()?>Admin/CariPending",
            type: 'post',
            data: {
                id: product_id,
            },
            success: function(e) {
                var data = e.split("|");
                $('#id').val(data[0]);  
                $('#merchant').html(data[4]);
                $('#product').html(data[1]);
                $('#stock').html(data[2]);
            }
        });
    } else {
        $('#trans_code').html();
    }
});
$('button#AcceptApp').click(function(event) {
    var product_id = $(this).prev().val();
    var stats = 2;
 /*   alert(product_order);*/
    $.ajax({
        url: '<?php echo base_url(); ?>Admin/ChangePending',
        type: 'post',
        data: {
            id : product_id,
            approve : stats,
        },
        success: function(e) {
            if (e == "true") {
                setTimeout(function() { // wait for 5 secs(2)
                    location.reload(); // then reload the page.(3)
                }, 001);
                // $('body').load('<?php echo base_url(); ?>Page');
                // $("#opencart").attr('class', "dropdown open");
                // $("#openexpanded").attr('aria-expanded', "true");
            } else {
                alert('Update Gagal');
            }
        }
    });
});
$('button#Accept').click(function(event) {
    var product_id = $(this).next().val();
    var stats = 1;
 /*   alert(product_order);*/
    $.ajax({
        url: '<?php echo base_url(); ?>Admin/ChangePending',
        type: 'post',
        data: {
            id : product_id,
            approve : stats,
        },
        success: function(e) {
            if (e == "true") {
                setTimeout(function() { // wait for 5 secs(2)
                    location.reload(); // then reload the page.(3)
                }, 001);
                // $('body').load('<?php echo base_url(); ?>Page');
                // $("#opencart").attr('class', "dropdown open");
                // $("#openexpanded").attr('aria-expanded', "true");
            } else {
                alert('Update Gagal');
            }
        }
    });
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
$("button#trash").click(function(event) {
    var product_id = $(this).prev().val();
    // alert(product_id);
    if (product_id != "") {
        $.ajax({
            url: "<?php echo base_url()?>Progress/GetProduk",
            type: 'post',
            data: {
                id: product_id
            },
            success: function(e) {
                var data = e.split("|");
                $('#pr_id').val(data[0]);
                $('#pr_name').html(data[1]);
                $('#pr_merc').html(data[2]);
               }
        });
    } else {
        $('#pro_name').html();
    }
});
</script>