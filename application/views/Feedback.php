  <style type="text/css">
    body {
        /*padding-top: 40px;*/
        /*padding-bottom: 40px;*/
        
      }
       p{
        font-size: 10px;    
        }
    
    /* COMMON PRICING STYLES */
        .panel.price,
        .panel.price>.panel-heading{
            border-radius:0px;
             -moz-transition: all .3s ease;
            -o-transition:  all .3s ease;
            -webkit-transition:  all .3s ease;
        }
        .panel.price:hover{
            box-shadow: 0px 0px 30px rgba(0,0,0, .2);
        }
        .panel.price:hover>.panel-heading{
            box-shadow: 0px 0px 30px rgba(0,0,0, .2) inset;
        }
        
                
        .panel.price>.panel-heading{
            box-shadow: 0px 5px 0px rgba(50,50,50, .2) inset;
            text-shadow:0px 3px 0px rgba(50,50,50, .6);
        }
            
        .price .list-group-item{
            border-bottom-:1px solid rgba(250,250,250, .5);
        }
        
        .panel.price .list-group-item:last-child {
            border-bottom-right-radius: 0px;
            border-bottom-left-radius: 0px;
        }
        .panel.price .list-group-item:first-child {
            border-top-right-radius: 0px;
            border-top-left-radius: 0px;
        }
        
        .price .panel-footer {
            color: #6d6767;
            border-bottom:0px;
            background-color:  rgba(0,0,0, .1);
            box-shadow: 0px 3px 0px rgba(0,0,0, .3);
        }
        
        
        .panel.price .btn{
            box-shadow: 0 -1px 0px rgba(50,50,50, .2) inset;
            border:0px;
        }
        
    /* green panel */
    
        
        .price.panel-green>.panel-heading {
            color: #fff;
            background-color: #57AC57;
            border-color: #71DF71;
            border-bottom: 1px solid #71DF71;
        }
        
            
        .price.panel-green>.panel-body {
            color: #fff;
            background-color: #65C965;
        }
                
        
        .price.panel-green>.panel-body .lead{
                text-shadow: 0px 3px 0px rgba(50,50,50, .3);
        }
        
        .price.panel-green .list-group-item {
            color: #333;
            background-color: rgba(50,50,50, .01);
            font-weight:600;
            text-shadow: 0px 1px 0px rgba(250,250,250, .75);
        }
        
        /* blue panel */
    
        
        .price.panel-blue>.panel-heading {
            color: #fff;
            background-color: #608BB4;
            border-color: #78AEE1;
            border-bottom: 1px solid #78AEE1;
        }
        
            
        .price.panel-blue>.panel-body {
            color: #fff;
            background-color: #73A3D4;
        }
                
        
        .price.panel-blue>.panel-body .lead{
                text-shadow: 0px 3px 0px rgba(50,50,50, .3);
        }
        
        .price.panel-blue .list-group-item {
            color: #333;
            background-color: rgba(50,50,50, .01);
            font-weight:600;
            text-shadow: 0px 1px 0px rgba(250,250,250, .75);
        }
        
        /* red price */
        
    
        .price.panel-red>.panel-heading {
            color: #fff;
            background-color: #D04E50;
            border-color: #FF6062;
            border-bottom: 1px solid #FF6062;
        }
        
            
        .price.panel-red>.panel-body {
            color: #fff;
            background-color: #EF5A5C;
        }
        
        
        
        
        .price.panel-red>.panel-body .lead{
                text-shadow: 0px 3px 0px rgba(50,50,50, .3);
        }
        
        .price.panel-red .list-group-item {
            color: #333;
            background-color: rgba(50,50,50, .01);
            font-weight:600;
            text-shadow: 0px 1px 0px rgba(250,250,250, .75);
        }
        
        /* grey price */
        
    
        .price.panel-grey>.panel-heading {
            color: #fff;
            background-color: #6D6D6D;
            border-color: #B7B7B7;
            border-bottom: 1px solid #B7B7B7;
        }
        
            
        .price.panel-grey>.panel-body {
            color: #fff;
            background-color: #808080;
        }
        

        
        .price.panel-grey>.panel-body .lead{
                text-shadow: 0px 3px 0px rgba(50,50,50, .3);
        }
        
        .price.panel-grey .list-group-item {
            color: #333;
            background-color: rgba(50,50,50, .01);
            font-weight:600;
            text-shadow: 0px 1px 0px rgba(250,250,250, .75);
        }
        
        /* white price */
        
    
        .price.panel-white>.panel-heading {
            color: #333;
            background-color: #f9f9f9;
            border-color: #ccc;
            border-bottom: 1px solid #ccc;
            text-shadow: 0px 2px 0px rgba(250,250,250, .7);
        }
        
        .panel.panel-white.price:hover>.panel-heading{
            box-shadow: 0px 0px 30px rgba(0,0,0, .05) inset;
        }
            
        .price.panel-white>.panel-body {
            color: #fff;
            background-color: #dfdfdf;
        }
                
        .price.panel-white>.panel-body .lead{
                text-shadow: 0px 2px 0px rgba(250,250,250, .8);
                color:#666;
        }
        
        .price:hover.panel-white>.panel-body .lead{
                text-shadow: 0px 2px 0px rgba(250,250,250, .9);
                color:#333;
        }
        
        .price.panel-white .list-group-item {
            color: #333;
            background-color: rgba(50,50,50, .01);
            font-weight:600;
            text-shadow: 0px 1px 0px rgba(250,250,250, .75);
        }

  </style>



  <div class="inner-block">
      <div class="portlet-grid-page">  
        <h2>Feedback</h2>   
        <div class="main-page-charts">
   <div class="main-page-chart-layer1">
        <div class="col-md-6 chart-layer1-left"> 
            <div class="glocy-chart">
            <div class="span-2c">  
                        <h3 class="tlt">Feedback Analytics/Week</h3>
                        <canvas id="weekbar" height="300" width="400" style="width: 400px; height: 300px;"></canvas>
                        <script>
                            var barChartData = {
                            labels : ["Mon","Tues","Wed","Thurs","Fri","Sat","Sun"],
                            datasets : [
                                {
                                    fillColor : "#FC8213",
                                    data : [65,59,90,81,56,55,40]
                                },
                                {
                                    fillColor : "#337AB7",
                                    data : [28,48,40,19,96,27,100]
                                }
                            ]

                        };
                            new Chart(document.getElementById("weekbar").getContext("2d")).Bar(barChartData);

                        </script>
                    </div>                              
            </div>
        </div>
        <div class="col-md-6 chart-layer1-left"> 
            <div class="glocy-chart">
            <div class="span-2c">  
                        <h3 class="tlt">Feedback Analytics/Month</h3>
                        <canvas id="monthbar" height="300" width="400" style="width: 400px; height: 300px;"></canvas>
                        <script>
                            var barChartData = {
                            labels : ["Jan","Feb","Mar","Apr","Mei","Jun","Jul","Aug","Sep","Oct","Dec"],
                            datasets : [
                                {
                                    fillColor : "#FC8213",
                                    data : [65,59,90,81,56,55,40,56,55,40,56,55]
                                },
                                {
                                    fillColor : "#337AB7",
                                    data : [28,48,40,19,96,27,100,56,55,40,56,55]
                                }
                            ]

                        };
                            new Chart(document.getElementById("monthbar").getContext("2d")).Bar(barChartData);

                        </script>
                    </div>                              
            </div>
        </div>
        </div>
        </div>
