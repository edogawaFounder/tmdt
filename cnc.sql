-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 26, 2022 lúc 12:58 PM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `cnc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_account`
--

CREATE TABLE `tbl_account` (
  `username` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `status` int(11) NOT NULL,
  `authority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_account`
--

INSERT INTO `tbl_account` (`username`, `password`, `status`, `authority`) VALUES
('admin', 'admin', 1, 0),
('haha', '123123', 1, 0),
('khanh', '123456', 1, 0),
('khoa', '123456', 1, 0),
('khuong', 'pham', 1, 1),
('ky', '123456', 1, 0),
('test@kr', 'test', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id_loai` int(11) NOT NULL,
  `ten_loai` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `category_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_category`
--

INSERT INTO `tbl_category` (`id_loai`, `ten_loai`, `category_status`) VALUES
(1, 'Áo Sơ Mi', 1),
(2, 'Áo Phông', 1),
(3, 'Áo Hoodie', 1),
(4, 'Áo Khoác', 1),
(5, 'Giày', 0),
(6, 'Quần', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_color`
--

CREATE TABLE `tbl_color` (
  `id_color` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_color`
--

INSERT INTO `tbl_color` (`id_color`, `name`) VALUES
(1, 'Red'),
(2, 'Yellow'),
(3, 'Black'),
(4, 'White'),
(5, 'Blue');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_cutomer`
--

CREATE TABLE `tbl_cutomer` (
  `id_customer` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `address` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_cutomer`
--

INSERT INTO `tbl_cutomer` (`id_customer`, `name`, `address`, `phone`, `username`) VALUES
(1, 'Hà Khang Kỳ', 'tphcm', '0368783283', 'ky'),
(2, 'Trần Đăng Khoa', 'tphcm', '0368783283', 'khoa'),
(3, 'Châu Ngoc Khanh', 'tphcm', '0368783283', 'khanh'),
(4, 'user', 'tphcm', '0356657937', 'admin'),
(5, 'trần văn a', 'hdlsdf', '0931337140', 'haha'),
(6, 'test', 'korea', '0900000000', 'test@kr');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_detail_order`
--

CREATE TABLE `tbl_detail_order` (
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `size` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `color` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total_money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_detail_order`
--

INSERT INTO `tbl_detail_order` (`id_order`, `id_product`, `size`, `color`, `quantity`, `price`, `total_money`) VALUES
(4, 13, 'S', 'White', 5, 824000, 4120000),
(5, 15, 'M', 'Blue', 5, 460000, 2300000),
(3, 16, 'S', 'Yellow', 5, 599000, 2995000),
(2, 18, 'L', 'Yellow', 1, 480000, 480000),
(6, 18, 'L', 'Yellow', 5, 480000, 2400000),
(8, 18, 'L', 'Yellow', 1, 480000, 480000),
(4, 19, 'L', 'Black', 1, 360000, 360000),
(5, 19, 'L', 'Black', 1, 360000, 360000),
(7, 19, 'L', 'Black', 2, 360000, 720000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id_order` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `ten_kh` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `id_staff` int(11) NOT NULL,
  `ngay_dat` date NOT NULL DEFAULT current_timestamp(),
  `address` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `status` int(11) NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `total_money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order`
--

INSERT INTO `tbl_order` (`id_order`, `id_customer`, `ten_kh`, `id_staff`, `ngay_dat`, `address`, `phone`, `status`, `notes`, `total_money`) VALUES
(2, 2, 'Trần Đăng Khoa', 0, '0000-00-00', 'tphcm', '0368783283', 1, 'NULL', 480000),
(3, 2, 'Trần Đăng Khoa', 0, '0000-00-00', 'tphcm', '0368783283', 1, 'NULL', 2995000),
(4, 2, 'Trần Đăng Khoa', 0, '0000-00-00', 'tphcm', '0368783283', 1, 'NULL', 4480000),
(5, 5, 'trần văn a', 0, '0000-00-00', 'hdlsdf', '0931337140', 1, 'NULL', 2660000),
(6, 5, 'trần văn a', 0, '2022-05-22', 'hdlsdf', '0931337140', 1, 'NULL', 2400000),
(7, 2, 'Trần Đăng Khoa', 0, '2022-05-22', 'tphcm', '0368783283', 1, 'NULL', 720000),
(8, 2, 'Trần Đăng Khoa', 0, '2022-05-25', 'tphcm', '0368783283', 1, 'NULL', 480000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_products`
--

CREATE TABLE `tbl_products` (
  `id_product` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `price` int(11) NOT NULL,
  `details` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `id_loai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_products`
--

INSERT INTO `tbl_products` (`id_product`, `name`, `price`, `details`, `status`, `image`, `id_loai`) VALUES
(1, 'ÁO SƠ MI NAM SKDTK100', 450000, 0, 1, 'hinhanh3.jpg', 1),
(2, 'ÁO SƠ MI NAM SKDTK101', 475000, 0, 1, 'hinhanh4.jpg', 1),
(3, 'ÁO SƠ MI NAM SKDTK102', 375000, 0, 1, 'hinhanh5(1).jpg', 1),
(4, 'ÁO SƠ MI NAM SKDTK103', 450000, 0, 1, 'hinhanh10.jpg', 1),
(5, 'ÁO SƠ MI NAM SKDTK104', 325000, 0, 1, 'hinhanh9.jpg', 1),
(6, 'ÁO PHÔNG NAM APLTK100', 450000, 0, 1, 'hinhanh18.jpg', 2),
(7, 'ÁO PHÔNG NAM APLTK101', 230000, 0, 1, 'hinhanh30.jpg', 2),
(8, 'ÁO PHÔNG NAM APLTK102', 100000, 0, 1, 'hinhanh22.jpg', 2),
(9, 'ÁO PHÔNG NAM APLTK103', 900000, 0, 1, 'themanh26(1).jpg', 2),
(10, 'ÁO PHÔNG NAM APLTK104', 350000, 0, 1, 'hinhanh31.jpg', 2),
(11, 'ÁO NỈ HOODIE NAM AHD100', 620000, 0, 1, 'hinhanh27.jpg', 3),
(12, 'ÁO NỈ HOODIE NAM AHD101', 523100, 0, 1, 'img7.jpg', 3),
(13, 'ÁO NỈ HOODIE NAM AHD102', 824000, 0, 1, 'img5(1).jpg', 3),
(14, 'ÁO NỈ HOODIE NAM AHD103', 123000, 0, 1, 'themanh54(1).jpg', 3),
(15, 'ÁO NỈ HOODIE NAM AHD104', 460000, 0, 1, 'themanh55.jpg', 3),
(16, 'ÁO KHOÁC NAM AKP100', 599000, 0, 1, 'hinhanh33.jpg', 4),
(17, 'ÁO KHOÁC NAM AKP101', 399000, 0, 1, 'themanh49.jpg', 4),
(18, 'ÁO KHOÁC NAM AKP102', 480000, 0, 1, 'img10.jpg', 4),
(19, 'ÁO KHOÁC NAM AKP103', 360000, 0, 1, 'themanh53.jpg', 4),
(21, 'Quần sinh bút chì', 500000, 0, 1, 'tải xuống (1).jpg', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product_size_color`
--

CREATE TABLE `tbl_product_size_color` (
  `id_product` int(11) NOT NULL,
  `id_size` int(11) NOT NULL,
  `id_color` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_product_size_color`
--

INSERT INTO `tbl_product_size_color` (`id_product`, `id_size`, `id_color`, `quantity`) VALUES
(1, 1, 1, 19),
(1, 2, 1, 20),
(1, 1, 2, 20),
(1, 2, 2, 20),
(2, 1, 1, 20),
(2, 2, 1, 20),
(2, 1, 2, 20),
(2, 2, 2, 20),
(3, 1, 1, 20),
(3, 2, 1, 20),
(3, 1, 2, 20),
(3, 2, 2, 20),
(4, 1, 1, 20),
(4, 2, 1, 20),
(4, 1, 2, 20),
(4, 2, 2, 20),
(5, 1, 1, 20),
(5, 2, 1, 20),
(5, 1, 2, 20),
(5, 2, 2, 20),
(6, 1, 1, 20),
(6, 2, 1, 20),
(6, 1, 2, 20),
(6, 2, 2, 20),
(7, 1, 1, 20),
(7, 2, 1, 20),
(7, 1, 2, 20),
(7, 2, 2, 20),
(8, 1, 1, 20),
(8, 2, 1, 20),
(8, 1, 2, 20),
(8, 2, 2, 20),
(9, 3, 2, 20),
(10, 4, 2, 20),
(11, 1, 1, 20),
(12, 1, 5, 20),
(13, 1, 4, 15),
(14, 4, 1, 20),
(15, 2, 5, 15),
(16, 1, 2, 15),
(17, 3, 4, 20),
(18, 3, 2, 13),
(19, 3, 3, 16),
(21, 2, 2, 600000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_size`
--

CREATE TABLE `tbl_size` (
  `id_size` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_size`
--

INSERT INTO `tbl_size` (`id_size`, `name`) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L'),
(4, 'XL');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_staff`
--

CREATE TABLE `tbl_staff` (
  `id_staff` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `address` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_staff`
--

INSERT INTO `tbl_staff` (`id_staff`, `name`, `address`, `phone`, `username`) VALUES
(1, 'Phạm Duy Khương', 'Hà Nội', '0356657937', 'khuong');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id_loai`);

--
-- Chỉ mục cho bảng `tbl_color`
--
ALTER TABLE `tbl_color`
  ADD PRIMARY KEY (`id_color`);

--
-- Chỉ mục cho bảng `tbl_cutomer`
--
ALTER TABLE `tbl_cutomer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Chỉ mục cho bảng `tbl_detail_order`
--
ALTER TABLE `tbl_detail_order`
  ADD PRIMARY KEY (`id_product`,`id_order`,`size`,`color`) USING BTREE;

--
-- Chỉ mục cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id_order`);

--
-- Chỉ mục cho bảng `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`id_product`);

--
-- Chỉ mục cho bảng `tbl_product_size_color`
--
ALTER TABLE `tbl_product_size_color`
  ADD PRIMARY KEY (`id_product`,`id_color`,`id_size`) USING BTREE;

--
-- Chỉ mục cho bảng `tbl_size`
--
ALTER TABLE `tbl_size`
  ADD PRIMARY KEY (`id_size`);

--
-- Chỉ mục cho bảng `tbl_staff`
--
ALTER TABLE `tbl_staff`
  ADD PRIMARY KEY (`id_staff`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id_loai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `tbl_color`
--
ALTER TABLE `tbl_color`
  MODIFY `id_color` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbl_cutomer`
--
ALTER TABLE `tbl_cutomer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `tbl_size`
--
ALTER TABLE `tbl_size`
  MODIFY `id_size` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `tbl_staff`
--
ALTER TABLE `tbl_staff`
  MODIFY `id_staff` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
