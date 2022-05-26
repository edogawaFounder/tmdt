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
        <li class="breadcrumb-item active">Quản lý sản phẩm</li>
    </ol>

    <!-- Area Chart Example-->
    <div class="card mb-3">
        <div>
            <canvas id="myChart"></canvas>
        </div>

    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
    
    $sql = "SELECT ngay_dat,SUM(total_money) as sum FROM `tbl_order` WHERE ngay_dat >= LAST_DAY(CURRENT_DATE) + INTERVAL 1 DAY - INTERVAL 1 MONTH
    AND ngay_dat< LAST_DAY(CURRENT_DATE) + INTERVAL 1 DAY GROUP BY ngay_dat ";
    $result = $conn->query($sql);
    $data=[];
    for($i=1;$i<31;$i++){
        $data[$i]=0;
    }
    // $data['total']=[];
    if ($result->num_rows > 0) {
      // output data of each row
      while($row = $result->fetch_assoc()) {
        echo $row["ngay_dat"]. ": " . $row["sum"]. "<br>";
        $data[(int)$row['ngay_dat'][8]/1*10+$row['ngay_dat'][9]/1]=$row['sum'];
      }
    //   var_dump($data);
      echo '<script>
      var test='.json_encode($data).'
      </script>';
    } else {
      echo "0 results";
    }
    $conn->close();
    ?>
    <script>
        // test=JSON.parse(test);
        let labels=[];
        // for(let i=1;i<31;i++){
        //     labels.push(i);
        // }
        console.log(labels);

        const data = {
            labels: labels,
            datasets: [{
                label: 'Doanh thu theo ngày',
                backgroundColor: 'rgb(255, 99, 132)',
                borderColor: 'rgb(255, 99, 132)',
                data: test,
            }]
        };

        const config = {
            type: 'line',
            data: data,
            options: {}
        };
        // <script>
  const myChart = new Chart(
    document.getElementById('myChart'),
    config
  );
</script>

    </script>

    <script>