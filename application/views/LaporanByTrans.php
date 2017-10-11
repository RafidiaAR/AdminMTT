<?php if($this->session->userdata('leveluser') == 1) : ?>
<div class="inner-block">

    <div class="col-md-12 chart-layer2-left">
               <div class="work-progres">
                            <div class="chit-chat-heading">
                                  Laporan Transaksi JualBeli MTT
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                  <thead>
                                    <tr>
                                      <th style="width: 1%;">No. Order</th>
                                      <th style="width: 3%;">Merchant</th>
                                      <th style="width: 15%;">Type Product</th>
                                      <th style="width: 3%;">Amount</th>
                                      <th style="width: 3%;">Total Fees</th>
                                      <th style="width: 3%;">Fee Delivery</th>
                                      <th style="width: 3%;">Infaq</th>
                                      <th style="width: 3%;">Action</th>
                                      <!-- <th style="width: 5%; text-align: center;">Action</th>
 -->
                                  </tr>
                              </thead>
                              <tbody>
                                 
                                 <?php 
                                 $i = 1;
                                
                                 foreach ($A_Transaction as $data):?>
                                <tr>
                                  <td><?php echo $data->code;?></td>
                                  <td><?php echo $data->username;?></td>
                                  <td>
                                  <!-- <?php if(array_key_exists($data->order_id, $deliv)){ ?>
                                    <?php echo $deliv[$data->order_id];?>
                                  <?php } ?>
 -->
                                  <?php echo $data->product_name;?></td>
                                  <td><?php echo $data->amount;?></td>
                                  <td><?php echo 'Rp. '.number_format($data->total_fees);?></td>
                                  <td>
                                 <?php echo 'Rp. '.number_format($data->fee_delivery);?></td>
                                  <td><?php 
                                     $jumlah   = $data->amount;
                                  $harga    = $data->price_item;
                                  $deliv    = $data->fee_delivery;
                                  $admin    = $data->fee;
                                  $infaq    = $data->fee_infaq;
                                  $hasil    = ($jumlah*$harga)+$deliv;
                                  echo 'Rp. '.number_format($data->fee_infaq);?></td>
                                  <td>

                                  <a href="<?php echo base_url();?>index.php/Admin/DetilLaporan/<?php echo $data->order_id;?>"><button id="detail" class="btn btn-info" data-toggle="modal" data-target="modal-body">
                                  <i class="fa fa-search"></i>&nbsp Detail</button></a>

                                  </td>
                                  <!-- <td style="text-align: center;">
                                  
                                <a href="<?php echo base_url();?>index.php/Admin/DetailTransaction/<?php echo $data->id_detail;?>"><button id="detail" class="btn btn-info" data-toggle="modal" data-target="modal-body">
                                  <i class="fa fa-search"></i>&nbsp Detail</button></a>
                                  <button id="Accept" class="btn btn-primary">
                                  <i class="fa fa-print"></i>&nbsp Print</button> 
                                  <button id="Accept" class="btn btn-danger">
                                  <i class="fa fa-trash"></i>&nbsp Delete</button>
                                  </td> -->
              
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