     <div class="inner-block">
         <!-- <div class="signup-head"> -->
                <h1>Edit Product</h1>
            <!-- </div> -->
            <div class="signup-block">
            <?php if(!empty($notif)) {
            echo '<div class="alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                '.$notif.'
            </div>';
             } ?>
                <form action="<?php echo base_url(); ?>Page/update_product" method="post" enctype="multipart/form-data">
                        <label>ID Produk</label>
                        <input id="last_update" type="hidden" name="last_update" placeholder="" class="form-control" value="<?php echo strtotime(date('Y-m-d H:i:s'))?>">
                        <input type="text" name="id_produk" placeholder="ID Produk" class="form-control" value="<?php echo $id; ?>" readonly>

                        <label>Nama Produk</label>
                        <input type="text" name="product" placeholder="Nama Produk" class="form-control" required="" value="<?php echo $nama; ?>"><br>    

                        <label>Stock</label>
                        <input type="number" name="stock" placeholder="0" class="form-control" required="" value="<?php echo $stock; ?>"><br>

                        <label>Harga</label>
                        <input type="number" name="harga" placeholder="Harga" class="form-control" required="" value="<?php echo $harga; ?>"><br>
                        
                        <label>Description</label>
                        <textarea class="form-control" rows="5" placeholder="Deksripsi produk" name="description" required="" value=""><?php echo $deskripsi; ?></textarea><br>
                    
                        <Label>Foto Produk</Label>
                         <?php if (!empty($foto)): ?>
                                        <img src="<?php echo base_url().'assets/images/'.$foto; ?>" alt="" width="150px">
                                        <br><br>
                                    <?php endif; ?>
                        <br>
                    
                         <input type="hidden" name="tgl_add" placeholder="" value="" <?php getdate(); ?>  class="form-control" disabled hidden="">
                    <div class="clearfix"></div>
                    <input type="submit" name="submit" value="Update Product"><br>                                                        
                </form>
               
            </div>
</div>