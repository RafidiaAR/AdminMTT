<div class="inner-block">
                <div class="col-md-8 col-md-offset-2">
                    <h2 style="text-align: center;">
                        Transfer Payment To Merchant
                    </h2>
                    <hr/>
                   
                    <div class="shopping_cart">
                        <form class="form-horizontal" role="form" action="<?php echo base_url(); ?>Admin/Transfer" method="post" id="payment-form" enctype="multipart/form-data">
                            <div class="panel-group" id="accordion">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Review Order</a>
                                        </h4>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <div class="items">
                                                <div class="col-md-9">
                                                    <table class="table table-striped">
                                                    <?php 
                                                        foreach ($C_Detail as $data) :
                                                        
                                                     ?>
                                                        <tr>
                                                        <?php 
                                                            $product    = $data->product_name;
                                                            $amount     = $data->amount;
                                                            $price      = $data->price_item;
                                                            $date       = $data->last_update;
                                                            $mer_name   = $data->username;
                                                            $mer_phone  = $data->phone;
                                                            $mer_email  = $data->email;
                                                            $mer_address= $data->address;
                                                            $id_bill    = $data->id_bill;
                                                            
                                                         ?>
                                                            <td colspan="2">
                                                                <b><?php echo $product;?></b></td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <ul>
                                                                    <li><b>Amount</b> : <?php echo $amount;?></li>
                                                                    <li><b>Tanggal Pesan</b> : <?php echo gmdate('Y-m-d',$date/1000); ?></li>
                                                                </ul>
                                                            </td>
                                                            <td>
                                                                <b>Rp. <?php echo $price;?></b>
                                                            </td>
                                                        </tr>
                                                    <?php endforeach; ?>
                                                    </table>
                                                </div>
                                                <div class="col-md-3">
                                                    <div style="text-align: center;">
                                                        <h3>Order Total</h3>
                                                        <h3><span style="color:green;">Rp. <?php echo ($amount*$price);?></span></h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <div style="text-align: center; width:100%;"><a style="width:100%;"
                                                                                        data-toggle="collapse"
                                                                                        data-parent="#accordion"
                                                                                        href="#collapseTwo"
                                                                                        class=" btn btn-success"
                                                                                        onclick="$(this).fadeOut(); $('#payInfo').fadeIn();">Continue
                                            to Merchant Information»</a></div>
                                    </h4>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Contact
                                            and Billing Information</a>
                                    </h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <b>Help us keep your account safe and secure, please verify your billing
                                            information.</b>
                                        <br/><br/>
                                        <table class="table table-striped" style="font-weight: bold;">
                                            <tr>
                                                <td style="width: 175px;">
                                                    <label for="id_email">Merchant Name:</label></td>
                                                <td>
                                                    <input class="form-control" id="id_email" name="email"
                                                           required="required" type="text" value="<?php echo $mer_name;?>" readonly/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 175px;">
                                                    <label for="id_first_name">Phone:</label></td>
                                                <td>
                                                    <input class="form-control" id="id_first_name" name="first_name"
                                                           required="required" type="text" value="<?php echo $mer_phone;?>" readonly/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 175px;">
                                                    <label for="id_last_name">Email:</label></td>
                                                <td>
                                                    <input class="form-control" id="id_last_name" name="last_name"
                                                           required="required" type="text" value="<?php echo $mer_email;?>" readonly/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 175px;">
                                                    <label for="id_address_line_1">Address:</label></td>
                                                <td>
                                                    <input class="form-control" id="id_address_line_1"
                                                           name="address_line_1" required="required" type="text" value="<?php echo $mer_address;?>" readonly/>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <div style="text-align: center;"><a data-toggle="collapse"
                                                                            data-parent="#accordion"
                                                                            href="#collapseThree"
                                                                            class=" btn   btn-success" id="payInfo"
                                                                            style="width:100%;display: none;" onclick="$(this).fadeOut();  
                   document.getElementById('collapseThree').scrollIntoView()">Enter Payment Information »</a>
                                        </div>
                                    </h4>
                                </div>
                            </div>
                            <div class="panel panel-default" style="margin-bottom: 50px;">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                            <b>Payment Information</b>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <span class='payment-errors'></span>
                                        <fieldset>
                                            <legend>What method would you like to pay with today?</legend>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label" for="card-holder-name">Masukkan Nomor T-Cash</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" stripe-data="name"
                                                           id="name-on-card" name="nomor" placeholder="T-Cash Number" required>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label" for="card-number">PIN
                                                    Number</label>
                                                <div class="col-sm-9">
                                                    <input type="password" class="form-control" stripe-data="number"
                                                           id="card-number" name="pin" placeholder="T-Cash PIN Number" maxlength="6" required>
                                                    <br/>
                                                    <div><img class="pull-right"
                                                              src="https://s3.amazonaws.com/hiresnetwork/imgs/cc.png"
                                                              style="max-width: 250px; padding-bottom: 20px;">
                                                    </div>
                                                </div>
                                        </fieldset>
                                        <input id="date" type="hidden" name="last_update" placeholder="" class="form-control" value="<?php echo strtotime(date('Y-m-d H:i:s'))?>">
                                        <input name="id_bill" type="hidden" class="form-control" value="<?php echo $id_bill;?>">
                                        <input type="submit" name="submit" class="btn btn-success btn-lg" value="Pay Now" style="width:100%;">
                                        <br/>
                                        <div style="text-align: left;"><br/>
                                            By submiting this order you are agreeing to our <a href="/legal/billing/">universal
                                                billing agreement</a>, and <a href="/legal/terms/">terms of service</a>.
                                            If you have any questions about our products or services please contact us
                                            before placing this order.
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                </form>
</div>


