<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Invoice</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="<?php echo base_url(); ?>/assets/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!-- font Awesome -->
        <link href="<?php echo base_url(); ?>/assets/css/font-awesome.css" rel="stylesheet"> 
        <!-- Ionicons -->
        <!-- <link href="<?php echo base_url() ?>assets/css/ionicons.min.css" rel="stylesheet" type="text/css" /> -->
        <!-- Theme style -->
        <!-- <link href="../../css/AdminLTE.css" rel="stylesheet" type="text/css" /> -->

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    <style type="text/css">
        @media print {
  .no-print,
  .main-sidebar,
  .left-side,
  .main-header,
  .content-header {
    display: none !important;
  }
  .content-wrapper,
  .right-side,
  .main-footer {
    margin-left: 0 !important;
    min-height: 0 !important;
    -webkit-transform: translate(0, 0) !important;
    -ms-transform: translate(0, 0) !important;
    -o-transform: translate(0, 0) !important;
    transform: translate(0, 0) !important;
  }
  .fixed .content-wrapper,
  .fixed .right-side {
    padding-top: 0 !important;
  }
  .invoice {
    width: 100%;
    border: 0;
    margin: 0;
    padding: 0;
  }
  .invoice-col {
    float: left;
    width: 33.3333333%;
  }
  .table-responsive {
    overflow: auto;
  }
  .table-responsive > .table tr th,
  .table-responsive > .table tr td {
    white-space: normal !important;
  }
}
    </style>
    </head>

    <body class="skin-black">

<div class="container">
            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">                
               

                <div class="pad margin no-print">
                    <div class="alert alert-info" style="margin-bottom: 0!important;">
                        <i class="fa fa-money"></i>
                <?php 
                if ($list_payment->detail_status == 'Selesai') {
                    $status = 'Lunas';
                }
                else if ($list_payment->detail_status == 'Order Dibatalkan') {
                    $status = 'Tidak Lunas';
                }
                else if ($list_payment->detail_status == 'Pesanan ditujukan ke Merchant') {
                    $status = 'Belum Lunas';
                }

                 ?>        
                        <b>Status Pembayaran:</b> <?php echo $status ?>
                    </div>
                </div>

                <!-- Main content -->
                <section class="content invoice">                    
                    <!-- title row -->
                    <div class="row">
                        <div class="col-xs-12">
                            <h2 class="page-header">
                                    <img src="<?php echo base_url(); ?>/assets/images/mtt.png" width="165px"> JUAL BELI MTT.
                                <small class="pull-right">Date: <?php echo date("d/m/Y") ?></small>
                            </h2>                            
                        </div><!-- /.col -->
                    </div>
                    <!-- info row -->
                    <div class="row invoice-info">
                        <div class="col-sm-4 invoice-col">
                            From
                            <address>
                                <strong><?php echo $list_payment->merchant_name ?></strong><br>
                               <?php 

            if (substr($list_payment->merchant_phone, 0,1) == '8') {
                $phone = '+62 '.$list_payment->merchant_phone;
               
              }
              else if (substr($list_payment->merchant_phone, 0,1) == '0') {
                $phone = $list_payment->merchant_phone;
              
              }
              else if (substr($list_payment->merchant_phone, 0,1)== '6') {
                $phone = '+62 '.substr($list_payment->merchant_phone,2);
               
              }
              else if (substr($list_payment->merchant_phone, 0,1) == '+' ){
                $phone = '+62 '.substr($list_payment->merchant_phone,3);
               
              }
              

               ?>
                                Phone: <?php echo $phone ?><br/>
                                Email: <?php echo $list_payment->merchant_email ?>
                            </address>
                        </div><!-- /.col -->
                        <div class="col-sm-4 invoice-col">
                            To
                            <address>
                                <strong><?php echo $list_payment->buyer ?></strong><br>
                    <?php 

            if (substr($list_payment->phone, 0,1) == '8') {
                $phone2 = '+62 '.$list_payment->phone;
               
              }
              else if (substr($list_payment->phone, 0,1) == '0') {
                $phone2 = $list_payment->merchant_phone;
              
              }
              else if (substr($list_payment->phone, 0,1)== '6') {
                $phone2 = '+62 '.substr($list_payment->phone,2);
               
              }
              else if (substr($list_payment->phone, 0,1) == '+' ){
                $phone2 = '+62 '.substr($list_payment->phone,3);
               
              }
              

               ?>              
                                Phone: <?php echo $phone2 ?><br/>
                                Email: <?php echo $list_payment->email ?>
                            </address>
                        </div><!-- /.col -->
                        <div class="col-sm-4 invoice-col">
                            <b>Invoice Order <?php echo $list_payment->code?></b><br/>
                            <?php 
                        $date = gmdate('dmY/His', $list_payment->detail_created/100);
                        ?>
                            <b>Invoice Order Detail <?php echo $date ?>/<?php echo $list_payment->detail_id?></b><br/>
                            <br/>
                            <!-- <b>Order ID:</b> 4F3S8J<br/> -->
                            <b>Shipping:</b> <?php echo $list_payment->shipping?><br/>
                            <b>Date Shipping:</b> <?php echo gmdate('D, d-m-Y H:i:s', $list_payment->date_ship/10) ?><br/>
                        </div><!-- /.col -->
                    </div><!-- /.row -->
