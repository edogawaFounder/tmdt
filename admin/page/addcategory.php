
<?php include("action.php");
$page=new action();
    
$trang=$page->total_page();
?>
<div class="container-fluid">

<!-- Breadcrumbs-->
<ol class="breadcrumb">
  <li class="breadcrumb-item">
    <a href="#">Dashboard</a>
  </li>
  <li class="breadcrumb-item active">Thêm loại</li>
  <!-- <li class="breadcrumb-item active">Xóa loại</li> -->
</ol>

<!-- Area Chart Example-->
<div>
    <form action="index.php?action=category" method="post">
        <input placeholder="Nhập tên loại.." class="form-control" name="category">
        <button type="submit" class="btn btn-primary">Lưu</button>
    </form>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>    