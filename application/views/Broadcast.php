<style type="text/css">
  .contact-form{ margin-top:15px;}
.contact-form .textarea{ min-height:220px; resize:none;}
.form-control{ box-shadow:none; border-color:#eee; height:49px;}
.form-control:focus{ box-shadow:none; border-color:#00b09c;}
.form-control-feedback{ line-height:50px;}
.main-btn{ background:#00b09c; border-color:#00b09c; color:#fff;}
.main-btn:hover{ background:#00a491;color:#fff;}
.form-control-feedback {
line-height: 50px;
top: 0px;
}

</style>
<div class="inner-block">
<div class="pro-head"><h2>Broadcast Message</h2></div>
<div class="copyrights">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css"/>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>
<?php
  $notif = $this->session->flashdata('notif');
 if(!empty($notif)) {
            echo '<div class="alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                '.$notif.'
            </div>';
          } ?>
  <div class="container">
  <div class="row">
    <form role="form" method="post" enctype="multipart/form-data" action="<?php echo base_url() ?>Admin/Broadcast_in" id="broadcast-form" class="contact-form">
                    <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                      
                        <select id="Terima" name="for_id" class="form-control">
                          <option value="0920">Merchant</option>
                          <option value="0921">Buyer</option>
                          <option value="0922">All User</option>
                        </select>
                          <!-- <input type="text" class="form-control" name="Receipt" autocomplete="off" id="Recipt" placeholder="Receipt"> -->
                      </div>
                    </div>
                      <div class="col-md-4">
                      <div class="form-group">
                           <input type="text" class="form-control" name="subject" autocomplete="off" id="Subject" placeholder="Subject">
                      </div>
                    </div>
                    </div>
                    <div class="row">
                      <div class="col-md-10">
                      <div class="form-group">
                            <textarea class="form-control textarea" rows="3" name="text" id="Message" placeholder="Message"></textarea>
                      </div>
                    </div>
                    </div>
                       <div class="row">
                    <div class="col-md-10">
                  <input type="submit" name="submit" id="broadcast"  class="btn main-btn pull-right" value="Broadcast Now">
                  </div>
                  </div>
                    
       </form>
    
  </div>
</div>
</div>
</div>
