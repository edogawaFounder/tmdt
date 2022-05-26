<?php 
    
?>

<table  >
    <tr style="background:#CCFFFF;height:40px;" >
        <td width="100px" ><b>STT</b></td>
        <td width="100px" ><b>Mã hóa đơn</b></td>
        <td width="250px" ><b>Ngày lập</b></td>
        <td width="200px" ><b>Tổng Tiền</b></td>
        <td width="200px" ><b>Chi tiết đơn hàng</b></td>
        <td width="200px" ><b>Tình trạng đơn hàng</b></td>
        <td width="200px" ><b>Xóa</b></td>
    </tr>
     <?php
         include("./admin/connect.php"); 
        $dem=0;
        $id=$_SESSION['id_customer'];
         $sql="SELECT * FROM `tbl_order` WHERE id_customer='$id'";
         $result=mysqli_query($connect,$sql);
         while($row=mysqli_fetch_array($result)){ ?>
     <tr  >
             <td><?=$dem++?></td>
            <td><?=$row['id_order']?></td>
            <td><?= date('d/m/Y H:i')?></td>
           <td><?=$row['total_money']?></td>
           <td><a href="index.php?action=ctdh&mahd=<?=$row['id_order']?>">Chi tiết đơn hàng</a></td>
           <?php if($row['status']==0){ ?>
           <td>Chưa được xử lý</td>
           <?php } else{ ?>
            <td>Đã được xử lý</td>
            <?php } ?>
            <td><button onclick="xoa(<?=$row['id_order']?>,<?=$row['status']?>)" id="xoa">Hủy</button></td>
            
    </tr>   
        <?php  } ?>     
        </table>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

    function xoa(id,status){
        if(status==0){
        var check=confirm("Ban co muon huy hay khong");
        $.ajax({
            type:"get",
            url:"./page/xoadh.php",
            data:{id:id,status:status,check:check},
            success:function(data){
                alert(data);
               location.reload();
                // if(){
                //     $("span").html("hi");
                // }
            }
        })
        }
        else{
            $.ajax({
            type:"get",
            url:"./page/xoadh.php",
            data:{id:id,status:status},
            success:function(data){
                alert(data);
               location.reload();
                // if(){
                //     $("span").html("hi");
                // }
            }
        })
        }
        
    }
  
</script>