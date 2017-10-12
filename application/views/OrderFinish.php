<div class="inner-block">
    <div class="col-md-12 chart-layer2-left">
               <div class="work-progres">
                            <div class="chit-chat-heading">
                                  <?php echo $head; ?>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                  <thead>
                                    <tr>
                                     <th style="width: 10%">#ID Transaksi</th>
                                      <th style="width: 10%">Nama Pemesan</th>
                                      <th style="width: 15%">Alamat</th>
                                      <th style="width: 20%">Nama Produk</th>
                                      <th style="width: 5%">Amount</th>
                                      <th style="width: 10%">Price Items</th>
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
                                  <td><?php echo 'Rp. '.number_format($data->price_item);?></td>
                                  <td><?php 
                                  $jumlah = $data->amount;
                                  $harga  = $data->price_item;
                                  $total  = $jumlah*$harga;
                                  echo 'Rp. '.number_format($total);?></td>
                                  <td><?php echo $data->status;?>  
                                  </td>
                                  <!-- <td>
                                 <a href="<?php echo base_url();?>Admin/DetailTransaction/<?php echo $data->id_detail;?>"><button id="detail" class="btn btn-info" data-toggle="modal" data-target="modal-body">
                                  <i class="fa fa-search"></i>&nbsp Detail</button></a>
                                   <input type="hidden" name="product_id" placeholder="Nama Produk" class="form-control" value="<?php echo $data->product_id;?>">
                                  <input id="order_id" type="hidden" class="form-control" value="<?php echo $data->id;?>">
                                  </td> -->

                                  
                                 
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

<Script type="text/javascript">
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
$('button#Sent').click(function(event) {
    var product_order = $(this).next().val();
    var stats = "Selesai";
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













$('button#sent').click(function(event) {
    var order_id = $(this).next().val();
    var stats = "Proses Kirim";
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