<style type="text/css">
  .shape{    
    border-style: solid; border-width: 0 70px 40px 0; float:right; height: 0px; width: 0px;
    -ms-transform:rotate(360deg); /* IE 9 */
    -o-transform: rotate(360deg);  /* Opera 10.5 */
    -webkit-transform:rotate(360deg); /* Safari and Chrome */
    transform:rotate(360deg);
}
.offer{
    background:#fff; border:1px solid #ddd; box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2); margin: 15px 0; overflow:hidden;
}
.offer:hover {
    -webkit-transform: scale(1.1); 
    -moz-transform: scale(1.1); 
    -ms-transform: scale(1.1); 
    -o-transform: scale(1.1); 
    transform:rotate scale(1.1); 
    -webkit-transition: all 0.4s ease-in-out; 
-moz-transition: all 0.4s ease-in-out; 
-o-transition: all 0.4s ease-in-out;
transition: all 0.4s ease-in-out;
    }
.shape {
    border-color: rgba(255,255,255,0) #d9534f rgba(255,255,255,0) rgba(255,255,255,0);
}
.offer-radius{
    border-radius:7px;
}
.offer-danger { border-color: #d9534f; }
.offer-danger .shape{
    border-color: transparent #d9534f transparent transparent;
}
.offer-primary {    border-color: #5cb85c; }
.offer-primary .shape{
    border-color: transparent #5cb85c transparent transparent;
}
.offer-default {    border-color: #999999; }
.offer-default .shape{
    border-color: transparent #999999 transparent transparent;
}
.offer-primary {    border-color: #428bca; }
.offer-primary .shape{
    border-color: transparent #428bca transparent transparent;
}
.offer-info {   border-color: #5bc0de; }
.offer-info .shape{
    border-color: transparent #5bc0de transparent transparent;
}
.offer-warning {    border-color: #f0ad4e; }
.offer-warning .shape{
    border-color: transparent #f0ad4e transparent transparent;
}

.shape-text{
    color:#fff; font-size:12px; font-weight:bold; position:relative; right:-40px; top:2px; white-space: nowrap;
    -ms-transform:rotate(30deg); /* IE 9 */
    -o-transform: rotate(360deg);  /* Opera 10.5 */
    -webkit-transform:rotate(30deg); /* Safari and Chrome */
    transform:rotate(30deg);
}   
.offer-content{
    padding:0 20px 10px;
}
@media (min-width: 487px) {
  .container {
    max-width: 750px;
  }
  .col-sm-6 {
    width: 50%;
  }
}
@media (min-width: 900px) {
  .container {
    max-width: 970px;
  }
  .col-md-4 {
    width: 33.33333333333333%;
  }
}

@media (min-width: 1200px) {
  .container {
    max-width: 1170px;
  }
  .col-lg-3 {
    width: 25%;
  }
  }



</style>
<div class="inner-block">
      <div class="portlet-grid-page"> 
      <h2> List Diskusi</h2>

    <div class="row">
    </div>
    
    <div class="row">
    <?php foreach ($list_discuss as $discuss) : ?>
       <a href="<?php echo base_url(); ?>index.php/progress/discussion_detail/<?php echo $discuss->product_id ?>" title="<?php echo $discuss->name ?>"> <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
            <div class="offer offer-primary">
                <div class="shape">
                    <div class="shape-text">
                        <span class="glyphicon glyphicon glyphicon-comment"></span>   td                   
                    </div>
                </div>
                <div class="offer-content">
                    <h3 class="lead" >
                         <?php echo substr($discuss->name,0,10) ?>...
                    </h3>
                    <p>
                        ID Product : <label class="label label-primary"><?php echo $discuss->product_id ?></label>
                        <br> 
                        <!-- <div class="progress"> -->
            <!--  <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 40%; height:100%" > -->
                     <!-- 60% -->
                        <!-- </div> -->
                   <!-- </div> -->
                    </p>
                </div>
            </div>
        </div></a>
    <?php endforeach; ?>

        </div>
</div>
</div>

<div class="clearfix"></div>