<?php include("action.php");
$page = new action();

$trang = $page->total_page();
?>
<div class="container-fluid">

    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Quản lý loại</li>
    </ol>

    <!-- Area Chart Example-->
    <div class="card mb-3">
        <div class="card-header">
            <i class="fas fa-users-cog"></i>
            Bruh
        </div>
        <div class="card-body">

            <button id="btnAdd"><a href="index.php?action=addCategory">Thêm loại</a></button>
            <!-- <button id="btnAdd"><a href="index.php?action=selection&act=sua">Sửa loại</a></button> -->
            <select id="sort" onchange="sortChanged(this)" style="position:absolute;right:0;border:2px lightgrey solid;">
                <option value="">Sort by...</option>
                <option value="sort_increase">Sort by name (increase)</option>
                <option value="sort_decrease">Sort by name (decrease)</option>
            </select>
            <BR></BR>
            <table class="table" tabindex="1">

                <tr>
                    <th>Tên</th>
                    <th>Tình trạng</th>
                </tr>
                <tbody id="sanpham">
                    <?php
                    $servername = "localhost";
                    $username = "root";
                    $password = "";
                    $dbname = "cnc";

                    // Create connection
                    $conn = new mysqli($servername, $username, $password, $dbname);
                    // Check connection
                    if ($conn->connect_error) {
                        die("Connection failed: " . $conn->connect_error);
                    }
                    if (isset($_POST['category'])) {
                        $sql = "INSERT INTO `tbl_category`(`ten_loai`) VALUES ('" . $_POST['category'] . "')";
                        $result = $conn->query($sql);
                    }

                    if (isset($_POST['category_id'])) {
                        $sql = "UPDATE `tbl_category` SET `category_status`='0' WHERE id_loai=".$_POST['category_id'];
                        $result = $conn->query($sql);
                    }

                    $sql = "SELECT * FROM `tbl_category` WHERE category_status=1";
                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        // output data of each row
                        while ($row = $result->fetch_assoc()) {
                            echo '
                            <tr>
                    <td>' . $row["ten_loai"] . '</td>
                    <td><form action=index.php?action=category method="post"><input value="'.$row['id_loai'].'" name="category_id" type="hidden"><button type="submit" class="btn btn-primary">Xóa</button></form></td>
                </tr>';
                        }
                    } else {
                        echo "0 results";
                    }
                    ?>
                </tbody>


            </table>
            </section>


        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>