</div>
</div>

        <div class="clearfix"></div>

        <!-- batas bar persentase -->
<!-- <?php foreach ($feedback as $data) : ?>
<div class="inner-block">
    <div class="portlet-grid-page">  
    	<div class="portlet-grid panel-primary"> 
    		 <div class="panel-heading">
    		      <h3 class="panel-title"><?php echo $data->buyer; ?></h3>
    		  </div> 
    		  <div class="panel-body">
    		  	   <span><?php echo $data->product_name ?></span>- <?php echo $data->Feedback; ?>
    		  </div>     	
        </div>
    </div>
</div>
<?php endforeach ?> -->





<?php foreach($feedback as $data) : 

    if ($data->feedback != null || $data->feedback != '') {
       
    ?>

<div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
                
                    <!-- PRICE ITEM -->
                    <div class="panel price panel-red">
                        <div class="panel-heading  text-center">
                        <h3><?php echo $data->buyer; ?></h3>
                        </div>
                        <div class="panel-body text-center">
                            <p class="lead" style="font-size:20px"><?php echo $data->feedback; ?></p>
                        </div>
                        <ul class="list-group list-group-flush text-center">
                            <li class="list-group-item"><i class="icon-ok text-danger"></i><p  title="<?php echo $data->product_name; ?>"><?php echo substr($data->product_name,0,30); ?>...</p></li>
                            
                        </ul>
                        <div class="panel-footer">
                            <p>Submitted at <?php echo gmdate('Y-m-d H:i:s',$data->tgl_update/1000); ?></p>
                        </div>
                    </div>
</div>
<?php }
 endforeach; ?>
