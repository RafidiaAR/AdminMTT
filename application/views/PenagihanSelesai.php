<style type="text/css">
  .inner-block{
    padding: 4em 2em 4em 2em;
    background : #fafafa;
  
</style>
<!-- Admin Merchant Start -->
<?php if($this->session->userdata('leveluser') == 1) : ?>
<div class="inner-block">

    <div class="col-md-12 chart-layer2-left">
               <div class="work-progres">
                            <div class="chit-chat-heading">
                                  Transaction JualBeli MTT
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                  <thead>
                                    <tr>
                                      <th style="width: 2%;">No. Order</th>
                                      <th style="width: 5%;">Buyer</th>
                                      <th style="width: 1%;">Merchant</th>
                                      <th style="width: 10%;">Produk</th>
                                      <th style="width: 10%;">Shipping</th>
                                      <th style="width: 2%;">Total Fees</th>
                                      <th style="width: 10%;">Status Order</th>
                                      <th style="width: 5%; text-align: center;">Action</th>

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
                                  
                                  <a href="<?php echo base_url();?>index.php/Admin/DetailTagihan/<?php echo $data->id_bill;?>"><button id="" class="btn btn-info">
                                  <i class="fa fa-search"></i>&nbsp Detail</button>
                                  </td>
                                  </td>
                              </tr>
                            <?php endforeach; ?>
                              
                               <input id="last_update" type="hidden" name="last_update" placeholder="" class="form-control" value="">

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
                                  Order Penagihan Selesai
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                  <thead>
                                    <tr>
                                      <th style="width: 10%">#ID Transaksi</th>
                                      <th style="width: 10%">Nama Pemesan</th>
                                      <th style="width: 15%">Alamat</th>
                                      <th style="width: 15%">Nama Produk</th>
                                      <th style="width: 15%">Shipping Method</th>
                                      <th style="width: 10%">Total</th>
                                      <th style="width: 15%">Status</th>
                                      <th style="width: 5%">Aksi</th>

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
                                  <i class="fa fa-search"></i>&nbsp Detail</button></a>
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
    var product_order = $(this).next().val();
    var stats = "Selesai";
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













$('button#sent').click(function(event) {
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