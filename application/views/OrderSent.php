<style type="text/css">
  th{
    text-align: center;
  }
</style>
<div class="inner-block">
      <div class="clearfix"></div>
      <div class="col-md-12 chart-layer2-left">
               <div class="work-progres">
                            <div class="chit-chat-heading">
                                  List Order Sedang Dikirim
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                  <thead>
                                    <tr>
                                      <th style="width: 5%;">#ID Transaksi</th>
                                      <th style="width: 10%">Nama Pemesan</th>
                                      <th style="width: 10%">Alamat</th>
                                      <th style="width: 15%">Nama Produk</th>
                                      <th style="width: 5%">Amount</th>
                                      <th style="width: 10%">Price Item</th>
                                      <!-- <th style="width: 10%">Shipping Method</th> -->
                                      <th style="width: 10%">Total</th>
                                      <th style="width: 10%">Status</th>
                                      <!-- <th style="width: 10%">Aksi</th> -->
                                  </tr>
                              </thead>
                              <tbody>
                               <?php foreach ($transaksi as $data ) : ?>
                                
                                <tr>
                                 
                                  <td><?php echo $data->code; ?></td>
                                  <td><?php echo $data->buyer; ?></td>
                                  <td><?php echo $data->address; ?></td>
                                  <td><?php echo $data->product_name; ?></td>
                                  <td><?php echo $data->amount; ?></td>
                                  <td><?php echo 'Rp. '.number_format($data->price_item); ?></td>
                                  <!-- <td><?php echo $data->shipping; ?></td> -->
                                  <td><?php 
                                  $jumlah = $data->amount;
                                  $harga  = $data->price_item;
                                  $hasil  =$jumlah*$harga;  
                                  echo 'Rp. '.number_format($hasil);
                                   ?></td>
                                  <td><?php echo $data->status; ?></td>
                                  
                                  <!-- <td>
                                  <button id="Sent" class="btn btn-success">
                                  <i class="fa fa-check"></i>&nbsp Accept</button>
                                  <input id="order_id" type="hidden" class="form-control" value="<?php echo $data->id_detail;?>">
                                  <input id="id_order" type="hidden" class="form-control" value="<?php echo $data->order_id;?>">
                                  <input id="pro_id" type="hidden" class="form-control" value="<?php echo $data->product_id;?>">
                                  <input id="pro_name" type="hidden" class="form-control" value="<?php echo $data->product_name;?>">
                                  <input id="mer_id" type="hidden" class="form-control" value="<?php echo $data->merchant_id;?>">
                                  <input id="mer_name" type="hidden" class="form-control" value="<?php echo $data->username;?>">
                                  <input id="mer_phone" type="hidden" class="form-control" value="<?php echo $data->phone;?>">
                                  <input id="mer_email" type="hidden" class="form-control" value="<?php echo $data->email;?>">
                                  <input id="amount" type="hidden" class="form-control" value="<?php echo $data->amount;?>">
                                  <input id="price" type="hidden" class="form-control" value="<?php echo $data->price_item;?>">
                                  


                                    <button id="decline" class="btn btn-danger">
                                  <i class="fa fa-close"></i>&nbsp Decline</button>
                                  
                                  </td> -->
                              </tr>
                              <?php endforeach; ?>
                               <input id="date" type="hidden" name="last_update" placeholder="" class="form-control" value="<?php echo strtotime(date('Y-m-d H:i:s'))?>">
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
 <!-- batas order selesai berhasil-->

       <!-- batas order gagal  -->
</div>
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
                                         <input type="hidden" class="form-control" name="search" id="transs_amountt" value="" placeholder="">
                                         <button type="button" class="btn btn-success" id="Sent">Yes</button>
                                         <input type="hidden" class="form-control" name="search" id="transs_id" value="" placeholder="">
                                         <button id="ADecline" type="button" class="btn btn-danger" data-dismiss="modal">No</button>
                                         <input type="hidden" class="form-control" name="search" id="product_id" value="" placeholder="">
                                   </div>
                        </div>

            </div>
     </div>
<Script type="text/javascript">
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
$('button#Sent').click(function(event) {
    var id_detail = $(this).next().val();
    var stats = "Selesai";
    var order_id = document.getElementById("id_order").value;
    var product_id = document.getElementById("pro_id").value;
    var product_name = document.getElementById("pro_name").value;
    var merchant_id = document.getElementById("mer_id").value;
    var merchant_name = document.getElementById("mer_name").value;
    var merchant_phone = document.getElementById("mer_phone").value;
    var merchant_email = document.getElementById("mer_email").value;
    var statusbill = "Belum Ditagihkan";
    var amount = document.getElementById("amount").value;
    var price_item = document.getElementById("price").value;
    var date = document.getElementById("date").value; 
   /* var product_order = $(this).next().vaSent
    */
   

 /*   alert(product_order);*/
    $.ajax({
        url: '<?php echo base_url(); ?>index.php/Page/Change_Bill',
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
                // $('body').load('<?php echo base_url(); ?>index.php/Page');
                // $("#opencart").attr('class', "dropdown open");
                // $("#openexpanded").attr('aria-expanded', "true");
            } else {
                alert('Update Gagal');
            }
        }
    });
});


 


            








/*$('button#sent').click(function(event) {
    var order_id = $(this).next().val();
    var stats = "Proses Kirim";
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