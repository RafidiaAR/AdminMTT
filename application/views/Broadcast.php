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
  <div class="container">
  <div class="row">
    <form role="form" id="contact-form" class="contact-form">
                    <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                      
                        <select id="Terima" name="terima" class="form-control">
                          <option value="1">Merchant</option>
                          <option value="2">Buyer</option>
                          <option value="2">All User</option>
                        </select>
                          <!-- <input type="text" class="form-control" name="Receipt" autocomplete="off" id="Recipt" placeholder="Receipt"> -->
                      </div>
                    </div>
                      <div class="col-md-6">
                      <div class="form-group">
                           <input type="text" class="form-control" name="Subject" autocomplete="off" id="Subject" placeholder="Subject">
                      </div>
                    </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                      <div class="form-group">
                            <textarea class="form-control textarea" rows="3" name="Message" id="Message" placeholder="Message"></textarea>
                      </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-12">
                  <button type="submit" class="btn main-btn pull-right">Send a message</button>
                  </div>
                  </div>
                </form>
  </div>
</div>
</div>
</div>
<script type="text/javascript">
  $('#contact-form').bootstrapValidator({
//        live: 'disabled',
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            Receipt: {
                validators: {
                    notEmpty: {
                        message: 'The Receipt is required and cannot be empty'
                    }
                }
            },
            Subject: {
                validators: {
                    notEmpty: {
                        message: 'The Subject is required and cannot be empty'
                    }
                }
            },
            Message: {
                validators: {
                    notEmpty: {
                        message: 'The Message is required and cannot be empty'
                    }
                }
            }
        }
    });

</script>