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
                                      <th style="width: 15%;">Product</th>
                                      <th style="width: 3%;">Amount</th>
                                      <th style="width: 3%;">Price Item</th>
                                      <th style="width: 3%;">Fee Delivery</th>
                                      <th style="width: 3%;">Fee Admin</th>
                                      <th style="width: 3%;">Infaq</th>
                                      <th style="width: 3%;">Total Fees</th>
                                      <!-- <th style="width: 5%; text-align: center;">Action</th>
 -->
                                  </tr>
                              </thead>
                              <tbody>
                                 
                                 <?php 
                                 $i = 1;
                                $out = array();
                                foreach ($A_Transaction as $data):?>
                                <tr>
                                  
                                  <td>

                                  <?php
                                  
                                  echo $data->code;?>  
                                  </td>
                                  <td><?php echo $data->username;?></td>
                                  <td><?php echo $data->product_name;?></td>
                                  <td><?php echo $data->amount;?></td>
                                  <td><?php echo 'Rp. '.number_format($data->price_item);?></td>
                                  <td style="text-align: center;">
                                
                                 <?php
                                 if (!in_array($data->code, $out)) {
                                    echo 'Rp. '.number_format($data->fee_delivery);
                                    $a= $data->fee_delivery;
                                  }
                                  else{
                                    $a= 0;
                                    echo '~';
                                  }
                                  ?></td>
                                  <td><?php 
                                  echo 'Rp. '.number_format($data->fee);?></td>
                                  <td style="text-align: center;"><?php 
                                     
                                 if (!in_array($data->code, $out)) {
                                  echo 'Rp. '.number_format($data->fee_infaq);
                                  $out[] = $data->code;
                                  $b= $data->fee_infaq;
                                  
                                 }
                                 else{
                                    echo '~';
                                    $b=0;
                                  }
                                  
                                  ?></td>

                                  <td ><?php 
                                  $x = $data->price_item;
                                  $y = $data->fee;
                                  $z = $data->amount;

                                  $hasil = $a+$b+$y+ ($z*$x);
                                  echo 'Rp. '.(number_format($hasil));?></td>
                                  <!-- <td style="text-align: center;">
                                  
                                <a href="<?php echo base_url();?>Admin/DetailTransaction/<?php echo $data->id_detail;?>"><button id="detail" class="btn btn-info" data-toggle="modal" data-target="modal-body">
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