<div class="inner-block">
<!-- Dashboard Admin Start -->
<?php if($this->session->userdata('leveluser') == 1) : ?>
    <div class="market-updates">
    <a href="<?php echo base_url();?>Admin/Transaction_Success">
      <div class="col-md-4 market-update-gd">
        <div class="market-update-block clr-block-1">
          <div class="col-md-8 market-update-left">
            <h3><?php echo $A_AmountTransaction;?></h3>
            <h4>Total Transaksi</h4>
            <p>Semua transaksi yang dilakukan melalui JualBeli MTT</p>
          </div>
          <div class="col-md-4 market-update-right">
            <i class="fa fa-shopping-cart"> </i>
          </div>
          <div class="clearfix"> </div>
        </div>
      </div>
      </a>
      <a href="<?php echo base_url();?>Admin/List_Merchant">
      <div class="col-md-4 market-update-gd">
        <div class="market-update-block clr-block-2">
         <div class="col-md-8 market-update-left">
          <h3><?php echo $A_AmountMerchant;?></h3>
          <h4>Jumlah Merchant</h4>
          <p>Jumlah merchant yang bekerjasama dengan JualBeli MTT.</p>
          </div>
          <div class="col-md-4 market-update-right">
            <i class="fa fa-users"> </i>
          </div>
          <div class="clearfix"> </div>
        </div>
      </div>
      </a>
      <a href="<?php echo base_url();?>Admin/Product_List">
      <div class="col-md-4 market-update-gd">
        <div class="market-update-block clr-block-3">
          <div class="col-md-8 market-update-left">
            <h3><?php echo $A_AmountProduct; ?></h3>
            <h4>Semua Produk</h4>
            <p>Jumlah produk yang dijual oleh merchant.</p>
          </div>
          <div class="col-md-4 market-update-right">
            <i class="fa fa-list"> </i>
          </div>
          <div class="clearfix"> </div>
        </div>
      </div>
      </a>
    </div>
    </div>
    <div class="clearfix"> </div>

<!--climate start here-->

<!--climate end here-->
<!-- total sales -->
<div class="chart-layer-2">
  
  <div class="col-md-6 chart-layer2-right">
      <div class="prograc-blocks">
         <!--Progress bars-->
          <div class="home-progres-main">
             <h3>Produk Terjual Sebulan</h3>
           </div>
          <div class='bar_group'>
           
          
          <?php foreach ($A_Product as $data): ?>
            <div class='bar_group__bar thin' label='<?php echo $data->product_name ?>' show_values='true' tooltip='true' value='
            <?php if(array_key_exists($data->product_id, $A_allamount)){ ?>
            <?php echo $A_allamount[$data->product_id];?>
            <?php } ?>
            '></div>  
          <?php endforeach ?>
          
        </div>
        <script src="<?php echo base_url(); ?>assets/js/bars.js"></script>

        <!--//Progress bars-->
        </div>
  </div>
  <?php endif ;?>
  <!-- Dashboard Admin End -->
  <!-- Dashboard Merchant Start -->
  <?php if($this->session->userdata('leveluser') == 0 || $this->session->userdata('leveluser') == NULL ): ?>
    <div class="market-updates">
    <a href="<?php echo base_url();?>progress/transaction ">
      <div class="col-md-6 market-update-gd">
        <div class="market-update-block clr-block-1">
          <div class="col-md-8 market-update-left">
            <h3><?php echo $totaltrans;?></h3>
            <h4>Total Transaksi</h4>
            <p>Semua transaksi yang dilakukan melalui JualBeli MTT</p>
          </div>
          <div class="col-md-4 market-update-right">
            <i class="fa fa-shopping-cart"> </i>
          </div>
          <div class="clearfix"> </div>
        </div>
      </div>
      </a>
     <!--  <div class="col-md-4 market-update-gd">
        <div class="market-update-block clr-block-2">
         <div class="col-md-8 market-update-left">
          <h3>0</h3>
          <h4>Jumlah Peminat</h4>
          <p>Jumlah peminat produk anda melalui JualBeli MTT.</p>
          </div>
          <div class="col-md-4 market-update-right">
            <i class="fa fa-users"> </i>
          </div>
          <div class="clearfix"> </div>
        </div>
      </div> -->
      <a href="<?php echo base_url();?>page/product_list">
      <div class="col-md-6 market-update-gd">
        <div class="market-update-block clr-block-3">
          <div class="col-md-8 market-update-left">
            <h3><?php echo $jmlh_produk; ?></h3>
            <h4>Produk Anda</h4>
            <p>Jumlah produk yang anda jual di JualBeli MTT</p>
          </div>
          <div class="col-md-4 market-update-right">
            <i class="fa fa-list"> </i>
          </div>
          <div class="clearfix"> </div>
        </div>
      </div>
      </a>
    </div>
    </div>
  <div class="clearfix"> </div>

<!--climate start here-->

<!--climate end here-->
<!-- total sales -->
<div class="chart-layer-2">
  
  <div class="col-md-6 chart-layer2-right">
      <div class="prograc-blocks">
         <!--Progress bars-->
          <div class="home-progres-main">
             <h3>Produk Terjual Sebulan</h3>
           </div>
          <div class='bar_group'>
        
          <?php foreach ($product as $data): ?>
            <div class='bar_group__bar thin' label='<?php echo $data->product_name ?>' show_values='true' tooltip='true' value='
              <?php if(array_key_exists($data->product_id, $allamount)){ ?>
            <?php echo $allamount[$data->product_id];?>
            <?php } ?>'></div>  
          <?php endforeach ?>
          
        </div>
        <script src="<?php echo base_url(); ?>assets/js/bars.js"></script>

        <!--//Progress bars-->
        </div>
  </div>
  <?php endif; ?>
  <!-- Dashboard Merchant End -->

    
<!--market updates end here-->

<!--main page chart start here-->



    
  </div>
  <!-- total sales done -->