<style type="text/css">
  .inner-block{
    padding: 4em 2em 4em 2em;
    background : #fafafa;
  }
   .modal-headeer
{
    background:#ff3333;
    color:white;
    min-height: 16.42857143px;
    padding: 15px;
    border-bottom: 1px solid #e5e5e5;
}
.modal-headeeer
{
    background:  #47d147;
    color:white;
    min-height: 16.42857143px;
    padding: 15px;
    border-bottom: 1px solid #e5e5e5;
}
</style>
<!-- Admin Merchant Start -->
<?php if($this->session->userdata('leveluser') == 1) : ?>
<div class="inner-block">

    <div class="col-md-12 chart-layer2-left">
               <div class="work-progres">
                            <div class="chit-chat-heading">
                                  Transaksi Sedang Dikirim
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                  <thead>
                                    <tr>
                                      <th style="width: 2%;">No. Order</th>
                                      <th style="width: 3%;">Pembeli</th>
                                      <th style="width: 3%;">Merchant</th>
                                      <th style="width: 10%;">Produk</th>
                                      <th style="width: 3%;">Jumlah</th>
                                      <!-- <th style="width: 7%;">Shipping</th> -->
                                      <th style="width: 5%;">Total Harga</th>
                                      <th style="width: 10%;">Status Order</th>
                                      <th style="width: 15%; text-align: center;">Action</th>

                                  </tr>
                              </thead>
                              <tbody>
                                 
                                 <?php 
                                 $i = 1;
                                 foreach ($A_Transaction as $data):?>
                                <tr>
                                 <td><?php echo $data->code;?></td>
                                  <td><?php echo $data->buyer;?></td>
                                  <td><?php echo $data->username;?></td>
                                  <td><?php echo $data->product_name;?></td>
                                  <td><?php echo $data->amount;?></td>
                                  <!-- <td><?php echo $data->shipping;?></td> -->
                                  <td><?php 
                                  $amount = $data->amount;
                                  $price  = $data->price_item;
                                  echo 'Rp. '.number_format($amount*$price);?></td>
                                  <td><?php echo $data->status;?></td>
                                  <td>
                                  
                                  <a href="<?php echo base_url();?>Admin/DetailTransaction/<?php echo $data->id_detail;?>"><button id="detail" class="btn btn-info" data-toggle="modal" data-target="modal-body">
                                  <i class="fa fa-search"></i>&nbsp Detail</button></a>
                                  <input type="hidden" name="amount" placeholder="Nama Produk" class="form-control" value="<?php echo $data->amount;?>">
                                  <button id="showaccept" class="btn btn-success" data-toggle="modal" data-target="#myModalll">
                                  <i class="fa fa-check"></i>&nbsp Accept</button>
                                  <input type="hidden" name="product_id" placeholder="Nama Produk" class="form-control" value="<?php echo $data->id_detail;?>">
                                  <button id="deletetrans" class="btn btn-danger" data-toggle="modal" data-target="#myModall">
                                  <i class="fa fa-close"></i>&nbsp Decline</button>
                                  <input id="order_id" type="hidden" class="form-control" value="<?php echo $data->id_detail;?>">
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
<!-- Admin Merchant End -->
<!-- Merchant Transaction Start -->
<?php if($this->session->userdata('leveluser') == 0 || $this->session->userdata('leveluser') == NULL ): ?>
<div class="inner-block">
	  <div class="col-md-12 chart-layer2-left">
               <div class="work-progres">
                            <div class="chit-chat-heading">
                                  Order Masuk
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                  <thead>
                                    <tr>
                                      <th style="width: 10%">#ID Transaksi</th>
                                      <th style="width: 10%">Nama Pemesan</th>
                                      <th style="width: 15%">Alamat</th>
                                      <th style="width: 15%">Nama Produk</th>
                                      <th style="width: 10%">Shipping Method</th>
                                      <th style="width: 10%">Total</th>
                                      <th style="width: 10%">Status</th>
                                      <th style="width: 20%">Aksi</th>

                                  </tr>
                              </thead>
                              <tbody>
                                 <?php foreach ($transaksi as $data ) : ?>
                                <tr>
                                  <td><?php echo $data->code; ?></td>
                                  <td><?php echo $data->buyer; ?></td>
                                  <td><?php echo $data->address; ?></td>
                                  <td><?php echo $data->product_name; ?></td>
                                  <td><?php echo $data->shipping; ?></td>
                                  <td><?php echo $data->total_fees; ?></td>
                                  <td><?php echo $data->status;?>  
                                  </td>
                                  <td>
                                  <input type="hidden" name="amount" placeholder="Nama Produk" class="form-control" value="<?php echo $data->amount;?>">
                                  <button id="Accept" class="btn btn-success">
                                  <i class="fa fa-check"></i>&nbsp Accept</button>
                                  <input type="hidden" name="product_id" placeholder="Nama Produk" class="form-control" value="<?php echo $data->product_id;?>">
                                  <button id="Decline" class="btn btn-danger">
                                  <i class="fa fa-close"></i>&nbsp Decline</button>
                                  <input id="order_id" type="hidden" class="form-control" value="<?php echo $data->id;?>">
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
<!-- Merchant Transaction End -->
<!-- Modal Delete -->
<div id="myModall" class="modal fade" role="dialog">
             <div class="modal-dialog">
                        <div class="modal-content">
                                   <div class="modal-headeer">
                                         <button type="button" class="close" data-dismiss="modal">×</button>
                                         <h4 class="modal-title"><i class="fa fa-hdd-o"></i>  Cancel Transaction</h4>
                                   </div>
                                   <div class="modal-body">

                                         <p>Pesanan dengan No. Order <b id="trans_code"></b>  produk <b id="trans_product"></b> sejumlah <b id="trans_amount"> 3 </b> Pieces akan dibatalkan</p>

                                   </div>
                                   <div class="modal-footer">
                                         <button type="button" class="btn btn-danger" id="Decline">Yes</button>
                                         <input type="hidden" class="form-control" name="search" id="trans_id" value="" placeholder="">
                                         <button type="button" class="btn btn-info" data-dismiss="modal">No</button>
                                   </div>
                        </div>

            </div>
     </div>
