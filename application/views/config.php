<style type="text/css">
	 .custom-input-file {
    overflow: hidden;
    position: relative;
    width: 300px;
    height: 300px;
    background-repeat: no-repeat;
    /*background-attachment: fixed;*/
    background-position: center; 
    background-size: 300px;
    /*border-radius: 120px;*/
}
input[type="file"]{
    z-index: 999;
    line-height: 0;
    font-size: 0;
    position: absolute;
    opacity: 0;
    filter: alpha(opacity = 0);-ms-filter: "alpha(opacity=0)";
    margin: 0;
    padding:0;
    left:0;
}
.uploadPhoto {
    position: absolute;
    top: 25%;
    left: 25%;
    display: none;
    width: 50%;
    height: 50%;
    color: #fff;    
    text-align: center;
    line-height: 60px;
    text-transform: uppercase;    
    background-color: rgba(0,0,0,.3);
    /*border-radius: 50px;*/
    cursor: pointer;
}
.custom-input-file:hover .uploadPhoto { display: block; }
   
</style>
<div class="container">
	<?php
  $notif = $this->session->flashdata('notif');
 if(!empty($notif)) {
            echo '<div class="alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                '.$notif.'
            </div>';
          } ?>
	<div class="row">
<div>
			<h4>SLIDE 1</h4>
		 <form id="formfoto1" action ="<?php echo base_url();?>Admin/changeslide" method="post" enctype="multipart/form-data">
              <!-- <img class="img-responsive" width="300px" height="300px" src="<?php echo base_url() ?>/assets/images/<?php echo $user->image ?>" alt="profile photo"> -->

              <input type="date" name="last_update" class="hidden" value="<?php echo date("Y-m-d"); ?> " />
                               <div class="custom-input-file" id="previewavatar" style="background-image:url('<?php echo base_url() ?>/assets/images/<?php echo $slide1; ?>');">
                                    <label class="uploadPhoto">
                                        Edit
                                        <input type="file" id="filefoto1" name="fotoslide" class="change-avatar" name="avatar" id="avatar">
                                        <input type="hidden"  name="type" value="SLIDE1">
                                    </label>

                                </div>


               </form>
	</div>
	<div>
			<h4>SLIDE 2</h4>
		 <form id="formfoto2" action ="<?php echo base_url();?>Admin/changeslide" method="post" enctype="multipart/form-data">
              <!-- <img class="img-responsive" width="300px" height="300px" src="<?php echo base_url() ?>/assets/images/<?php echo $user->image ?>" alt="profile photo"> -->

              <input type="date" name="last_update" class="hidden" value="<?php echo date("Y-m-d"); ?> " />
                               <div class="custom-input-file" id="previewavatar" style="background-image:url('<?php echo base_url() ?>/assets/images/<?php echo $slide2 ?>');">
                                    <label class="uploadPhoto">
                                        Edit
                                        <input type="file" id="filefoto2" name="fotoslide" class="change-avatar" name="avatar" id="avatar">
                                        <input type="hidden" name="type" value="SLIDE2">
                                    </label>

                                </div>


               </form>
	</div>
	<div>
			<h4>SLIDE 3</h4>
		 <form id="formfoto3" action ="<?php echo base_url();?>Admin/changeslide" method="post" enctype="multipart/form-data">
              <!-- <img class="img-responsive" width="300px" height="300px" src="<?php echo base_url() ?>/assets/images/<?php echo $user->image ?>" alt="profile photo"> -->

              <input type="date" name="last_update" class="hidden" value="<?php echo date("Y-m-d"); ?> " />
                               <div class="custom-input-file" id="previewavatar" style="background-image:url('<?php echo base_url() ?>/assets/images/<?php echo $slide3 ?>');">
                                    <label class="uploadPhoto">
                                        Edit
                                        <input type="file" id="filefoto3" name="fotoslide" class="change-avatar" name="avatar" id="avatar">
                                        <input type="hidden" name="type" value="SLIDE3">
                                    </label>

                                </div>


               </form>
	</div>
</div>
</div>

<script type="text/javascript">
	document.getElementById("filefoto1").onchange = function() {
    $("form#formfoto1").submit();

}  
	document.getElementById("filefoto2").onchange = function() {
    $("form#formfoto2").submit();

}  
document.getElementById("filefoto3").onchange = function() {
    $("form#formfoto3").submit();


}  
</script>