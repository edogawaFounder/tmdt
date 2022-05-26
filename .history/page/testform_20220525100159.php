<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
<div style="border:2px solid #b55b00; width:500px;height:250px;
    margin:auto;text-align:center;background-color:#de6f00;
    box-shadow: 4px 3px 8px 1px #969696;border-radius: 10px;">
    
        <div style="margin:10px;">
            <label for="" style="font-size:24px;">Thể loại</label>
            
            <select name="theloai" id="theloai1" style="height:24px;width:37%;">  
            <option value="">Loại sản phẩm</option>
                <option value="1">Áo Sơ Mi</option>
                <option value="2">Áo Phông</option>
                <option value="3">Áo Hoodie</option>
                <option value="4">Áo Khoác</option>
            </select>
        </div>  
        <br>
        <label for="" style="font-size:24px;margin:20px;">Khoảng giá</label>
        <br>
        <label for="" style="font-size:24px;margin:20px;">Từ</label>
        <input type="number" value="100" placeholder="From" id="from1" name="from" style="height:24px;">
        <br>
        <label for="" style="font-size:24px;margin:20px;">Đến</label>
        <input type="number" id="to1" value="500000" placeholder="To" name="to" style="height:24px;"><br>
        <button onclick="locnangcao()" style="box-shadow: 4px 3px 8px 1px #4a4a4a;
        background-color:#1a9900;border:0;border-radius:10px;
        color:white;height:50px;width:200px;margin-top:20px;
        font-size:24px;"><i class="fas fa-search"></i>Tìm kiếm</button>
    
</div>




<?php include("./action.php");
    $phantrang=new action();
    
    ?>  

    <div class="small-container">

        <div class="row row-2">
            <h2>Tất cả sản phẩm</h2>
           
        </div>
        <div id="theloai">
        <div class="row row1">

        
        
        
            </div>
        
        <?php  ?>
        <!-- <h3 style="color:black;font-size:15px;">Có  trang</h3> -->
        <?php  ?>
        <div id="page1" style="color:red;font-size:20px;"></div>
      
        
        </div>
        
    </div>
    
    <!-- ------------footer----------- -->

   





    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
function locnangcao(){
    var theloai=$("#theloai1").val();
    var from=$("#from1").val();
    var to=$("#to1").val();
    if(theloai.length>0 && from.length>0 && to.length>0){
        $.ajax({
            type:"get",
            url:"./page/locnangcao.php",
            data:{theloai:theloai,from:from,to:to,page:"1"},
            success:function(data){
               // alert(data);
                console.log(data);
                $(".small-container .row1").html(data);

            }
        });
    }
    else if(theloai.length>0 && from.length>0){
       
       $.ajax({
           type:"get",
           url:"./page/locnangcao.php",
           data:{theloai:theloai,from:from,page:"1"},
           success:function(data){
              // alert(data);
               
               $(".small-container .row1").html(data);

           }
       });
   }
   else if(theloai.length>0 && to.length>0){
       
       $.ajax({
           type:"get",
           url:"./page/locnangcao.php",
           data:{theloai:theloai,to:to,page:"1"},
           success:function(data){
              // alert(data);
               
               $(".small-container .row1").html(data);

           }
       });
   }
   else if(from.length>0 && to.length>0){
       
       $.ajax({
           type:"get",
           url:"./page/locnangcao.php",
           data:{from:from,to:to,page:"1"},
           success:function(data){
              // alert(data);
               
               $(".small-container .row1").html(data);

           }
       });
   }
   else if(from.length>0){
       
       $.ajax({
           type:"get",
           url:"./page/locnangcao.php",
           data:{from:from,page:"1"},
           success:function(data){
              // alert(data);
               
               $(".small-container .row1").html(data);

           }
       });
   }
   else if(to.length>0){
       
       $.ajax({
           type:"get",
           url:"./page/locnangcao.php",
           data:{to:to,page:"1"},
           success:function(data){
              // alert(data);
               
               $(".small-container .row1").html(data);

           }
       });
   }
   else if(theloai.length>0){
      
       $.ajax({
           type:"get",
           url:"./page/locnangcao.php",
           data:{theloai:theloai,page:"1"},
           success:function(data){
              // alert(data);
               
               $(".small-container .row1").html(data);

           }
       });
   }
   else{
    $(".small-container .row1").html("Không tìm thấy sản phẩm");
   }
}       
</script>