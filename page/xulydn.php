<?php
include("../admin/connect.php");
session_start();
    if(isset($_POST["username"]) && isset($_POST['password'])){
        $user=$_POST["username"];
        $pass=$_POST["password"];
        $result=mysqli_query($connect,"SELECT * FROM `tbl_account` WHERE username='$user'");
        if(mysqli_num_rows($result)>0){
            $row=mysqli_fetch_assoc($result);
            if($row['password']==$pass){
                if($row['status']==1){
                    if($row['authority']==0){
                        $result1=mysqli_query($connect,"SELECT * FROM `tbl_cutomer` WHERE username='$user'");
                        $row1=mysqli_fetch_assoc($result1);
                        if(mysqli_num_rows($result1)>0){
                        $_SESSION["dadangnhap"]="true";
                        $_SESSION["id_customer"]=$row1["id_customer"];
                        $_SESSION["name_cus"]=$row1["name"];
                        $_SESSION["address_cus"]=$row1["address"];
                        $_SESSION["phone_cus"]=$row1["phone"];
                        echo "1";
                        header("location:../index.php");
                        }
                    }
                    else{
                        $result1=mysqli_query($connect,"SELECT * FROM `tbl_staff` WHERE username='$user'");
                        $row1=mysqli_fetch_assoc($result1);
                        if(mysqli_num_rows($result1)>0){
                        //$_SESSION["dadangnhap"]="true";
                        $_SESSION["id_staff"]=$row1["id_staff"];
                        $_SESSION["name_staff"]=$row1["name"];
                        $_SESSION["address"]=$row1["address"];
                        $_SESSION["phone"]=$row1["phone"];
                        echo "2";
                        header("location:../admin/index.php");
                        }
                    }
                }
                else{
                    echo "Tài khoản bị khóa";
                }
            }
            else{
                echo "Đăng nhập thất bại";
            }
        }
        else{    
            echo "Đăng nhập thất bại";
        }
    }












    
        
            
                
                    
               
       
    
    
    //session_destroy();


?>