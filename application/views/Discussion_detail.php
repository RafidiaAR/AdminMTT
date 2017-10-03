<style type="text/css">
    .messages .list-group-item:first-child {border-top-right-radius: 0px;border-top-left-radius: 0px;}
.messages .list-group-item:last-child {border-bottom-right-radius: 0px;border-bottom-left-radius: 0px;}
.messages .list-group .checkbox { display: inline-block;margin: 0px; }
.messages .list-group input[type="checkbox"]{ margin-top: 2px; }
.messages .list-group .glyphicon { margin-right:5px; }
.messages .list-group .glyphicon:hover { color:#FFBC00; }
a.list-group-item.read { color: #222;background-color: #F3F3F3; }
hr { margin-top: 5px;margin-bottom: 10px; }
.nav-pills>li>a {padding: 5px 10px;}

.ad { padding: 5px;background: #F5F5F5;color: #222;font-size: 80%;border: 1px solid #E5E5E5; }
.ad a.title {color: #15C;text-decoration: none;font-weight: bold;font-size: 110%;}
.ad a.url {color: #093;text-decoration: none;}



 .message-wrap
    {
        box-shadow: 0 0 3px #ddd;
        padding:0;

    }
    .msg
    {
        padding:5px;
        border-top:1px solid #ddd;
        margin:0;
    }
    .msg.odd {
        background-color: #FFFFFF;
    }
    .msg.even {
        background-color: #F4F6F8;
    }
    .msg.user {
        background-color: #FFFFFF;
    }
    .msg.merchant {
        background-color: #F4F6F8;
    }
    .msg .author {
        border-right: 1px solid #ddd;
    }
    .msg-wrap {
        padding:10px;
    }
    

    .msg-wrap .thread-title {
        font-size: 22px;
        font-weight: 400;
        color: #222222;
        padding: 0 0 0 10px;
    }

    .send-wrap
    {
        border-top: 1px solid #eee;
        padding:10px;
        /*background: #f8f8f8;*/
    }

    .highlight
    {
        background-color: #f7f7f9;
        border: 1px solid #e1e1e8;
    }

    .msg-wrap .media-heading
    {
        color:black;
        font-weight: 700;
    }

    .msg-date
    {
        background: none;
        text-align: center;
        color:#aaa;
        border:none;
        box-shadow: none;
        border-bottom: 1px solid #ddd;
    }
</style>
<div style="margin-left: 20px">
 <div class="row" style="margin-top:20px">
        <div class="col-sm-3 col-md-2">
             <a href="<?php echo base_url(); ?>index.php/progress/discussion"><button type="button" class="btn btn-default" title="Back to List Discussion">
                   <span class="glyphicon glyphicon-arrow-left"></span> Back to List Discussion</button>
        </div>
        
    </div>
    <hr />
    <div class="row">
        <div class="col-sm-3 col-md-2">
            <ul class="nav nav-pills nav-stacked">
                <li><a href="#"> <img alt="" src="http://lorempixel.com/165/200/people/9/"></a>
                </li>
                
            </ul>
        </div>
        <div class="col-sm-9 col-md-10">
            <div class="msg-wrap">
                <p class="thread-title"><?php echo $product->id ?> - <?php echo $product->name ?></p>
                
                <?php 
                // $i=1;
                foreach ($detail_discuss as $discuss) :
                 ?>
                <?php if ($discuss->level == 1){ 
                $merchantuser = 'merchant';
                }
                else{
                $merchantuser = 'user';
                }
                $subphone = substr($discuss->phone, 0,1);
                 if ($subphone == '0') {
                $whatsapp = '62'.substr($discuss->phone, 1);
                 }
                  else if ($subphone == '6') {
                 $whatsapp = $discuss->phone;
                  }
                 else if ($subphone == '+') {
                  $whatsapp = substr($discuss->phone, 1);
                  }
                  else {
                  $whatsapp = '';
                        }
                ?>
                    
                
                <div class="msg <?php echo $merchantuser ?>">
                    <div class="col-md-2 author">
                        <h5  class="media-heading"><?php echo $discuss->user_name ?> 
                        <!-- <?php if ($merchantuser == 'merchant'): ?>
                            <small class="text-muted badge">Merchant</small>
                        <?php endif ?> -->
                        

                        </h5>
                        <a style="color:#337ab7" href="tel://<?php echo $discuss->phone; ?>"><i class="fa fa-phone"  data-toggle="tooltip" title="<?php echo $discuss->phone ?>"></i></a>
                        <a style="color:#337ab7" href="sms:<?php echo $discuss->phone; ?>"><i class="fa fa-envelope"  data-toggle="tooltip" title="<?php echo $discuss->phone ?>"></i></a>
                        <a style="color:green" href=" https://api.whatsapp.com/send?phone=<?php echo $whatsapp; ?>">
                         <i class="fa fa-whatsapp"  data-toggle="tooltip" title="<?php echo $discuss->phone ?>"></i></a>
                        <a style="color:#f22b49" href="#">
                         <i class="fa fa-location-arrow"  data-toggle="tooltip" title="<?php echo $discuss->location ?>"></i></a>
                        <br/>
                            <small class="text-muted">
                        <i class="fa fa-clock-o"></i> <?php echo $discuss->discussion_created?> </small>
                        <a href="#" class="">
                            <!-- <img src="http://lorempixel.com/165/200/people/9/" style="width: 64px; height: 64px;" alt="64x64" data-src="holder.js/64x64" class="media-object"> -->
                        </a>
                    </div>
                    <div class="col-md-9">
                        <?php echo $discuss->comment?>
                    </div>
                    <div class="clearfix"></div>
                </div>
            <?php 
            // $i++;
            endforeach; ?>

               <!-- even -->
               
            
            </div>

            <div class="send-wrap ">
                <form action="<?php echo base_url(); ?>index.php/page/SendComment" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <textarea id="text_discuss" name="comment" class="form-control counted" rows="3" placeholder="Ketik untuk membalas..."></textarea>
                        <input type="hidden" name="product_id" value="<?php echo $product->id ?>" id="product_id"/>
                    </div>
                    <div class="form-group">
                        <h6 class="pull-right" id="counter">250 characters remaining</h6>
                        <input type="submit" class="btn btn-primary" name="submit"  id="send_discuss" value="Send">
                    </div>
                </form>
            </div>
        </div>
    </div>
    </div>
     <div class="clearfix" style="margin-bottom: 120px"></div>
    <script src="<?php echo base_url() ?>assets/js/jquery-2.1.1.min.js"></script> 
    <script type="text/javascript">

 
/**
 *
 * jquery.charcounter.js version 1.2
 * requires jQuery version 1.2 or higher
 * Copyright (c) 2007 Tom Deater (http://www.tomdeater.com)
 * Licensed under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 * 
 */
 
(function($) {
    /**
     * attaches a character counter to each textarea element in the jQuery object
     * usage: $("#myTextArea").charCounter(max, settings);
     */
    
    $.fn.charCounter = function (max, settings) {
        max = max || 100;
        settings = $.extend({
            container: "<span></span>",
            classname: "charcounter",
            format: "(%1 characters remaining)",
            pulse: true,
            delay: 0
        }, settings);
        var p, timeout;
        
        function count(el, container) {
            el = $(el);
            if (el.val().length > max) {
                el.val(el.val().substring(0, max));
                if (settings.pulse && !p) {
                    pulse(container, true);
                };
            };
            if (settings.delay > 0) {
                if (timeout) {
                    window.clearTimeout(timeout);
                }
                timeout = window.setTimeout(function () {
                    container.html(settings.format.replace(/%1/, (max - el.val().length)));
                }, settings.delay);
            } else {
                container.html(settings.format.replace(/%1/, (max - el.val().length)));
            }
        };
        
        function pulse(el, again) {
            if (p) {
                window.clearTimeout(p);
                p = null;
            };
            el.animate({ opacity: 0.1 }, 100, function () {
                $(this).animate({ opacity: 1.0 }, 100);
            });
            if (again) {
                p = window.setTimeout(function () { pulse(el) }, 200);
            };
        };
        
        return this.each(function () {
            var container;
            if (!settings.container.match(/^<.+>$/)) {
                // use existing element to hold counter message
                container = $(settings.container);
            } else {
                // append element to hold counter message (clean up old element first)
                $(this).next("." + settings.classname).remove();
                container = $(settings.container)
                                .insertAfter(this)
                                .addClass(settings.classname);
            }
            $(this)
                .unbind(".charCounter")
                .bind("keydown.charCounter", function () { count(this, container); })
                .bind("keypress.charCounter", function () { count(this, container); })
                .bind("keyup.charCounter", function () { count(this, container); })
                .bind("focus.charCounter", function () { count(this, container); })
                .bind("mouseover.charCounter", function () { count(this, container); })
                .bind("mouseout.charCounter", function () { count(this, container); })
                .bind("paste.charCounter", function () { 
                    var me = this;
                    setTimeout(function () { count(me, container); }, 10);
                });
            if (this.addEventListener) {
                this.addEventListener('input', function () { count(this, container); }, false);
            };
            count(this, container);
        });
    };

})(jQuery);

$(function() {
    $(".counted").charCounter(250,{container: "#counter"});
});


    
   
</script>

        

