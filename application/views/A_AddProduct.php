    <!--  <div class="inner-block">
         <div class="signup-head">
                <h1>Add Product</h1>
            </div>
            <div class="signup-block">
            <?php if(!empty($notif)) {
            echo '<div class="alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                '.$notif.'
            </div>';
             } ?>
                <form action="<?php echo base_url(); ?>Page/add_product" method="post" enctype="multipart/form-data">
                       
                        <label>ID Produk</label>
                        
                        <input type="hidden" name="merchant_id" placeholder="ID Produk" class="form-control" value="<?php echo $merchant_id; ?>" readonly>   
                        <input type="text" name="id_produk" placeholder="ID Produk" class="form-control" value="<?php echo $id_product; ?>" readonly>

                        <label>Nama Produk</label>
                        <input type="text" name="product" placeholder="Nama Produk" class="form-control" required=""><br>    

                        <label>Stock</label>
                        <input type="number" name="stock" placeholder="0" class="form-control" required=""><br>

                        <label>Harga</label>
                        <input type="number" name="harga" placeholder="Harga" class="form-control" required=""><br>

                        <label>Category</label>
                        <select class="form-control" id="sel1" name="category">
                                <option value="">--- Pilih Category ---</option>
                        <?php foreach ($category as $record): ?>
                                <option value="<?php echo $record->id; ?>" name="category"><?php echo $record->name; ?></option>
                        <?php endforeach; ?>
                        </select> <br>
                        
                        <label>Description</label>
                        <textarea class="form-control" rows="5" placeholder="Deksripsi produk" name="description" required=""></textarea><br>
                    
                        <Label>Foto Produk</Label>
                        <input type="file" name="foto" class="form-control">
                        <br>
                    
                         <input type="hidden" name="tgl_add" placeholder="" value="" <?php getdate(); ?>  class="form-control" disabled hidden="">
                  <div class="clearfix"></div>
                    <input type="submit" name="submit" value="Add Product">                                                        
                </form>
               
            </div>
</div> -->

<style type="text/css">
.form-style-5{
    width: 100%;
    padding: 10px 20px;
    background: #f4f7f8;
    margin: 10px auto;
    padding-left: 50px;
    padding-right: 50px;
    background: #f4f7f8;
    border-radius: 8px;
   /* font-family: Georgia, "Times New Roman", Times, serif;*/
}
.form-style-5 fieldset{
    border: none;
}
.form-style-5 legend {
    font-size: 1.4em;
    margin-bottom: 10px;
}
.form-style-5 label {
    display: block;
    margin-bottom: 8px;
}
.form-style-5 input[type="text"],
.form-style-5 input[type="date"],
.form-style-5 input[type="datetime"],
.form-style-5 input[type="email"],
.form-style-5 input[type="number"],
.form-style-5 input[type="search"],
.form-style-5 input[type="time"],
.form-style-5 input[type="url"],
.form-style-5 textarea,
.form-style-5 select {
   /* font-family: Georgia, "Times New Roman", Times, serif;*/
    background: rgba(255,255,255,.1);
    border: none;
    border-radius: 4px;
    font-size: 16px;
    margin: 0;
    outline: 0;
    padding: 7px;
    width: 100%;
    box-sizing: border-box; 
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box; 
    background-color: #e8eeef;
    color:#8a97a0;
    -webkit-box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
    box-shadow: 0 1px 0 rgba(0,0,0,0.03) inset;
    margin-bottom: 30px;
    
}
.form-style-5 input[type="text"]:focus,
.form-style-5 input[type="date"]:focus,
.form-style-5 input[type="datetime"]:focus,
.form-style-5 input[type="email"]:focus,
.form-style-5 input[type="number"]:focus,
.form-style-5 input[type="search"]:focus,
.form-style-5 input[type="time"]:focus,
.form-style-5 input[type="url"]:focus,
.form-style-5 textarea:focus,
.form-style-5 select:focus{
    background: #d2d9dd;
}
.form-style-5 select{
    -webkit-appearance: menulist-button;
    height:35px;
}
.form-style-5 .number {
    background: #00cc66;
    color: #fff;
    height: 30px;
    width: 30px;
    display: inline-block;
    font-size: 0.8em;
    margin-right: 4px;
    line-height: 30px;
    text-align: center;
    text-shadow: 0 1px 0 rgba(255,255,255,0.2);
    border-radius: 15px 15px 15px 0px;
}

