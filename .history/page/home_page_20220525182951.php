<div class="header">
        <div class="container">
<div class="row">
                <div class="col-2">
                    <h1>Give Your Workout<br> A New Style!</h1>
                    <p>Success ins't always about greatness. It's about
                        consistency. Consistent <br>hard work gains success. Greatness
                        will come. </p>
                    <a href="index.php?action=productclassification" class="btn">Đến ngay &#8594;</a>
                </div>
                <div class="col-2">
                    <img src="images/image1.png">
                </div>
            </div>
            </div>
        </div>
<!-- <div class="categories">
        <div class="small-container">
            <div class="row">
                <div class="col-3">
                    <img src="images/category-1.jpg">
                </div>
                <div class="col-3">
                    <img src="images/category-2.jpg">
                </div>
                <div class="col-3">
                    <img src="images/category-3.jpg">
                </div>

            </div>
        </div>

    </div> -->
<div class="small-container">
        <h2 class="title">Latest Products</h2>
        <div class="row">
            <?php 
include("./admin/connect.php");
    include("./action.php");
    $phantrang=new action();
        $result=$phantrang->phantrang(1);
        echo $result;
        
    ?>
        </div>
    </div>
    <!-- ------------ offer -------------- -->
    <div class="offer">
        <div class="small-container">
           <?php
           $servername = "localhost";
           $username = "root";
           $password = "";
           $dbname = "cnc";
           
           // Create connection
           $conn = new mysqli($servername, $username, $password,'cnc');
           // Check connection
           if ($conn->connect_error) {
             die("Connection failed: " . $conn->connect_error);
           }
           
           $sql = "SELECT * FROM `tbl_products` order by id_product desc";
        //    echo $sql;
           $result = $conn->query($sql);
           $data="";
           if ($result->num_rows > 0) {
             // output data of each row
             if($row = $result->fetch_assoc()) {
                $data='<div class="row">
                <div class="col-2"><img src="'.'./admin/images/'.$row["image"].'" class="offer-img"> </div>
                <div class="col-2">
                    <p>Sản phẩm mới nhất</p>
                    <h1>'.$row['name'].'</h1>
                    <small>
                    Surrounded affronting favourable no mr. Lain knew like half she yet joy. Be than dull as seen very shot. Attachment ye so am travelling estimating projecting is. Off fat address attacks his besides. Suitable settling mr attended no doubtful feelings. Any over for say bore such sold five but hung

</small>
                    <a href="http://localhost/ecommerce/index.php?id='.$row['id_product'].'&action=detail" class="btn">Buy Now &#8594;</a>
                </div>
            </div>';
             }
           } else {
             echo "0 results";
           }   
            echo $data;
            ?>
            
        </div>
    </div>
    <!-- ------------ testimonial -------------- -->
   
    <!-- ------------------- brands --------------------- -->
    <div class="brands">
        <div class="small-container">
            <div class="row">
                <div class="col-5">
                    <img src="images/logo-godrej.png">
                </div>
                <div class="col-5">
                    <img src="images/logo-oppo.png">
                </div>
                <div class="col-5">
                    <img src="images/logo-coca-cola.png">
                </div>
                <div class="col-5">
                    <img src="images/logo-paypal.png">
                </div>
                <div class="col-5">
                    <img src="images/logo-philips.png">
                </div>
            </div>
        </div>
    </div>