<?php 
$price = 0;
 ?>
                    <!-- Table row -->
                    <div class="row">
                        <div class="col-xs-12 table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Qty</th>
                                        <th>Product</th>
                                        <!-- <th>Serial #</th> -->
                                        <th>Description</th>
                                        <th>Subtotal</th>
                                    </tr>                                    
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><?php echo $list_payment->amount?></td>
                                        <td><?php echo $list_payment->product_name?></td>
                                        <!-- <td>455-981-221</td> -->
                                        <td><?php echo $list_payment->comment?></td>
                                        <?php 

                                        $price += $list_payment->amount * $list_payment->price_item; 
                                         ?>
                                        <td>Rp. <?php echo $price?></td>
                                    </tr>
                              
                                </tbody>
                            </table>                            
                        </div><!-- /.col -->
                    </div><!-- /.row -->

                    <div class="row">
                        <!-- accepted payments column -->
                        <div class="col-xs-6">
                            <p class="lead">Payment Methods:</p>
                            <img src="<?php echo base_url(); ?>assets/images/t-cash.png" width="30%" alt="T-CASH"/>
                            <!-- <p class="text-muted well well-sm no-shadow" style="margin-top: 10px;">
                                Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra.
                            </p> -->
                        </div><!-- /.col -->
                        <div class="col-xs-6">
                            <!-- <p class="lead">Amount Due 2/22/2014</p> -->
                            <div class="table-responsive">
                                <table class="table">
                                    <tr>
                                        <th style="width:50%">Subtotal:</th>
                                        <td>$250.30</td>
                                    </tr>
                                    <tr>
                                        <th>Ongkos Kirim:</th>
                                        <td>Rp. #</td>
                                    </tr>
                                    <tr>
                                        <th>Infaq:</th>
                                        <td>Rp. #</td>
                                    </tr>
                                    <tr>
                                        <th>Total:</th>
                                        <?php 
                                        $total = $price; 
                                        // +$ongkir + $infaq 
                                         ?>
                                        <td>Rp. <?php echo $total ?></td>
                                    </tr>
                                </table>
                            </div>
                        </div><!-- /.col -->
                    </div><!-- /.row -->

                    <!-- this row will not appear when printing -->
                    <div class="row no-print">
                        <div class="col-xs-12">
                            <button class="btn btn-default" onclick="window.print();"><i class="fa fa-print"></i> Print</button>
                         
                        </div>
                    </div>
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->


        <!-- jQuery 2.0.2 -->
        <!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script> -->
        <!-- Bootstrap -->
      <script src="<?php echo base_url(); ?>/assets/js/bootstrap.js"></script>
<script src="<?php echo base_url(); ?>/assets/js/jquery-2.2.3.min.js"></script> 

    </body>
</html>