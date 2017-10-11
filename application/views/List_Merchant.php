<style type="text/css">
.inner-block{
    padding: 3em 0em 0em 0em;
    background: #fafafa;
}
  .td{
    word-wrap: break-word; 
  }
  .table{
    table-layout: fixed;
    word-wrap: break-word;
  }
  .table > thead > tr > th {
    text-align: center;
  }
  .p{
    padding-top: 10px;
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
<!-- Admin Merchant Start -->
<?php if($this->session->userdata('leveluser') == 1) : ?>
<div class="inner-block">

    <div class="col-md-12 chart-layer2-left">
               <div class="work-progres">
                            <div class="chit-chat-heading">
                                  Daftar Merchant JualBeli MTT
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                  <thead>
                                    <tr>
                                      <th style="width: 7%;">ID Merchant</th>
                                      <th style="width: 15%;">Username</th>
                                      <th style="width: 20%;">Email</th>
                                      <th style="width: 20%;">Email Telkomsel</th>
                                      <th style="width: 10%;">Address</th>
                                      <th style="width: 10%;">Phone</th>
                                      <th style="width: 10%%;">Action</th>

                                  </tr>
                              </thead>
                              <tbody>
                                 <?php foreach ($ListMerchant as $data ) : ?>
                                <tr>
                                  <td style="text-align: center;"><?php echo $data->id; ?></td>
                                  <td><?php echo $data->username; ?></td>
                                  <td><?php echo $data->email; ?></td>
                                  <td><?php echo $data->email_tsel; ?></td>
                                  <td><?php echo $data->address; ?></td>
                                  <td><?php echo $data->phone; ?></td>
                                  
                                  <td style="text-align: center;">
                                  <input id="merchant_id" type="hidden" name="merchant_id" placeholder="" class="form-control" value="<?php echo $data->id;?>">
                                  <button id="view" class="btn btn-info" data-toggle="modal" data-target="#myModal">
                                  <i class="fa fa-search"></i>&nbsp View</button>
                                  <button id="delete" class="btn btn-danger" data-toggle="modal" data-target="#myModall" >
                                  <i class="fa fa-trash"></i>&nbsp delete</button>
                                   <input id="merchant_id" type="hidden" name="merchant_id" placeholder="" class="form-control" value="<?php echo $data->id;?>">
                                 
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
<div id="myModall" class="modal fade" role="dialog">
             <div class="modal-dialog">
                        <div class="modal-content">
                                   <div class="modal-headeer">
                                         <button type="button" class="close" data-dismiss="modal">×</button>
                                         <h4 class="modal-title"><i class="fa fa-group"></i>  Delete User</h4>
                                   </div>
                                   <div class="modal-body">
                                         <p>Are you sure to delete <b id="merchant_user"></b> from JualBeli MTT ?</p>
                                   </div>
                                   <div class="modal-footer">
                                         <input id="merchant_idd" type="hidden" placeholder="" class="form-control" readonly>
                                         <button id="deleteuser" type="button" class="btn btn-danger" data-dismiss="modal">Yes</button>
                                         <button type="button" class="btn btn-info" data-dismiss="modal">No</button>
                                   </div>
                        </div>

            </div>
     </div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
            <h4 class="modal-title" id="merhant_usernamee"></h4>
         </div>
         <div class="modal-body">
            <center>
               <img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRbezqZpEuwGSvitKy3wrwnth5kysKdRqBW54cAszm_wiutku3R" name="aboutme" width="140" height="140" border="0" class="img-circle"></a>
               <h3 class="media-heading" id="merhant_username"></h3>
               <!-- <span><strong>Skills: </strong></span>
               <span class="label label-warning">HTML5/CSS</span>
               <span class="label label-info">Adobe CS 5.5</span>
               <span class="label label-info">Microsoft Office</span> -->
               <span class="label label-success">Merchant</span>
            </center>
            <hr>
            
               <div class="form-group">
                  <label class="col-sm-2 control-label" for="textinput">ID</label>
                  <div class="col-sm-10">
                    <input id="merhant_id" type="text" placeholder="" class="form-control" value="" readonly><br>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for="textinput">Username</label>
                  <div class="col-sm-10">
                    <input id="merhant_usernam" type="text" placeholder="" class="form-control" readonly><br>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for="textinput">Email</label>
                  <div class="col-sm-10">
                    <input id="merhant_email" type="text" placeholder="" class="form-control" readonly><br>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for="textinput">Phone</label>
                  <div class="col-sm-10">
                    <input id="merhant_phone" type="text" placeholder="" class="form-control" readonly><br>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-2 control-label" for="textinput">Address</label>
                  <div class="col-sm-10">
                    <input id="merhant_address" type="text" placeholder="" class="form-control" readonly><br>
                  </div>
              </div>
               <div class="form-group" id="Status">
                  <label class="col-sm-2 control-label" for="textinput">Status Merchant</label>
                  <div class="col-sm-10">
                    <select class="form-control" id="sel1" name="category">
                      <option value="1">Active</option>
                      <option value="0">Waiting</option>
                    </select>
                  <br>
                  </div>
              </div>
               <p class="text-left">Last Active : <i id="merhant_last_udpate"></i></p>
           
         </div>
         <div class="modal-footer">
            <center>
              <!--  <button type="button" class="btn btn-warning" id="Edit">Edit</button> -->
               <button type="button" class="btn btn-warning" id="Editing">Edit</button>
               <button type="button" class="btn btn-primary" id="Update">Update</button>
               <button type="button" class="btn btn-info" data-dismiss="modal" id="Cancel">Cancel</button>
            </center>
         </div>
      </div>
   </div>
</div>

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
$("button#quickview").click(function(event) {
    var product_id = $(this).prev().val();
    // alert(product_id);
    if (product_id != "") {
        $.ajax({
            url: "<?php echo base_url()?>index.php/Progress/CariProduk",
            type: 'post',
            data: {
                id: product_id
            },
            success: function(e) {
                var data = e.split("|");
                $('#pro_id').attr('href', '<?php echo base_url()?>index.php/Page/edit_product/' + data[0]);
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
            url: "<?php echo base_url()?>index.php/Admin/CariProduk",
            type: 'post',
            data: {
                id: product_id
            },
            success: function(e) {
                var data = e.split("|");
                $('#a_pro_id').html(data[0] + ' - ');
                $('#a_pro_name').html(data[1]);
                $('#a_mer_name').html(data[2]);
                $('#a_pro_cat').html(data[3]);
                $('#a_pro_desc').html(data[5]);
                if (data[4] == 'READY STOCK') {
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




$('button#delee').click(function(event) {
    var product_id = $(this).prev().val();
    /*alert(product_id);*/
    $.ajax({
        url: '<?php echo base_url(); ?>index.php/Page/Delete_Product',
        type: 'post',
        data: {
            id: product_id
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
                alert('Hapus Gagal');
            }
        }
    });
});

$("button#view").click(function(event) {
    var merchant_id = $(this).prev().val();
    // alert(product_id);
    if (merchant_id != "") {
        document.getElementById("Update").style.display = "none";
        document.getElementById("Status").style.display = "none";
        document.getElementById("Editing").style.display = "none";
        $.ajax({
            url: "<?php echo base_url()?>index.php/Admin/CariMerchant",
            type: 'post',
            data: {
                id: merchant_id
            },
            success: function(e) {
                var data = e.split("|");
                $('#merhant_id').val(data[0]);
                $('#merhant_usernamee').html('More About ' + data[1]);
                $('#merhant_username').html(data[1] + '  <sub><small><strong>IND</strong></small></sub>');
                $('#merhant_usernam').val(data[1]);
                $('#merhant_email').val(data[3]);
                $('#merhant_phone').val(data[2]);
                $('#merhant_address').val(data[4]);
                $('#merhant_last_udpate').html(data[5]);
            }
        });
    } else {
        $('merchant_username').html();
    }
});
$("button#Edit").click(function(event) {
      
  });
$("button#delete").click(function(event) {
            var merchant_id = $(this).next().val();
            // alert(product_id);
            if (merchant_id != "") {
                $.ajax({
                    url: "<?php echo base_url()?>index.php/Admin/CariMerchant",
                    type: 'post',
                    data: {id: merchant_id},
                    success: function(e){
                        var data = e.split("|");
                        $('#merchant_user').html(data[1]);
                        $('#merchant_idd').val(data[0]);
                        }
                });
            } else {
                $('merchant_user').html();
            }
        });  
$('button#deleteuser').click(function(event) {
    var user_id = $(this).prev().val();
    /*alert(product_id);*/
    $.ajax({
        url: '<?php echo base_url(); ?>index.php/Admin/Delete_User',
        type: 'post',
        data: {
            id: user_id
        },
        success: function(e)     {
            if (e == "true") {
                setTimeout(function() { // wait for 5 secs(2)
                    location.reload(); // then reload the page.(3)
                }, 001);

                
                // $('body').load('<?php echo base_url(); ?>index.php/Page');
                // $("#opencart").attr('class', "dropdown open");
                // $("#openexpanded").attr('aria-expanded', "true");
            } else {
                alert('Hapus Gagal');
            }
        }
    });
});

</script>