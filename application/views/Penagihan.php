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
<?php if(!empty($notif)) {
            echo '<div class="alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                '.$notif.'
            </div>';
             } ?>
    <div class="col-md-12 chart-layer2-left">
               <div class="work-progres">
                            <div class="chit-chat-heading">
                                  Tagihan Masuk JualBeli MTT
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                  <thead>
                                    <tr>
                                      <th style="width: 2%;">No. Order</th>
                                      <th style="width: 1%;">Buyer</th>
                                      <th style="width: 1%;">Merchant</th>
                                      <th style="width: 10%;">Produk</th>
                                      <th style="width: 10%;">Shipping</th>
                                      <th style="width: 2%;">Total Fees</th>
                                      <th style="width: 5%;">Status Order</th>
                                      <th style="width: 10%; text-align: center;">Action</th>

                                  </tr>
                              </thead>
                              <tbody>
                                 
                                 <?php 
                                 $i = 1;
                                 foreach ($transaksi as $data):?>
                                <tr>
                                  <td><?php echo $data->code;?></td>
                                  <td><?php echo $data->buyer;?></td>
                                  <td><?php echo $data->username;?></td>
                                  <td><?php echo $data->product_name;?></td>
                                  <td><?php echo $data->shipping;?></td>
                                  <td><?php echo $data->price_item;?></td>
                                  <td><?php echo $data->bill_status;?></td>
                                  <td>
                                  <a href="<?php echo base_url();?>index.php/Admin/DetailTagihan/<?php echo $data->id_bill;?>"><button id="detail" class="btn btn-info" data-toggle="modal" data-target="modal-body">
                                  <i class="fa fa-search"></i>&nbsp Detail</button></a>
                                  <input type="hidden" name="amount" placeholder="Nama Produk" class="form-control" value="<?php echo $data->amount;?>">
                                  <a href="<?php echo base_url();?>index.php/Admin/Checkout/<?php echo $data->id_bill;?>" id=""><button class="btn btn-success"><i class="fa fa-money"></i>&nbsp Transfer Ke Merchant</button></a>
                                  <input type="hidden" name="amount" placeholder="Nama Produk" class="form-control" value="<?php echo $data->order_id;?>">
                                  

                                  <input type="hidden" name="product_id" placeholder="Nama Produk" class="form-control" value="<?php echo $data->product_id;?>">
                                  <!-- <button id="deletetrans" class="btn btn-danger" data-toggle="modal" data-target="#myModall">
                                  <i class="fa fa-close"></i>&nbsp Decline</button> -->
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
                                      <th style="width: 5%">#ID Transaksi</th>
                                      <th style="width: 10%">Nama Pemesan</th>
                                      <th style="width: 15%">Alamat</th>
                                      <th style="width: 15%">Nama Produk</th>
                                      <th style="width: 10%">Shipping Method</th>
                                      <th style="width: 10%">Total</th>
                                      <th style="width: 10%">Status</th>
                                      <th style="width: 25%">Aksi</th>

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
                                  <td><?php echo $data->bill_status;?>  
                                  </td>
                                  <td>
                                  <a href="<?php echo base_url();?>index.php/Admin/DetailTagihan/<?php echo $data->id_bill;?>"><button id="" class="btn btn-info">
                                  <i class="fa fa-search"></i>&nbsp Detail</button> 
                                  <button id="Tagih_Admin" class="btn btn-success">
                                  <i class="fa fa-money"></i>&nbsp Tagihkan Ke Admin</button>
                                  <input id="order_id" type="hidden" class="form-control" value="<?php echo $data->id_bill;?>">
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

                                         <p>Pengiriman Pesanan dengan No. Order <b id="transs_code"></b>  produk <b id="transs_product"></b> sejumlah <b id="transs_amount"> 3 </b> Pieces telah sampai tujuan</p>

                                   </div>
                                   <div class="modal-footer">
                                         <input type="text" class="form-control" name="search" id="transs_amountt" value="" placeholder="">
                                         <button type="button" class="btn btn-success" id="Tagih">Yes</button>
                                         <input type="text" class="form-control" name="search" id="transs_id" value="" placeholder="">
                                         <button id="ADecline" type="button" class="btn btn-danger" data-dismiss="modal">No</button>
                                         <input type="text" class="form-control" name="search" id="product_id" value="" placeholder="">
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
        url: '<?php echo base_url(); ?>index.php/Page/Change_Status',
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
                // $('body').load('<?php echo base_url(); ?>index.php/Page');
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
        url: '<?php echo base_url(); ?>index.php/Page/Update_Order',
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
                // $('body').load('<?php echo base_url(); ?>index.php/Page');
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
        url: '<?php echo base_url(); ?>index.php/Page/Change_Status',
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
                // $('body').load('<?php echo base_url(); ?>index.php/Page');
                // $("#opencart").attr('class', "dropdown open");
                // $("#openexpanded").attr('aria-expanded', "true");
            } else {
                alert('Update Gagal');
            }
        }
    });
});
$('button#Tagih_Admin').click(function(event) {
    var id = $(this).next().val();
    var stats = "Tagihkan Ke Admin";
 /*   alert(product_order);*/
    $.ajax({
        url: '<?php echo base_url(); ?>index.php/Page/Change_StatusBill',
        type: 'post',
        data: {
            id : id,
            status : stats,
        },
        success: function(e) {
            if (e == "true") {
                setTimeout(function() { // wait for 5 secs(2)
                    location.reload(); // then reload the page.(3)
                }, 001);
                // $('body').load('<?php echo base_url(); ?>index.php/Page');
                // $("#opencart").attr('class', "dropdown open");
                // $("#openexpanded").attr('aria-expanded', "true");
            } else {
                alert('Update Gagal');
            }
        }
    });
});
$('button#Tagih').click(function(event) {
    var product_order = $(this).next().val();
    var stats = "Tagihkan Ke Admin";
 /*   alert(product_order);*/
    $.ajax({
        url: '<?php echo base_url(); ?>index.php/Page/Change_Status',
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
                // $('body').load('<?php echo base_url(); ?>index.php/Page');
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
            url: "<?php echo base_url()?>index.php/Admin/CariTransaction",
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
            url: "<?php echo base_url()?>index.php/Admin/CariTransaction",
            type: 'post',
            data: {
                id: product_id,
            },
            success: function(e) {
                var data = e.split("|");  
                $('#transs_id').val(data[0]);
                $('#transs_product').html(data[1]);
                $('#transs_amount').html(data[2]);
                $('#transs_amountt').val(data[2]);
                $('#transs_code').html(data[3]);
                $('#product_id').val(data[4]);
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
        url: '<?php echo base_url(); ?>index.php/Page/Update_Order',
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
                // $('body').load('<?php echo base_url(); ?>index.php/Page');
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
        url: '<?php echo base_url(); ?>index.php/Page/Change_Status',
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
                // $('body').load('<?php echo base_url(); ?>index.php/Page');
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
        url: '<?php echo base_url(); ?>index.php/Page/Kurang_Stock',
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
                // $('body').load('<?php echo base_url(); ?>index.php/Page');
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