<!-- Modal Delete End -->
<!-- Modal Delete -->
<div id="myModalll" class="modal fade" role="dialog">
             <div class="modal-dialog">
                        <div class="modal-content">
                                   <div class="modal-headeeer">
                                         <button type="button" class="close" data-dismiss="modal">×</button>
                                         <h4 class="modal-title"><i class="fa fa-hdd-o"></i>  Confirm Order</h4>
                                   </div>
                                   <div class="modal-body">

                                         <p>Pengiriman Pesanan dengan No. Order <b id="a_code"></b>  produk <b id="a_productname1"></b> sejumlah <b id="a_amount1"> 3 </b> Pieces telah sampai tujuan</p>

                                   </div>
                                   <div class="modal-footer">
                                         
                                         <button type="button" class="btn btn-success" id="Sent">Yes</button>
                                         <input type="hidden" class="form-control" name="search" id="a_iddetail1" value="" placeholder="">
                                         <button id="ADecline" type="button" class="btn btn-danger" data-dismiss="modal">No</button>
                                  
                                  <input id="a_iddetail" type="hidden" class="form-control" value="">
                                  <input id="a_orderid" type="hidden" class="form-control" value="">
                                  <input id="a_productid" type="hidden" class="form-control" value="">
                                  <input id="a_productname" type="hidden" class="form-control" value="">
                                  <input id="a_merchantid" type="hidden" class="form-control" value="">
                                  <input id="a_username" type="hidden" class="form-control" value="">
                                  <input id="a_phone" type="hidden" class="form-control" value="">
                                  <input id="a_email" type="hidden" class="form-control" value="">
                                  <input id="a_amount" type="hidden" class="form-control" value="">
                                  <input id="a_priceitem" type="hidden" class="form-control" value=""> 
                                  <input id="date" type="hidden" name="last_update" placeholder="" class="form-control" value="<?php echo strtotime(date('Y-m-d H:i:s'))?>">
                                   </div>
                        </div>

            </div>
     </div>