.form-style-5 input[type="submit"],
.form-style-5 input[type="button"]
{
    position: relative;
    display: block;
    padding: 19px 39px 18px 39px;
    color: #FFF;
    margin: 0 auto;
    background: #00cc66;
    font-size: 18px;
    text-align: center;
    font-style: normal;
    width: 100%;
    border-radius: 7px;
    border: 1px solid #00cc66;
    border-width: 1px 1px 3px;
    margin-bottom: 10px;
}
.form-style-5 input[type="submit"]:hover,
.form-style-5 input[type="button"]:hover,
{
    background: #68AE00;
}
.inner-block{
    padding: 3em;
}
</style>
<div class="inner-block"><h2>Tambah Produk</h2></div>
<div class="form-style-5">
    <?php if(!empty($notif)) {
            echo '<div class="alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                '.$notif.'
            </div>';
             } ?>
    <form action="<?php echo base_url(); ?>Admin/Tambah_product" method="post" enctype="multipart/form-data">
        <fieldset>
            <legend><span class="number">1</span> Informasi Produk</legend>
            <!-- <label>ID Produk</label> -->
            <input type="hidden" name="merchant_id" placeholder="ID Produk" class="form-control" value="<?php echo $merchant_id; ?>" readonly>
            <!-- <input type="text" name="id_produk" placeholder="ID Produk" class="form-control" value="<?php echo $id_product; ?>" readonly> -->
            <label>Nama Produk</label>
            <input type="text" name="product" placeholder="Nama Produk" class="form-control" required="">
            <br>
            <label>Stok</label>
            <input type="number" name="stock" placeholder="0" class="form-control" required="">
            <br>
            <label>Harga</label>
            <input type="number" name="harga" placeholder="Harga" class="form-control" required="">
            <br>
            <label>Kategori</label>
            <select class="form-control" id="sel1" name="category">
                <option value="">--- Pilih Category ---</option>
                <?php foreach ($category as $record): ?>
                <option value="<?php echo $record->id; ?>" name="category">
                    <?php echo $record->name; ?></option>
                <?php endforeach; ?>
            </select>
            <br>
            <label>Merchant</label>
            <select class="form-control" id="sel1" name="category">
                <option value="">--- Pilih Merchant ---</option>
                <?php foreach ($Merchant as $data): ?>
                <option value="<?php echo $data->id; ?>" name="Merchant">
                    <?php echo $data->username; ?></option>
                <?php endforeach; ?>
            </select>
            <br>
            <fieldset>
                <legend><span class="number">2</span> Deskripsi Produk</legend>
                <input id="last_update" type="hidden" name="created_at" placeholder="" class="form-control" value="<?php echo strtotime(date('Y-m-d H:i:s'))?>">
               <!--  <input type="hidden" name="adminfee" value="0" class="form-control" required="" readonly=""> -->
                <input type="hidden" name="status" placeholder="ID Produk" class="form-control" value="READY STOCK" readonly>
                <textarea class="form-control" rows="5" placeholder="Deksripsi produk" name="description" required=""></textarea>
                <br>

            </fieldset>
        </fieldset>
        <fieldset>
            <legend><span class="number">3</span> Upload Foto Produk</legend>
            <label>Photo Product</label>
            <input type="file" id="img" name="foto" class="form-control">
            <img id="preview"  width="300px" height="300px" style="display:none" /><br>
            <br>

            <input type="hidden" name="tgl_add" placeholder="" value="" <?php getdate(); ?> class="form-control" disabled hidden="">
        </fieldset>
        <input type="submit" name="submit" value="Add Product"> 
    </form>
</div>
<Script>
    function preview(input) {
        if (input.files && input.files[0]) {
            var freader = new FileReader();
            freader.onload = function (e) {
                $("#preview").show();
                $('#preview').attr('src', e.target.result);
            }
            freader.readAsDataURL(input.files[0]);
        }
    }
    
    $("#img").change(function(){
        preview(this);
    });
</Script>