<!-- Modal Delete End -->
<Script type="text/javascript">
$('button#Decline').click(function(event) {
    var product_order = $(this).next().val();
    var stats = "Order Dibatalkan";
 /*   alert(product_order);*/
    $.ajax({
        url: '<?php echo base_url(); ?>Page/Change_Status',
        type: 'post',
        data: {
            id : product_order,
            status : stats,
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
    var amount = $(this).prev().val();
    var product_id = $(this).next().val();
    var order_id = $('button#Decline').next().val();
    var stats = "Proses Kirim";
    var last_update = document.getElementById("last_update").value;
   // alert(product_id);
    $.ajax({
        url: '<?php echo base_url(); ?>Page/Update_Order',
        type: 'post',
        data: {
            order_id    : order_id,
            status      : stats,
            product_id  : product_id,
            amount      : amount,
            last_update : last_update
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

$('button#Cancel').click(function(event) {
    var product_order = $(this).next().val();
    var stats = "Order Dibatalkan";
 /*   alert(product_order);*/
    $.ajax({
        url: '<?php echo base_url(); ?>Page/Change_Status',
        type: 'post',
        data: {
            id : product_order,
            status : stats,
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
$('button#Sent').click(function(event) {
    var id_detail = $(this).next().val();
    var stats = "Selesai";
    var order_id = document.getElementById("a_orderid").value;
    var product_id = document.getElementById("a_productid").value;
    var product_name = document.getElementById("a_productname").value;
    var merchant_id = document.getElementById("a_merchantid").value;
    var merchant_name = document.getElementById("a_username").value;
    var merchant_phone = document.getElementById("a_phone").value;
    var merchant_email = document.getElementById("a_email").value;
    var statusbill = "Belum Ditagihkan";
    var amount = document.getElementById("a_amount").value;
    var price_item = document.getElementById("a_priceitem").value;
    var date = document.getElementById("date").value;
 /*   alert(product_order);*/
    $.ajax({
        url: '<?php echo base_url(); ?>Page/Change_Bill',
        type: 'post',
        data: {
            id : id_detail,
            status : stats,
            order_id : order_id,
            product_id : product_id,
            product_name : product_name,
            merchant_id : merchant_id,
            merchant_name : merchant_name,
            merchant_phone : merchant_phone,
            merchant_email : merchant_email,
            statusbill : statusbill,
            amount : amount,
            price : price_item,
            date : date,
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
$("button#deletetrans").click(function(event) {
    var product_id = $(this).next().val();
    //alert(product_id);
    if (product_id != "") {
        $.ajax({
            url: "<?php echo base_url()?>Admin/CariTransaction",
            type: 'post',
            data: {
                id: product_id,
            },
            success: function(e) {
                var data = e.split("|");
                $('#trans_id').val(data[0]);
                $('#trans_product').html(data[1]);
                $('#trans_amount').html(data[2]);
                $('#trans_code').html(data[3]);
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
            url: "<?php echo base_url()?>Admin/CariProsesKirim",
            type: 'post',
            data: {
                id: product_id,
            },
            success: function(e) {
                var data = e.split("|");  
                $('#a_iddetail1').val(data[0]);
                $('#a_iddetail').val(data[0]);
                $('#a_orderid').val(data[1]);
                $('#a_productid').val(data[2]);
                $('#a_productname1').html(data[3]);
                $('#a_productname').val(data[3]);
                $('#a_merchantid').val(data[4]);
                $('#a_username').val(data[5]);
                $('#a_phone').val(data[6]);
                $('#a_email').val(data[7]);
                $('#a_amount1').html(data[8]);
                $('#a_amount').val(data[8]);
                $('#a_priceitem').val(data[9]);
                $('#a_code').html(data[10]);
            }
        });
    } else {
        $('#trans_code').html();
    }
});
$('button#AdminAccept').click(function(event) {
    var amount = $(this).prev().val();
    var product_id = $('button#ADecline').next().val();
    var order_id = $(this).next().val();
    var stats = "Proses Kirim";
    var last_update = document.getElementById("last_update").value;
   // alert(product_id);
    $.ajax({
        url: '<?php echo base_url(); ?>Page/Update_Order',
        type: 'post',
        data: {
            order_id    : order_id,
            status      : stats,
            product_id  : product_id,
            amount      : amount,
            last_update : last_update
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
/*$('button#Sent').click(function(event) {
    var order_id = $(this).next().val();
    var stats = "Selesai";
//    alert(product_order);
    $.ajax({
        url: '<?php echo base_url(); ?>Page/Change_Status',
        type: 'post',
        data: {
            id : order_id,
            status : stats,
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
*/




/*$('button#sent').click(function(event) {
    var product_id = $(this).next().val();
    var amount = $(this).prev().val();
    var last_update = document.getElementById("last_update").value;
 //   var stats = "Selesai";
    //alert(last_update);
    $.ajax({
        url: '<?php echo base_url(); ?>Page/Kurang_Stock',
        type: 'post',
        data: {
            id : product_id,
            amount : amount,
            last_update : last_update
            
            //status : stats
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
                alert('Stock Update Gagal');
            }
        }
    });
});
*/
</Script>