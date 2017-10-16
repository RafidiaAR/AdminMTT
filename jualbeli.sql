-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 16 Okt 2017 pada 09.34
-- Versi Server: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jualbeli`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `app_version`
--

CREATE TABLE `app_version` (
  `id` bigint(20) NOT NULL,
  `version_code` int(11) NOT NULL,
  `version_name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `app_version`
--

INSERT INTO `app_version` (`id`, `version_code`, `version_name`, `active`, `created_at`, `last_update`) VALUES
(13, 13, '13', 1, 1485795799112, 1485795799112);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bill`
--

CREATE TABLE `bill` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `merchant_name` varchar(30) NOT NULL,
  `merchant_phone` varchar(20) NOT NULL,
  `merchant_email` varchar(40) NOT NULL,
  `status` varchar(50) NOT NULL,
  `feedback` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  `price_item` decimal(12,2) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bill`
--

INSERT INTO `bill` (`id`, `order_id`, `product_id`, `product_name`, `merchant_id`, `merchant_name`, `merchant_phone`, `merchant_email`, `status`, `feedback`, `amount`, `price_item`, `created_at`, `last_update`) VALUES
(3, 1, 8, 'Gorengan Bakwan,Tahu (MTT)', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', 'Belum Ditagihkan', '', 1, '1000.00', 1507016580, 1507016580);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id_cart` int(5) NOT NULL,
  `id_user` int(5) DEFAULT NULL,
  `id_merchant` int(5) DEFAULT NULL,
  `product_id` int(5) DEFAULT NULL,
  `value` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id_cart`, `id_user`, `id_merchant`, `product_id`, `value`) VALUES
(58, 127, 5, 53, 4),
(59, 127, 25, 56, 3),
(169, 127, 5, 8, 1),
(174, 1, 5, 5, 6),
(175, 1, 5, 4, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `brief` varchar(100) NOT NULL,
  `color` varchar(7) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `name`, `type`, `icon`, `draft`, `brief`, `color`, `priority`, `created_at`, `last_update`) VALUES
(11, 'Delivery Order TSO', 1, 'Delivery Order Kafetaria TSO.png', 0, 'Pesanan mudah dan cepat Kafetaria TSO lt.11\nPemesanan dilayani jam 09.00 - 11.00 & 14.00 - 16.00', '#66dd6a', 2, 1495150893458, 1495854002700),
(12, 'Herbal', 0, 'Herbal.png', 0, 'Tersedia kurma dan herbal untuk menyambut ramadhan', '#579fda', 3, 1495151016598, 1495336344346),
(13, 'Kue & Cemilan ', 0, 'Snack dan Minuman.png', 0, 'Menyambut santap buka puasa dan kue-kue lebaran', '#dddc0b', 1, 1495152413661, 1495680116235),
(14, 'Perlengkapan', 0, 'Perlengkapan Kerja  Lainnya.png', 0, 'Perlengkapan kerja dan rumah tangga', '#4db1a9', 4, 1495152557687, 1495855524709),
(15, 'Fashion', 0, 'Fashion.png', 0, 'Koleksi baju menarik untuk kamu dan keluarga', '#ff5c5c', 5, 1495152819006, 1497454635749),
(16, 'Properti', 0, 'Property.png', 0, 'Investasi properti untuk kamu', '#4db151', 6, 1495152929269, 1495152929269),
(17, 'Buku', 0, 'Buku.png', 0, 'Tambah wawasan dengan membaca buku', '#7fc600', 8, 1495153021937, 1495793566794),
(18, 'Travel dan Umroh', 0, 'Travel.png', 0, 'Umroh Bersama MTT', '#ff4747', 10, 1495153115031, 1495793491164),
(19, 'Otomotif', 0, 'Otomotif.png', 0, 'Dapatkan kendaraan layak pakai dengan harga terjangkau', '#269cff', 7, 1495677476934, 1495855786766),
(20, 'Usaha Jasa', 0, 'Usaha Jasa.png', 0, 'Berbagai Jenis Usaha Jasa', '#4db151', 3, 1495793261212, 1495793403906),
(21, 'Kerajinan', 0, 'Kerajinan.png', 0, 'Hasil Kerajinan , Produk Kreatif', '#ff5294', 9, 1496199771596, 1497454121297),
(22, 'Lainnya', 0, 'Hobi.png', 0, 'Aneka kebutuhan lainnya', '#4db151', 4, 1497454671645, 1497454671645);

-- --------------------------------------------------------

--
-- Struktur dari tabel `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `msg` text,
  `created_at` bigint(20) DEFAULT NULL,
  `status` smallint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `chat`
--

INSERT INTO `chat` (`id`, `from_id`, `to_id`, `msg`, `created_at`, `status`) VALUES
(1, 160, 77, 'ORDER ID:RO25857GO\nNama:nurul\nPhone:8118003585\nKirim:testing abaikan\nTgl Kirim:07/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:2000\nTotal:44000\nNote:testing admin abaikan\n========ITEM========\nProduk:jus jeruk vip\nHarga:15000\nJumlah:1\nMctName:Juicefriend\nMctPhone:0811101696\n------------------------------\nProduk:Bubur Kuningan\nHarga:17000\nJumlah:1\nMctName:BuburKuningan\nMctPhone:081296363064\n------------------------------\nProduk:Indomie Telor (MTT)\nHarga:10000\nJumlah:1\nMctName:admin\nMctPhone:6281285688212\n------------------------------', 1504745734184, 0),
(2, 160, 5, 'Kode Order : RO25857GO\nTotal : 44000.0\nApakah order sudah dibayar ?', 1504745774981, 2),
(3, 160, 5, 'Kode Order : RO25857GO\nTotal : 44000.0', 1504745784808, 2),
(4, 160, 5, 'Kode Order : RO25857GO\nTotal : 44000.0\nApakah order sudah dibayar ?', 1504745794297, 2),
(5, 160, 5, 'ORDER ID:DC21597OY\nNama:nurul\nPhone:8118003585\nKirim:test\nTgl Kirim:07/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:0\nTotal:19000\nNote:testing\n========ITEM========\nProduk:Nasi Pecel Madiun (MTT)\nHarga:19000\nJumlah:1\nMctName:admin\nMctPhone:6281285688212\n------------------------------', 1504746802495, 0),
(6, 161, 5, 'ORDER ID:UD51226QT\nNama:fredy\nPhone:811987802\nKirim:Lt 8 TSO\nTgl Kirim:07/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:0\nTotal:105000\nNote:\n========ITEM========\nProduk:Madu Super Liar Al Amin\nHarga:105000\nJumlah:1\nMctName:admin\nMctPhone:6281285688212\n------------------------------', 1504763190824, 0),
(7, 161, 5, 'ORDER ID:VG87084IO\nNama:fredy\nPhone:811987802\nKirim:TSO LT 8\nTgl Kirim:08/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:0\nTotal:105000\nNote:\n========ITEM========\nProduk:Madu Super Liar Al Amin\nHarga:105000\nJumlah:1\nMctName:admin\nMctPhone:6281285688212\n------------------------------', 1504790334730, 0),
(8, 161, 5, 'ORDER ID:ZQ20496LK\nNama:fredy\nPhone:811987802\nKirim:TSO LT 8\nTgl Kirim:08/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:0\nTotal:105000\nNote:\n========ITEM========\nProduk:Madu Super Liar Al Amin\nHarga:105000\nJumlah:1\nMctName:admin\nMctPhone:6281285688212\n------------------------------', 1504790687383, 0),
(9, 177, 21, 'ORDER ID:WT48701LN\nNama:ikarahma\nPhone:8111006456\nKirim:TSO Lantai 16\nTgl Kirim:12/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:0\nTotal:17000\nNote:\n========ITEM========\nProduk:Bubur Kuningan\nHarga:17000\nJumlah:1\nMctName:BuburKuningan\nMctPhone:081296363064\n------------------------------', 1505183661135, 0),
(10, 177, 5, 'Kode Order : WT48701LN\nTotal : 17000.0\nApakah order sudah dibayar ?', 1505183842111, 2),
(11, 177, 5, 'sudah', 1505183851314, 0),
(12, 184, 77, 'ORDER ID:HL00812AG\nNama:saefulrohman\nPhone:87717216986\nKirim:Graha XL Mega Kuningan Jakarta Selatan \nTgl Kirim:14/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:0\nTotal:26650000\nNote:Test\n========ITEM========\nProduk:Aneka Buah Potong\nHarga:25000\nJumlah:2\nMctName:Juicefriend\nMctPhone:0811101696\n------------------------------\nProduk:Umroh Bersama MTT\nHarga:26000000\nJumlah:1\nMctName:admin\nMctPhone:6281285688212\n------------------------------\nProduk:Gorengan Bakwan,Tahu (MTT)\nHarga:3000\nJumlah:1\nMctName:admin\nMctPhone:6281285688212\n------------------------------\nProduk:Sepatu anak lucu UB001\nHarga:120000\nJumlah:1\nMctName:Lilysportswear\nMctPhone:081291673067\n------------------------------\nProduk:Sepatu anak Adidas Yeezy boost LED\nHarga:320000\nJumlah:1\nMctName:Lilysportswear\nMctPhone:081291673067\n------------------------------\nProduk:Nasi Tengkleng\nHarga:35000\nJumlah:3\nMctName:\nMctPhone:\n------------------------------\nProduk:Nasi Ayam Komplit (MTT)\nHarga:26000\nJumlah:2\nMctName:admin\nMctPhone:6281285688212\n------------------------------', 1505298921188, 0),
(13, 184, 5, 'Kode Order : HL00812AG\nTotal : 2.665E7\nApakah order sudah dibayar ?', 1505299002964, 2),
(14, 184, 5, 'Kode Order : HL00812AG\nTotal : 2.665E7\nApakah order sudah dibayar ?', 1505299011301, 2),
(15, 184, 5, 'Belum, gak ada tcas', 1505299019199, 0),
(16, 187, 5, 'ORDER ID:GI05830AD\nNama:kardi\nPhone:811100677\nKirim:TSO lt.16\nTgl Kirim:14/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:2000\nTotal:20000\nNote:3 mendoan Dan 3 bakwan\n========ITEM========\nProduk:Gorengan Bakwan,Tahu (MTT)\nHarga:3000\nJumlah:6\nMctName:admin\nMctPhone:6281285688212\n------------------------------', 1505357100645, 2),
(17, 187, 5, 'Kode Order : GI05830AD\nTotal : 20000.0\nApakah order sudah dibayar ?', 1505358809699, 2),
(18, 187, 5, 'bagaimana dengan pesanan saya ini?', 1505358828373, 2),
(19, 187, 5, 'Kode Order : GI05830AD\nTotal : 20000.0\nApakah order sudah dibayar ?', 1505358901172, 2),
(20, 187, 5, 'maaf, dengan Bapak siapa\n?', 1505358920324, 2),
(21, 187, 5, 'saya lagi tes pesanan Dan tes fitur chatt nya', 1505358950053, 2),
(22, 187, 5, 'Kode Order : GI05830AD\nTotal : 20000.0\nApakah order sudah dibayar ?', 1505359440395, 2),
(23, 187, 5, 'Kode Order : GI05830AD\nTotal : 20000.0\nApakah order sudah dibayar ?', 1505359470810, 2),
(24, 189, 5, 'ORDER ID:PC77893XK\nNama:rochmansb\nPhone:8119510106\nKirim:lantai 15 ( ruang vendor MII )\nTgl Kirim:14/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:2000\nTotal:20000\nNote:gorenganya campur bakwan dan tempe\n========ITEM========\nProduk:Gorengan Bakwan,Tahu (MTT)\nHarga:3000\nJumlah:6\nMctName:admin\nMctPhone:6281285688212\n------------------------------', 1505373584288, 2),
(25, 189, 5, 'Kode Order : PC77893XK\nTotal : 20000.0', 1505373633797, 2),
(26, 189, 5, 'Kode Order : PC77893XK\nTotal : 20000.0\nApakah order sudah dibayar ?', 1505373655324, 2),
(27, 189, 5, 'maaf saat mau bayar kok totalnya sampai 400ribu ya ?', 1505373678998, 2),
(28, 189, 5, 'Kode Order : PC77893XK\nTotal : 20000.0', 1505373788741, 2),
(29, 160, 5, 'ORDER ID:MX74238AA\nNama:nurul\nPhone:8118003585\nKirim:test\nTgl Kirim:14/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:0\nTotal:19000\nNote:testing\n========ITEM========\nProduk:Nasi Pecel Madiun (MTT)\nHarga:19000\nJumlah:1\nMctName:admin\nMctPhone:6281285688212\n------------------------------', 1505433035924, 0),
(30, 160, 5, 'ORDER ID:LN83336KZ\nNama:nurul\nPhone:8118003585\nKirim:test\nTgl Kirim:14/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:0\nTotal:19000\nNote:test\n========ITEM========\nProduk:Nasi Pecel Madiun (MTT)\nHarga:19000\nJumlah:1\nMctName:admin\nMctPhone:6281285688212\n------------------------------', 1505433093712, 0),
(31, 160, 21, 'ORDER ID:GY73212NN\nNama:nurul\nPhone:8118003585\nKirim:test\nTgl Kirim:14/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:0\nTotal:16000\nNote:test\n========ITEM========\nProduk:Batagor\nHarga:16000\nJumlah:1\nMctName:BuburKuningan\nMctPhone:081296363064\n------------------------------', 1505433247392, 0),
(32, 160, 21, 'ORDER ID:FF81276LQ\nNama:nurul\nPhone:8118003585\nKirim:test\nTgl Kirim:15/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:0\nTotal:16000\nNote:test\n========ITEM========\nProduk:Batagor\nHarga:16000\nJumlah:1\nMctName:BuburKuningan\nMctPhone:081296363064\n------------------------------', 1505435828321, 0),
(33, 187, 5, 'ORDER ID:LU10671FG\nNama:kardi\nPhone:811100677\nKirim:TSO lt.16\nTgl Kirim:15/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:2000\nTotal:20000\nNote:\n========ITEM========\nProduk:Gorengan Bakwan,Tahu (MTT)\nHarga:3000\nJumlah:6\nMctName:admin\nMctPhone:6281285688212\n------------------------------', 1505443653433, 0),
(34, 104, 77, 'ORDER ID:DJ49341QN\nNama:dyka\nPhone:8111193932\nKirim:lantai 9\nTgl Kirim:18/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:0\nTotal:20000\nNote:buat pak dyka\n========ITEM========\nProduk:Salad Buah\nHarga:20000\nJumlah:1\nMctName:Juicefriend\nMctPhone:0811101696\n------------------------------', 1505623821597, 0),
(35, 104, 5, 'Kode Order : DJ49341QN\nTotal : 20000.0\nApakah order sudah dibayar ?', 1505623995106, 2),
(36, 104, 5, 'sudah', 1505624007926, 2),
(37, 104, 5, 'Kode Order : DJ49341QN\nTotal : 20000.0', 1505624053476, 2),
(38, 104, 5, 'Kode Order : DJ49341QN\nTotal : 20000.0\nApakah order sudah dibayar ?', 1505624076367, 2),
(39, 208, 43, 'Item : Sarung Murah\nHarga : 35000.0', 1505848700724, 2),
(40, 208, 156, 'Item : Sepatu anak lucu UB001\nHarga : 120000.0', 1505848933203, 2),
(41, 113, 5, 'ORDER ID:PL58753QW\nNama:Indah\nPhone:85288493094\nKirim:indah mtt lt 9\nTgl Kirim:20/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:0\nTotal:24000\nNote:mi rebus\n========ITEM========\nProduk:Gorengan Bakwan,Tahu (MTT)\nHarga:3000\nJumlah:3\nMctName:admin\nMctPhone:6281285688212\n------------------------------\nProduk:Indomie Telor Plus sosis, nugget, keju (MTT)\nHarga:15000\nJumlah:1\nMctName:admin\nMctPhone:6281285688212\n------------------------------', 1505890061888, 2),
(42, 113, 5, 'Kode Order : PL58753QW\nTotal : 24000.0\nApakah order sudah dibayar ?', 1505894354110, 2),
(43, 113, 5, 'sudah di bayar via tcash. namun ada item order yg habis. jd sy hanya menerima yg mi rebus', 1505894428236, 0),
(44, 211, 5, 'ORDER ID:MP33617TQ\nNama:rafidiaaqil\nPhone:81333978900\nKirim:Telkomsel Smart Office Lt. 9\nTgl Kirim:22/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:0\nTotal:172000\nNote:MTT\n========ITEM========\nProduk:Kurma Golden Dates 1 Kg (Sayer)\nHarga:52000\nJumlah:1\nMctName:admin\nMctPhone:6281285688212\n------------------------------\nProduk:Kurma Dattes 1 Kg (Khalas)\nHarga:60000\nJumlah:1\nMctName:admin\nMctPhone:6281285688212\n------------------------------\nProduk:Habatussauda\nHarga:60000\nJumlah:1\nMctName:admin\nMctPhone:6281285688212\n------------------------------', 1505907709076, 2),
(45, 218, 5, 'Item : Minyak Habbatussauda\nHarga : 75000.0', 1505992589346, 2),
(46, 218, 5, 'aslkm wr wb. kapan ready stocknya?', 1505992617408, 0),
(47, 113, 5, 'ORDER ID:EV84752HR\nNama:Indah\nPhone:85288493094\nKirim:mtt lantai 9\nTgl Kirim:22/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:0\nTotal:53000\nNote:bubur tanpa kecap\n========ITEM========\nProduk:Gorengan Bakwan,Tahu (MTT)\nHarga:3000\nJumlah:2\nMctName:admin\nMctPhone:6281285688212\n------------------------------\nProduk:Mangga Harum Manis Potong\nHarga:30000\nJumlah:1\nMctName:Juicefriend\nMctPhone:0811101696\n------------------------------\nProduk:Bubur Kuningan\nHarga:17000\nJumlah:1\nMctName:BuburKuningan\nMctPhone:081296363064\n------------------------------', 1506047803838, 0),
(48, 238, 138, 'Item : Saringan Khusus Artemia\nHarga : 15000.0', 1506386965539, 2),
(49, 238, 138, 'bisa pesan 1', 1506386981625, 0),
(50, 67, 5, 'Item : DIJUAL Honda CRV 2013\nHarga : 2.6E8', 1506420985667, 2),
(51, 246, 23, 'Item : Sepatu Vibram Fivefingers for women\nHarga : 0.0', 1506529488254, 2),
(52, 211, 212, 'ORDER ID:BL17651UM\nNama:rafidiaaqil\nPhone:81333978900\nKirim:TSO Lt 9\nTgl Kirim:29/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:0\nTotal:899000\nNote:\n========ITEM========\nProduk:Sepatu Running Nike\nHarga:899000\nJumlah:1\nMctName:yusronzain\nMctPhone:082251461910\n------------------------------', 1506573944219, 2),
(53, 212, 211, 'Kode Order : BL17651UM\nTotal : 899000.0', 1506574055849, 2),
(54, 212, 211, 'segera dikirim', 1506574064777, 2),
(55, 211, 5, 'Kode Order : MP33617TQ\nTotal : 172000.0\nApakah order sudah dibayar ?', 1506583960038, 2),
(56, 211, 5, 'Kode Order : BL17651UM\nTotal : 899000.0', 1506584444811, 2),
(57, 211, 5, 'Kode Order : BL17651UM\nTotal : 899000.0', 1506584457997, 2),
(58, 250, 212, 'Item : Sepatu Running Nike\nHarga : 899000.0', 1506596028480, 2),
(59, 254, 5, 'ORDER ID:DV41958FL\nNama:gatot\nPhone:811139193\nKirim:tso lt 2, ruang SEPAKAT\nTgl Kirim:29/09/2017\nBayar:T-Cash\nDelivery:0\nInfaq:0\nTotal:78000\nNote:\n========ITEM========\nProduk:Nasi Ayam Komplit (MTT)\nHarga:26000\nJumlah:3\nMctName:admin\nMctPhone:6281285688212\n------------------------------', 1506666601164, 2),
(60, 254, 5, 'Kode Order : DV41958FL\nTotal : 78000.0', 1506666618177, 2),
(61, 254, 5, 'paha 2 dada 1', 1506666650747, 2),
(62, 254, 5, 'Kode Order : DV41958FL\nTotal : 78000.0\nApakah order sudah dibayar ?', 1506666657372, 2),
(63, 254, 5, 'belum', 1506666669043, 2),
(64, 254, 5, 'Kode Order : DV41958FL\nTotal : 78000.0\nApakah order sudah dibayar ?', 1506666706783, 2),
(65, 254, 5, 'barusan sdh bayar', 1506666718643, 2),
(66, 254, 5, 'Kode Order : DV41958FL\nTotal : 78000.0\nApakah order sudah dibayar ?', 1506667273157, 2),
(67, 254, 5, 'Kode Order : DV41958FL\nTotal : 78000.0', 1506667297958, 2),
(68, 254, 5, 'Kode Order : DV41958FL\nTotal : 78000.0\nApakah order sudah dibayar ?', 1506667323039, 2),
(69, 254, 5, '29/09/2017 13:31:36 telah mengirim TCASH ke WaroengMTT  . /6281211110677 sebesar Rp 78,000 berhasil dgn no. Ref: 4IT52C71DP. Saldo Anda Rp 124,964. Info *800#', 1506667329261, 2),
(70, 254, 5, 'Kode Order : DV41958FL\nTotal : 78000.0', 1506667344539, 2),
(71, 262, 5, 'Item : Dijual Nissan All New Grand Livina SV Matic 2014\nHarga : 1.32E8', 1506880005955, 2),
(72, 262, 5, 'bisa nego', 1506880014091, 0),
(73, 267, 21, 'ORDER ID:CG70235RT\nNama:arifput\nPhone:8111700997\nKirim:TSO Lt. 19\nTgl Kirim:02/10/2017\nBayar:T-Cash\nDelivery:0\nInfaq:3000\nTotal:20000\nNote:\n========ITEM========\nProduk:Bubur Kuningan\nHarga:17000\nJumlah:1\nMctName:BuburKuningan\nMctPhone:081296363064\n------------------------------', 1506910564748, 0),
(74, 267, 5, 'Kode Order : CG70235RT\nTotal : 20000.0', 1506910611333, 2),
(75, 267, 5, 'Mas, saya order bubur ya', 1506910628942, 2),
(76, 267, 5, 'saya bayar pakai TCASH, nanti kalau pas sudah dianter', 1506910666623, 2),
(77, 267, 5, 'Kode Order : CG70235RT\nTotal : 20000.0\nApakah order sudah dibayar ?', 1506910672385, 2),
(78, 267, 5, 'Kode Order : CG70235RT\nTotal : 20000.0', 1506911089800, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `config`
--

CREATE TABLE `config` (
  `code` varchar(50) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `config`
--

INSERT INTO `config` (`code`, `value`) VALUES
('CURRENCY', 'IDR'),
('FEATURED_NEWS', '10'),
('FEE_DELIVERY', '1000'),
('FEE_MERCHANT', '0'),
('PHONE', '6281285688212'),
('SHIPPING', '["T-Cash"]'),
('SLIDE1', 'label.png'),
('SLIDE2', 'IMG-20170901-WA00071.jpg'),
('SLIDE3', 'sedekah.jpg'),
('TAX', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `currency`
--

CREATE TABLE `currency` (
  `id` bigint(20) NOT NULL,
  `code` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `currency`
--

INSERT INTO `currency` (`id`, `code`, `name`) VALUES
(1, 'AFA', 'Afghanistan afghani'),
(2, 'ALL', 'Albanian lek'),
(3, 'DZD', 'Algerian dinar'),
(4, 'AOR', 'Angolan kwanza reajustado'),
(5, 'ARS', 'Argentine peso'),
(6, 'AMD', 'Armenian dram'),
(7, 'AWG', 'Aruban guilder'),
(8, 'AUD', 'Australian dollar'),
(9, 'AZN', 'Azerbaijanian new manat'),
(10, 'BSD', 'Bahamian dollar'),
(11, 'BHD', 'Bahraini dinar'),
(12, 'BDT', 'Bangladeshi taka'),
(13, 'BBD', 'Barbados dollar'),
(14, 'BYN', 'Belarusian ruble'),
(15, 'BZD', 'Belize dollar'),
(16, 'BMD', 'Bermudian dollar'),
(17, 'BTN', 'Bhutan ngultrum'),
(18, 'BOB', 'Bolivian boliviano'),
(19, 'BWP', 'Botswana pula'),
(20, 'BRL', 'Brazilian real'),
(21, 'GBP', 'British pound'),
(22, 'BND', 'Brunei dollar'),
(23, 'BGN', 'Bulgarian lev'),
(24, 'BIF', 'Burundi franc'),
(25, 'KHR', 'Cambodian riel'),
(26, 'CAD', 'Canadian dollar'),
(27, 'CVE', 'Cape Verde escudo'),
(28, 'KYD', 'Cayman Islands dollar'),
(29, 'XOF', 'CFA franc BCEAO'),
(30, 'XAF', 'CFA franc BEAC'),
(31, 'XPF', 'CFP franc'),
(32, 'CLP', 'Chilean peso'),
(33, 'CNY', 'Chinese yuan renminbi'),
(34, 'COP', 'Colombian peso'),
(35, 'KMF', 'Comoros franc'),
(36, 'CDF', 'Congolese franc'),
(37, 'CRC', 'Costa Rican colon'),
(38, 'HRK', 'Croatian kuna'),
(39, 'CUP', 'Cuban peso'),
(40, 'CZK', 'Czech koruna'),
(41, 'DKK', 'Danish krone'),
(42, 'DJF', 'Djibouti franc'),
(43, 'DOP', 'Dominican peso'),
(44, 'XCD', 'East Caribbean dollar'),
(45, 'EGP', 'Egyptian pound'),
(46, 'SVC', 'El Salvador colon'),
(47, 'ERN', 'Eritrean nakfa'),
(48, 'EEK', 'Estonian kroon'),
(49, 'ETB', 'Ethiopian birr'),
(50, 'EUR', 'EU euro'),
(51, 'FKP', 'Falkland Islands pound'),
(52, 'FJD', 'Fiji dollar'),
(53, 'GMD', 'Gambian dalasi'),
(54, 'GEL', 'Georgian lari'),
(55, 'GHS', 'Ghanaian new cedi'),
(56, 'GIP', 'Gibraltar pound'),
(57, 'XAU', 'Gold (ounce)'),
(58, 'XFO', 'Gold franc'),
(59, 'GTQ', 'Guatemalan quetzal'),
(60, 'GNF', 'Guinean franc'),
(61, 'GYD', 'Guyana dollar'),
(62, 'HTG', 'Haitian gourde'),
(63, 'HNL', 'Honduran lempira'),
(64, 'HKD', 'Hong Kong SAR dollar'),
(65, 'HUF', 'Hungarian forint'),
(66, 'ISK', 'Icelandic krona'),
(67, 'XDR', 'IMF special drawing right'),
(68, 'INR', 'Indian rupee'),
(69, 'IDR', 'Indonesian rupiah'),
(70, 'IRR', 'Iranian rial'),
(71, 'IQD', 'Iraqi dinar'),
(72, 'ILS', 'Israeli new shekel'),
(73, 'JMD', 'Jamaican dollar'),
(74, 'JPY', 'Japanese yen'),
(75, 'JOD', 'Jordanian dinar'),
(76, 'KZT', 'Kazakh tenge'),
(77, 'KES', 'Kenyan shilling'),
(78, 'KWD', 'Kuwaiti dinar'),
(79, 'KGS', 'Kyrgyz som'),
(80, 'LAK', 'Lao kip'),
(81, 'LVL', 'Latvian lats'),
(82, 'LBP', 'Lebanese pound'),
(83, 'LSL', 'Lesotho loti'),
(84, 'LRD', 'Liberian dollar'),
(85, 'LYD', 'Libyan dinar'),
(86, 'LTL', 'Lithuanian litas'),
(87, 'MOP', 'Macao SAR pataca'),
(88, 'MKD', 'Macedonian denar'),
(89, 'MGA', 'Malagasy ariary'),
(90, 'MWK', 'Malawi kwacha'),
(91, 'MYR', 'Malaysian ringgit'),
(92, 'MVR', 'Maldivian rufiyaa'),
(93, 'MRO', 'Mauritanian ouguiya'),
(94, 'MUR', 'Mauritius rupee'),
(95, 'MXN', 'Mexican peso'),
(96, 'MDL', 'Moldovan leu'),
(97, 'MNT', 'Mongolian tugrik'),
(98, 'MAD', 'Moroccan dirham'),
(99, 'MZN', 'Mozambique new metical'),
(100, 'MMK', 'Myanmar kyat'),
(101, 'NAD', 'Namibian dollar'),
(102, 'NPR', 'Nepalese rupee'),
(103, 'ANG', 'Netherlands Antillian guilder'),
(104, 'NZD', 'New Zealand dollar'),
(105, 'NIO', 'Nicaraguan cordoba oro'),
(106, 'NGN', 'Nigerian naira'),
(107, 'KPW', 'North Korean won'),
(108, 'NOK', 'Norwegian krone'),
(109, 'OMR', 'Omani rial'),
(110, 'PKR', 'Pakistani rupee'),
(111, 'XPD', 'Palladium (ounce)'),
(112, 'PAB', 'Panamanian balboa'),
(113, 'PGK', 'Papua New Guinea kina'),
(114, 'PYG', 'Paraguayan guarani'),
(115, 'PEN', 'Peruvian nuevo sol'),
(116, 'PHP', 'Philippine peso'),
(117, 'XPT', 'Platinum (ounce)'),
(118, 'PLN', 'Polish zloty'),
(119, 'QAR', 'Qatari rial'),
(120, 'RON', 'Romanian new leu'),
(121, 'RUB', 'Russian ruble'),
(122, 'RWF', 'Rwandan franc'),
(123, 'SHP', 'Saint Helena pound'),
(124, 'WST', 'Samoan tala'),
(125, 'STD', 'Sao Tome and Principe dobra'),
(126, 'SAR', 'Saudi riyal'),
(127, 'RSD', 'Serbian dinar'),
(128, 'SCR', 'Seychelles rupee'),
(129, 'SLL', 'Sierra Leone leone'),
(130, 'XAG', 'Silver (ounce)'),
(131, 'SGD', 'Singapore dollar'),
(132, 'SBD', 'Solomon Islands dollar'),
(133, 'SOS', 'Somali shilling'),
(134, 'ZAR', 'South African rand'),
(135, 'KRW', 'South Korean won'),
(136, 'LKR', 'Sri Lanka rupee'),
(137, 'SDG', 'Sudanese pound'),
(138, 'SRD', 'Suriname dollar'),
(139, 'SZL', 'Swaziland lilangeni'),
(140, 'SEK', 'Swedish krona'),
(141, 'CHF', 'Swiss franc'),
(142, 'SYP', 'Syrian pound'),
(143, 'TWD', 'Taiwan New dollar'),
(144, 'TJS', 'Tajik somoni'),
(145, 'TZS', 'Tanzanian shilling'),
(146, 'THB', 'Thai baht'),
(147, 'TOP', 'Tongan paanga'),
(148, 'TTD', 'Trinidad and Tobago dollar'),
(149, 'TND', 'Tunisian dinar'),
(150, 'TRY', 'Turkish lira'),
(151, 'TMT', 'Turkmen new manat'),
(152, 'AED', 'UAE dirham'),
(153, 'UGX', 'Uganda new shilling'),
(154, 'XFU', 'UIC franc'),
(155, 'UAH', 'Ukrainian hryvnia'),
(156, 'UYU', 'Uruguayan peso uruguayo'),
(157, 'USD', 'US dollar'),
(158, 'UZS', 'Uzbekistani sum'),
(159, 'VUV', 'Vanuatu vatu'),
(160, 'VEF', 'Venezuelan bolivar fuerte'),
(161, 'VND', 'Vietnamese dong'),
(162, 'YER', 'Yemeni rial'),
(163, 'ZMK', 'Zambian kwacha'),
(164, 'ZWL', 'Zimbabwe dollar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `discussion`
--

CREATE TABLE `discussion` (
  `id_discussion` int(11) NOT NULL,
  `level` tinyint(3) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `comment` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `discussion`
--

INSERT INTO `discussion` (`id_discussion`, `level`, `id_user`, `product_id`, `merchant_id`, `comment`, `created_at`) VALUES
(1, 0, 95, 10, 5, 'asdasdasdas', '2017-09-13 03:10:40'),
(11, 0, 95, 54, 5, 'coba 54', '2017-09-12 03:11:31'),
(12, 0, 95, 54, 5, 'coba 54', '2017-09-12 03:12:57'),
(13, 0, 95, 24, 5, 'czxczxczxczxzc', '2017-09-12 03:17:36'),
(14, 0, 95, 8, 5, 'apa barangnya tersedia?', '2017-09-13 03:10:51'),
(15, 0, 95, 24, 5, 'apa barangnya tersedia?', '2017-09-12 03:18:31'),
(16, 0, 95, 24, 5, 'jbsfjdndandklandasklndaslkn ehueqnhcuihecuihhinohhwcuhewuihiuchweuicngfigcfuiuiqwncuihz,odemhduhiunxueincueigc eugcuincuinxhiunhuiehnxiuehniuewhnxiuqhniuehxniuheiunegwucgernuinxguignxiuenxiuewgnxiueguifgxiugdgiugeqixunehiuenwuiewhxniuheuixnheiuiuqxhn', '2017-09-12 03:19:03'),
(17, 0, 95, 24, 5, 'jbsfjdndandklandasklndaslkn ehueqnhcuihecuihhinohhwcuhewuihiuchweuicngfigcfuiuiqwncuihz,odemhduhiunxueincueigc ', '2017-09-12 03:19:26'),
(18, 0, 95, 24, 5, 'jbsfjdndandklandasklndaslkn ehueqnhcuihecuihhinohhwcuhewuihiuchweuicngfigcfuiuiqwncuihz,odemhduhiunxueincueigc ', '2017-09-12 03:21:39'),
(19, 0, 95, 8, 5, 'adasdadaddadad', '2017-09-12 03:24:17'),
(20, 0, 95, 24, 5, 'jbsfjdndandklandasklndaslkn ehueqnhcuihecuihhinohhwcuhewuihiuchweuicngfigcfuiuiqwncuihz,odemhduhiunxueincueigc ', '2017-09-12 03:29:31'),
(21, 0, 95, 24, 5, 'adaa24', '2017-09-12 03:45:27'),
(24, 0, 95, 5, 5, 'sadasdasdasd', '2017-09-12 07:01:53'),
(32, 0, 95, 56, 25, 'asdasdadasassadsa', '2017-09-12 07:21:34'),
(33, 1, 5, 6, 5, 'asdasda', '2017-09-13 08:04:34'),
(34, 1, 5, 6, 5, 'coba1', '2017-09-13 08:08:30'),
(35, 1, 5, 6, 5, 'berhasil', '2017-09-13 08:08:38'),
(36, 1, 5, 8, 5, 'coba2 berhasil', '2017-09-13 08:08:59'),
(37, 1, 5, 10, 5, 'cek cek 3', '2017-09-13 08:10:31'),
(38, 1, 5, 10, 5, 'cobacooadjaosdaslkdlasd', '2017-09-13 08:12:46'),
(39, 1, 5, 10, 5, 'test', '2017-09-14 02:40:10'),
(40, 1, 5, 5, 5, 'cklnda\r\n', '2017-09-14 02:55:45'),
(41, 1, 5, 6, 5, 'asxdsa', '2017-09-14 12:43:03'),
(42, 1, 5, 54, 5, 'Barang ready boss\r\n', '2017-09-15 00:18:05'),
(43, 1, 25, 56, 25, 'asd', '2017-09-19 06:50:57'),
(44, 1, 5, 6, 5, 'Test', '2017-09-27 02:42:45'),
(45, 1, 5, 6, 5, 'Coba999', '2017-09-27 02:43:12'),
(46, 1, 5, 6, 5, '2', '2017-09-27 02:49:52'),
(47, 0, 95, 154, 77, 'tes1', '2017-10-06 08:32:06'),
(48, 1, 5, 5, 5, 'aaaaaa', '2017-10-12 10:14:13'),
(49, 1, 5, 5, 5, 'aaaaaa', '2017-10-12 10:14:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fcm`
--

CREATE TABLE `fcm` (
  `id` bigint(20) NOT NULL,
  `userid` int(11) NOT NULL,
  `device` varchar(100) NOT NULL,
  `os_version` varchar(100) NOT NULL,
  `app_version` varchar(10) NOT NULL,
  `serial` varchar(100) NOT NULL,
  `regid` text NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `fcm`
--

INSERT INTO `fcm` (`id`, `userid`, `device`, `os_version`, `app_version`, `serial`, `regid`, `created_at`, `last_update`) VALUES
(6, 247, 'Xiaomi Redmi Note 3', '5.1.1', '13 (13)', '5c72490a', 'f9DY9A-7qsw:APA91bFvVJr01TxjGmIwir9gnFxwYOdSH0MKPy5vmRuxBJK-4_EbG8gh5c2JOeIrJC_C9g00TrW8GjgnpYwDRL9hXEz56KherMOaThLk9NC1VJMtQaErxQhyw2CSUCNFG_LZYN9zgCO2', 1494862150136, 1506561982126),
(7, 0, 'HUAWEI MT7-L09', '5.1.1', '2 (2)', 'P6Q7N14B12000206', 'cSzgknUyAoE:APA91bH61pfokcfpv1t0hFx5RRGLtOp2zrmSzIWg3nKb9Eo7g6xvji8XKUrQVqf768_2p1iDPOBh7Z_Smy9TyBp-A1in9dysuBLpGvdN3UywgKTOc0yy2Uv379qk2T63OGeZzU-fQepI', 1495093538493, 1495093538493),
(8, 0, 'samsung SM-T116NU', '4.4.4', '2 (2)', '30040997e6212200', 'egFWwV0Mz84:APA91bFK_ZMitoZdc2L12Waxtnu9vAfJ-20aZV3fO0BALu6h4R3r8TDbIXxLJ7ObhFlUlBePwxrGHMrme42TN2yD_qk4kEysHfJJueG-M1W_4DMSAwdtBRZYtBFi7BuXu4HYAw3Da9b_', 1495118299052, 1500132163979),
(9, 0, 'Google Pixel', '7.1.2', '2 (2)', 'FA71P0302749', 'feCno99Va3E:APA91bHt7fs2qWJBRWuwnLPvMbNHwFXylaF3mhl628fVXmT7T5NTzIXVQ2OY6IH_fZzuQm10FmbtZ7GHZ1GS19WJh2sPYpLKp6qEno-SaNOyj0JsGN7hph-__8e0kwe8Qxg9_FnANG-9', 1495165125201, 1495337187722),
(10, 0, 'Xiaomi MI MAX', '6.0.1', '11 (11)', '9e1e8be', 'f1GqH7mgTg4:APA91bFjpofRtCmAuW-LTHZmVdWlYepcBuEshEHJiqhH0JG0b3zRIeEViXw8eqMXP9tLS0tIrGSO8cyOvlIhgLYoG5KhL68bWbnS_kieINhYM55BKxxq5bgNkrLlUJ4hTZ8S_u6Nou6p', 1495166611506, 1500422908998),
(11, 0, 'Xiaomi Redmi Note 3', '5.0.2', '11 (11)', 'BEPBBUS499999999', 'ckUSWJzj4WM:APA91bF9M8Ajfds45BizlJR_qKqxkKfDJ92Dg94-jSL5mNJv7jieRNb8pTMhxdLa2pzkZGAZP54P1A3NIiMe5EgM1Tqzi-v-4H8M1PDHBI2Eae7EGsqCSudvg30rZhzEXuaM7VWBqYGI', 1495183733015, 1500865396403),
(12, 0, 'asus ASUS_Z012DB', '7.0', '6 (6)', 'GAAZGF0046438HJ', 'cm0q85_zksA:APA91bFvZyHldC8iLkYcNzUe8MfAIKXMLglwUxjxJpR_GDHic4z2Ruf6y5uXRcOFT9z7jKPFjXeKmC3LYaDE57CtEDGtXO4T3ARX8AZNdtsOBvbGLTsharlqU1nRJxlhhFLbU3BxdNtc', 1495185327337, 1495499105653),
(13, 0, 'Xiaomi Mi Note 2', '6.0.1', '5 (5)', 'da95c4aa', 'fQiL9riU34k:APA91bENTqI67ip1AYWEG4XyTBspHt8VIoa6Ke6RtZPraZzWon8EVHTya-sZ9mmzi_bSiX-vRyiZSeJODs1SOOtMxtjfUHCFmInU30esYfh8-aTKqIAP3Y-SSosQsMMeIKJAt4NreeXG', 1495186875687, 1495422701581),
(14, 0, 'asus ASUS_Z00RD', '5.0.2', '11 (11)', 'G1AZCY12Z350', 'eEKYdDkBTF4:APA91bGbIaCKQI1eISziY1E6J3qMVPq3s23HNVwfbobZlFdz3LpE0e2uSzU-NeeJ-eqyFYvDzPu7znIXf24JdkESLg97xoDGrNUhVo1tNNm7siUv_SlHazNq0vRbbM-XpBoVslGaMl7K', 1495327747987, 1499828386089),
(15, 0, 'samsung SM-A500F', '6.0.1', '10 (10)', 'f3f0ee52', 'dOJTnP082dE:APA91bGYPhuoZXYjJYsnQGejU2EAXWL5mzlioM2ZOXMZBXnNeN4Y-TRLe74VtSuc4G4Wf2s8PbG_lKzOds7U51CZB8WA6mEDjDQaXnMuFnU61MOPbumEAWDQ28ao4-zC_kpxV33nZOJ6', 1495340277022, 1496017075463),
(16, 0, 'asus ASUS_X008D', '6.0', '4 (4)', 'GBAXGY14235149P', 'cgIF-ScrM4k:APA91bG0ifsSzTG1VuE5fhaEsfB9g2vv1cZJlcGOErIo2tXSuMlxq9WGcMFmx2_ovBTbDHnz0G6j4sdTKbkJnOMakRFClCrKu8apehm3JavObeReFdSCIyuipb0b9M5DEfkYTPb1s4Iv', 1495380319491, 1495380319491),
(17, 0, 'LGE Nexus 5X', '6.0.1', '13 (13)', 'unknown', 'BLACKLISTED', 1495381000083, 1506865085364),
(18, 0, 'LGE Nexus 5X', '7.1.2', '4 (4)', '00c740438ab51c50', 'd4FV-4KQOy8:APA91bGId2VWwBxWysUWEfm8GeBYCOgwY3h6NnMfzjf4eLl2fcQ-8xMkoxUS8EIqUeE7GFeWp51i2OInyF5l8N7P1VlPgbDFEVYTBCdorSdTQvCUAzDazNgu3NvezsihwJw1Lvez-U3Q', 1495387104022, 1495387104022),
(19, 0, 'LGE Nexus 5', '6.0.1', '5 (5)', '096eb04c021f56bb', 'fDiG5QxHFm8:APA91bFy0vV2lTGyPhx8VOFDLVECchkk9yaD7wOASPgM4rh_nQNugplLKCNDGtHePXyd_9uOPULImS-QNolCrETz29_rNVi24pGTqFEykecrei8Hgv-v8B3xLaNYjSv_SabXG4DJqCxa', 1495411352908, 1495411352908),
(20, 0, 'LENOVO Lenovo A6000', '4.4.4', '5 (5)', '660ee695', 'fKDK-wc8etI:APA91bGk06a0E9nNP1mPW0jgffioGDkFzxb7TNUuYX_Yejb5xcmtpJtPkhaUJI2lIFeP-hYRkI2GbFOPFftRVIPQfjVTNNOdpZwv7d1jCkCiRPh9AYpU3j0UfDYyID-FYUILmQWUPAeR', 1495418236477, 1495418236477),
(21, 0, 'samsung SM-G935F', '7.0', '5 (5)', 'ad09160350d80c8287', 'fW69VT4_cEw:APA91bEBmNTosKJ8hkEhVT5mBEThXPQwlWN_CZM754QBzNfNAob8zbo_uHCfPoif5n3DkkjpODMReKxDUcHDzwQdgXw4cfw2dtYTP7Kz-60DG_mrR70nneisZ0PvlvMTE7MyhK8kILt8', 1495418353953, 1495418353953),
(22, 0, 'HUAWEI MT7-L09', '4.4.2', '5 (5)', 'P6Q7N14B12000981', 'fKoJrGkApR0:APA91bE2InaVH7UVV6wumOa2N5l_kU_lKZrQJwTKoPtyBu_4DTQU-FVvEtMLbM5GbMRspRUmzg4N2qiocK-bnBwawBnf9dfVg8MPQO7TNeuf_8XP08Q-koJvwIAO50MwrUxkbfAxbcwW', 1495419205608, 1495419205608),
(23, 0, 'samsung SM-P355', '6.0.1', '11 (11)', '3b7b2881', 'dpqmFTsne1Y:APA91bF4MlzPZ3CeU70ZiBcID28Ox0J3qD59VL3R6sle0BtcW889qJoIvkwnxakOgXrGp5aUhGt7UaLNxPljgmrYe_eZyRDEMHeAcooXGPQZ3okKuKh8xgyBUIq52gepxlZVmfDieHXT', 1495419534528, 1497335074005),
(24, 0, 'samsung SM-A800F', '6.0.1', '5 (5)', '4100a76be4b1b173', 'ewuwtc8rfbA:APA91bGLEAQya2wJ4HcamxrYE-ntN70qJwAs6neuXAB-chUncWhys5ZUSYr6cl7J2ET5DSunM8SfrOdEjRNoakDefL688jhpn0PjtmCAOcueec6BUUYVw85ggWNo3Cj-gyp7MDSW-adz', 1495419778594, 1495419778594),
(25, 0, 'Xiaomi HM NOTE 1LTE', '4.4.4', '11 (11)', 'eb8d38d', 'eHkpxxbcGQM:APA91bGmONIxrse7cf_7-t15H5XvJg5vxfAnfxPX3O6OzZuOwloFSC3jzLI-hEFsC4FBMBnIwNe_gfXD8u2aHxFx9COF68PTcpSHRHMg_tuBEAzqNvnkUjAI_WUV4tbwNdTIFO4G5SE3', 1495419850042, 1497073846093),
(26, 0, 'asus ASUS_Z017DB', '7.0', '5 (5)', 'GAAZGF00D386B9M', 'ejz2ozFVQbQ:APA91bG74ZMpEftN2pYFRG9pqXzUvRlNK0Ef9Uwuw3cicsMlw3_WF_fobmwFSYqBGTVdqX0fhJQo0TPbaaYtFKzB8OAVwwc4N46P0U_LtvrZNSOo2odzBS2Fziqdd1ZYyBxdGU406M4s', 1495419875300, 1495419875300),
(27, 0, 'Xiaomi Mi 4i', '5.0.2', '5 (5)', 'f757d0e9', 'esqy1awIA90:APA91bF-B-MXz8luW-9lmNFXQvCOD9Bk8AkHf6apjTnXeNKmnqjg_3cYhxsl6XvaQ79UPy5nAliveyHCqdHbmuJnv8MTW-T6k4zbUVgm6GzLsJBBWwp7XE9eiqExfVLQTciCYTCXN14y', 1495419990420, 1495419990420),
(28, 0, 'samsung SM-G950F', '7.0', '5 (5)', 'ce0317135cba6c870c', 'dCREjmehOQE:APA91bFFGgPUxHcIafmpieqGfgu2HDENSpT-qS5rl4nbyE0BV4NjCiuUZzVr9Ij5eNftnx3IAg0BCaiJ59CBDCh1vToCos6pyyP3zYwO44NqlXWhBZR9dWtRdxVdRBQyiBC-Zs8FKMCt', 1495420706002, 1495420706002),
(29, 0, 'Xiaomi Redmi Note 4', '6.0.1', '5 (5)', '5715caaa0903', 'fz81vtabed8:APA91bFsa5DeHpT28uWaEmuCK6AO2ylkdfyJg_Ys0lfsm7TVkpfHaOJ1LRbbOPcU4hJPII-ErJ5xQ1SL_sdYwxVraWkkL5sd4HTd9tZl3vcW5xKm242iT3LRyGYeWLxy8_voiU2LSCJd', 1495421272951, 1495421272951),
(30, 0, 'samsung SM-G930F', '7.0', '5 (5)', '9885e6375238533046', 'dhN0-WT3vd8:APA91bGBdcuk2sooq3C8xmzt8oh0T-56LhJDGwgZl1g1vqarJF_8vim-7fVWPoBLOX6tJ4bhMZoLd8V-Z1Wd0ZrYVuMtbR2KLxIBBu_SwUnKnWmcXgnXLTlY9OqoJTam-6moQ80jHv2u', 1495421406075, 1495421406075),
(31, 0, 'LENOVO Lenovo P1ma40', '5.1', '5 (5)', 'DICAHESSRCDUC6GI', 'cYZCSYJg2DI:APA91bEmhadGvQXz4ggz0wxvKWtxQ7p_OcK_0dcnIIJjSDwUEg_Y-lHjwR5gWr-pBX8tLIWeZRAGxQZc9CxCAvyLnzJgytRycOyuG6UNE9FlY35xVgmc5vGR_V_W6sdOcJODG91tdKSM', 1495421658191, 1495421658191),
(32, 0, 'samsung SM-A9000', '5.1.1', '5 (5)', '4d009e0c43618055', 'e-c05WCla24:APA91bE60uDd0g_0gOsm4sSW4Ca6xDMumHIVeoDNBb6XBEAuup1nbzcgEYqa5A3LJkU6NJN0eRC4WYU2pQBzFecbJvoM44behxdk47wo-Vlbg_KYK5iLE_3eD2G_WcQiRKb_AaI604mn', 1495421812353, 1495421812353),
(33, 0, 'samsung SM-G355H', '4.4.2', '5 (5)', '4203efbcce4bb100', 'dzmmYUtIwuM:APA91bGpEELcALVOZuELnSxn-6qd-qGIFT4ZkgH0s6xhjCpqOzZvaVV_xz6idZ1OhT05pG_KSNmu24vJ5rgysvqxV-YQ4j1jQRw2WtamiSS4_aTFB45kLHU338tKt5T7W75X_zdavhh5', 1495421931834, 1495421931834),
(34, 0, 'samsung SM-G610F', '6.0.1', '5 (5)', '330070795b37c339', 'ek33rZ9CjW0:APA91bEuMSac7NnGZNVK_uirMScsciAdFjYlxSjZiDPZaL6X9kfMgAc3cc6s6VBR6I9p5-0BDOs_IucGjyzndYzoZOeJzmfY74yHMbfoCd7RsgtFlI2be9_VkQnJUCe0RN2g9yeVqXx8', 1495422189866, 1495422189866),
(35, 0, 'LGE LG-D855', '5.0', '5 (5)', 'LGD855820e00a7', 'dJS0KXz5Vr0:APA91bE5RA5WAdfD9olWFCTu0xy1qYF_-qAvqS2OA7swQ1CduyLcP5h5TFIcvbktqFL1x3qsGZcDIHp0aXaLxhGDo863HFNjxrVzm_IdbJwEeGd1EvPtWcJ_xLNnC0TVJsv1c5V6ZVSD', 1495422217953, 1495422217953),
(36, 0, 'Xiaomi Redmi Note 3', '5.1.1', '6 (6)', '9d17c0f7', 'fA0HsaJE5GI:APA91bHYRaese1XwiJD9xlFQXr82D45teZtTKCX_fRD2SxaUka4bhCKmGar95LVNu2RbAFNcFiB2M2c069l8a-o6JphYDdI_U6nCbJIuPc_cqerA_aZzrV5bPrFhXuT5Wg0_w3HfU5aq', 1495426248862, 1495426248862),
(37, 0, 'Xiaomi MI MAX', '6.0.1', '6 (6)', 'df44fe90', 'dVH0I6GG9_4:APA91bEDxIk6RG-SRi2P8p9aFQnxARvWYYJBiZAETX_z754Na27ORyshipxU0IfqEc2BUcRuT5_tmxu2gv2yqu2XkwFRAasp01emeZvM4l4R6a7ex2pLRnqFHpDa3no1sB2h20TVYvw3', 1495426299768, 1495426299768),
(38, 0, 'samsung SM-G7102', '4.4.2', '6 (6)', 'b1ec637f', 'dUhR_ULVqlM:APA91bFOj4-B_o8WgQjU8M-nyVM2K_4k0fsJZexPrRhDkY-GSSdSILI64wTDgvFMNC5uMmk41X0indT1LruElNtFAhysn9eQEGRjkprIYVEDj19swJ1t043iHzz-HMzxjprSWRl3REH6', 1495426379624, 1495426379624),
(39, 0, 'HUAWEI NXT-L29', '6.0', '6 (6)', 'QHC0216313004731', 'eQgJMetruCA:APA91bE85nYVdstfvDj0Ei_EdFoEXhnZqPpGTW3KX5uGDAbnE1Ak849ynQAfE0O71edoBUfN2jeAG_hXzg7xfJzpO46rYLEfLhhyQqFeL5X-sYX4u3OHV-pV6GyC-vKXrNJf30JclaEm', 1495428454421, 1495428454421),
(40, 0, 'HUAWEI GRA-UL00', '6.0', '11 (11)', '7VL7N15903000788', 'c9sNl0bRDgc:APA91bGcpgtFZnAh1tMTlShPpWK2f-uMuq5mq6DRNJ0ihsERn2VLRFqcxqQ-y9A8AwTAaPQkGRCPL99A5zYn6rr6fzqvx-3TEp9NpF-pJca1YbRt8VkzmuWEQhtqN6x8xs9Dwvp662Yp', 1495431192699, 1496736991147),
(41, 0, 'samsung SM-N920I', '5.1.1', '6 (6)', '83f04a384137544c', 'cKQ1zNQ3hKM:APA91bHhVo3ZVZaZuBYRENFv0KmDwBX29VVvRdivKA0Oemk1hZzpqDyHbIG_wcYfPN_7Rn0HQPKf0gneAf8C-_e54njMhiF93Pdz2kPd9X9-edn5u7RQkZbPYrX_dVFYFpzSaA4oir_5', 1495450822206, 1495450822206),
(42, 0, 'ZTE N939Sc', '5.1.1', '6 (6)', '40ded43c', 'c93VJAqEx_w:APA91bHq3XtkfaDqE4iQ0o-Ta7oSWdBkyMfEk9gGyjrDHpFZsm-QtQOPnYKgjSEShdZGSu1D23v6h0-9Ajs4kXxj7xZTMrMTUGG_WSfpZTlY6n2aAQxy3O5pfJOrvMGUjsYFJZojMZNv', 1495466725414, 1495466725414),
(43, 0, 'OPPO F1f', '5.1.1', '6 (6)', '2284e449', 'e_PcPWVIt4k:APA91bGorn3iNcBbI_fPx-UQfrbmA8k_yYgUQgtb8-7RZfP2a6k2yixHf_P2tPGeSWDbJ8p7FVvpUm4nEOZN8gNzA4g3qKEUGMyxLY_dSgF_DS28futGJMQ7AHNbs_Mj9IUyJft00jai', 1495491346177, 1495491346177),
(44, 0, 'samsung SM-G950F', '7.0', '6 (6)', 'ce0317133db5863504', 'd9yd9Pbz-9c:APA91bE_pW1-baZmHlGsRpO15QKAu1vuKJMmDIDegCARJN8ysYjzM4vbT3IrOQPrMXkloBjBXWP166mlSpNzPgEJwZkDbwF22SErJyyrJI-VuuFqbmxUSOFJS7w1j8h1rsMSuwVnMw0T', 1495491878705, 1495491878705),
(45, 0, 'samsung SM-G935F', '7.0', '6 (6)', 'ce041604a2e83a1204', 'dnNrBQhZg8g:APA91bGQVmEiqx-g_tYZEut2b4JtN0BKOAqrxNIe-Cgdd49S7LaL3QTmaJc0ZLa1wAuxz_W-y_JJjHMi0OqMXYDJ1RdKEJmiWhU4yhDilOWtN0jRta2wHJC5qHbQiWv-y4zI6n2yemEj', 1495491918513, 1495491918513),
(46, 0, 'Xiaomi Redmi Note 4', '6.0', '6 (6)', 'W8YTSGWSCAF6WKYT', 'dvC1hm6fksc:APA91bGSqwOpW-A8vkP8mV3RbGqFAal9sUXkeJZ0MiZdSf8HeYdFn4Ji90faEuL4FDKpVX_H-r_2mkrcXMDmxo1YFSAjmcW6dHy5E069WsLgqw2hzKsdK4XNNz0IfJzuUSl0Yd2zXN5X', 1495492186000, 1495492186000),
(47, 0, 'Foxconn V55C', '6.0', '6 (6)', 'V2AGLMB682002825', 'cGCEf87LNOc:APA91bG3MjBtko0Ryq_qkrmCNDg4CzMbUShpVme260Xu__n77c55xweWIUtnRWdD3qP9zKDeWTiIBZvFSByYnGjCDHy--b0XTELqO1z17ylLI4Gd4JMT1bb2vok_egy9oa2Q5dHEACez', 1495492738278, 1495492738278),
(48, 0, 'samsung SM-T285', '5.1.1', '6 (6)', '310092d924b14300', 'eJq4NUdXeTk:APA91bExth-5vCjy9qRYR70W29EZvTeJiRX0Hnfa6YpAnTizKrlKD15fdQWmsznm1hmWTVA2uBRqPAW9hY2Gy6DH7CopPDBaW-1wBE7OkZT2mbo8nLrkc3eKtWd1sMWSRmVus3MiuTOD', 1495499813659, 1495499813659),
(49, 0, 'Xiaomi Redmi 3', '5.1.1', '6 (6)', 'b0bb55527cf3', 'dYUDCrj4kUU:APA91bGIDXj4fJTpVAClCppAhRzHevOikpkEItlIYJMiDnOJUMUd-TDYvF7ovd56gvuqioqFNJbR7EjDo4niFvR9xH1r4XB6rpojEzX7CQMMyUxPLxU1VmWQGXNr3NqaRSfG2K_KN_AM', 1495502104087, 1495502104087),
(50, 0, 'samsung GT-I9506', '5.0.1', '6 (6)', 'ba9bbe40', 'dsUAFePuNHs:APA91bGMqqyi_O7JYYbLemClkp7Xy4UFsAZln1Dyw6gUcPkBA6yrexViwJevjzidgvF-hEcvHrAX53dh8yKfvxhLO0lVZ2R1bthdhGuFyXN86LvkAXX8hn20Hwj5LvDftIpLQerfinvv', 1495505555853, 1495505555853),
(51, 0, 'Xiaomi Redmi 3', '5.1.1', '6 (6)', '81e329c57cf3', 'e1CBSkwYQZQ:APA91bEZOze3a4SD0w39Isg7GRjFvl9tCwmxZllTZqnzSND2Y9irxWATGggkLVySr5fq960dA1Y2uHDQAgPljqmryKsNNxSjqYgEKB2vQ84tb5tqBdz1Ks3mDngPVsnS14Yf8_XDgzyz', 1495508686843, 1495508686843),
(52, 0, 'motorola XT1575', '6.0', '5 (5)', 'TA39400QGD', 'dsgxxNataqs:APA91bFyZUEu2KPJETCYTdii4eTDqyRY1CbmU-dIDPLq4hdM67kmOir8JgCdQFgKd0vDDnuo3wvUa4A7Aj1GAa8BVI0vioC9-T2v6YoPkCWdXcZoTTiO5W9si3-oCFStnwoLCbZmnBPN', 1495513846323, 1495513846323),
(53, 0, 'LGE LG-H870DS', '7.0', '6 (6)', 'LGH870DS340ba712', 'ewa8YjSZvA4:APA91bG5fe09i1xi11XZZlGYME63aHTItE6A9CYy8VzQgEdn4cYMJErYI8Zxh9NQFryLJ94Mn7ow6U4P3OTE8eagwFmAmV858GRKhuXQxgNanFVLGioBp2I-d5WcBrjqvqgjNVhzIPab', 1495513923357, 1495513923357),
(54, 0, 'Xiaomi MI 5', '6.0.1', '6 (6)', '5cd40403', 'deKwR9xDJgY:APA91bE1UshRv8fyoSE3Y7_0fzmIGsKYFa993fdypvjw-zHBu9awj6jrJvpN899jaLxVyRQhv-mxMMQgwa3SpsEMWgv4ZfpWTTsTgZpbZSLs5ccZdf1WsLgAT_QvlesiPUnKpITKM7SL', 1495518955713, 1495518955713),
(55, 0, 'samsung SM-G900H', '4.4.2', '6 (6)', '4d00af4b4a06319f', 'dZgz9HuplHY:APA91bH6UTxqensOk_z4Ij9x18CgVFF_XGeNBuS4f5bB3j75uYGVM-LjGx8sMuCvPPgJvX6Pw6EbuDQY-IQmafSKvFcdO1pvqS5HDvYw_b94kIjgKpElYSMyKpc3RgeFc0DPgZ211tK3', 1495533908105, 1495533908105),
(56, 0, 'samsung SM-N910H', '6.0.1', '6 (6)', '410072b9c8549117', 'cDgD11MnFPA:APA91bEwx8w4MrWekt_yrupQYBRiGt1OQnSFI6m8MWr5DR5CtedgC561_xnX1vQVWJtRMzn0AYSbp9s7snx3ttgF7nCxhzrTRbmpRHhFZrR2IL-DJB-NbI5TECEiOVRLo90V2lpG_4Kd', 1495535768430, 1495535768430),
(57, 0, 'Xiaomi Mi 4i', '5.0.2', '6 (6)', '2f58ce8c', 'dB8O2avIHNw:APA91bGkAGti2iC9lfoiNXWR5ctap1hSdBwr57SoKsKo03W3hrwe9hC9kWx65WHxhmhVLG8Gkr8PsLL_lUlapaFLkNq7kRH20eJYm93vxzG9_MCW3tMY2MSUc1_UBYFYO6e6Pj1SWjI6', 1495536545534, 1495536545534),
(58, 0, 'OPPO F1f', '5.1.1', '6 (6)', '103cdcc0', 'ePJ8qo_6Ypk:APA91bG-5Pm2XDcNIakIv_eTaOr359GLjlfYi64FIyHfqKqJ4Zfl58LWOfYjyfA84FPQobxVuHHq2U9ZQrfQfuxwjVFqmssjc1mXkI867d0bsp9SU1-TogcIC5E-PLxI8APA-vWtWW6P', 1495600202487, 1495600202487),
(59, 0, 'LAVA iris 870 4G', '6.0', '6 (6)', 'L40IG0G080I0406A', 'f_ShK0W1Kjc:APA91bHmry8wFBtNYX0xCnMrCFR-mtAdhA_-hrGlFoXTO2Ki8vf9PC4PLTObUkhq4UGOBa0oXCN0oYbIzlr7plXnolbR0_RuZefycxG5fJwnox8_SHkWP2RcWsSEXduld9V2Xj7ZsCMq', 1495609324627, 1495609324627),
(60, 0, 'samsung SM-G930F', '7.0', '6 (6)', '9885f738485a524149', 'fX-BENQtYUU:APA91bGqtY6KcpQPa_rn8xcONVoampXBErWwdCxxEkgEuAwUHS0MAY_JmXGGtb6_Im5jMDg1DEU8iiAweeKqK1fgg0-FJ1WH3Nv9tSNqMxgfPu3kyIrD6RXUoRNd7jkBecUFWor7u6Cu', 1495624625985, 1495624625985),
(61, 0, 'samsung SM-A720F', '6.0.1', '6 (6)', '5210d46847b5c34d', 'cuOVOphEw0g:APA91bHnlnmic8bcsq9w8YHljLnmb3KK6h7IMK6qXxa5eTYEOoPhQ7eS_61KTWvctKZgTFW6C2PrxLX_Z1ZqLFIDAUHagNsHY6mRC-4h5dVJ8Ez14o0YCe6d20paWu2_aV8WtilHc8WP', 1495625408003, 1495625408003),
(62, 0, 'Xiaomi MI 5', '6.0.1', '6 (6)', 'c8525c95', 'fECBfpBW11k:APA91bGDWMc0M590x1tnTJ6l6x3FggOQNyosuu6pO54imLgPJeiOX9l9qlQVfTe_terqz6iXIBXZ4edAzvUljFannaQDSiRKOlTMAhAKWZASRdBragkA1eXVcEQjb65h0EM8nHEURQfh', 1495625447015, 1495625447015),
(63, 0, 'samsung SM-G930F', '7.0', '6 (6)', 'ad09160358ab9ebb4d', 'eKM-IexSDSg:APA91bHVEZl42outI6UOIY0fGa3tHDfXB-_NfPckf68XpTT6jeO4PpupZzZtRRcnzjvW1ByaLwcSkMoilPose3JslbmB-HjHOZEtovBY1bRwxPctHoS81PQDsKJb7GB47nFluLp4V5uQ', 1495625496567, 1495625496567),
(64, 0, 'samsung SM-N9005', '4.4.2', '6 (6)', '08abd00d', 'f_-sf9lJdxw:APA91bELNqtAHc-sEHuBJo1CITU9z-qs4xfOgqwgdnv7m87oS7XvaJeiWMiqUfq68aR8aWdCBpepBemA92ch13YlGlnf4v5S1KBdcAH2uQQbJ602QKi1Li-x8YLMDtHvQA9TJ7QpPl5k', 1495639649131, 1495639649131),
(65, 0, 'samsung GT-I9060I', '4.4.4', '6 (6)', '4d008343c8473200', 'frx4JFmoTbs:APA91bEypUp2dUCJC1uGD1_ZQC8yA1jvB9NrOTmp3UB-Rla6FONoA-MaCBWuEfFzPN_-h4efzQnSigj5eL6GoL-go9Hl20O0LPw3Ezub-6wVtmVtkuA5ErsOyof7InGIQefnKlEfAxEP', 1495663721905, 1495663721905),
(66, 0, 'samsung SM-N750', '5.1.1', '6 (6)', '320452d995cac047', 'fPQOymY9eCY:APA91bFNG2gB4-RCBDbiF-S1GxSZQPanDG2FgI4iCqxQ-_6H9Ku1w0qc4x9Wvh3isNHwG_RhhCX9MylND0MhmirmaYT2kZoanQUNI9R5SsmpvUc_GJkUNgTh-Mn-WlfIONdps6B05Mjm', 1495666388387, 1495666388387),
(67, 0, 'OPPO A1601', '5.1', '6 (6)', 'GAOVOJAE6HZDP7N7', 'd5uFnX9Rdx0:APA91bGWBIP_5wTjxVJxc90AkvC_GnCpTczjcfy9qbsaAoERy_bB3Wo5vBMuSb8GLY8g5u5aDppbvjyCTGQSHze5fX3mvb7PvShNyPMyfkAM7C0tszpgwqzwmJl-qZ_UnbbkBNJxgaYo', 1495681142601, 1495681142601),
(68, 0, 'LGE Nexus 5X', '6.0.1', '6 (6)', '00d42d52b25cd109', 'dr33CUnJ_84:APA91bF8FtRrgGjAMyzj4885mR89iPG8kKnAjjOwi3S-C0ZZvG8OQdFCYfOXuvbb8fdKt17KgUCTbHOJ6NyEHYcL2zXnTGhwfzzxMHqocyf5lU1C562xmtqRronouwdOyzsEJyTRYfdw', 1495690764602, 1495690764602),
(69, 0, 'Xiaomi MI 5', '6.0', '6 (6)', 'dd97b8d6', 'f8AZhCit5Dk:APA91bHVdr5OeoFXw1K8ZSHWD9HnsNAchZJNUGnnsg7ACwj-kVcPd5z72kn9srh9bkN0ZtfD3cx_76ugdeVVSxDOCDyl8VGtgXHaA2IiZTYGjilRjZmOHtqzBs48qplOh5H2U43aWia7', 1495716326657, 1495716326657),
(70, 0, 'LENOVO Lenovo P1a42', '5.1.1', '6 (6)', '7e53ca67', 'c2WfAh1SV00:APA91bFMwZaSOItTlVNFki53FW-b8COzBzhledTsCUWsPoWBNng1iUWoQyRntGKYbJdSWz3D_xRDc4CZYz5JSLZJ7mdC7xO_BlkYfI5e4TSPDGr0AA6LOrcXvrfAT99k26XP_vlhKR33', 1495722142625, 1495722142625),
(71, 0, 'OPPO F1f', '5.1.1', '6 (6)', '26c5de69', 'f_dXdVfG1PQ:APA91bHwpRGx8zBoCCf8PXqbRmSy2wnlVUewwA69of-9KPofF8pkFpJ9M1HDAT5ZnFC601LH6lPFo0dbTZFvqKKVHaqVOgjO5_k4NnXoqK57MBDQst_tVlk8tQdJF9kAkkL1ZG2Swy5t', 1495753309972, 1495753309972),
(72, 0, 'Xiaomi Redmi Note 4', '6.0', '11 (11)', 'AASSOR7PFAZSCY6H', 'ci_pMtyUlOA:APA91bFnPZ4s2hCIi42I09ini89HdKDIV6cc-lzLfvfDafPSFXAbP3ozhz7mrPUFjnDwPtFBK9TcMx-pLn4QhNBgG0e7mI6GjAMRiXqv3stTV2xu7RwBWvSWoGqRctiWcScD5O7SHi5y', 1495856097233, 1500449902633),
(73, 0, 'asus ASUS_Z00AD', '5.0', '6 (6)', 'G2AZFG01R5363BZ', 'e7dGoPa4ehI:APA91bHx7UnzhOBGNQEpy8QOiHYleEypTohQRptGpjNuj1eDSlco_FIN6wS7AL6zjOfOocphROZYv29Bx58GR3R52fXns_yF5GOowe0Z5P-kGAwxGX9i2cvE1ZiAi5sYMpz_Ooj7QDe2', 1495867876787, 1495867876787),
(74, 0, 'samsung SM-N9208', '6.0.1', '6 (6)', '1115fb58fb0e0905', 'e8UNrt45cAo:APA91bHQvT3-maF1peoUXpgSqJ6HeOTg_4B9O7ajWJVv4NjYNSXoeImi5cyILYZGS490JOeXBjIecwOSytyaW7m69bNrH90YqJnlBePV1DqXOs-EbNV9h5KnkCL4sIvDB6mfJzLhj3Kc', 1495870090519, 1495870090519),
(75, 0, 'samsung SM-G530H', '5.0.2', '6 (6)', 'd78bcab6', 'dldkF9JY5HQ:APA91bGlWz1d6TfI7jsSnpHNrGwRwIlJgMw8geANV1itJgyW-uYKm1mBLPohIzcwpvYjKYmhNEzI9rdjL1TrhBHWNSHoV5ZovpsyKxHksxjUiFJiS2nk2oIetcCWEH9ug6YmVoYuvAtH', 1495871237030, 1495871237030),
(76, 0, 'Xiaomi MIX', '6.0.1', '6 (6)', 'ecce0e87', 'fKn4jfRc1uo:APA91bEqty0qLtETGZsdjchQdBMVGYjwbjHvmOyUW6yf4s_xFyAdNb6w-4aZk1Bd89v5YdsSabEtsraq53BSu8IncgOpvmChOVkmj-hLT2xX1Sh2yXi_WpRbKDQ-6yZCKLmXdL6SuOiH', 1495872426950, 1495872426950),
(77, 0, 'samsung SM-A310F', '6.0.1', '6 (6)', '3100a7a96b98a2dd', 'dX_buTMv6v0:APA91bHgdHdVLh1jgEbnQdBzV04X05zALWiE1K8T4Sgsmrr-sOmPkWuEQTiN_awBcReIjZdUy5J5EN6cP8KWYYa-hSYg8L5uCD7Ikc3VqMhqLEdtjEUrct___JDCgV5YxyiYCEOq6b7C', 1495872489522, 1495872489522),
(78, 0, 'samsung GT-I9060I', '4.4.4', '11 (11)', '4b1341391b61334e', 'efYYwaeYhiU:APA91bEL9EhubZA-vH3pbTE2cDIFchVFr6UrxCg4CbsBMeg83HyIroaD95vhNl7964KbiTfcLZX7ULuWlsjHTIDpzZbgu46_23A4rS9TY_DqPskRSQCYo854e00AtKVgzzhwkg9NyU95', 1496024095380, 1496024095380),
(79, 0, 'samsung SM-J320G', '5.1.1', '11 (11)', '4200594f96af3300', 'cA77csOViQQ:APA91bGLGxEL5i3ZHdCdz7pXI9vuYITG5SDc7d25YFpYrweCx9cIVoxZH4pv4Mixl3ltSOOjEAUlmhrEM2cErexPmfoNqHcHFKVZFs7NmE1J9JEvq4btpXOydT9qqGbR8zGwHrxG348f', 1496027666232, 1501139617163),
(80, 0, 'Sony E5663', '5.1', '11 (11)', 'YT9119A3ZN', 'cmaPGSXhXAE:APA91bEixUUz65oX5fhztux6Teozw_CmkHL009QpDAgxCZogeUWsHJyLwYPSji5yPx7zRmTo5DKLLV9LSK5S2iASlyTiJW74M-V0K10akO_XbW36OAVDiOMDJ5-aUTiTrXE17qr-dn02', 1496030915186, 1496030915186),
(81, 0, 'Xiaomi MI MAX', '6.0.1', '11 (11)', '91ebf28e', 'c_WeT6ocP6o:APA91bHNVc-jPy7mn50qoniD5KatejYihrSLIBt5lCyeO1qkNy5Iqfz4OQN1-YjbfGFDPvhLs6PMQtI0c4nrGjF5RtXMrmYct9oYld5ECX0GA0FkKERg8sWqJJduo18ZWOTlSAUDKDfP', 1496033366118, 1496033366118),
(82, 0, 'samsung SM-G935F', '7.0', '11 (11)', 'ce11160baa972d1704', 'd7M0srjsvjI:APA91bFWXzRhiCnY_Xsn27F9b9FL1iMd9SNItS6s77LEEVWSWrvDDTZma_gpa5jSERxHycsDm2fQwlp-JeJD5JEUd8E15ZK_YWHeM_NL3zDA-wkCA85szMduIHvdndnUNDfeswpH9p67', 1496035237489, 1496035237489),
(83, 0, 'samsung SM-G935F', '7.0', '11 (11)', '9886334b3257455349', 'eCWW2_sT1-A:APA91bHS-6Bf8R_i7lT5mn074tc6JFP5FrKO5sbJUeWXw2gDfJi8Y3ud-8WzezyOO2UipQLtValhHTodQLpSAIr8-Azpdx17plsFCqc7IBpt1oBXpAZ4nrckGCTWpw-tx5xmYZCnArgb', 1496115975243, 1496115975243),
(84, 0, 'samsung SM-A310F', '6.0.1', '11 (11)', '5203db9bec0ea389', 'dktY2V97MAo:APA91bF6B4wF861IX8Tcdcdsh88VglQIbglZHIz_-j7TYOa4HOxL5qMq1lVfwfrQn33k1ig2D3i-aJe5CwjHP5KybQm6sXvHbPQII5Lz8I848mdyAVy6Cg0PgTnwEOceMUQVcLNxzHNh', 1496116025223, 1496116025223),
(85, 0, 'asus ASUS_T00N', '6.0.1', '11 (11)', 'E5ATCT084029', 'dK8QbYeB2-M:APA91bEgJPqWYFBoYFT_8xuovugVFY8VMDUZ22lVBxO-0Zt4PFPd-HB-ScPmJhbNzIaBnIiLTTQtgBp-XD_KmIuSVrc3NkLx3US7Np8VVhQD1XjxXkNoAy6KWSN540LkxizMw1_iFTaV', 1496129321564, 1496129321564),
(86, 0, 'Xiaomi 2014817', '4.4.4', '11 (11)', '3a27a58', 'ccC0cto0HH4:APA91bHSA8Re3NRgPztYw_eR2KfNqnI_-ejFuZTxNb7LsIfHO6UuvCcVo2YM37y67Lm-s0sYqiOkRpw8etrN12z4NMXfTudrB3NuHFdthUfNCLk99Du7abpdmxI04Mq_5ht3mhAF9JJ5', 1496158515803, 1496158515803),
(87, 0, 'samsung SM-G925F', '7.0', '11 (11)', '02157df29b1b6d35', 'dn_oF3QTgOI:APA91bHZ7vw0u85VyeWgwPDUAJbBkWqnW8UUIHiOt61WtGGYpmQbNWwxiZef4kCyhKtkYGxQN5hw3R4mi0PcTKDLcrsayqPYngDxSOnBNMjA0TKBG4CGeZq6ziiiEEMzv5no1TVA4seB', 1496182668368, 1496182668368),
(88, 0, 'samsung SM-G930F', '7.0', '11 (11)', '9885e6395850494741', 'eGermO0SKCA:APA91bEu1KsGSYhFlb8ctvbaO4KZK8plngrF5m7mYZzw4Au16KXAy8gr2ewhQuDHj3jX5YELw7Bj5vCT5KqtekWOPzWzpLdJ79pHcsAcHFTELKmEM7aJ3C_UqHhAM4Ybi_oIOo48YiHj', 1496184336634, 1496184336634),
(89, 0, 'samsung SM-G935F', '7.0', '11 (11)', 'ce051605b8604a0a04', 'cBpQVTquPog:APA91bEp6ltmir1oUyIu9l0mwtDcNbeq-tqibYhvOPqb-KdOrt01Vgha_m9sPMV_zr19uxR50zHPkGmcnR-p7DRbUTi8uhF6UCKZTs01GkEgm4lwelIRhoG6g04Ips02RcoC4fya0IPL', 1496185662688, 1496185662688),
(90, 0, 'HUAWEI CRR-UL00', '5.1.1', '13 (13)', 'JDM5T16108000634', 'fV7CtIOeIeE:APA91bG1TozFvDDNseEHDicMlB0OMw7JaVqP0Mot5kaeS9YWotZGzN-ROrSRKuOgCIphpbSDlwEie4gYqV7Z3g9BhNQLqW7wm1GdGRzQNfVk_GKHlKa9k86NDoZsQF6uEQLWB46gf3FI', 1496186703040, 1506904788431),
(91, 0, 'asus ASUS_T00F', '4.4.2', '11 (11)', 'E7AZCY334550', 'f_cJTOV5V4k:APA91bGJuTLOPllPnoPxbivL0FxWa31b79na1SxFat7yCyfsAe-L5wA3SsVT3kFhKzly1xJnlw_VH2BLQju8c_c9mmIkNvXCB8BOhlbe6WskelTT57hSQ6NDqCvsnbNOwnMwl1NJYOy8', 1496188053186, 1496188053186),
(92, 0, 'samsung SM-G935F', '7.0', '11 (11)', 'ce0516054cc66a3a03', 'ccxEH6NDoy0:APA91bHII-T7I9vTDhYtetp7WSOdG9HwEo_xzX_uUv0NG2CrHF-IKG4H7Bu2bwizmnB4pciECYPROfP3raMD8yrDBhp2d4xMCJGXinTbNS0kIOYTes5UfxhkP4BuBdN8PtjJwUadVmBS', 1496188474169, 1496188474169),
(93, 0, 'samsung SM-G935F', '7.0', '11 (11)', 'ce051605b230692604', 'cBWzoxIflA0:APA91bHpW7Q2kRWUvPEBrkJklvV0f3VCQd3-PFlj3wgY05gqgimG5YmWT3GBHWNafJoRrTOHAe_M4AgAxy_zH58voL9Q_SvhVhlgdFKycnIVpqjjY43CMARyPjfdFBZPoD_I5I4k8Eko', 1496189812070, 1496189812070),
(94, 0, 'samsung SM-J510FN', '6.0.1', '11 (11)', '6d6be06e', 'efBnPEHgYMM:APA91bGvmGjctvEJhZDnRpip0umZ4dKCi1y8gvauFptlwhU1e1SbutzDKM7yokDHXkdgZWfyfpvnyPuPmUnVSeBcYCUxiEIZ7yN1xQlvJxRyrr21vW4EJgBEbgNzl4yFHWUTpy6y_q2c', 1496194068951, 1496194068951),
(95, 0, 'Xiaomi Redmi Note 3', '5.0.2', '11 (11)', 'K7WCWKGQZH4HDE79', 'fZrRryUtCaI:APA91bECUBNSWgE11a1Z-bOvExa12U19pfS9qwyuU9d-SSxdrvDEIVsqsn1FfUiV2LSgr5GJ9r4ySvI-D3bQre0qCFL18qBDzSD2Pj22NcLULKrE4pgvxHR-ZsWzhUfW45m2XqfOAvp9', 1496197427535, 1496197427535),
(96, 0, 'samsung SM-G935F', '7.0', '11 (11)', 'ce11160b821bc40105', 'eXysdczocqs:APA91bHm2DeILL80hOnwGYuLHr7_4pp0BwyRrpv4RTMaUGdZq7K4HV1dohS_DU7QLd9ta3THvhMMaIoHtt0pLlnTQoDz6nyfutTqpfHcQEqtEp46hqKvSSlAILFpBMNb3QwsHF94UQqA', 1496199907856, 1496199907856),
(97, 0, 'Soundphone S2', '6.0.1', '11 (11)', '7e6ad48f', 'dDywZFGS-ps:APA91bEbb1rbOwlefa8QEEpESd7rcTjU7Uv8Mtp38CgryMbCS0HpBYPyVPmrm0JN7i8kH1gH2dGfIyCsmd03HAdm5FvT2OoaE1l4TkE44Avw28wEdEAyB_54VdslLg868RUh6kNn1s0l', 1496200527752, 1496200527752),
(98, 0, 'LGE LG-H845', '6.0.1', '11 (11)', 'LGH845d48fb758', 'e4E4tWjAHk4:APA91bESLfIgZWt7e11eN9Ozxp4WjLAqzLLdsCdTIOmcAe2KO_0nr2J3U75h9yic7VCOQ-pwnErdqQeuGUFkWle2a5IsUb5i4nEua1TuOHwqdgRNaWiIVd5aUtWhsYKJkDuMTV2E25UU', 1496201183485, 1496201183485),
(99, 0, 'samsung SM-G930F', '7.0', '11 (11)', '98862748463333364c', 'fRd2hD_K6zM:APA91bF_NVLHGruI-KQj9wx7ZrXgkv1IMZwPdz9ojdZ6O1WJ7oboWwD2HrJkeXXbECbx9y4t24MgzeoAlkdhYb1sE-nxXlArwL0MQxMVM3soRJGzIT8BqOZsFG3_yrj34VBzuJ5V-Gbm', 1496201587990, 1496201587990),
(100, 0, 'Xiaomi Redmi Note 4', '6.0', '11 (11)', 'EYJJGIAECYAYDAD6', 'camk1BShHFg:APA91bHZENEeC0PgA0lx_erFVIfhMRskxgFjtVnbqkEtjy8Hbl6tTPM6cWKkZ0-Clx4-hZMfERErGHXoetlTpHECtToShq1lTheVhVM-MiyU3n1TtN-VweLG4d1OeC7MdAO4_9cJfi76', 1496205521441, 1496205521441),
(101, 0, 'Xiaomi Redmi 3', '5.1.1', '11 (11)', '28ab9f15', 'cmHni0NQHOI:APA91bH_ipob54DHyriXuanPXi8hkUqgEobHWs7cIdssEbdl4L5pCuJ7ZCu2BY6uZVEKp1ix8_XxfVcb-wJY9Ewd4VV8Xn1txZZcXGUJ0vnTyI9h5ydwp97_QdFyBaSkX_KpA9jcLwir', 1496216842362, 1496216842362),
(102, 0, 'asus K016', '5.0', '11 (11)', 'ECNKCX257605', 'db4nH87HaiE:APA91bEUV2I7Ftk0ZkKXah7yYbmIeslJ4HOSPm-8k57n1zpoTO6tLKmWbpBFNkjL2qvPMGikT-XW2IC6VexdHWTxcjp_WuVl1TSPxdYulB14rpd6VyW2fFZjRlDyPXS1ChNGLDK8aaQ5', 1496310708989, 1496310708989),
(103, 0, 'Xiaomi Redmi Note 3', '6.0.1', '11 (11)', 'd095d611', 'ffof3JH4iz4:APA91bFwGBUD5gCOnACmkQYmwHlQArgCY_Go_0ubUSCg2Lqu33OrCdYqioindf6-RYbV8nmqfq1U9_FJBQJklXsxErPYqI5GTsobsnJaCWDMbgY2Bg6yvyS7t577_-cUtHuYrUzriWbj', 1496379135495, 1496379135495),
(104, 0, 'Xiaomi Redmi Note 3', '5.1.1', '11 (11)', 'b8918f09', 'dtjp-WVitqc:APA91bG0cxmhjiCyErqZpDhlzB39J846RG776e8Lrrd4-29Dt06ZZXzk1u2ypdkybWnSw8lzCs94rbDwGH6JTCyUgrqaDxLOx6yzRqAz39sGm1AyGGqOdNOZi--688PgHiomNs_rqEeS', 1496379235729, 1496379235729),
(105, 0, 'asus ASUS_Z00AD', '5.0', '11 (11)', 'F5AZFG095724', 'd29PcRCt_as:APA91bEp-5TxTAwmeZTx7PEHdHUPrJVeuDhQlrMtoz_5HKMz-89J1IvWXubOu40kbCLf4jdlLFDOEmcqVv5ehJVP9SlY0FcQX_RZLMjpzzItqoxagPpAs6gHOAzGKmahWds6wJfLIKwu', 1496382381363, 1496382381363),
(106, 0, 'samsung SM-A310F', '6.0.1', '11 (11)', '52036e5aeeca83c5', 'fs3L3DKip_Y:APA91bFFllfZgxUtp2YlmMb7k2uIGPH93JU3LNvqprhZDc4vZkjCLueK7PJA8sX3wK7G7P2uemGVxfxgymrG7-1E63peu7MNZzgyvffUr_1BzGWhC131XUhI3nF6ZpRpKZrH_hmzGQlt', 1496386408677, 1496386408677),
(107, 0, 'Xiaomi Redmi Note 4', '6.0.1', '11 (11)', '108394429804', 'dmUcGfCIMTk:APA91bEXed6P1bliMM62oIRa40P4JwDYeeM2-R2W0JEo118qpxfZA7QJrtNTp-DcgQnnbi8yf7Mj5mL7p54rfWEcKqyPggslxabw6lt-CtT04AUtyJ9eAx6EEmphuyY1RIoNDWt9a0J4', 1496387932031, 1496387932031),
(108, 0, 'OPPO A37f', '5.1.1', '11 (11)', '5366a813', 'ecEQo1i7I2k:APA91bF9aMYFTZ7l50bvmcBqiiWsUQOZoCP0jEyEzdSHBUdXhOm_cbWF7QhPa2NkWPgIcAipXsta1YnEUgXgt7Ews0AcVkJhgKCQ8zsJpNtKs-uz9T3h26M4XPCpSiJGMrnLfBMh-be-', 1496388226369, 1496388226369),
(109, 0, 'samsung SM-A320Y', '6.0.1', '11 (11)', '5203d0dd4082c35d', 'efzqlKArmcU:APA91bG9d9VMwtgm0AJiz10L_uegYh_-8mPut1Op5mb6gpXmSX6o38DtTXIGsVtYzCkCdiH6e1L0nIZ-J5M_6D0Ixg8iVMvlMS_Y9Yc90kZIQzQ3k0bS6yEXFc3V26kTTgZmdi7o3M_X', 1496388302188, 1496388302188),
(110, 0, 'OnePlus ONE E1003', '5.1.1', '11 (11)', '44ae0f65', 'fT2DPlMi3pM:APA91bEo8DbbX9w3vO_2w94G_c3zWIdeijQwjabfJQH7A5CxYFtl3V4URXwxM4LSJg-cVz__QlEdY8CJ7NUrQD3VeID_AYG7sOJpIolKGdQWmaWgFRXB9NfD8KQHP3HLSRpUTVwzRQs6', 1496388429878, 1496388429878),
(111, 0, 'samsung SM-G935F', '7.0', '11 (11)', 'ad01170206a6071ae3', 'dLvfKR4UtW8:APA91bGvN5El5dYHwP0NOzfHXAADu8BUHQ8pJ8XdcaUF93zBP72XIWI-RwjMSehEMqNoTVmDLwHMY2b5kh4nMs5Ozf-vTp5xSRvXGVRxPY6_Qx-uwP9AX2dd3mjMOsWbehDWrKNaJmEh', 1496417607640, 1496417607640),
(112, 0, 'Xiaomi Redmi Note 3', '5.0.2', '11 (11)', 'GYUGHAYD5TMJSWIF', 'evbB3n5AY5s:APA91bFyWrFhnBC7cW19mjKp044WGYIUkSDKQ0Qews5LBpMZ-p51cGjzHmM-_Hp6frQH0eA6BmQxzU8SKCNy28M6ERs3xBgpokJiheQnL3_s0Yc74Y_2HTxxn4c0Wi1g2tJOnIJtp7uC', 1496726495894, 1496726495894),
(113, 0, 'samsung SM-C900F', '6.0.1', '11 (11)', '629cecb3', 'dR4ZEtEIY58:APA91bFQFep254xrqnTZLrW5m98uAr5dXmFx1duW5jpmrOweWFl9G7o25Jyg06qckWn5Ba7hWrAqjH5lWUJoXwPkK28rWRmW3uGR0pgjB2S4QYRwD3eV5Yd4PrmpKotQdrIrMlbEUsYh', 1496749152632, 1496749152632),
(114, 0, 'LENOVO Lenovo P70-A', '4.4.4', '11 (11)', 'L7BMQSUC7HBQRCDA', 'cS_d0mV5DzE:APA91bGwCvoeqdYX3iAv0kIVFBr_-UXbjwIua6_0mdq3u66G7KoaHkSJSn07Er7xj6wrFUWl54UWMOeq_GOl1qeAfMXdXKfivTOdmAB6JA28qLyRUV7RP4LbYSkYquPWHKGqLg2nZJCM', 1496752838136, 1496752838136),
(115, 0, 'samsung SM-J500G', '5.1.1', '11 (11)', '4631fee4', 'dyxe6IFrMl0:APA91bHTJlnuERAUZobfSVG_uiVF9d8ceRsIMYUHf8gNrV9PjYvXSTYskiQDro7pupcbF5e1kp9IoPavMRzx-aOV7zSDako9q7-c1er2gObLCPy_86DmckaqPbyXnAEJmdozorg8a-73', 1496875772587, 1496875772587),
(116, 0, 'samsung SM-N9208', '7.0', '11 (11)', '85334b4433443647', 'dgmwzNFL1bs:APA91bHj1bmZxaFxcQOuw47oDIJLXdmt5mpJJhLu3q0zlJUbaunmuEYWBAa_aSkjmJb8rDa2gZbJJLOa0ZX1WClW-EpOln7aty0IHiikufBAUiSmfgUd3Qb4oedCJGqmEwrd65Yr_oN-', 1496999555699, 1496999555699),
(117, 0, 'LENOVO Lenovo A7010a48', '6.0', '11 (11)', 'OJ6DBE7PHUCUR4W8', 'fhYZxM5RZAY:APA91bGelZPPp6hp3nbYcKHm3JGEP5FY_f4tgNdy6Yknbdyzo7y7i-0rKT_UfdDb3uhWDg2daWKk8Zb-rhfYhFhfDRlrUNTpEo7uyEwLzO1dAqYp1AlDiTBBARuSFlVPVtoZOxDog4wD', 1497002702913, 1497002702913),
(118, 0, 'Xiaomi Mi 4i', '5.0.2', '11 (11)', 'fb26e4ba', 'cSKgu5w0YAE:APA91bHNx882vSzBQJc4zuYVdjAdRjEDDZAXb5cPFku6CCpS2Wq3jnjVclJqMLbnrwlz5zeHqDVwQO7vKZsQA580eQtIL81QEC_hkosG06jfrqoNW4wZzbJjCG1RMlvYTZDVDivUjFPX', 1497004839685, 1497934195320),
(119, 0, 'LGE LG-H818', '6.0', '11 (11)', 'LGH818123095a9', 'fdkORSBtIXA:APA91bG7l8YTDQf6MxKN8XdsO_m5ZSgf6Cdhih0u6oseW4mpiI-_MHegyFb7vv29HhI6Bpjkrb2mytaXb_iuhqdSAwnMfF4Upegh0ZTjgUQSK-7o-cxJqpduaCMiLJvjT72kHrcqC-Ji', 1497141804248, 1497141804248),
(120, 0, 'samsung SM-G950F', '7.0', '11 (11)', 'ce031713330e1cab0c', 'fnDNF21QerY:APA91bFATUCAqFCM81JOrZfS_eiv69za3n12oG0rAfa2DJ4w9ksgZADdNNnLP-YFbptWKU5sdQKfaymJRjkNt0ku68nGFTkZ-cXr8OabTROqaF3FZQwuj8NXI5hAoB11H4auRyg_kIJW', 1497195142984, 1497195142984),
(121, 0, 'ADVAN S4F', '4.4.2', '11 (11)', 'S101X5A150106321', 'dN7p_V9SUl4:APA91bE3L_mzGL4CxY14xDX5OEhPzcsr211NOSU-2p1PNiNSCf0h7sVDLOmsBkZVTLlfD0uvoCT2pgSk7DkM7p1IKa22X2sGccs5g4pRjSOfqr5elxslvuhX4oSSdUFIB-ZFeoC16UJ7', 1497200239058, 1497200239058),
(122, 0, 'samsung SM-G935F', '7.0', '10 (10)', 'ce04160484c9393b03', 'cG1sSgULQC4:APA91bFa-KbDBlRaW4sr6NWghjmLGPxEfVOzzeZ3tQ_4L3GEqJglVzHrybROjRaPVKgYS5JlALJfrL2WDzxQEK7WLVIxPteA7HI5E7WooiRUhCjXEGZgrtY3HKlZ-9RXn-Z3YPbsZeBg', 1497230229258, 1497230229258),
(123, 0, 'samsung SM-N900', '5.0', '11 (11)', '4d005df0521780bf', 'dRFIYg6xBKc:APA91bGjDDPV-9w8IMvV4P3HsPn382Z42EJ7fvFFVuxtDZ6-DNz-yYGPlkRZyeHNDiWrSsRtiw0Xo_EVC47GUsZ1_5SWM5pScyJ8qHLYy0NMp7Y8HooYawIGMVNhoeNFF9V1euIlSscM', 1497245218896, 1497245218896),
(124, 0, 'samsung SM-G930F', '7.0', '11 (11)', '9885e64d4b3441374d', 'eCfCIKrulh0:APA91bHzmI3Fjdceq1gB6TtJ80vBE_5ttd3D2NZ44AFsEkxohJsODewMiubkHAcWzpP7Hls-1Lbchuj3CX7U6SttcBMP6-APjCCATi5siugZLuMx0JX1I1lxBeApiP9QN8l6C0P64MeX', 1497248669295, 1497248669295),
(125, 0, 'Xiaomi Redmi 3', '5.1.1', '11 (11)', '515577e67ce3', 'c5hQD00z4DY:APA91bF3Obr6SgauBwFAkuecfj7_HYSZ0t5Zp57CpJpge5G01IQexhc3793Rs1JO4OCxQzUbcids9wSM1WsoZi7rCD7S36AAXCmR1TyZNnz4AEQq1ytFTSHmf_Itp7PiY_Cu8hgPvKmO', 1497255961114, 1497255961114),
(126, 0, 'samsung SM-A520F', '6.0.1', '11 (11)', '5210e041c07714ab', 'cPOj6rrIjXk:APA91bFq4eI3quTYeSSvbKVzSHh1KQHRkSos__Jb-4LiX0CaCybccJR87DAlU9gulXd6maQDsM3cibNyLxNV6oFraRWhq6uFLsqbOoVNBprX2lLv4LZAgx2jKDxVZHd3dmjq34wahC1-', 1497257172732, 1497257172732),
(127, 0, 'Xiaomi Redmi Note 3', '5.1.1', '11 (11)', '5ae9256d', 'dtvfsXhEDNw:APA91bGs8gchOACR4j0wGfdXC_b1twJ6rRHzx7srkRlHLVZ71R1JqzGd9G8PPdcQL64ZjJLwIZcq6pAQmi6KCacdd8KfB3eC5eteOxeWd6aPfY7FIA5q6hc1hzydM16tYp6wv_Kid5RH', 1497275214773, 1497275214773),
(128, 0, 'OPPO F1f', '5.1.1', '11 (11)', '296470f7', 'elp9TJIsRw4:APA91bE-8_Gfi6aWVqMA438RYJMorzn6oGL_1B7Lt2SjZeP-oOXoQb1hEPkGaJU3WUcAz4mF5ocoqoYURyNYfEV9VbMhJv2MBosNAqMe1ap3h-NzZsfG34Vt0TM6Hv2IPXokzEPut24E', 1497280952663, 1497280952663),
(129, 0, 'asus ASUS_X008DA', '6.0', '11 (11)', 'GCAXGF00D563WK3', 'dWNa2yrow70:APA91bHrD2kIY1q4dW3gekAnwoZ8nubPaxlRvbNGwh6836xZLypfpNlXPOUsAHDLLxX74PGql8ugjy6M27NI-EIRZa4oG1bS95zXr0IzBytTH-iqbnpcoaJTSLRFB2vMgUk99crI2low', 1497331107048, 1497331107048),
(130, 0, 'LENOVO Lenovo A7010a48', '6.0', '11 (11)', 'FUJVIJ9SE6KVK7MR', 'efQg5hVW-kc:APA91bE4yjiIQlTM-XJGauhyNIFmvnvpx5jSHQSolc9DSR5KECp4gMYcELVHucTiIRORtrTE_UbVF7M65QMQvVa4XRj8xy44ArtX_0RlEbTDII_hLT7LvGJm-kiDdzBFe1orjT6mpWSI', 1497331499326, 1497331499326),
(131, 0, 'LGE LG-H990', '7.0', '11 (11)', 'LGH990ba176332', 'eDt6jo7eGS0:APA91bHnvBf-a-8A_UjfMk-zBBq_Y-h0JLoTKQAYwV3VREkTfrc6fmrbL3ety8HYbCycPGw_wFCi5bMowCOIXxsIvFEZ5ulS-I4SQbxGuAU8EVsCOhqHsCgXBoKFKqnwSWYlgU9OMX10', 1497333944998, 1497333944998),
(132, 0, 'Xiaomi MI 5s', '6.0.1', '11 (11)', '59fe41c2', 'ds13D6Up3rQ:APA91bGB1LBMd5jocaCwECNzlgFubnPsn0b99kImcP4jxZaO-Ten6bNGBv8vGIAF7P06hR6_0HmBxbbGI-RZqoE1T1Qfr951xO-_bEoe1AUeF9bc5RfFDkokWbrDZ84ei6FrCawDLnBD', 1497333991374, 1497333991374),
(133, 0, 'samsung SM-N9208', '7.0', '11 (11)', '83f0304a4e345846', 'cTNwuXhXEnY:APA91bHzpvQlabnuzTqA6XRWsXFvQ19cNNAVpUlBU6iq1VdRdfrAlUspJ_c-xvY7o-ZVs2hdE3gxxAaZyxFgyFg0SJ09AP33vzBAOqUj4C0ZzIXq6KPsCwHi--Nlu4Y-4QN66VgexKqp', 1497334006310, 1497334006310),
(134, 0, 'samsung SM-G570Y', '6.0.1', '11 (11)', '4200c198fe79b3df', 'fbB8HSN_BH0:APA91bF5XY_uG8qFTtbmODJiBHcWM_NSb_cyuFTvtmyyNNiJmEyxLeEa_FXiPzRx2BUOnprjXxr5fQMo_KUcwhlzYn_L7TfazOA1Q2sXKvjuw1aL5X6F6xqT5P2UZbkEAoTagv7Dfv4P', 1497334018549, 1497334018549),
(135, 0, 'vivo 1611', '6.0.1', '11 (11)', '3c5de099', 'dfA-gNhTx6o:APA91bElzhbJo0_GMSXEw2CxIaS4UfTaEFtjZeqrezo74Douxd2SttIn6WLX7txxTa0k8O4Mt9wMsNFQka5EQYTH_A7S232-m1zQAvVMLN_6-JyBZDqj8Wf-dQ8D95vSLlTN66AEK2G6', 1497334065001, 1497334065001),
(136, 0, 'LGE LG-H845', '7.0', '11 (11)', 'LGH8451fab352a', 'coqo8687ayo:APA91bH0s3J9AEHylZoAJLgVPbQIfe6jRDI_14AYavSY6TaqLKP2-lQMr4zol2scqWklg0ESht1oOGPTg3xKk3cYRV4gCooRYhzOGa9P1gXseqZJnP09tcGCHNdAn5wBx1gXh_CC2qf0', 1497334089320, 1497334089320),
(137, 0, 'samsung SM-A500F', '6.0.1', '11 (11)', 'bf4a5669', 'dhljbJf1OME:APA91bGYYFQ_-XRtyjhivuUlPxU5ce20qNmM_0twjK9gIVbtCwPTh2eSAeMQeWQtceMXqFVj49Na0K8ND1vx6K0NzDf_XeFy8hGHYY8JUmrmXsvVkjKv46YWWtXBeRfAt0KJu_WzqXWt', 1497334115923, 1497334115923),
(138, 0, 'OnePlus A0001', '6.0.1', '11 (11)', '625ae260', 'eEKB2SmEZVw:APA91bHVWA0J8nuMVENYYLSUTkwrxF2c4nd9vgM3Xuunl7r37PVG5SgGPpFcJZ-szMWFvxaegd1wF5lgJw2KWWKX7odhSRFkHzeEY_BAzuFbK4ipMOd9nDdByxbp9os0MAwKVfYuU8mL', 1497334135703, 1497334135703),
(139, 0, 'OPPO CPH1609', '6.0', '11 (11)', 'T8DM8DRKAMSOPJ4L', 'eVUHF0RmYrg:APA91bFly089ItdVFMhTBXGqg1FR6kRmL2zVACoclhw0xlrQaiovxQKmeiPFCX3OrQmM4aH-vcimcmr5XdN8CH8lrLRJEvVB-LCYBVnPJ_iS6O7Tsfypkp1fsoirgNB6y4vv5l_63kC5', 1497334175241, 1497334175241),
(140, 0, 'LGE LG-H990', '7.0', '11 (11)', 'LGH990f2be14b5', 'erWZ1L18EII:APA91bHRGYK2gSwgUQJKeWLq1d2l-yXv-Ud4sd6pQncpdjKcNjfG43-3wL5pM4Jd5fnS6HQZsOfI2yrtZpYBuwFsyHvYO9rlRx7QDEMeInbSQqoRkGi1OZDromzTD_-sp3rbYFyp1MIZ', 1497334202751, 1497334202751),
(141, 0, 'Hisense L697', '5.1.1', '11 (11)', '4218ce43', 'cUpw7aa-erw:APA91bHSFLUq5zBVRcDwFgDOqEZdYT0n4J-J0wtSvhpXRvo0iVNtSt9pMKxiqDvL6mo0gToinjewuV8MNEB3qIvHRWP29E410RYyXQMqZLFLtbg6vkRI-nxVFQErWNKAxEJtYfx0-wa8', 1497334220191, 1497334220191),
(142, 0, 'samsung SM-G930F', '7.0', '11 (11)', '9885f7524f39503930', 'fEIZ7y61ojE:APA91bEW00HWBZur7WJPwiyLk3Eu86XC1MNkuDXjiDmQQIoajpjb5Vbii0Vem1fWtZonz4Xriicy6vsj6cdMkX__UNnuhHbu8Fyt2qhSQ5qCNbcDWFYXVSPdbk4DlexTkFT-V1SKbIcU', 1497334220248, 1497334220248),
(143, 0, 'asus ASUS_Z00AD', '5.0', '11 (11)', 'F4AZFG162483', 'cTu1hN2ZpAA:APA91bH64sVKoa3GyW5JzZBMZ5rDykRKnE86AtfcIYgDcf0MW53vWyUKZJvsVtL5y-HmpAVnecjcWPsQshsypKtWMGicZXaZIvepwdSnnGoqCiT6PpuF3aOHHvAnluaWmNsWNwBXlePB', 1497334221917, 1497334221917),
(144, 0, 'LENOVO Lenovo A7000-a', '6.0', '11 (11)', 'W45L79AMONSCKRKZ', 'cjZDdw15t0c:APA91bEA3u3Q-d4sbMi2_vaNLJYiFMZSrlOAeMUjbyzI7qYCrUMLYMaiU5CMwzJVeoK6YpQun6mMxUmOWxnDxBafyA5yX4i4KvQpVMqyvvKH7vbG4t3LW0vxDvOKvoKNHBuGQkZx9kMH', 1497334229910, 1497334229910),
(145, 0, 'samsung SM-A710F', '6.0.1', '11 (11)', '33009a6ace46a2a1', 'c637P4OZis4:APA91bGfd0D1zUYawarUyQYQF2UL_QljbeotS14ATCGLx2SXb6P2qUXMkr_y0LYzYi-vRPE7pqNc8bSUpp6l6mwKLtD7IkuY6TqnoBQvpv9TcyX-EoI2w1CUD96CroS0hIMDnDeq2g2L', 1497334239706, 1497334239706),
(146, 0, 'Xiaomi Redmi 3S', '6.0.1', '11 (11)', 'e4c9e0617d53', 'dyaUvSDVT34:APA91bF-4DqQFgZT69xPeIbhOBBD5VElYbk3b5ryJyVXZYP8np0GemlsU4NuOpsXFx2YFMvY2sivPSz2U_RsW1-mNE7BOHJtWqAi7KB_kMejuZsUJZcMMsjMksUARTB3hHxjKblfHXH6', 1497334279370, 1497334279370),
(147, 0, 'LENOVO Lenovo P1a42', '5.1.1', '11 (11)', 'c01fd8bd', 'ffPzzDhkhSs:APA91bGW7uEbwviEieXrMthBBH5rbpQo7hV5lEEjMdVSjEHTI5kDOytBA1sM7dy8oK7T77rTvOic1T71Q9eEABrwhqvOyCNGHXVid-MOhI5SzQqzmtyutUy0QVddNeQZQ_9DxPwVOMAk', 1497334343553, 1497334450860),
(148, 0, 'HUAWEI VIE-L29', '6.0', '11 (11)', 'YED7N16A17000929', 'fhx_KSYNM7U:APA91bFSeCOBs9Loal7_6aE35zWa9BBnRL4-NREugfqACEjAN89unOR3E41UDMKx0OjaKDQUwBONzAEKgP36X7DxO_3N6HKlSaG0Hb8AsUxpJHZIXly8fDZXb2iO75OwyU-xHHQDCR40', 1497334431932, 1497334464624),
(149, 0, 'Sony D6503', '6.0.1', '11 (11)', 'CB5A28AJDR', 'e44G8MbL60M:APA91bHS3-z05gPT7sHa1ZibjjOwuYV-j95di4lOPsI_j84E2pe3mSX7JGe9Qz4tDWVTpuB555q2eXBo_DD_IfqpB0ya1e3_lBtYHE2mLVouSMbid2CJeaF5TFxg-RD-Qlj-ZyxjIT-Z', 1497334439737, 1497334475639),
(150, 0, 'OPPO CPH1605', '5.1', '11 (11)', 'YTY5LJ5TRSKVDUN7', 'c6ULknRp41Q:APA91bFRM22JpikakDd31tNdSlynn87BZeDUNmb1Q35gFoH9QguJHbOgP6HQJpmDo7kfIfaJQnOM1HWBnQWltcwynw2fM6nxUCxPZ4W_iC-TnMvY--5vIOW2Ejrk2Dyyh8E1dQ-bhm2o', 1497334440331, 1497334440331),
(151, 0, 'OPPO X9009', '5.1', '11 (11)', '45QWHIAMFAM7FQJN', 'cZKZ1NBkfXk:APA91bHEiN1WYzGRCobTBkZcuJP0ZUEAr_OiSHpyaoA-60fCsaFRt8xn5yQ-dee1TYjvNzIhtSJ_PyhcBrXVnYu-xkphdxEyGXwcVx47ERbsafVicfIpzSTR_ZHrzO3CVa3YUHlvGPj0', 1497334515842, 1497334515842),
(152, 0, 'vivo Y35', '5.0.2', '11 (11)', '579b0da0', 'dUejxZh2Rrg:APA91bGK_DyKQw7Zo2_EP1eK2foF2dEdzkmPSTt9j3M8kVWxAQkK1QcgGmhjRTm09zidPkP3T7ZXWm1uedI_3Kw6J4XCLcCP9H2E3RhdZjPSMLj6xvWnJUe42rDtpB4GhQzbhjwADGLo', 1497334521075, 1497334521075),
(153, 0, 'samsung SM-A520F', '6.0.1', '11 (11)', '5210fa7dea3b143d', 'dIPoFsswUIs:APA91bESkfOcf1EdWhBPA6HkMbHHzDnxcTbSKHAXht5CDRMkWZ2iyXr3DySqqFdtHfg8YpVzMjwuGlbC80Z1whzEonxBWbqumRsdVr3nVuKm2wi4F62ZNNLJXQqI-TWijY5O-aVijZlO', 1497334539676, 1497334539676),
(154, 0, 'Xiaomi Redmi 3S', '6.0.1', '11 (11)', '3a6190f7d53', 'fi0p7Vj13eY:APA91bErDyrovsnAdq6c7eiPxeFb_kBHKLKvK_RPCU2RDmRqsbZqP0cKgjxC_NiZJGWmQ00LvJvcI38fPXSyw8jl-WdPX6axuT-lgKqg-BIlsynRGL1FPc3dDJzKQvx1u-xl5_9jJNTo', 1497334554782, 1497334554782),
(155, 0, 'samsung SM-N9208', '7.0', '11 (11)', '1115fb704ed80a04', 'fTq717NJ-JY:APA91bGWH6FH8JfD0f7hMPjqcp-ozkYSw8HGdfArCK9WLaqAX4Oxz_pr2POlzZrUgXgmDqT8Z128DIMC937BbuJZF8fcQDclHClm7Q_8XFnD72QkxhwgY04pSjxv-1gPRdsN-iW9X4g_', 1497334555995, 1497334555995),
(156, 0, 'samsung SM-G935F', '6.0.1', '11 (11)', 'ad08160330e91d1a2c', 'fmf1Dh_G2b0:APA91bFxoxrwPZfknTMb6tlxVfNDKYYJzeANCTgCE4pqOml_kMzQ0QgmAV9Bz3vd-dl1HIGP0osZPr_lOizuN8sSIUnp4z6OB2DUS-QoDP6e5dSNI7CQDYUtdGTMzue3u0lrWEAdIpRs', 1497334559361, 1497334559361),
(157, 0, 'samsung SM-G935F', '6.0.1', '11 (11)', 'ce10160a40ebd12604', 'd-XLr12BUoc:APA91bFA9kZCcWl3ndL0A8eeSJa227b_-TKawYm25vxG8FSapVBoH07g2JeEtAV3DCAsPpgqdKYdBMgRyTRIsyHBWJ1D8bEiGw80n7725bM3Txlp8cylpNTexGolLhdiLOgllxOaEkwz', 1497334564951, 1497334564951),
(158, 0, 'samsung SM-G610F', '6.0.1', '11 (11)', '3300b041d1b193cd', 'ewFei53xCVY:APA91bHW86F7Ru7suUrJBTlELRz7aUNH_Z-_xC8bxtiOaE2R_vFvJKZoCexCFJprQdMhD-9G3xbKWUJj98MPeQzuoThZyUPIQypbcErwEkOU7-_f34z7bNKU5VOUoY3dRSiJo-IMQj2N', 1497334576870, 1497334576870),
(159, 0, 'Xiaomi Redmi Note 4', '6.0', '11 (11)', 'AIIRKZDMP7IRAYTK', 'dDiNDMJhPgY:APA91bGPPsGnc26tK8PtBk82LYiLfAI-FwrRjVL_HFQmfQVb5NlRQQWIGhaLLwPMaQg92LmodKQp91FUuzI4mQJTE2eHWj50O9R_jvmPiUyXyJDHTz4FelaAMizdrbDBYUmFtttqfljj', 1497334585740, 1497334585740),
(160, 0, 'samsung SM-N9208', '7.0', '11 (11)', '0315353031383631', 'c8EoFkZQgac:APA91bEKgWIklUkHmLNCQyQ6yPcz4OeniaxTHpSbTmdlYgX8nGtdHwNpgF_1OBK-h7IxcyclyZL5djVp6JDVtJRVCGdOn3KdLVdIDhyfeD9tizgDf9pudTzRz6lRyvSlKMzRAKjvoqpH', 1497334590953, 1497334590953),
(161, 0, 'samsung SM-G935F', '7.0', '11 (11)', '9886674242524b4544', 'eDZosDeOK28:APA91bEk6FnX5nVno8oOe6302BNA96bNmzaWwwMIpex4dwDEHaG3aeaSgAAiCNMMspsqJloWhIdNhDozmpUOsBorOx0g6NFgkNOft05mDXkwWsaPjDd0W1J5LBi7Rlh0xdwg2ox1lkcR', 1497334604584, 1497334604584),
(162, 0, 'samsung SM-N910H', '6.0.1', '11 (11)', '4100983fe4749163', 'e_KDDF4P9IA:APA91bGm6U45aYBLlL37VscurDmDMvZsaMGdZuDcbR1B6iY1PBJbcOsSn6pWOjcD7R47kO8OauXOqA5ec7wLFq-Fnu6mMixXFOEOsgWX131O2gWWRSal7mWKyBYszkC8aGDz7Cs-ciON', 1497334618270, 1497334618270),
(163, 0, 'Xiaomi Redmi Note 4X', '6.0.1', '11 (11)', '8dc4d2f29804', 'eH0E2rxrKIs:APA91bEYU6Hl2UGCpmwOdmseYeiSz9HPKJxf63i41BA4yXTDlmd6gSgZJjjndzZw49zpj6POKpITaS9CcVC_i2KM0t5ljN-aKpMP8IIFQpeYm4-gi11ilG_7lSBfQbz4_36YDuUXgjlo', 1497334636030, 1497334636030),
(164, 0, 'samsung SM-N910H', '6.0.1', '11 (11)', '41008719e4938193', 'd9DXAiD1tSQ:APA91bFbmL2ZqPXUxHJU984VkQOUXoHUSZDIqOVvHEdcz3YqUVReHxl3s_zvqBGmWZuYQ2T16RhKwRb90kEfgCBmNfeuSiIFdk4tSLG5Dm2AZH-dcjRjibDmTXwlAyi56XlsFhl5QiFd', 1497334637938, 1497334637938),
(165, 0, 'Xiaomi MI 5', '7.1.2', '11 (11)', 'e787b887', 'dzQGVoMUQuM:APA91bG8YswLjn2AKFcMIFfwxzxyOeH5B4ogI69y29xgwmLr1zbnKHU0fgLJH_DGTMDBefq3izXDcbPz1uvB4FkcIeiHIvkLLCcOaQhWAq4CVQx368bQJAhY36TYtaeKvOq3BfjPmo8l', 1497334640017, 1497334640017),
(166, 0, 'samsung SM-G935F', '7.0', '11 (11)', '9885f332483552594e', 'fJoMNEdMUQY:APA91bEPD24sNMtFhPdbj6wTv1coTEFFGP1kb7c4-MCsUUFv-aDwccujBVEDY7349AgL1DUuB8VyYdf8gbdzuQ199naaZWjOqu6AykH1UcfVz_0uZmY49MBP-T7VaKzqwktaur026IV_', 1497334698184, 1497334698184),
(167, 0, 'Sony F3216', '6.0', '11 (11)', 'WUJ01NRWMB', 'fXCqli5d2JY:APA91bFPNgTILrL43erPEz7YD-c96HnaPpM0SbrWfHK3E3sTDCBIf0Rq-BMXnl9yLwdte8qHpz9HmbYSCCt0H5O4ehMWeL8IMSygKNuWOMnUzhdwGOr3LfAQIT8Agw6hAkrw7WvUdsot', 1497334705555, 1497334705555),
(168, 0, 'Xiaomi 2014817', '4.4.4', '11 (11)', '3a254f3', 'e9rQXNlRIgg:APA91bGGiNBHZ6xP5UOXLY5b_AzPg0oGkFB9BfuyHQq68fP3AtgjXRHAD-eCplHaMi-4kcmoA2-VYgliUkY2nujhRQnV0Nl_WoxNjD525rwhXFF--wVA46g4itXcjHHIB-CkF9RLys0v', 1497334705828, 1497334705828),
(169, 0, 'samsung SM-G935F', '7.0', '11 (11)', 'ce041604a28f963404', 'f7ib0lLAydk:APA91bFzNk_SKsoxYV9Fq6jgCyayZ32ZWBvkmmYydx8tnQMvqiFRwVVDFZJDvil3-L1gsRusDK3wlRV_2QG8_Dtt176QSzTZpJ8Zypp-6J5S44TmygRXrcJe1MznXa_tw5crmcg4D5uN', 1497334776960, 1497334776960),
(170, 0, 'samsung SM-A520F', '6.0.1', '11 (11)', '5210ea37be91b365', 'e-btpHzNsRk:APA91bE4ffOA_oU6m9wWlyaumAor2UW0P3OThHYAvKSNRuVR4G5DAXmtCYRThUI0qE2YPAdQDYpwZmdFavDUEj2WvGiYOUX4C0TZCUP-5dgdbJGMPg1GBXyGuytSDYjDHE8xrlfI-xiN', 1497334795214, 1497334795214),
(171, 0, 'motorola Nexus 6', '7.0', '11 (11)', 'ZX1G425HRP', 'eGnRZ_mf8To:APA91bFB2qquslIECBkezB0jkXKYt_F6WCzjG6KUWJynZyk58aPLsodDLl9cAfeXgQIZX3NVccPd2xKCA8u8Tz4wGuTQ8XfuegZJV5aU54lH97avyHSCFEYy02aby1jQtIRIEkVVLWyE', 1497334841821, 1497334841821),
(172, 0, 'samsung SM-G920F', '5.0.2', '11 (11)', '04157df43073e509', 'e7nCxvQxK64:APA91bF6vDd3YVZ994wUk-t2qkDTJ2oejqpEXG-8eO6aEIxy8aWmOJaJMyebxkt_7WcjYSYcjLybqocmZQ5_ALU-OZhhJ5Vc4UrA1oepreTq9ZHXFKP5lNYAqh1v6e5JC3W5CD9ryuRS', 1497334845701, 1497334845701),
(173, 0, 'samsung SM-G935F', '7.0', '11 (11)', 'ce04160468cf9b0304', 'dpQxOmOkue4:APA91bFPmSfIw2Q4bCyZONVs2IawNL2rJah3QDTUxEK9Z5VMShmRcd-pY5CrnewRhgM29ibLjX7XFdwqRHzEnFjQPufnCv3H5-0tGy1RMFMYEAtKRSUAzqKYfB0VVphn8aUdkjDEZYxB', 1497334856478, 1497334856478),
(174, 0, 'Xiaomi Redmi Note 3', '5.1.1', '11 (11)', '1d8fc537', 'd1ZfSsr62FI:APA91bHnVLRCQXP68j50lY68rFVc6ElAa00gMyxH2a8LPuZf-UJsH6uE2-Ea30WmQt6rpDhXq2CGkyo1ov1lq7jf6ky_v-5sK1r6oqb5bGHhphxlStE-H3146L_X-K-YqC03Lr-nYvgp', 1497334862735, 1497334862735),
(175, 0, 'samsung SM-A510F', '6.0.1', '11 (11)', '33006547a103b217', 'eoIGfn0_wUA:APA91bGEC05SHyZc7uo6sAWQRpw91PbyTdMADQA8-Zp8vyUAtDnFIXdlkuM0E3j_NFKPv8fT4JdYZj8KYFZkKxCzvXyqauUdO7HpQnOJ7_v3kiMFUtJn4Fx7tchEiTNKZ1s2TyygjPUI', 1497334882119, 1497334882119),
(176, 0, 'samsung SM-G920F', '5.1.1', '11 (11)', '1115fb7162692505', 'eN4ReMT1h1Y:APA91bGn1KM2y2b97ytcoQt5nIzLZ2ZjAV44ojA_eYPTkAsZoC9V_oTrnIXxM0yp78-tM_6P7w-6sBqjpv8ppW5WZF55mae2mmPjA6xbPEyiK6wvD7juarsHBW-c9qYLVIC7YDYuqf_h', 1497334963196, 1497334963196),
(177, 0, 'samsung SM-G935F', '7.0', '11 (11)', 'ce0416042529160302', 'cF_GevvRyCc:APA91bFD-tBiFFKU6w6uKozN-c3hSwI4eL_yPeopYZ3tazrwHko7Qg85MjT9pGmVPT-_DCb-cn9Mf-6A_tckscOljPiJ-zWB16PJPNB7DPrb23glCSEAXpPKtgMzRnvFjpQiL8uS1RqJ', 1497335022789, 1497335022789),
(178, 0, 'samsung SM-N910H', '5.0.1', '11 (11)', '4100e423f2df9109', 'cOMlr6s45DY:APA91bElRUZuLUN6hNoEiizdmkEaOAx6J9e7TUi5Q7TnmHeeAUx_cIu11HQkIIdoh5CDP7wT-IFRSF2Vm3_mZuqYu8DRNRCZENFF8d-QBjSjE0rDX-MmPrD7D7ML73G8Ii16r1txh8GT', 1497335028617, 1497335028617),
(179, 0, 'samsung SM-N9005', '5.0', '11 (11)', '10a9786a', 'cwg18sdVLzE:APA91bHaFQdu75fiVwgYPJWjW2C21tgFTx8VDLo1DCV7_B4QMU0WXLvlLdr2K1BeG8E42QT4yGbqtsego-ie79COCTabjSYGTkXzYZo9ZXiWNLis0tBrpf08NIyDm2BV67gZQm3eXMt7', 1497335063242, 1497335063242),
(180, 0, 'samsung SM-G920F', '6.0.1', '11 (11)', '02157df28c490820', 'enGIcHAwaUQ:APA91bGWlgpussJ3nyeMDj_d3e3U2poVnXkwVPvS8gJrvRemAu8Ar0Ufx1230cdxmWGJl4uJhXyymzpDcAK1KY5VoHgPif8Jm6eSq_CFmPHJ4CxjABcdJiruN9vuDgWj5Br0aQxbtLWc', 1497335102431, 1497335102431),
(181, 0, 'Xiaomi Redmi Note 3', '6.0.1', '11 (11)', '9f22c00e', 'dCyhJB4J68w:APA91bHpJAwUDryqabaA46Ju0ZXGUYN6KZMywULRDygg9QhYwnU3hqKCYwPRVnOxCMQ6UFieRa84ys-ymR78gzbxMXKy6Vg0Mr2VpyPLYREOBSjAEqjUegTN6ptZVd1v6a5-Q4dRogzR', 1497335211454, 1497335211454),
(182, 0, 'samsung SM-A310F', '6.0.1', '11 (11)', '3100e0d18ea132c9', 'fG3OiLptqOg:APA91bFiVRK8C-2KDs7lxTNCE3FsOwCLrTzQm-VCD2PxqGqNkX9FcQcM2cnv7kRwYAY5Mx_VCp4RAkgB3KPTvG7eiTlHYv4m3tfPrsBMI49ZdDOR82Ll8YDe-WgHrf5I2mUHkoRv9S--', 1497335244638, 1497335244638),
(183, 0, 'LENOVO Lenovo P70-A', '5.1', '11 (11)', 'LBMN8995SCTGO7PR', 'euIS4ej9iuU:APA91bEdzzXEXW7329bSscoxXecjr6CurjwqfP0H3QD0K5mZtZlCsLj-GAUXBJU8Rpez8MWEvWHM-wHulp9CBSWbby_HexJ9Hd-RU_R7Udewn-xaJ_geZuqROpfFr20uk0TCkQ4ThaBU', 1497335348071, 1497335348071),
(184, 0, 'Xiaomi MI 4LTE', '4.4.4', '11 (11)', '5b766131', 'fOUfAIiJyCI:APA91bEnKQkP4FYqTof2eVQ62_czEwoqtiDmqgk1xJWUauZsEvuYAiqIKSCjBePbYMPrLtDDLFFQQAg1ffm1KEQgY8uA3534M5ZjiFkq41dXInWJzeZ3qcTQr7ZlOL-GF11Hd71-aDIx', 1497335403997, 1497335403997),
(185, 0, 'samsung SM-G935F', '6.0.1', '11 (11)', 'ad07160328acd59302', 'cN8QyvteFas:APA91bEqStZfmPN9FCdAwtiK4md5uiNzZQTU1fcL7H_kO6l98K-C0P8hPOFwUc0W7Vaw4J64GaiMF746OZV-7bHEXrRW-zbU-35wXUyLsqcZOhc_qhYP1GU_k9IOf2g8aT7O6y7Ki7jV', 1497335623396, 1497335623396),
(186, 0, 'samsung SM-N910G', '6.0.1', '11 (11)', '1b32d821', 'f-pfTM-Wv4o:APA91bF3Aj14ckHWgA9AbL9Bo_0dEFeZ3paW0K48C0CZPnnfumv3AbMrXddjLIKDi7echcDonRRcIDSQsyMH3H0t09ixmggSag2lfeGeGWMEtLgA3Az9ENcP-zwkqIYFl4M0dyFlYTD6', 1497335865547, 1497335865547),
(187, 0, 'samsung SM-A510F', '6.0.1', '11 (11)', '330082adbe2bc291', 'fFGnx2aoRP4:APA91bEGnbMbjIsfD80w7ee6V7rbH9z1JWUP-_ZrroWqQiB0iaFbg2nDSV3vNr_LjXU0OTSZVholsTw3TO9NoK8B_zmS_vVg8wjB9v3FDoQ1u0vvsQCalwYxFnxmrgY9FU_wOpYGgBGP', 1497337005000, 1497337005000),
(188, 0, 'Xiaomi Redmi Note 4', '6.0', '11 (11)', 'AAMB7HEYD6USYSTO', 'cFGn-dIn7QU:APA91bEAf4-3ehsZuEsENLvrQ0bxXEkMZFdfdF7Z6CLGUzV4GE2Nnw6aC39KN7loR5SLT6r2M5XXkLVCn6bsLU8-RY4eywEAAz16WeZMAfUpwm6fTe8YI1fgW6iA5wolvvBmOiead0d8', 1497338175663, 1497338175663),
(189, 0, 'Xiaomi Mi 4i', '5.0.2', '11 (11)', '6968d935', 'c6ZCvpU3Xs0:APA91bGFzI1AtzcyS9w80KEvKlyDo1MOLGhiaornZZoAahMWvjHN1BFdaqHWio2spgpBHL2-lUgcpgx013sRb_I2kAYJ0nLwX7bqX2HohSXLtWyqmOCsvBcp3Ump2LZmNGds4uXwJzCX', 1497338392441, 1497338392441),
(190, 0, 'samsung SM-N910G', '6.0.1', '11 (11)', 'd1e165df', 'ePyCU7lDjaI:APA91bHEowFGRwDoIByPhCtm6Abxa8bQsQXwuAUomO97JovEDt0IuZAvLFf9RkjGX3J3G8kBuq-E0CaBlQlpK9_-CaAGf3cwD2-Z5wNBFprPxrKdMHz-J12tuChAFfsj7yXsBOhCqu7n', 1497340531477, 1497340531477),
(191, 0, 'samsung SM-A510F', '6.0.1', '11 (11)', '33003962496b4371', 'dWPHw8rZG54:APA91bEySRddggKFbefs68lZ31VN2tHZtipkI1wttsUQfhMhtIJGZJGlnI-VYPtz5Y4nAZHQLrNGwSo_VMNFHrWsaFbCy57XFmYqA_IpmFuUv9MWdFC1vuZ08n1ElTjsXPT42yUrV3j8', 1497343166518, 1497343166518),
(192, 0, 'samsung SM-G935F', '7.0', '11 (11)', 'ce10160a40fb911f04', 'cSOs5O5rPKo:APA91bG3bs-Zy_QkcCjaUxiRenFLI9Pch-ZTG3AZWQFbYrDko4HBjkGEYkBGzcRqL_fKjGuq4A5j4oa4aRUsRZ5OgKv3WKy4xVTEEpmxEcG2g5VwXTI-lVd_4DWWIuqXPvpjzdtvZaJ3', 1497343904349, 1497343904349),
(193, 0, 'HTC One ME', '5.0.2', '11 (11)', 'FA56HB102379', 'ehKyOXJXzII:APA91bFl_Y29V2Z5j87LDvCnE3kKfkT5iLG1k-L0ryg0kO-xX_4MsTq4K_k3iNcwaU2e5t5c_NwuRsiLxgxMsaCnOiP7w2v4nqSm7_0CZJ3GFqbpHKV4KSx3q6l9ExT-j2yNJABA1FqR', 1497348636292, 1497348636292),
(194, 0, 'samsung SM-G930F', '7.0', '11 (11)', '9886674e54414e3155', 'eusp6zxaQug:APA91bFbv1vrEeWi6hrAg3701N7rwrR0bygPNNo63YMXnXvaSwfUYSN97wW5rJ1wIdQbA6ci6s9Vqxf6BT51fZqZnLCQBY0O-oazYn4Wj13WALOwgoYVSnFcT07t2IrGdoVfDg8hJwBW', 1497362240166, 1497362240166),
(195, 0, 'Xiaomi Redmi Note 2', '5.0.2', '11 (11)', 'I7NZ7HMBAAD6UOOR', 'eTLSRi7PB8I:APA91bFrDjASx-payT-OUQkwoNr8Vpdo7Z1D_KmvIO1FX3Jkid4Up4lMYvN0NQI6cm8HTLbQzAXjJZgxt1vOrmtGqIcZEtuPrlPS7dxeYSpEvcCmbXr-dOulZcLoR8nc7MCZM8n8a5e8', 1497404267881, 1497404267881),
(196, 0, 'samsung SM-G920F', '7.0', '11 (11)', '03157df3d946552b', 'cTsQ7S2qg0A:APA91bE-lqJyjYALFdqXe0-mabmfiFDDCC3YbSlSQzHtlgiCwWBNBqBa1bExi1iPdG4JkMQb_epuACEHCbkgzH_W4yXyQf69mMEGDiGlKZyZ5Oe0h6Sv1-r0x7irxCyJZhH0I8cmc4K5', 1497407826061, 1497407826061),
(197, 0, 'samsung SM-G930F', '7.0', '11 (11)', '9886334b53394a4b32', 'dzuiGeUBEQI:APA91bFdnvMuZ6YcfNXTlfFmLhfW5cDU2qIEEDAQfzQfEwcSh-_XyO00vNYrRcUMbc_TSTxNR-Pt-i9WOI99lAQaC48LhLv_V-RpwaP5yeDnT73SaKE-XlOlED4fGxAD-e7S--qafUhN', 1497408221688, 1497408221688),
(198, 0, 'asus ASUS_Z010D', '5.0.2', '11 (11)', 'G4AXGF004217EFV', 'dbC_wLkv53g:APA91bG3iiP1lkdX8SmFHMbvI-OqlP8SMyC_uunioyEoNJSHImCFFANQEoFjmtvMoBVxkWoiv-adfKOh6i-L1Xl5vP1eBRQjxkyWUxJhghzWott-HVtyigTZYhAPUeNaChyJMqafTuT4', 1497431764333, 1497431764333),
(199, 0, 'LENOVO Lenovo P1a42', '6.0.1', '11 (11)', '7dfecae0', 'feYzne0T-y8:APA91bF6jn55kvoDCfE9HU8P8FTSG8_SjwE7Npbw846YYOUZrUJj0T0_jFZiyxzLin1rg-G-MX_hBtyhraHQdBeXauC54_ZTa3zSzCIS5iKPoxSTYVCYts6q1itlDJtO3x3PSmU0PYSZ', 1497441053727, 1497441053727),
(200, 0, 'asus ASUS_Z012DB', '7.0', '11 (11)', 'GCAZGF014182CBZ', 'euGOdxBAZOg:APA91bFpmcJNYrcHgI_sQBUbnXMCDIbaUGyz4IvMsefSCv6OaCGqp1oeQJ6A1ndeKa1tEzdn8-_EsFa--5P8M3A0-6LGn7YMRiz3-E2eY0tGBcEyftTOK3hE0coCTGdhOcI_JwyieTl5', 1497451230338, 1497451230338),
(201, 0, 'OPPO A51w', '5.1.1', '11 (11)', 'e72af2c4', 'dm-4n6-s5zk:APA91bGcQwGcpOwPEmQDNyYPADrT-ewMO2C1eW_mQMGXP89L1kNqajn3l-WZrHzkTBnxv_PEzyQtmYJ6Nr5FaoWWgup-LdUTr85iGCx_34B2ayoOQGVPPPD-vlv4n17RfTQfgmWzXJmv', 1497477017106, 1497477017106),
(202, 0, 'OPPO A37f', '5.1.1', '11 (11)', '3d74036', 'fOAgDsXNP_M:APA91bHK4I5IZwPQzVZoEbvNBSqQVAwImtQeHnxFr54U0YzjpOCDRP4vO9ZKO34mrMyiKSor0ImpQT0o1uw_E7tUwJzn4Xjd-dm4b2saRXPRXP9eG9hhMgCmrN66VECa9NAMuh-fYi7g', 1497501914330, 1497501914330),
(203, 0, 'Xiaomi Redmi Note 3', '5.1.1', '11 (11)', '500b410', 'dT893JBM1ZQ:APA91bHJ0R4A8XM-LNEC-H6sV25xEeonrbTbLFw64lma7u7qmhq8dZTf-oTU3cv5iCNol9mPzMFvx0jBkwzFRXhvlqXlCt1UvVEKq95vdzisvlmrFj-oVNqtQK9C8yJLnTbxwEiil05Z', 1497504145148, 1497504145148),
(204, 0, 'samsung SM-G920F', '7.0', '11 (11)', '04157df4a86b0238', 'dEbJ84sCuoU:APA91bE6hhW9uHYk3a8C4jWqUcif4p1XOPKZfCvNNxZN7girsl3nLZr2WHcmfrJANPg-ZyjIUp5HVYudBf7Mg3pI2-Si7CXWlZoa9_O2R5c5OxTXzfchWnP3R_pYdFlFs3x1PHkWsVan', 1497505153787, 1497505153787),
(205, 0, 'Xiaomi Redmi Note 2', '5.0.2', '11 (11)', 'E6T4SW8D9PLFZHJ7', 'dxp-_E1kKl4:APA91bHKi6pzyxUtaL8TguUOtIOJDr3ima4RZ88TkHFcgCyQTDyZ6pK4JBoz9zdWBGUncXc_S8YeaJtnAdJQnXoBUyx2jQkYQlX_bP3Sk9E0ErLKNMNUZEb7Qm0tUsrJmem5YBecZKQ3', 1497509807767, 1497509807767),
(206, 0, 'OPPO A1601', '5.1', '11 (11)', 'J7MN4THA99999999', 'fJGzs3Pu6t0:APA91bH8OEf1YTAtgWsxe2TT4QiobLTSaJ3EKf8afR8GmavlGpnIuYQbdyw_cN7_3Y-Q_ZjF4J3bfN1LrzWe7Fyfyol1ASfuMXogjdCPzSBvnE8ySflSyktJjoxwIzZXnw3mXdubNYZ9', 1497514136412, 1497514136412);
INSERT INTO `fcm` (`id`, `userid`, `device`, `os_version`, `app_version`, `serial`, `regid`, `created_at`, `last_update`) VALUES
(207, 0, 'Soundphone S2', '6.0.1', '11 (11)', '7e64d4aa', 'f4ajbClfTJM:APA91bF419nPksB2t-OsPT5lwhx6oERcwPgCm8gpwxnm3WYB8-jdmbHw1MR6TA3a49z03Lud_u4WV8DBd56m-QCPKxh3-BlNi9s0Ro0xaL8zqxcRcSww741rts3Fo8wbSGQ4Wt9YiWth', 1497520493583, 1497520493583),
(208, 0, 'HUAWEI P8max', '6.0', '11 (11)', 'HEE6R15A08000750', 'd1wPUzWxp5Y:APA91bFdlGISV9di0b7vhPdah0UqYL-SHfDc7XHuBVbFTfBKFEuqaPoi0Ck_uFGgjcLJaYly8yaQzj5QY-wh_jAm-_e2C34KEjYlILE7v84g_Zd38cMRx--3394_iX6MXaw-npl8KJy0', 1497520524871, 1497520524871),
(209, 0, 'samsung SM-N910H', '5.1.1', '11 (11)', '4100f562e4e3329f', 'fDmX58hFY84:APA91bEJjhBA79TdM-cbDsnCCED0E7-_-Og0rLlkbYzNu9xhfcl1Aw0_giPIcp6yzdGCdluN-pAj2KhAxtNkMCJxhj6vxz8xgcSUgcN7BcM7jJAi2ONQ5ggumMlpmroAxgQ9rZXFMy2r', 1497520878679, 1497520878679),
(210, 0, 'Xiaomi Redmi Note 3', '5.1.1', '11 (11)', 'eed7bc3c', 'cOhw1pEvTHQ:APA91bEdP-jJccHp2cXKu5daP_Q6hw0A6DyCvuHPlVe7xkM4q5-LAkD-bYFWskKiFPLdZRaGV8mN_5Pim3d-N5r7Y3BQ3Sv3ojSotHfm-FLQx8X8bNroG6LtxNXleMwzZQ5aKJ0Qvs63', 1497521085192, 1497521085192),
(211, 0, 'Xiaomi Redmi Note 3', '6.0.1', '11 (11)', '4a964f14', 'dLo9EOGl_5U:APA91bHx3amy_MiocWqvCWw1mAK0LpvgJqtHNiWUJ9wQgCFn1A3m0H0Z5huI8QuXx-ELquSFwfESWmfVkCaivIak4AbJAKD55XIfQz43HCdNfy5-QqH8Xx-O_k82P-udOIvCqJ_XfUOH', 1497521994338, 1497521994338),
(212, 0, 'samsung SM-A720F', '6.0.1', '11 (11)', '5210b952eae31441', 'f4oGeN-avQU:APA91bHZVFfZ6wDsesSkB2s1lDWijFPRXbka9hw-1RjFufjM9HfS-x23oMRgHDHqpEgx489JMjC6c4KnzD-_US_r8q2_8UcQyVhcE1ThICik0bxsBKw3t7adXLdwUPCSkwcARdfMdivC', 1497522962434, 1497522962434),
(213, 0, 'LGE LG-D690', '4.4.2', '11 (11)', 'NZPZEMGQUCNFBYFU', 'dBCC1K0ywqs:APA91bHEKPJt3K-6doqdek3J68K_nvJYIwZFzi4geECpY6WyyANd6st6NIFidVvCCQyqnwZQHA0zcFfTIgO-D_EX0XhSFU5AXfaF8V4009Q6FUwnUbQHp0KC6375IqYNZ2pVLYe6uXyH', 1497523406667, 1497523406667),
(214, 0, 'Xiaomi MI MAX', '6.0.1', '11 (11)', '5af0b6d9', 'fGL7GNHr0k0:APA91bFdo7Do8nhdWqNkHgqdkcTZ45LuwvCFU9YDJsfxfyiQJL11k0CcyHJ18HmE5XPLRTEqqUHL2cgyvvA6U7H684Ht_EMAHRRzTyzchK78u0fEBpeMtZSntqoq4nzVu5TpSokTnu4m', 1497523477770, 1497523477770),
(215, 0, 'samsung SM-N910H', '6.0.1', '11 (11)', '410010dbc844a16b', 'fq_jfZEzzsE:APA91bFFIEVPVRWadO7rYxyMSfPlItQ-lNEbjiq2E9SuIGRTR3WVJGQ-0MzhcL4a2LeEj4fX_mjDUp3UzrNz02mLEDfykx1XEWYfLxYmlPF6ZRnsJelTNBPKekbGKYyrCjwSvYJN8sJ4', 1497523958910, 1497523958910),
(216, 0, 'samsung SM-C900F', '6.0.1', '11 (11)', 'a8df59a4', 'fObtuPGkYCA:APA91bEnzyPHMQbRFzSre29byHJm_cCfGrWETm9Fz4rvUxxLM5ebcRl9YKdLqB5n5o1psdHZVECC6GcG2ATwc0v3ejbu9xr_vJFdRfwfwSXm0--SyARoLUjw0hV63I2mq9cNSdINN8P-', 1497524326587, 1497524326587),
(217, 0, 'samsung SM-G930F', '7.0', '11 (11)', 'ce12160cd058083605', 'f-2DKjvWyZw:APA91bGUT1y4GiGBTtYkQ9v5TYk5AruhT3YI-9Bsyj_-lOHLogdon7Tt_r6rgDiyvGEr1TokpFZT4h2ekVC_0c5MPJ8WB-e0tNmL40wQfL473ZegVKk3m5uzOp2-fXRmCugVBBB5BMoV', 1497524618110, 1497524618110),
(218, 0, 'Xiaomi Redmi 3S', '6.0.1', '11 (11)', '141ddcf57d43', 'e5y5ggmpios:APA91bFoNcbZnC71R-bBCQCfHF6_CHy6_h-QWrtJnOQmb6J4odvnUE0dn6kZ5iJvG9fK2o2xEsSEb4zpf-7K98TZ5P__SidbELefS0Mi1lXaNcLymME79urE294RloUeBrmhY4TgAT_7', 1497525226742, 1497525226742),
(219, 0, 'samsung SM-A800F', '6.0.1', '11 (11)', '41000c8df299a2ad', 'eXKWI7HabQY:APA91bGxaaZ5mmsMcwYfJ6bAn1ekqlmTFOjncxW-2Db26-62wqs7TjBuLkDCzqcW-eeFH6ZzjjakLNXl1iuPsK6ZgYzUgEZfRLR0HhFzrtdYgaD3kgYlHC5_IfumVurGXsqNTKuTqx0P', 1497526478536, 1497526478536),
(220, 0, 'samsung SM-N9208', '7.0', '11 (11)', '83a44a3043303959', 'dlMtRMy8miU:APA91bHMTLpsMW8nliZXh_Q132C4doMR8Fu3y_0oDc4KrTpbCNvGPQDL2wEWTwcxcnBjK0Vk8GZnl3thI-wzy-91eOePbEPdZEUjpEAGxCMS-K4HlSUtGTe8EEO38ISWeV3KKwIu0ChV', 1497528361639, 1497528361639),
(221, 0, 'LGE Nexus 5X', '7.1.2', '11 (11)', '0202184c4dc23049', 'e7OVSaWljH4:APA91bHMXAY-SXAGJ0U7vL7F4kd8TBr8z1yv7I812V7nMoz4Wcor4B-fFy0al6dCi5qJiNHwhkOQYPosl2MhBaKNPucu6WSUCWOo1W_BMRB1Go3TmRFLOHRiS5g9mmkwq1nzvABBo2yh', 1497529402740, 1497529402740),
(222, 0, 'samsung SM-P355', '6.0.1', '11 (11)', 'ab6491d8', 'emVtOKf0sgo:APA91bGvKJJWthJPV6ABxNfOdo7SS5ZCus62FaQsKVUUBenRiYgUyQxyGb2wO14ztr1adh2rSPOYH2cJlVtqUzT72XU2vZjyKRATcaKuNno_8xrygW7FIKb3-UMJjE6yttzc0zytY9aW', 1497532511120, 1497532511120),
(223, 0, 'samsung SM-A720F', '6.0.1', '11 (11)', '5210ed28ea86c3a3', 'fh5CtaDJN2A:APA91bFb1dXWVsO7A6Hz_guiMZL1h0dbBUruEvpiyz-38zN7KEo23x2Fvtt_zroXcY91vw7YGy86EU9z4mHZmNMllzvYaZN_SgGYfwGmeYOx6a103tpZn6K0FHcgGulhANjWsv97xdEU', 1497538574202, 1497538574202),
(224, 0, 'samsung SM-A510F', '6.0.1', '11 (11)', '330031333923c239', 'fUmOYLGQNp0:APA91bEHJYupxfP8mSXJhC8wFHOeJr-feSuum6BG8uiEmtyfECQrXMq06PYHO3Y9QpUZBW1hqzgiqyxE-N7lrwqCrFWeq1KQNkfuZDvusW8_t22XQPC5R7naKtmhjvGpPNSa95HmU7du', 1497538617890, 1497538617890),
(225, 0, 'samsung SM-G930F', '6.0.1', '11 (11)', '9885e6395538494b4f', 'emq2ohDyAvs:APA91bHPZzl_ALw3bWRJCSFzMpUCsmbFNHgP8OislED4f_EVBDDSWrk0t86nZ-_3juRo0MyiOOAiq8goFQ26J-FWMwbyQTS0qFZYO9e6qrBcowcSDIDmWQUqr2HBnuLHjX0RcXEfVlBb', 1497542216825, 1497542216825),
(226, 0, 'Xiaomi MI 5', '7.0', '11 (11)', 'be37e9ae', 'cAb2Nil923w:APA91bFtDaTqztq6F9HxsNvYAMTzYUhJubLJBEi4UnCZcv9M85vztbhFMBxipFMNB8jHHf_Vqhffg8afNtmi46xRqjYRBgtLhj_WYZM90h5OHhuQlW6fQeNszHtkDEeB6sCVRvoCRm5o', 1497550130684, 1497550130684),
(227, 0, 'Xiaomi MIX', '6.0.1', '11 (11)', 'e36c03d2', 'd2WBTEs8jAY:APA91bFL1cJQqCQVqJxYQXdvQLj6nV4JtJ1AwojcdmBoDy1jZXAzHwqcTlJSbmyS4PuANLTfo-aV3PI5K4xkwn1Bw0JkmL-29lXTW3Chw0q4s71OSq-zTRiRRA2ssvlkqDyvL6jNBtGi', 1497553379605, 1497553379605),
(228, 0, 'samsung SM-N9208', '7.0', '11 (11)', '836f4b4a444c524f', 'd56GRQc1c0Q:APA91bF9E3Vlgikx9aKoQWbO29LEfiBeKZaKMQ_u9_JlWOpZN0rWpgZBKnAanfdWvGstrBvFmPL0y5G94cQkjf6RI1AvSEbKQJiznIut8VkgbyvU0RSPwnowX6-_PNY0ixBT3pk8Ih-0', 1497566136717, 1497566136717),
(229, 0, 'HUAWEI Che1-L04', '4.4.4', '11 (11)', '7c7d3d2cc0c3', 'd9UsTci8ZRw:APA91bF2TPSsd25GZkDR9Tv_x0Ag1fHFqp49Vwe49GqCxieX-98YGxW_K0f7PsQbVBn2Gr7wAbItXcxzf3w6a6KqXqpqxpt0jTYVvaQIHVBJmlZo9CGbw3Ng_t8KYkX0GwCZFXjcBYFV', 1497569397892, 1497569397892),
(230, 0, 'Xiaomi Redmi Note 4', '6.0', '11 (11)', 'UGIZ89DQZ9H6HEHU', 'dvp9G5_etdI:APA91bFMlH5_-5CIBZtbtizknq23sHMFuBFWfftjunLAC2lhzCnVF148aVM2LhzQEwKUQqUNNd2uZ71riAQXqnfVoVN2ICzT0kbGffswFvn0a_oxLeH-xabb-_gH4N43bssVUDwwTgTF', 1497570025826, 1497570025826),
(231, 0, 'samsung SM-N9005', '5.0', '11 (11)', 'a2aeb224', 'dRUIaLFYUMs:APA91bEMF2BgoETDqZOzLm8KxlNRs5EPujDFzjPgbcL-Dwt7-H4pDZWyBGhS2e0Rd02OZou7VXZ5yzTQ56Wt6CmSFuhGAVef1NCLzsXDZEERrASiG-XxeRx8GIUltXYY-mMxN6pXFXEd', 1497570236170, 1497570236170),
(232, 0, 'Xiaomi Redmi 3', '5.1.1', '11 (11)', '91a6b10b', 'fQPG7WYaXIU:APA91bGAliaxGtYFoFms25MQEJEGLtD5h2yB5y_MV6uGi-pmB_2luxEDy3PlMg3Kf8rt40FkqdWDvMKF0De10O-B4ZfAIs6hruNUP7cQzYL_0JawgexXicppu3P1YBKlinKqJhwdueaJ', 1497571682547, 1497571682547),
(233, 0, 'samsung SM-A520F', '6.0.1', '11 (11)', '5210ce78facd2415', 'c10lcTYODXA:APA91bEoEVnJd7Wx0ysiGev2g3Jw6rWhC78FcXPQ-IJKnJmtHhif766gJTOh1Jm6l0kELzTYLjjjIf2fGFCvl5pBszqkIM2gCUp7g1mkB8m_xnAWKaTXXOxnO-RbVsXuo4vh0NiBsXKE', 1497573693658, 1497573693658),
(234, 0, 'Xiaomi Mi 4i', '5.0.2', '11 (11)', '2f41ceb6', 'ewQByhsakdo:APA91bEke0GjUgVRKCRWiS-zI_UBxWn6FUSajecBTU8NrHyaRZ-ktMgQpzPZuToTFnJGwZNwMcTBAOzEwE5iY0cyEl__aYgxfnWJRkbDw5e2PHRNvHoKDVp8FZGsgc7TwuvqUFq6HoSR', 1497573914493, 1497573914493),
(235, 0, 'OPPO X9009', '5.1', '11 (11)', 'JNT8BQ6599999999', 'foZhMihrWFw:APA91bG1cubcqwyNemFRcoT1_mI3xrXbl2poMtyNlnF3Z0cuDf7KTsxj7lT9KMBYxoe9XTcXpKs38FcwdJG3Ot9ksoE4W9i8as8IRCo_PeQG8sT7xeIAiCPRT6YNmBWloKaViEJi1RVs', 1497575233719, 1497575233719),
(236, 0, 'OnePlus ONEPLUS A3010', '7.1.1', '11 (11)', 'd6a35d98', 'cSNMyrZksfA:APA91bFkVr1J28TyT7W3UczDksWPkMqtx5fGR5j5o_raxiZy9iYtkQiuSkUtL5mizHXD6H_LeiP1rQLlQbm5huYGqcQyffdegWfZTLWiQvBC5wvp1VYmZoMymyrZY57YoeK51X3yQw7P', 1497575739024, 1497575739024),
(237, 0, 'Xiaomi Redmi Note 3', '6.0.1', '11 (11)', '942bc5a', 'f_lKnems_x8:APA91bE-au0hSNpFQRdk5dFZIackXqNRArO2Y-JqdWZhYiuEQ6Z_qfW6GhYGgcksN387J7e1yTREkoGmvDXid416GfyN9SSmo5a-0MRqqk2MwI8ZDasjC7jmMn8bOq2ezS3O5YS5oqss', 1497576268684, 1497576268684),
(238, 0, 'samsung SM-G930F', '7.0', '11 (11)', '9885f7353659365334', 'dcN5ayJtHN0:APA91bHo6qhERx1nZZNW2cIkZycXJwEPYgmvuT5SkDy1DtzQMkWctRomtgceqJXDNP3JRELQAibBdeMZvB4688Nx0e5Q_i0LAvLuucqm1fdWxFUw5HEPgOewok19y7YeGKS-r2q-SIzp', 1497578008133, 1497578008133),
(239, 0, 'asus ASUS_Z017DB', '7.0', '11 (11)', 'G9AZGF002539PND', 'fAXjhUAli9w:APA91bEaDn_TOFofnC8zD52VjNsSKQSc7Qk0iXQKgaSSq8Zv2VqHW8akjeZupTGFU2I3G0qvsFWXq0ytvEaaMs8OFEBOf_0kNHmoAAr9N26bXMIEO8qdUEy5TfVckivnhtDfLYUhYY-G', 1497578488578, 1497578488578),
(240, 0, 'Xiaomi MI MAX', '6.0.1', '11 (11)', 'e196b457', 'dxnr7xB35AY:APA91bGGtzDlHJ3XKfBcW0v6A_bZB2JCSDDPzQFC10tpunNpUFYQy5EShPTc-02VeR0m-RMI4yS8KUCSjEEVcJsvZ3dN-pXa2KfRRj0dxQkgOGH4CkyFwvfUefrluQK21zvQH6N-Bn_O', 1497578665179, 1497578665179),
(241, 0, 'samsung SM-N9208', '7.0', '11 (11)', '0215453233363132', 'dfFQ1wikx7E:APA91bHMmISPWtWqK0zg-bcNq1UEzYl_UszDdxXuIXlt1OpijUPOVfinq-SS-agbYjNE_za6qkl8uEpHdoH8AqXxx3EKRJIaJq1PyXNJWTtX5Si8BJJ6UsL7JlXHnl-DBaEPUWtOogjL', 1497579165303, 1497579165303),
(242, 0, 'samsung SM-G935F', '7.0', '11 (11)', '988678514445564842', 'f5mCod3Tj1g:APA91bHHK_ieqj6AbPNZSr4IwVio1rcWKgy42gfjlh_Y7XYMxKjQU2353ARB5gNpNUelsXOl3LcT7Y8CLAmXhw-xnhdz3JsmxchtkuXAhU7cICRxXeSHe9rY6c9kEHbCK41QGslqFkUW', 1497579755187, 1497579755187),
(243, 0, 'samsung SM-G930F', '7.0', '11 (11)', '9885e63753414f4f34', 'dEkG17oHoCU:APA91bFQQj-zbsmgKqQ6Zxh_kCmY5xMCsdK8kCdlFxaSP3USFjAcGgGxfQ26PyPjitfu36QrCeNEEiZMZoXASD8xM7uK1_UJB3nAERDcBGoglpSD9CCJNyo0czH1KJzTfl2K1rugFm_P', 1497579825959, 1497579825959),
(244, 0, 'Xiaomi Redmi 4', '6.0.1', '11 (11)', 'c6c96af27d73', 'dvWVKl7D9AI:APA91bFXoDD-h7jMjMvAA2Y_LD74rzTa1oFPfVgfEz57vP-tm4kWJFtEStFPv_kOVFSJ4naXZZ80vBdvxFK_hDuZoobRirp_0E7E6WJAF-JdHJWWxXCDKVSccyYrpwp_028tBK3G516j', 1497580149354, 1497580149354),
(245, 0, 'asus ASUS_Z00AD', '5.0', '11 (11)', 'F6AZFG023917', 'cl2QAwmpEcI:APA91bFYER7tz9uv1QKdA071fEgenartl95GgetAomPZS7PwSfyE-8Vl83GXNhxltW8ebZkZ33lsD_O04yX7k4C0Q1Q5ljwBdb7drB__La_2AfJYxMHuW_K_hSJPZRhrFnF-5eZ-rQ3A', 1497580251509, 1497580251509),
(246, 0, 'asus ASUS_Z00AD', '5.0', '11 (11)', 'F9AZFGC13440', 'cOi-qfIIV2w:APA91bFoczYnkRgiliypDGQpUa4rzEso3DCQjfbWeXnh-57BGL3ruFvxW85gXiVj_EgRWzB3tRmuXVFvvqxiLxBA2it6zCM0bpSeClIk5hRyq6XbtMDtYKSVdkI3WwEGWa3HpjspnB3L', 1497580340887, 1497580340887),
(247, 0, 'samsung SM-G935F', '7.0', '11 (11)', '9886674833474b3232', 'csf9b0ytEtQ:APA91bEjNFFOZUxwl9bJcEPiXIJW9PuizaIrzo9Gow2odAJKUGc-FDeG7AGpdnZeLcvHmYA-FdI_4njo9VgE2x1N47ktaBOu_NkXpCUSQsKckuFyWIfd5soNtTC9qrk0sxP9nJIXpH8F', 1497580389771, 1497580389771),
(248, 0, 'Sony D6653', '6.0.1', '11 (11)', 'CB5A27Q6C9', 'faGN8ArsU00:APA91bHe-9czm8e-HLWqdkG_XTjGu_zB8q5lkztt_0JjE3uFW2dZ8yInjoM_ovLuXMEdofRuL09P5n7Ih_cRUI19iGPc_0GX3Mu7fJIADES6mvVwUtcNZWklLeeb8p05OvlPRoOoKwfJ', 1497580397898, 1497580397898),
(249, 0, 'asus ASUS_Z00AD', '5.0', '11 (11)', 'F5AZFG083941', 'e4pm1VWok14:APA91bFmrFN-CQQkwBddBMB2Wwl3xV_37QC4RtzaVYJFPWUpYllCcAyTjZOhakFv_P4B_E--Ubj-cPr0KqkuSmXPC8jcWmA18NgofeF6ZYSXAxRYoYMspSnbnKTAx9I2HwLK2sgt7yf5', 1497580799093, 1497580799093),
(250, 0, 'Xiaomi Redmi 3S', '6.0.1', '11 (11)', 'b70e40b7d430', 'd06BrgLesmY:APA91bH1BFre1W1iEuMx0BNec2MM3A82cSCMuhZb3Mbf8jdTDIEeVceeGaBS1z1I_SBprRgfr83i5PdZpJ4pS3fQy24-nctoEMuUT58ZbLvL3gxvnMXRgvLWHbT_F6jSkAmvV6yQIIQS', 1497581175932, 1497581175932),
(251, 0, 'LENOVO Lenovo A7010a48', '6.0', '11 (11)', 'JRUGHQVKLR8DHMFI', 'eFol1LpMOrU:APA91bEVptbkEs4Yb69kSwGX7QLtsvdQu4mia1StlWr2d2cmT2QIVdY8RKq9zRBaaoS1sYpiMOxLH2NUrDQUkio_WXfU2cElffArvzpKwnmGfUog93WMzdc5IHQJluXBRUy2iI78KfPH', 1497581202890, 1497581202890),
(252, 0, 'samsung SM-G930F', '7.0', '11 (11)', 'ad0616030888934b84', 'c5-BLEexF6c:APA91bEHVKvk9XS_bD76OuaK4kUxIY_r_iuu7FOHpYWyG8RXDESiJJVSRGvnl4B-05kf9dZV_LEtfshslCfM_BI_Z6mydzsTgAkZYpXX2-ZY53f5mSYkVOXC9GQHCVrhpwGkwKKFMcAI', 1497581363923, 1497581363923),
(253, 0, 'asus ASUS_Z017DB', '7.0', '11 (11)', 'GBAZGF009315HY7', 'fQorzA9EWFQ:APA91bG-Pcs4cLRgCsLBLd3SFqT3Z1efRT41RcGSCzPmuE2rmTIu8Q-kvlEJGDQiWl7fSEVIvZPAplt0cxTzZ3_BoeXu1H-mpVyIHC-zWrne-lhVi5ZcDKRKWasJsNE6_76Jb1oyC94H', 1497581752317, 1497581752317),
(254, 0, 'samsung SM-A520F', '6.0.1', '11 (11)', '521025d9508f14c7', 'eE-lrVKjQNQ:APA91bF-cssKHWX6kXoWveIiUw0Oi4Ss3Ymb8AdjL-qVhZuZJXxlgHW08leTuzUlHbX60SN4UZPC8d6xA_dUIid5ZpiX-fdUDMRdZFlotNHOxhJ94SvcISw57H23ScFkBm_tOKn17i-7', 1497581948521, 1497581948521),
(255, 0, 'Xiaomi Redmi Note 4', '6.0', '11 (11)', 'K7EQMRKVAQ79GEGY', 'fl1xKM0yi80:APA91bEO__LnoqeDxSPKg82gpISblwv9QTY571Kly1gu3y6vs-ZjXgKHoC9-pE7J_pKIkIlDsoams4czlzK9K8629cnX-XSBEjpHLNETz4HDkxZdAhsUGb-uleNBlboHe0pDzq_KphuO', 1497582321981, 1497582321981),
(256, 0, 'Xiaomi MI 5', '7.0', '11 (11)', '335208e9', 'fHUrDa6fO1Q:APA91bHKKZ_b4snkw09YPSUZgZ_sxbmoVbbjpOqktKhrieiue8P7npvnVVzSiHS_oFofYJek0XK-4GNWZXE_rLlgGQALxHB5A6lnyfsTmUqWlUX_na9FyuVJL6_DlvyGB0KCqGBBw972', 1497582768262, 1497582768262),
(257, 0, 'OPPO CPH1609', '6.0', '11 (11)', 'Y5US8PDAIZZDSCIJ', 'euJ2xUG-AXM:APA91bFsNIdJnXmuvYI5AFuYks9Wcro7pPevu4nwHzjjkYYfAMFbhqnMf6zT_FBj-CnRYBklQDt6M4Ovdsvc6QfFaUXydvp4rkCFo3VeValtE1NX8TvAQYWM9hIxrfBbeGvL5Z316z35', 1497582942277, 1497582942277),
(258, 0, 'samsung SM-A500F', '6.0.1', '11 (11)', '2514c4e8', 'cbsZlnunfbY:APA91bEQtW8j-VryQmNvpDqZEaK1xfgQjRVqnACiAfH28MolW2yDvG7rRQmep9yanTng8u_4pZmNQNGjaLoPuN2DXJBJlorxlUVt_RBosFSB6bQSLyPhVp-Lpkt_LdvyrQb9RvYm0cfr', 1497582952001, 1497582952001),
(259, 0, 'samsung SM-N920I', '5.1.1', '11 (11)', '0515443044303634', 'fysNa1jWA6w:APA91bFuFJJGqouDVvt7I2OgC7JeJ-BrX_0-tmF3mDwjHGNzIqJiVczJA0Xz4lH8OKiaeqa2YCOB3iOwvDcapWsVMUAjq7cQeT6ddMe-a-8ojJdvuSWOpdCxZqA8uCTnjlfjgFYHNvWa', 1497583090130, 1497583090130),
(260, 0, 'samsung SM-G935F', '7.0', '11 (11)', 'ce061606f5c9652901', 'fuCWXUsK4qw:APA91bH32MzHvQgsbsM2zed2MJ_F2gMBjOZkZikajPVVykxFtR9Ajoy_58egA4xfU_KBTnxVbAcP72YelS5P7peWh5h-iOBqPy3nq9avnZBwCcsoex3GyUV0xEiAV6wsZTWMpojJboHf', 1497584541143, 1497584541143),
(261, 0, 'samsung SM-G955F', '7.0', '11 (11)', 'ce0417140a36891401', 'fSj2uRy_9hw:APA91bFEO5MCrLjfp8bbFymLuZHGtB0lJegryltJBfUs5Y6krxv5M_OBWpWUybP0awrskyOw5HylkQcY0LpGpr-LQy0kb7voZOoO4j4-iA8Yo-0hcWEC7LV8zQLSn4FGPJldwJBF_P0Q', 1497585721793, 1497585721793),
(262, 0, 'samsung SM-G935F', '7.0', '11 (11)', 'ce12160c79109b3c05', 'eDxCJM1HDLg:APA91bH7Wd0ddWWvU48SjswoIAcPeg0KOPrA2ynwCWP-ux1pkh0O8VpKK24isLyBXpDEwFU8QM1oaqjly7QeagMgf8yM2Yx6k5viYLV5f6aq-tHnoBVW2PROvmEcYv_wLoSqp7ROeR5f', 1497586134670, 1497586134670),
(263, 0, 'LGE LG-D855', '5.0', '11 (11)', 'LGD8551f094087', 'doy5MRTsjNY:APA91bHWl0W2qnPG_5CkbdrdeSBUsbRqklURh-FnCD3eEgWn9uabqqPRfRK88iEGF6PQJetSSkFkHa-gwLdj3oBa5pwQIDxrHFULAPhZzTfBGr5HH1-Uc9vgW7v7euqXhkvLQ-39rkIQ', 1497587522138, 1497587522138),
(264, 0, 'samsung SM-A500F', '6.0.1', '11 (11)', '28f6ec55', 'eHlQQlN75xE:APA91bGZeHO3ZvlA2WT1LV_QZUhw8twXTJnc3F4GruSPLhXcjxMLDCyunLyy5Nx1zGz9-LgoKWaKsEIZk6yfybo9YiVPMA9V7kBolaibIRh8tyxmp8Id5MtrGmB2QuZWVK-LUPEJFRCs', 1497587940214, 1497587940214),
(265, 0, 'OPPO A1601', '5.1', '11 (11)', 'JBQG7SSS99999999', 'dvyY6y23KKc:APA91bEFtkssDGWEChd2rWwrkqfGzZOlNGqX45tB86Qbv21cxu3J9--A3uVXK2EgxpLw08p0PlHQXul8HU5NVMat8qdrfMzM8-GS5dXFIkX97-o9qfpMxQuQP-pOJiQ0qMthSNAE7RaG', 1497589329028, 1497589329028),
(266, 0, 'Foxconn V55C', '6.0', '11 (11)', 'V2AGLMB682001442', 'c2prwq8SfDQ:APA91bGJaCP3EJkSLG00GuMCEuccci9ObedgJ0rpdlZ_2vJuvfD921IZsY3fuvNMt2y-zE4iOFszLsUbDvVVPkXAkjIsGxvvCoe8qXid9YKVqoOXKRBH79MxJmcVegn1b0audHB_Bld1', 1497594238292, 1497594238292),
(267, 0, 'Xiaomi Redmi Note 2', '5.0.2', '11 (11)', 'ZSTKQ8A699999999', 'copKAGuQx5Q:APA91bEbHLnd64oGkuQL-uT3PO8SUJ57mBlj0Zifq_nPzUjCp4WFsh3b72Ky9c0Bzx5u6C_XlzU4gw7vfi74mh0GYtaCwPc40CThPkR34RrkCAa9bYSkrWOp8WF26HrAt_yeVTgicDmE', 1497595935368, 1497595935368),
(268, 0, 'Sony E6883', '7.0', '11 (11)', 'CB5A29U8HD', 'cgjlDBRTc1U:APA91bGcAO4Abm2d_r5-2fRIBSgRgXXUau_5-5re6jy7z_9eSuwMFr07fDJ-oclzGQahXsWyoVtnLtF0-1nV72h_orpSMR3r1LbFcTSlKBsO9LnOaVbXk5NZB-Kd1fF9-W2h3tGtAUzv', 1497596126353, 1497596126353),
(269, 0, 'samsung SM-A720F', '6.0.1', '11 (11)', '52107631fc2c1435', 'covwIDC6JxE:APA91bEctySTTNN5BX1rcf9FgCPQkMGlZo1G64EbsduOOROG4Aj4u-MAHgD6MohIGfmtpB8E2vjj6O-MIDn-Cg47XEpfS2RAAwSEGvHni5UTo8b7qH3CTO5b70bLhgAXRKovwL-rCLxr', 1497596430053, 1497596430053),
(270, 0, 'Xiaomi Redmi Note 3', '5.1.1', '11 (11)', '4858c022', 'eiEgNyB1qos:APA91bHm2--BqHmLDctxMAVqNckT36Rwu1ot2Yhor_8-O27r6iFVrPj9QZ1LNxvFeyfiNGQ7EWnFP7ZslNe2AQfmATiNSqrdyXbHkQXz2KHgyvPTcHMjN-P1BX0dguIgXDQnuItjVu3s', 1497622082394, 1497622082394),
(271, 0, 'Hisense Andromax B16C2G', '5.1.1', '11 (11)', '7969f2be', 'c41wvzhlaaY:APA91bECXvLq3myPUrELmyt3T9sLig0UOZWk8_FBKWw_IuH5bB8KlbQIyMK_7YFcYUPXY66Fbhng1bjXeZoO6qGgdEL5ENEWqvDeyDDPPTcV4ucKZoIY8FU3a5npan24Zn9U7e7zXGK_', 1497636638535, 1497636638535),
(272, 0, 'OPPO X9009', '5.1', '11 (11)', 'WOYTSOY5GU95OZFU', 'fLdwU3NlXCA:APA91bFCpWIFcU3iUHPPiBYHkMDRAnii-n6Cih_Kq9SO6wHwNXVnIQZyBq69VjMz5fziqkzAHA_FSYQ2xQLXUKd5BjdDu003Rik1ECORqU8KUVBtvhWNDUjZy37lV5UgFTiZoT4AMApq', 1497667194803, 1497667194803),
(273, 0, 'Sony D6653', '6.0.1', '11 (11)', 'BH905G081E', 'e61BfCvM1E4:APA91bEiN-qJazJIfcSvvDRDD1ACziyKT5WlT1HE5MTWFMoS0MdlUDBJxITTirOt2SPApDIgXNuMcULuq5vIxaJECNAEk2-d2_e_VKd3ErUS8IOJCvyAsaE330FoDXCCD67alO0VJG0f', 1497692006286, 1497692006286),
(274, 0, 'asus ASUS_Z00AD', '5.0', '11 (11)', 'F4AZFG089266', 'eHdU0tORY-o:APA91bGuz76mGGkV5cX8CcmTTV7oMfdIwxdY0Qf6k9mkK0gaZrdIx43R5oOKKS1YV4ypVonS51QyWe_YbwDO4tDSm7vW-lHquPJ9DM3g6iSyb_E7l_4g5Xgsn0zdtJTVMpYOLYua_U2F', 1497711562561, 1497711562561),
(275, 0, 'samsung SM-N9208', '7.0', '11 (11)', '8575304b4e493733', 'fQJ241zQy4w:APA91bHEVPJs1R4_PA3g6RKFZY3d5LCTMoT-2tmRDTFodB3D5QuqeNDsx-l0Nwa79sHL1CIH49NApJcwa6v8KnpND3TYuo0TAZlItBec5YN1NF1kYsfu1pdA51GLY7o0iohmj3WRzoeg', 1497770865661, 1497770865661),
(276, 0, 'OPPO X9006', '5.0', '11 (11)', 'da2d48bc', 'dV1HSQyIdaA:APA91bHalC1MDj1m-w4_Fg36PGqHpNGCasWGvZ15DYS4jDVbieKpPtCvVOTPeg65XoCMq_yB3mJEY8LawDQnv6xS00Ud-eHDtYPvcqyaXqqAUTamwZneiWDtb2TpGCTQqIrR1AIvSpNc', 1497840419216, 1497840419216),
(277, 0, 'Xiaomi Redmi 4X', '6.0.1', '11 (11)', '2e8b68977cf4', 'cBH-HnKRs3Y:APA91bGxrGg6YyONsFKbbfJ5Li4lQiVg47m_BNfDrocHhyGolVP3NA4zU6ilixIG8J6NnfOWGRNgcacE5b7iwICgxCM4AggWl4SXIAM6n_whU4V7jm8ArbWzIVFcPqso-OG2dN5QuPbt', 1497849654293, 1497849654293),
(278, 0, 'samsung SM-G935F', '7.0', '11 (11)', 'ce0416048533802903', 'd9PLmnbnJNA:APA91bHD0TBr0VcycnAW4KyhkwO6z8eeqzpDe8tVBprj6uQj5x4hwGaDXq4VcLBynqKupw3laq1IVEzFa41CkFmCh4SYG5MApHNh7Ss8WxmlR9k86pJfJGHpKIr2tmPpuaID3SMroUVX', 1497852097947, 1497852097947),
(279, 0, 'samsung SM-G950F', '7.0', '11 (11)', 'ce031713a906e06a0c', 'c3K6kfy0mxc:APA91bFCGFJg3RrZbUIU6XIc37NufxfNGrbiPQWusjk31OAWFpoYdZmSWgIK02-L8qcQY4Y3Yuhj4uydPAfYdE5_4tK6AjHX0AJ_2X8QzMX3i1rA4t6SvRYTDaSSnWhRm1jPMmw7gz4r', 1497857970841, 1497857970841),
(280, 0, 'Xiaomi Redmi 4A', '6.0.1', '11 (11)', 'dd749b061f603', 'fzMHRPtK7xA:APA91bF_4GJLagBT-RYxZDE0sxTn2LheJX_UTNg2RVl_MHWuW07g6dvzv2wmqw3DelJhkfrcJ32eSFpqXRBUAQH-XhuFbz43RwXl-Xr2WTV7L1CfIaD9jehlhtcvmIbOpzEn0SD_VU8g', 1497859569820, 1497859813978),
(281, 0, 'samsung SM-G930F', '6.0.1', '11 (11)', 'ce041604554b582105', 'eeypgC9PMQk:APA91bEOWPA-1PuxC8Oy-T1PFqC-mhclzq7mTNj-xrtSgV52T2dMxx-HJI_XgFwRTGRk1C0bev0_kRTQXVkr93qURkxYEOmhqEfWwkm0cygH4dVTt2zXMLAtgNBeJdFQQD9uLLsj6oSP', 1497860009814, 1497860009814),
(282, 0, 'LENOVO Lenovo X2-AP', '5.0', '11 (11)', '884F4F91FAC67DAD', 'cpZSFqk2wN8:APA91bFeBPkGA3xyd8RtW9whyfYCjPqcfa9K66QMZmt12MO-zWv3bvDwb4vQXXz4K7wuZ2Cai5T35xWGivJnrzwaO_gIQOzCSH-WAXg0EVfN2CdKDZQNQ0mz6HRkP6QmLVEDxxjYqc6F', 1497928451537, 1497928451537),
(283, 0, 'samsung SM-N900', '5.0', '11 (11)', '4d00226c5a738041', 'eG36FlHY4nM:APA91bFTbg3TSBOh4SzsvokQ8dJfmc4tTM1ZYwiY_dIzOJeQv8cClokjBLJ_ZYH7Ai7_hFfdxE6g39g0nduaAF9rFDj3lp3WBatvqtJOkDlQXPpGxSv0RAW8BBy7hfc6Oe3kYA9g-T5H', 1497928750223, 1497928750223),
(284, 0, 'Xiaomi Redmi 3X', '6.0.1', '11 (11)', '29a6ec017d33', 'dQWkMqu2qJQ:APA91bGOQAk1QViZBEkIdoz5D2qR1Sjay2dUuIp_k2quUA0k3_UKSyCqj6vFAeEeUIWQH7VoLhfFb5efoLQob4h9AYOUcrVhjibzcTB1nrbwhFHBUwgcK_42t64vcE33RXzkCF9q_W39', 1497938819874, 1497938819874),
(285, 0, 'samsung SM-N9208', '7.0', '11 (11)', '836f4d3356433436', 'cVx9yktRFaA:APA91bE7wiqQVFuW8cAnzkK-2Oa-KiFy7g35QOslerAEkGWzfarOG8WhpEt594msRqeMo4jK9YOfow0LP0RlZQerJzySbpCmxL48Zy9aG1fvlUlsuy1Dd1LVvrAL372cXejkXtVgdehg', 1497941660813, 1497941660813),
(286, 0, 'OPPO R7kf', '5.1.1', '11 (11)', '23c1d00e', 'cECoIC031Os:APA91bFidTAypm8evyf3hISzLXTHa945gNIpLjbweSMgJtmmz1oeFvi38ekRdFniQoziTJU2TVswHihXDalS9Bg8KoYCRqgFqE5WUDWOz-PDngabn9jH8k_b7UTU5fPiqDoiCYRf7U3x', 1497946161003, 1497946161003),
(288, 0, 'Infinix_X521', '6.0', '11 (11)', 'J5088A1R68266474', 'dysgNYFJqi4:APA91bH6sTETm1dodGGYyDoEHn7wm0swi4wD_P3dw4QRhQIxW3pJewQ_02xYlyZ-Pd-XiAPa9SbEaz05DvkgGsnFnMjKMcLg3slBuzvCyF65V_EpnQKrHlr4eGCvCBBKrDmfFxh39ANo', 1497980863818, 1497980863818),
(289, 0, 'asus ASUS_Z007', '4.4.2', '11 (11)', 'F1AZB703C909', 'cPyzKkghspc:APA91bHZyXXqJtBpS4eQQyDqwF1dADnQNFrKz-0yptXQMj81hL3O06iOxsQuWhkV_-Z1u6rnYPrmS78nx6UPg0wZxHEbqpF9MyDOtbdJS-iwfnlRMQaAvipUR5oydjnGgEhi9trcGci5', 1497987647650, 1497987647650),
(290, 0, 'samsung SM-G930F', '7.0', '11 (11)', 'ad08160308f46ad3c9', 'eDfLcQ-OiWI:APA91bFYkXnJkQgdXlvBTkesJAcHmxCYsM8tWNThyhDVNpaOEOwmJPMmi2b7Mc7sFxadM4XaVTzVM8CXyjCiqYt2YcHj93GsUb4hWQ-GnQoOPF8nkkJrXFOk4iD83aBJ81cP1aChqpe5', 1498024656523, 1498024656523),
(291, 0, 'samsung SM-J105F', '5.1.1', '11 (11)', '420038badc856300', 'dMjfrWtXa3Y:APA91bGSREksH-oh1uGFTsLap4gA14YDztNuUT8lAmuKgzbOUgBWBxQGmiAPblnF3BAvsg6OS1jGF9NKzJZw71q6qbyjYu0oztuvif_46gmSpSWETqe23Wq7S37TYmztI1LDvUjsB_ni', 1498038589571, 1498038589571),
(292, 0, 'samsung SM-G935F', '7.0', '11 (11)', 'ce051605b2308a3704', 'fluP7onUxzI:APA91bFHSyQ23OLel18eoyMhqhzT01rSdzb3lHYXvmxv92JxIASZc5IuVcwjgow7TOb1PBpG9JNQlinDkw7PjdRbDTnxRjdQzky8ln8LDOzyfMimpglM3yddOvG8IbdqZhKgOJJJb7Mv', 1498045165883, 1498045165883),
(293, 0, 'samsung SM-G610F', '6.0.1', '11 (11)', '3300c165278693b3', 'dcF_rogeepU:APA91bFPVyIutGknn2lQLJLhw3UgxNrFRpPb4ZutZ-4Um5RU4iZU2kRocUf8LxcLVqLzQY0n3yvBPQJKr1L_wfEQb5vHJq66XPjtF31cliqMIBuREKUyBGfK6EcJ7Vh5LCBaOgy5B_w7', 1498051605082, 1498051605082),
(294, 0, 'samsung SM-T231', '4.4.2', '11 (11)', '30045b5bf5d63200', 'dZ2CGmSgnDE:APA91bFQ7Zlb1yRqhrzX-Dy2XzD3xuDR_NyBHdiaw2W6vK7IMD75cM0kRfAqTH1HmQfsBVyBBuaMfkd0ggwHTjl9dayLzE6Q-YhcoIfgxbUsf0RKR2DzQ7RUqlEPnP-jtlVJS-vOjyEO', 1498052254950, 1498052254950),
(295, 0, 'samsung SM-J700F', '6.0.1', '11 (11)', '3300c2845572b275', 'f1x1frqIqzg:APA91bHT0BwxDTLWy54Di4s349Ud5oQDpfXXph1_vCRTENYWBT6hGASJxGICN_7CjWr2P55CFApuH6Hmoq_Spl4Qlj7ZQ2qYQujZY-3-Rhl69j61UiyVvMou9PSDz3RBuiISJ4rnycVX', 1498059595265, 1498059595265),
(296, 0, 'samsung SM-G313HZ', '4.4.2', '11 (11)', '4203a8f8e036a100', 'flNTTu7yBxM:APA91bHb8WXRu1Aj4A_ky-WoJg8lSG91P9R4IhB6zNijqsQMokJ1atZI8V0Lm0fJBBvu7T9vDQe97WCaCiewe47W2LqQT1YIEj8W3il7ucTyysnipAGbe5bdhBpQ3ArTpj8SlY5WoaZx', 1498081453351, 1498081453351),
(297, 0, 'LGE LG-K580', '6.0', '11 (11)', 'LGK580HQHMRK4H', 'fan9xkroSUM:APA91bEm1XFB-goHZDYBLvh_GBgjU8gXoSbw2e7Zc3soNoyg13PIB4l1CaWbmKMlZZFDACgvKaAeMJTVgIqzPyhU8spkzCCE9cKX8w2IRGfjrZYFXv_M3MTXAdLaWknyMbdEmRma0lmV', 1498096673129, 1498096673129),
(298, 0, 'samsung SM-J710F', '6.0.1', '11 (11)', '5203edc0ee24837d', 'cQyFyXZWik8:APA91bFdZeCeUDIYhlYPcHuoRi8zQc5JHgTbgf1z3DUKknjmvavFqL7ks0xBgKDhNilgSwi2PUHTasbHYtPk4WVKyR3dFsn8XX5aTq2qF5V3k04SRzAgyi4siHm2Ok6RvFev5JguLOgR', 1498101140033, 1498101140033),
(299, 0, 'samsung SM-G935F', '7.0', '11 (11)', 'ce0416048d079d1e04', 'd3T98DG9xG0:APA91bHIAnR5RiW7Cqw-3fLwHjHgP8zzQ7rBcMCG7Ia1J7qU28rGNU-Yy_nuksEvE7XYrlLikqu0ka_L6C-EhiBTMwbhXdPVMdZUyL_QTHnEOMCOfRcsu64Vvr8t9lrNFTUOOw5VrSsD', 1498106416025, 1498106416025),
(300, 0, 'samsung SM-G935F', '7.0', '11 (11)', '9885e633584e574747', 'eMgylD4fvK8:APA91bEL9Hlg9luvpIkgqS573Fng5h4t3UWFIGhcH1ZvwCyZpV2f8XGBvD_C8sEt16mbmC2QFbTARhpF20acCf72LWCjgjcQQ2mVWuHAx_7aRBGasWqC8boiQuFBmBsWMe6h3lXz-XMe', 1498114012671, 1498114012671),
(301, 0, 'samsung SM-G313HZ', '4.4.2', '11 (11)', '4203efbfd4dd8100', 'd81bUstRXe0:APA91bG8M8W-zAHOemAb9wqC9SCf8OQvxAiR9C7vYe8ha7mQKrbHaZLAB1LBI8g7eztD4CxR1xco7ZKBE7mZ730FAK5SmgXHw4gjdgMHiFPpbvUzm28y3h0qSAKQKOiETSkBEakavQG1', 1498137151758, 1498137151758),
(302, 0, 'asus ASUS_Z00VD', '5.1', '11 (11)', 'SWV8NNM79TGYFQ7S', 'eb5P9OBPHQ0:APA91bFDikTquB9Ort3G5u7GvS24GErazvbHCWVA4ZSFXWb1HyQi0GRmQ878QAO8iGhLRvuuxSu1Z7IqfOIiyHvRzjOmsaTjCnljoayZRTIUFuk9rAl96oZdZ7Th6rAbZ6QUkfq1v_Z5', 1498176198965, 1501265144396),
(303, 0, 'HUAWEI ALE-L21', '6.0', '11 (11)', 'W3D7N16108001807', 'eLf442YreSs:APA91bH5izmWSsmCpB6lJXn8qSnPBH0_U-zz7D8NFi9oH7tAVPXnSb5IOUm_lBFKo4vXiv_6_E_le8YNSkhoYO6LwRgJPMNGoUHlXAp2uhQ0D_V-jRtn4gqExChwdmAsVCRozAbDtpuX', 1498251853669, 1498251853669),
(304, 0, 'samsung SM-A520F', '6.0.1', '11 (11)', '521095b4ea78c3d7', 'dBj6ZLF69Cs:APA91bHjg7UF5raMmyVv0MimTcLWjpgsOiUUXiNOEa9lSRPNFc9ePDcAkfRfe2oxvaGxK9UXk6ThlQJh1z0wuQ3zgcjBKhuSLVV_cPvvQNiFiAuc25Ugs5LrQ5ymf93tDDyQzyhLPlxP', 1498277322774, 1498277322774),
(305, 0, 'Sony D5503', '5.1.1', '11 (11)', 'CB5A22TCZR', 'f4Unt5FOw_I:APA91bEpelf-uvILlr12olWatC-pMTcovr2gzTFYjymM7IgFKHCkMITCruSRVmmsjfbzMmVyJ80fCaj4g2PcerGQFcAbs5Sf8edaIdR888iNcuAoYYw6xHXm82s0c2Ln-KMSyIbgseCW', 1498632885753, 1498632885753),
(306, 0, 'LENOVO Lenovo A6020a40', '5.1.1', '11 (11)', 'd2b3d0bb', 'dCzn14X6Ll0:APA91bGq6B23pOLjZmgDrljFiC-_MxGIxTDD6e5J_e2MV2uoMUTIm6o8_DF7XIckX7IylLqbTOH78ln0PikmuyR4qp1n4OTkytwegGBAQm06efOISR8FGKT2zFxaDXhJXWVH2zutIFjv', 1498651917948, 1498651917948),
(307, 0, 'Xiaomi Redmi Pro', '6.0', '11 (11)', 'YTDUY9PFDQHA7HAE', 'eqYOG7l5vUs:APA91bGB6B9zeusAa3cHeiGxIY-GBEVrHvkMJJYT-fg5iac10TpDAyddxVwg9iSGrM_9aajoqIWqzUF9XqKInXpyJRdIMjYRbyaP-2QGDEQEj3xPxIEj2Uc97PYihLFgruao9O_PFkoS', 1498810206454, 1498810206454),
(308, 0, 'samsung SM-T116NU', '4.4.4', '11 (11)', '300416ab672e8200', 'fad2_uzODqw:APA91bGLpiSJZx79SHqu6coQnmUw5mdCJq336obMg6DsOXqkceUE-Ddh0bSSWcY8liEiLb5VB6sjvuD6Wqm4tavJyTEOYuCyWUnPcUdO33m9e0hoRKLEMIE2EEGQjY-nbXiKeAeGaNBg', 1498893421582, 1498893421582),
(309, 0, 'LGE LG-H845', '7.0', '11 (11)', 'LGH845a088908a', 'cqEmnUyCjxs:APA91bGrMfyuuwTXphIs-aP_veo99VepJCKklDyAXFljnth3wcPuA4okTmfZyYxqId9pgH9djD8o3DxM1Qbv0WWOJxQ5G46XIC2CA9YUFMnY-gyol91nDmW5gdzLCCo_gKCMd-qx5v5L', 1498900968979, 1498900968979),
(310, 0, 'Xiaomi Redmi Note 2', '5.0.2', '11 (11)', 'OZS8CIMJ99999999', 'f7Uu0yT-YlA:APA91bGoTDJ1MqeMV66IpBbTW-SN-rxqtgvT6qRSVRq0MzKsE7_uSNXdu5c2CofXzMd7eFXvzf4JFJf8P9ALW8XApQ-pD7_M5QXZ4Dp1AKY2RGQrs_d-HxpaUpGa17bzQA4Mxjkdz5ND', 1498948119194, 1498948119194),
(311, 0, 'Xiaomi Redmi Note 4', '6.0.1', '11 (11)', 'ef77d2fd9804', 'fONXGfaEE5U:APA91bHhhGh-faIl_jA-a1qpGVwlzdXCBUHlMQGhTa6-leQdiRXs8H8wXbsom9nPOPoWj93jdsnENUEReSWBOz9Ua9BgXykafJ9_2gl1U_q7eQK7xBX1LKeIIp95dYH0_51f4zIgC_T6', 1498987725810, 1499378846678),
(312, 0, 'Xiaomi MI NOTE Pro', '7.0', '11 (11)', '1b39b4e8', 'e2Xb5LvH9Gc:APA91bEEB6Ym9--gx54F-rJbJajRLtbVt66oS1-t4ZPBsT7LU1Qzensb9tRUukVSObn4z6vAaiOEM4WwZD0IjMqXL3q96G4dHJWlx67QfYpQmFkssrS-9FNtnqBBWC3N-fGWi1qC6LYs', 1499000502222, 1499000502222),
(313, 0, 'YuLong Coolpad E561', '5.1.1', '11 (11)', '7924dc47', 'erL4pg4C4_c:APA91bH9jJ-nKUEKRnrTypasPhOztUJ0zvK1APcxkWcZlS7RI1blRrCFt_mk5rp8bEYPu_61mYrSZqwzj4wkIX5hXQGtgojIfaZRIRuklsPnVOU9Eqsk1KlGAWgnRoCzSGS1_-doAJIO', 1499061473899, 1499061473899),
(314, 0, 'OPPO X9009', '5.1', '11 (11)', '7HAQDQU499999999', 'cG4LcT0g2fA:APA91bFHJDyWox8xW9_XEyqV4ODzBmFPEg0tWA0D9n1BUsXlUSHxD_kWsA_9K1ZTbqgbS3Wg5yxJb3l1WNicwqyrHFSLbpYN4fy4iOr5Jwl2xxcFBTgiWIOI-cKW0SASUJrlQqZgOl1N', 1499138268769, 1499138268769),
(315, 0, 'OnePlus ONEPLUS A3010', '7.1.1', '11 (11)', '8f5bef34', 'e4_y8admO8Y:APA91bEZuIs-bKNTc0VV_IpcZEaRkrUk25odMY-8oNUu-_ERn-61nSV1b0YF4kPjJx-1EIWVIqoRTh4YmAF6L0ss1HWw72tPudgr3QbNNB1vokeeb5mfnCWzekpcgVNmoirs1ScaYsAC', 1499148345830, 1499148345830),
(316, 0, 'Xiaomi MI 5s', '6.0.1', '11 (11)', '2af12599', 'e4tdHhtx_dQ:APA91bEM80THhAie12YZz0VBPPKYeV1phVD0gOSXaXOnpkMEfpxJbpNiA_s8WdJEKAaUm_zHWrC26Ig349s0FGkkJcEqTlaAkgLojW7JeG74FDnU34u96tdulYgaSvTat9yWXDA0Bcf8', 1499172029421, 1499172029421),
(317, 0, 'samsung SM-A510F', '6.0.1', '11 (11)', '33000e58b62f730f', 'c3gjM5BgvKw:APA91bH8Qkb9yn8w_hGa4KEzd-p-JBP42uGDmStjBKZDUuIcubioAn_E7nGVHGfqt2ZlpQcJzJ2x394PR4Gsn4eX7m_ek6CEnsyRBsbql1llyvX8y_G8YHQnge1XRAbzdDfPneNlnppj', 1499207435108, 1499207435108),
(318, 0, 'Xiaomi HM 1S', '4.4.4', '11 (11)', 'e7cbb2cd', 'esY3ZxCOzeY:APA91bHxUod1KYs6GvenWAExopivX8E7A0xBokpAFC3G_ecB7r-ENkn-7cMwGtdhT46_FkKWErUD5jWzdkTmhHUMJZjaDshKtFF6sj9tibCu2uvI_7dCyWbi7qqfjzgMJ4sPYyg34V22', 1499223229449, 1501556939649),
(319, 0, 'Haier Andromax A16C3H', '5.1.1', '11 (11)', 'ae3cc696', 'cHs2B3a9kEE:APA91bElIPV5dGJkrayKTMdXQ71mTqNNrGNChP0XQ9WXqdOkBM7pJchUSsihVMzkxpuK2N-yQVzsk2qoTO1gZ8wANmFPCMFne-NalY5ghIRpXGp3Gn-3IRGMFodtzOCmETLMhExy6DDu', 1499223801953, 1499223801953),
(320, 0, 'asus ASUS_Z00D', '6.0.1', '11 (11)', '6a8dd86f', 'dZWa27VhXgA:APA91bFkRmhBjywawZt4pPWZtfrqWPsc6u0JkanfRlIa8-E64KF0jiYiWbEQif-buAekyv-DuZmuqIzYCjCCSaZRSKTpDVMYliyxuUiM0wK3AEN2tBaH_CyGwxe-9pA0jz02XFmUuY0e', 1499230983914, 1499230983914),
(321, 0, 'LGE LG-K430', '6.0', '11 (11)', 'LGK430AQIV9SA6', 'chAdfJ-Q7cs:APA91bFpw57UyS1Iyo30Js9440Fkazjv60CeQfDDSYQArlafPbg34dA6Rx4Kdr5yU-faeujNF4Z4HIDrfGaA4p430zbpzgioehFWDciQmBv-ryylFxst8qfarxwhvg8I7mOa81Bd7jlU', 1499264799167, 1499264799167),
(322, 0, 'samsung SM-G935F', '7.0', '11 (11)', '988638313039414239', 'fQxBVuU00T0:APA91bH9TkpVePyPIRhn-YjTykbP4TTJwsnw8stfBS-iiwyfs22km07BoOuqYS1kMMVI17maklHFwbcjWOQuzo978Od4foybtsw_dcgCrb9zq8RinojjuTM_6pF9N6aNC7VUxKjcz3ug', 1499289476525, 1499289476525),
(323, 204, 'HUAWEI GRA-UL00', '6.0', '13 (13)', '7VL7N15702001435', 'fXeAKv7hanw:APA91bGzmsc-lYG2loEmHphuS2Rh2DipFyOPZyvRDJL5PvaSctSYyp70VzYSaqSoaxqnrQeqBExvPJBPk7nM5vVVO1Qqy6wkYqoBn_79AQAu26pcNV-Z_z0RtZ9lbOtsX4Kc6QhNtuDQ', 1499312795709, 1506088264275),
(324, 0, 'OPPO A37f', '5.1.1', '11 (11)', 'b9d39a3b', 'c41lS70hce4:APA91bHJCMPLJW0-ae7cUoRInDUFMslKADLnnK0SSvaGNqwUBhnDpmTNGSisCWkmsn1xvI_EHLLv8xz3lXSGOKK8c0hJo9kXpStgWMBlPBoeaDYYEBzKfbd8aq5xNRe7a9Fmd1eVPauG', 1499347972407, 1499347972407),
(325, 0, 'samsung SM-A910F', '6.0.1', '11 (11)', '6254f6d6', 'eJn2YByFz10:APA91bEvCd1w33NUSeJkMHHC2M5wvcqkU0xDTAP74i82H075QJQag_rTEHZLAzrNYdJIJBE7L0VoP1VXguF8iZU41u2V9EO4GB--oomsAR_mlMk3bKrSemuDOBHkKGZ4WEH4AuwCOU5J', 1499348769620, 1499348769620),
(326, 0, 'Xiaomi Redmi Note 4', '6.0', '11 (11)', 'N7FEEAIVLBPRSSIJ', 'fPtVaFRLRno:APA91bGP7TtkC4kS-rJcFbsYb9MT7mch_SKteptkBGSpdpb3-OWXwlLjvdKAgtnlHiJ0S28b8GjePMYz4WaDJo5hM0qPK3gGl-9jYgWaoWO0Kw67snXKlgjQci5i7Ozx_dDeIGa3c2gh', 1499355988441, 1499355988441),
(327, 0, 'samsung SM-N9208', '7.0', '11 (11)', '8575483330513547', 'ecXiPVuHSnQ:APA91bFdSMsNKGr--MiFHSkLvYyk4xdQT2TGzcvRU-e3MNV_5cdMClN0Kp93eSE4etOwx56KiqF3A571esAHKuvedO7lcJZj-wG9YE33qwGjJmCR8V2aI-tNLOE-0biTUhErYXNxcYlM', 1499408343528, 1499408343528),
(328, 0, 'samsung GT-I9500', '5.0.1', '11 (11)', '4d00a008c881500b', 'curcEUA2lpc:APA91bHnKsCaE24AWnB_ObwaIE0VD75HjHjyo5M9IGWPkM-b4YqKM7Dy6RgmRNabzB2ikXvlS7HUTDFbl7GfpR5-nsHM1SIpas2JK4aVIIqybdrPYvXTHLcQAD4qzkzZW3HNOJ8_szur', 1499408630684, 1499408630684),
(329, 0, 'Xiaomi Mi 4i', '5.0.2', '11 (11)', '5e75112b', 'dARlQ_CfcjE:APA91bGGkLKyyxAcx2zkDfuq4GAeZeX9D35XPMOqtrLrwj2giaEPhA4bMHEQEZ7jA4qB3pAb51DjAxmBQxxYHL_CzyWIRsecuHMb1-KagNbxcSEQUBCgKFb0fT9zCiZMHfBheQpm6VSA', 1499412992759, 1499412992759),
(330, 0, 'samsung SM-G9208', '7.0', '11 (11)', '1015fa6123d40603', 'cc14tkQwYtk:APA91bHscwZEK82vmGNc1zU_0OFHnzfcthPK7Wdlz8GO6CmqFnvnG2-Vzm38y0e9QWUbTnAsdFzf_OMN4zLQgtzrsHlTDPgyf6YNBA8kHpZSt4ThZ7LCXiOsqCxUaycHMBQard-BSTMW', 1499442738258, 1499442738258),
(331, 0, 'Sony D5788', '4.4.4', '11 (11)', 'YT911BGTX8', 'fZ8GtU5J5zM:APA91bHfcq6XoOpnvCRaBUxrDYuKIAoWFP6rZO6IqkbArUbbxzyWFJMq2HlJaLMbdbXgxiR6VuTEuRWnu57PAHkAjJ_CURMJUK654bIAKmgg2ri5tGeqB0cvAdiqTE0cC3oFgdjBrdXh', 1499465598808, 1499465598808),
(332, 0, 'Xiaomi Redmi 3', '5.1.1', '11 (11)', '887a98657cf3', 'cbLR69WA24g:APA91bFYIMl3WMW_snGLxnYWV351L9dRMDHgmzEGQY_HoWKgCTdOzyy4mNXFxmAYh8Qfhvv27BPbmoNWv1p-ccT6DhQFAe3xu0QO5vqN6z6AwWr26CQJQXgI_va-8EPKltpU4EXA3exD', 1499474557790, 1499474557790),
(333, 0, 'Xiaomi Redmi Note 4', '6.0.1', '11 (11)', '11e4d3b39904', 'frSlgQYuWeo:APA91bGE0UxwHCvIS6mQMWb1zxp1zO5fQw7pyUGCMXLWL4UzHGqi3OD7w4t9FGVGZOE-rXNqIw0X05d5nQ8mLz-naahJu23GlnrNZX1KbINgXwEDRAEjS1_UwI6PTvtnbjTacgeMFI4z', 1499482862489, 1499482862489),
(334, 0, 'samsung SM-J700F', '6.0.1', '11 (11)', '33004083d5232313', 'e6l4ioZxgnU:APA91bFsJjhGWM6Upt4PYcnoaynreHVSp5VoFK46OqfIE-spvZs6V-9QHksSYA7a3Xr5hogYWvlL_Jsewe_NwQYQrjxlj5ntfBJvrolXw13zYeqzIzYwIJde1vW-cdVf9ZwBXbBZzsFn', 1499525078146, 1499525078146),
(335, 0, 'asus ASUS_Z011DD', '5.0.2', '11 (11)', 'G4AZGF00L823WFC', 'cqQt-CFYOik:APA91bHsKbsFpdmH7LFG_zOTT2HE1TT7c3iEoSmfXGDbKB5VOut4ZOiZc3Cwk5TYQN15Mf4FeN-s0d0RCal6Suxi4R-3kbd71V3R3WG0EcZWAPjrKOc_HYOrfE-5wtnkMqHzY3xVLBKS', 1499578291441, 1499578291441),
(336, 0, 'HMD Global Oy TA-1000', '7.1.1', '11 (11)', 'D1CGAPE732926110', 'cVYkHbK09NM:APA91bErfuIFNFe0e7jK_p-qTGXUwi8hb-4AKRVepqqpkOExIewhXQRbyzL29xdSBY6QyuPJ7EIg44ihbb7T6C0VemEV4UWZJi6vCymKAcGUUbQv0d-5bJ08YW7lwdoipbwGJoAvDByo', 1499593932050, 1499593932050),
(337, 0, 'OPPO R7plusf', '5.1.1', '11 (11)', 'cda11d2f', 'cOvl8ERSPIU:APA91bGYE8FPPYerc_WzFLF27CuRL01Ysp2iRT6pff_oO7eKRmKcU2RtalXACIQ5nd0qGQfNm_tVIiAdmNF7CtQrIM0Izz4-QntgcYoHzwaUgdqq7HA5Iv-3dOuZHhK-1gw1NBoh_qMJ', 1499781585363, 1499781585363),
(338, 161, 'Xiaomi Redmi Note 3', '5.1.1', '13 (13)', '9a5ec0f3', 'dIpKYJcL030:APA91bFbHpbcdlpiSzgJgKTovccfSlL7hmQPrWI5aM8lkD2EsdL9GD_164wYXO6TpZYd7p9F2swrN13j9BtuPvxWHaHzBZPnsMuNjVGtbgr7CekJpn-t0MN5zwGZZrll6yDigO2a74u5', 1499812169443, 1504790643710),
(339, 0, 'samsung SM-G935F', '7.0', '11 (11)', 'ce01171124879c8b0c', 'dKon98mHUxc:APA91bGnWh2byJefOs5ZOTITGfyQ3xlnEEAd48sibhHX3DwFvatQnfwXa-uz2JEUKU8tnR9odSZvN51SksO5Zqx8A0sk2iclMQ4_GRMlxx8Ya_47TmFU2__CH1QGhB0-VpBQmusXkqro', 1499828039277, 1499828039277),
(340, 0, 'LENOVO Lenovo A2010-a', '5.1', '11 (11)', 'HGEPH57R', 'fP1VVR9p9A4:APA91bEtzdyDoRyoi_FkJ5I1BiwFekpyYr9A9ZU8Wo3doX4ZLyTvyuhtcoCUdgZffyPLk37r10M5xSBTC_g1RWmjJF5aTKuJUVO9v70jdbkt3f611zK6Akj3qZ9WIoscguZQtxNaleYk', 1499829773268, 1499829773268),
(341, 0, 'Xiaomi Mi-4c', '6.0.1', '11 (11)', '4ed0b8a6', 'fewogYedXLU:APA91bH98p6TnAgoWVTGizd0M6eLq4v5z6yrddmbK20NojIyFpvJWEx9aCBL7MI1V0Z5GuES06LQ0EuveZ-EXnmSj3n8ZzYBUoYqhTaOfdyQ14CqwyF2OZViiCsEVZN1MMTlXKYQbFim', 1499834256424, 1499834256424),
(342, 0, 'Xiaomi Redmi Note 4X', '6.0', '11 (11)', 'CUZ5WWEET8EEAE65', 'fDfe09xpOX8:APA91bFrjZZG2wDlmi3PjybNzRTdDOWkTgAHK4P2jFREQTSYBNWNCFTpKOvmBeVJDoBsvq4g0K08cI21JzAmQ3kmjOEnqm3-TtC8cT_zvwPkCtaY6Wyt1yhll4_VgUTZILmEEQqpMfhK', 1499840789077, 1499840789077),
(343, 0, 'samsung SM-J200G', '5.1.1', '11 (11)', '42007b59d6599225', 'c4-MP9oTN6A:APA91bEivPic969iR-tfzxiBssHnUHsbyZB6LWR4v2XCirEpZ9WgFcovSKzicFFBNrngv_lYnhlq8CjIczDEsLBW3JOR291SjXUXjnMWmh4iFH14a9pEKkTM1vtWKtoZE2HZQGonzD2W', 1499844788469, 1499844788469),
(344, 0, 'Coolpad E502', '6.0', '11 (11)', 'T8NRDYEAIFVCDMTC', 'edhHnpWGnL4:APA91bFyWEnBAD-wTvHCbfjMDIlIbsX2v0PCyoEo3AtEYuq__LxLkkwOTOL2hSQT9FnLbYxZseB7qSJZ2tewy8vhIQ7BPVhFqxPvebVhsWdTknCUcuNtKiTUMbbKzDs-_wsPsJZ25ppd', 1499881592625, 1499881592625),
(345, 260, 'ADVAN i5', '5.1', '13 (13)', '0123456789ABCDEF', 'fLnb0Yf6Yr4:APA91bGonv4afXFnCXcSV_YYMnNJi1xlbEDOEbxEgeak8RTW26dfjhp90RIRWIkenLpYjfgKgWH34H7nUl__GRZrp8aI27LVZeS3qw5JFHWbzHwpvX_wbSNIePd9yYAPHI9AMmMJqLwQ', 1499887003226, 1506837255739),
(346, 0, 'samsung SM-A720F', '6.0.1', '11 (11)', '52100d14ea6d248d', 'eFRW4PfWYeY:APA91bHbQdyIT_TEMN16o-LyDnda_6CcQpTWD9Q0K4J-EHYRaMvNtUgHuMEjV8Yvu_lek-rrtsC7WJQcKjF4kAywxPSu4QAgyBeZmkGhyrrDWZIu99sMxNA-x0Fp49okEcRdyi2ETq6n', 1499939364768, 1499939364768),
(347, 0, 'asus ASUS_Z00UD', '6.0.1', '11 (11)', 'G2AZCY07P178', 'fw54ipAE16E:APA91bHa2EWH7wzPf93Xd4vFL4S-6-K9ixQ9L7jzsd5qCAdi8OAsfZYoPGFlMfEv8O-3wDrQOrYoUbIKNe_GvPZzZG9safFbPKPBA0e88m6SgZbeCem1ULdI6NqSwLXl6fqwywn9c0D0', 1499959179446, 1499959179446),
(348, 0, 'samsung GT-I9505', '5.0.1', '11 (11)', '9d07033b', 'fPaIZ1nog4E:APA91bE2Y27NYw-pysSTs_FuXZbAL1UOyEHVUgDpIco2qykgswmYi_EgM1MoP61KYuyIDvTphdGYNuW4q3vbh8EPlwJ_du9NRQ7psWC8dYOMwcoryIlQjeQm1-eCzRRZrn1kZTwHiHRY', 1499996612675, 1499996612675),
(349, 0, 'motorola XT1022', '5.1', '11 (11)', 'ZX1B3439FC', 'fIFMURZ-3us:APA91bE6ZwhLBhYAHCpELs-4Y5_ZY2gqOxfN4Y9-DBqy1gIwHhGP0n4HIBSdTAt06G1oClINu4gM1NvXWFsFj_0PYT9yGbobNQjesVOZt7KRZDvrV9-18Dre8KlVTitO3ARIlskXHZn2', 1499998993282, 1499998993282),
(350, 0, 'OnePlus ONEPLUS A3000', '7.1.1', '11 (11)', '1bee021c', 'fgVTXMMhOog:APA91bGCs3nITdmfvYZGO8PmMzQnpLfum0j-ZFdLPOzCr4lwRNFKAPYXoJKAAlLK9Y2cHrBXyiyxX6YLG_jXHSUp4Nkn7BMvEpkLBsuuk-oFm3xyGBJPvaJE-l-tHokNjhMGMRGcn1G-', 1500002534866, 1500002534866),
(351, 0, 'OPPO R7sf', '5.1.1', '11 (11)', 'd84d0b7', 'cIla3TvaHtE:APA91bGeNeYT8YS6lI888peI0Yap3jOm1E0W9hi5hVvGBqwJgy_7j2ABUOLIl2u_M1yQrY6b1Y009TO2--uOC0W8dULHyfeqW7c7cqTfQh3OlEG5CKZ9oOPwFD1l4zL3HJ_FoXRCbbvu', 1500005158728, 1500005158728),
(352, 0, 'Xiaomi Redmi Note 2', '5.0.2', '11 (11)', 'HMS8T8NRWGKBLZSS', 'f_sb1KWucbc:APA91bFvGfi8FieoAA7tVj3lxJOVuP13EdymtVXi6_4dmctregfDFEDVtXunA5SDvqJLviZQwo9kewS-Ld0jkPtuUvDU7W78BKMGpjFrJZr1b-r_i622EnkiXfHFrX9XRFekcibkCOzs', 1500010359178, 1500010359178),
(353, 0, 'Infinix_X556_LTE', '6.0', '11 (11)', '01885106B0400320', 'dvz7Plgxt4Y:APA91bHkQ1k7S3VF3w6TyFWBt_XQU-IYj3eU0XoN0Vl9EjNuJc3Mz1H91-L12GHeXGRd1G5lF5iHAesikygMStdrC5levb08lEmKvUvO-bAph0sKFdBFdlRAKND5EZC7uTzcnRDQu7JK', 1500043263119, 1500043263119),
(354, 0, 'Xiaomi MI 5', '7.0', '11 (11)', '377911d4', 'cjiBZ6WO3nA:APA91bFjLzRcNjvOiOnHMFEMrBC_r0QUHES1IlQv7tY5hWh0q97-y9qQEtEGCItXsYClai7Tl5IKr-TwSk8e2gEaiWXjDvupF2r9lOqE3Q9ZYIMHwBDUY16Ctiq2mi1LxinSavdTfEHZ', 1500121584810, 1500121584810),
(355, 0, 'vivo Y31', '5.1', '11 (11)', 'WGHU55F699999999', 'd766GW6zLDU:APA91bFP_9XLpwRHJz45V6RZExkT5KH_YIxvG105L4-q-Zsoh2eTZctUwcSl8XkJjAGmeR7cJJQ4OTVQWtpDGHzNMNlAc1Uy4JVzF-mi7Or106VLHjrWjZS3z4qWbywd07fPzQyFKkTp', 1500127243179, 1500127243179),
(356, 0, 'asus ASUS_Z00RD', '5.0.2', '11 (11)', 'F8AZCY10D797', 'dsds8CvMgNo:APA91bHYbu7xqYEpsC1QpFidrYtMebzV-BHrcyXduJPkw-GUZ2Ods9WNOLeV6hnTveorX7z6TRkj7ehqpYAkwrTsiUz8Di_yDvkQNjFDmMWtphezHnJB_F81PJDngcAdXZ5wE0WU7hfE', 1500141145177, 1500141145177),
(357, 0, 'samsung SM-J710F', '6.0.1', '11 (11)', '5203925eb48d83c7', 'eKW6DmGvasI:APA91bGoP-poCd5cW_8YzqDcbVJlmtaZF5x1LkO9IN-3XsbsiziiwoM73MldLk_zABdxmXjQTZrMZvPJxOFA5Y4Or3ElQ3nDeeys0bvXCJ3AH_3BuY-26luQmTD1JLsiG3JXD21HinMZ', 1500198870592, 1500198870592),
(358, 0, 'samsung SM-N900J', '4.4.2', '11 (11)', '17d5317f', 'dRd1NdI9cks:APA91bFgVuUmvJCCtp30RWIejPHkUtmDhGMrS-bIl2I6n4jcq-AFlBYMiXqbyewksPJ4RqOyXxrMNCzBi6oAZRCDWnSWcUus-H8zoYQsyek-putSr_E5woOWYTYjaq5Gy9z3TVuRooNg', 1500214941172, 1500214941172),
(359, 0, 'samsung SM-A520F', '6.0.1', '11 (11)', '52108fc2fabac339', 'fUS1ijwWX8Y:APA91bGPjCJYiXLvcvZd5T-5edpjUES7f8casHx1limEZgiGU8AYA4xMGPFhLy--r6KCBLzJTOizRuvegkeZAufOatraOATcH-sqtZa5gpZ8HP451lYe1ePkUCApmtTZYWfKOxngGA6f', 1500291473919, 1500291557487),
(360, 0, 'samsung SM-A720F', '6.0.1', '11 (11)', '5210e9a1c0c614d3', 'c4cZl5VGW1E:APA91bGyJpVToglP-nvfETx0I2fdcs4iVjV1hdB8NNy8OYy5wDpgkkmBdE7gwj6wkXkSpNYYJDi30jZgl47u-thnYH4iXrlbUGG1QHA84lEqLNxirhyNH533NLsdHca1srjU6nbwTDsM', 1500355661543, 1500355661543),
(361, 0, 'LGE Nexus 5', '6.0.1', '11 (11)', '065f886300eb8d3b', 'dQDG1kQp264:APA91bF_WVA4ZDlrIKbWOHuNAtChZN4LqdwO3XrHiztMyJMmNboiJ_KPISKJgCx-6RGBZuSFx8IW7RA5KIdKUB3liWp82hRaQ8ivTEY3YjGOLUxIlr3GTGUXxiSQiguX35ND_QjXucGO', 1500357173456, 1500357173456),
(362, 165, 'HMD Global TA-1000', '7.1.1', '13 (13)', 'D1CGAPF710704160', 'fvKmWEv0-J4:APA91bHf31IB8IApl2JyYQx-zvZ0d5EtBTwwPvMH_hFGtaEG4unNruwjI0X9ZAUXkrtHk5FrtaZojU7JpQRDzWRC0UtBGS6lORppiPuGC7SMV8BkIbSH2URzEaEY970XANFKvFCuUVfY', 1500361248254, 1504821016740),
(363, 0, 'LENOVO Lenovo K920', '5.0.2', '11 (11)', '9577bed4', 'fCxBHa95HSQ:APA91bEA-IIF4qabwmyShAyMjlmLbkCSVqtalQqx_YlJ2zbMPVZ0Fg2k3Uj1jTK8A3B-jOAL1jY1WffQoM8jsQigk96qLtgApbLjNPcxN4vlBUBLnClB22RlW0iG0olH6iOn3SFRgcDh', 1500437465863, 1500437465863),
(364, 0, 'Xiaomi Mi-4c', '5.1.1', '11 (11)', 'f059226b', 'fO2DfA6cZTI:APA91bF0LMkcVhKjnk-cSokwGdA34ZvRteItGSx9GJmdcROWsPlZiyUdsDd5psQYimOeOtJehQk5uTLNbALBlwQXcWgILWjdpS4KLJJ3H5jtdJSSopnML6H-lYvJsXfNhtZHSGs0BH_S', 1500439321700, 1500439321700),
(365, 0, 'Xiaomi MI 5', '6.0.1', '11 (11)', '17a0505e', 'dKAHtYrRPkE:APA91bHLAhITKSHLC_Yr0tgVgiIrE8yTLSQzvHm0Nk5LfNm_xO22ECSUuXRNyHcbhC9ut_R4JzEn7HAYsNQSq1AAyPxv2QhYORQwjx6E7apFcBGr-emH9DjylM5_h51py6iHD-Usb1Wz', 1500446717138, 1500891113951),
(366, 0, 'Xiaomi Redmi Note 3', '5.1.1', '11 (11)', 'd38cc2cc', 'eV666x-iuOU:APA91bGL8MXfcaav4e7LU0xKhieu8QsHxtt0t3mN-Uvmk5GnDA2g1pddlGOYn47BD2_VzYuzRfe-xfW4W153VyUqKQUROWlp_PgD1IaSFqJj7fmoNXXn4KloKp1GC2qY5bc7BpS2Wuf7', 1500447894816, 1500447894816),
(367, 0, 'asus ASUS_Z008', '5.0', '11 (11)', 'F7AZGF00X252', 'csmAAa9MLAE:APA91bE961bLqeedOuoezODGpOk6XyXo3TOAKDV6nBfVxrdvlOLHuzx1-5Ok_VDKBIGrgUDXhgwOm4yorxZ4kKM71TphozbJKgnRpyYlY0x_8pBWtY6gV5XgUBOn2_dtPltGHmv87QcO', 1500469050726, 1500469050726),
(368, 0, 'samsung SM-A520F', '6.0.1', '11 (11)', '52108d6059e5243f', 'e9z7iXqI_9I:APA91bE3YcdTYKnzXhCYT8U5dCNXyG0dlBR8PJaT3RfvqKaxg6JJtFsgkVG5Hdq1txclFOvtDnETtKgwcHu99CFr0sg6UTdcUVa2IcNuYRGzb9UXc8t58ZgiNQYTUYBKZAdwbLa7GBF7', 1500511282358, 1500511282358),
(369, 0, 'Xiaomi Redmi 4', '6.0.1', '11 (11)', 'ac4f6aab7d73', 'fZ2CKdc6IE0:APA91bG59OsrQyX3qtS8HETYcQia8l4UCZKHB7wfFTwPSgkIozL2jNbEJeuRtE7XLurkGyzWtYO2h9dmcJjfmLYpIO8LAVj5wdhEg0iDrnDpvp5gwJgrV_L4LTBy6WyZUYgLQutocCMV', 1500521186003, 1500867598113),
(370, 0, 'Xiaomi Redmi Note 4X', '6.0', '11 (11)', 'LRR4V48S75CIEQ8S', 'dK_kXKAq8Vw:APA91bHuxIWDYtFZ6sv7eJ9AU8QXpoMAaSOsxu_iA8n8Pr6EVZWYITBo1f6EsGG2i8ZXvYOTqtv7f-TaLaYhUioxIHFR6r3Xkuht_3-xR0dfpOsIiy8rTHngTIH97M9-gE4FVKLd9sWc', 1500539504765, 1500539504765),
(371, 0, 'OPPO A37f', '5.1.1', '11 (11)', '440019a', 'eimR7kbsASs:APA91bFA4E0ZTs_NFhrLn3FKJbEeLjedy5RPFGRHRs-_j39nMVcC7mA3d12AwEYStqsspbjO-YDBlJQ-f4mJvQhpxKsgtToRj1_dWOE3KXJnkqkQODpUapWFbkdWxG8ezS7PwSE59y8v', 1500566708837, 1500566708837),
(372, 0, 'samsung SM-G935F', '7.0', '11 (11)', 'ce051605b17a133505', 'd2HlQ1ZZ-U4:APA91bFsoV8Do68TZxpAP7T4bgeL23xvRKzY8GneksfPVUDRSPaGQZW60Wnp-QG-Q5evkNT5WrKcGvULPwmkx5VDAp6ye8JXusPqhTWyHcGupx923hexRrBo0CoqSydi0CsnV9V3O33i', 1500627319379, 1500627319379),
(373, 0, 'Xiaomi Redmi 3S', '6.0.1', '11 (11)', '8b64daff7d53', 'enVe43qbyHw:APA91bHI1AZIOP67CbiO58dcC6kESImPhD_NBrrIwDY8dNAg1PvibbFQT7tBKje0qp45pxSzyleDrunkj6ZmEX_8vPN82Bt4ql3bhq1164wYHD5E071b0BH-gdCR-dMG8stnl2Prt6lR', 1500636003987, 1500636003987),
(374, 0, 'EVERCOSS A66A', '4.4.2', '11 (11)', 'SANVOSSV8AMEM4HVKHY', 'eOjlsL4V23s:APA91bHqs8DIhl6hINEV_xLsEh7pprTBYLj86ojSDONdKTjd_2ACSm8OHNKokByZQAgHwm0_2aAP28VfxuQyAmdOgJQZz6IS6lnoHtRtpnPtdxQdb9hdUBK06dHdWBNek_r9BR23LSlK', 1500761183122, 1500761183122),
(375, 0, 'OPPO A37f', '5.1.1', '11 (11)', 'c1add343', 'fBX2TllRIw4:APA91bHj2zGr4e-yuQ-hhKhehk8bmpwGXxJfx2TW4gGd_oKuTrvE1Wz371WN4qbZ-9xD63038504ZyvsNu6YGp_GjYX3KnqfCa8xKhs3AlC3JhlFlg09ZA6dZ9ns_KoVL_m37qn-ZL24', 1500811710116, 1500811710116),
(376, 0, 'vivo 1601', '6.0', '11 (11)', 'C6JVONKFUOIBSSOF', 'cW9oDgpRTkE:APA91bEqT8Pm2MDJsUUIOZabADSO4spDCliIw7tV4jR2kP36XG0YN_Jz8VzfJ7Rcn1ezDIDUr88eODsiCX1xjKbnDX2v19mV9ICrUq7n5idQhWj8SL3Gsvh5Oo8aqqkDXZO5AJa_3mRG', 1500858137072, 1500858137072),
(377, 0, 'samsung SM-G935F', '7.0', '11 (11)', '9885e64d5942494b48', 'dK1SaIMMiO4:APA91bHaFJ6Nc4Uj5mlQiU2CQXfc0XAxuQZ5cSHTEK3YdeGILuP2Sl4RWWgdGiPmgMoodJtkFxTNonk4FlLbTzPTuBKktv3KqsKr_ifA4Tuj39-pjgMD5ySEIxdboKS5dAjvjH-21jmi', 1500868643023, 1500868643023),
(378, 0, 'Foxconn V55C', '6.0', '11 (11)', 'V2AGLMB682007416', 'eHXrZGpUyZw:APA91bH1LWKOlTR6az9C9Lcumkjfqh9CNoaUnHyiGHKpiWgH4KFxySrHegA7QL1_dnmpHqGkbC4qdrnZRH7AuI_3F8n5YeXlcbGwgUkbML9AklSJwoqj5Xa-hgB7Y753Ccms5q1TYjXi', 1500872238673, 1500872238673),
(379, 0, 'Sony D6603', '6.0.1', '11 (11)', 'CB5A256S1R', 'ekpn3M4kwl4:APA91bFI9sGC0Kxck-E9eK95GbSDm3LapbPKhxj0RWxq3KBpBh9FmEe1Qpo1xJDgzjZHRjfxcYdlAj9pIwcgOtBBUedU2adA-DYBVebi80v11zGI4B15FhuwaDULBsOy2Y1aXCaKi6a7', 1500902679673, 1500902699503),
(380, 0, 'OPPO CPH1605', '5.1', '11 (11)', 'PZMRHQ8599999999', 'eLgYrA4U7WY:APA91bERRI7Cs5hWxd9-aBCYQuhoBVi2Og5XnTA6lGlSEujYR0iouHDyADIvMxQC5fRpFXxs9q1jeIRTqynM3mDL5cVby711uDKYR2ITBthrAlrj2TzAQdRkCToxIIviKBOq68TyU1cW', 1500959696962, 1500959730723),
(381, 0, 'HMD Global Oy TA-1000', '7.1.1', '11 (11)', 'D1CGAP8732700993', 'eVzTgAFzuT4:APA91bGO-b92HHWMGrbaZ6wJiJtinjUmwtuUcOgQCrLg-_j8DvM9pM8b2k5WK9d7t0gk78WldOBkSRkryQ79-Af_vIuC-o90PbIMQxn9P8mnjk5xcucI26Eqrh5LLZ-1nevObuWV_Jjv', 1501065706538, 1501065706538),
(382, 0, 'samsung SM-A510F', '6.0.1', '11 (11)', '33009d33b86db2e9', 'dFE16MUVquA:APA91bFn5Jnp6dUwnNOstlxfvEY8MlPg1xa6QolPS2Y4W9v9XphPAxxhBRjeK12LqrDy_DbayHnqwZ85JFfsoKinOW8ck7zBQ8psktLumaBvXo8EyD1baubcuS9U_Q0fqOGLDB4qbjL9', 1501122714241, 1501122714241),
(383, 0, 'vivo 1612', '6.0', '11 (11)', 'SGBAGMBMF6EYFMRO', 'emYl0aSQh1A:APA91bGDfXjcwPXX4dLvCPWgQ4EuVeCTVxmEmo59seC_IbLdCUUyopTa4X4sTX_oI15W1lDBW3Z0LVHdqB2is7KSXr8fh0j05I2PoEMgKBuhVseaBcmNOH_Z-yRdX13GUC5xiVprMtNq', 1501133911191, 1501133911191),
(384, 0, 'LENOVO Lenovo A6020a46', '5.1.1', '11 (11)', '694bc649', 'cPMLzB9JyQU:APA91bEmO0XrIHHaR2F4sg6g_-PIF2XryYDPRpIdePUsyVKmKD4MUQAUCFq5KhxAcKAjE13IQxlhfjP1tcseZ3SMV7dywl5xFHeqVtB-cFAb3k-wMnZN-Far_wn-A4rLLiypIgHD6Y7F', 1501140941185, 1501140941185),
(385, 0, 'OPPO A1601', '5.1', '11 (11)', 'DIJB59HU99999999', 'daP7J4UggRA:APA91bF3QaADURf7cYSTR6a5ItRjGjDECUa4RlJAcIEAeXMF2iFyQzUs3E7rBfvUjWSPOCVAJaTpiOd2pizOHuMy1hYCQQz0la5cC7EgJ_x30XB2HZ5Oh47YENZ4boIGmpwoGTLkRT2u', 1501163573679, 1501163573679),
(386, 0, 'Sony E5563', '5.0', '11 (11)', 'WUJ01KD3QY', 'dG41TzBMeF0:APA91bGkW486z-o9QoWvkKGUDCHqxfszHcfKS-sBSsUDAZp0leJPXviTYc4-GNKXhIszgyHnKysUPYztrbSRR3bP-toIvfxSfqcKC7GFr25ywGUNLxDXNg1doORwSjj0oaTj1Bbp54Fn', 1501217324763, 1501217324763),
(387, 0, 'Xiaomi MI MAX', '6.0.1', '11 (11)', '51c0a250', 'cIYGjK81Z8Y:APA91bGhq_wInpiPBRmG4vohRyy7lZfWSeWOBAgiGPhYyXJcg9KSgf3Thl6lAHMOAS4eE2M-NuUoh2hqg0ntiZceCwRMnkmj4MYaRGd3eAdt00k2ZB99ra0eWjHCjvafY0o8TQWCQodV', 1501369850315, 1501369850315),
(388, 0, 'samsung SM-G318HZ', '4.4.4', '11 (11)', '1101d77399d6924a', 'deMa5_d9Lu0:APA91bFuh6qioz9Sr-JjdahTgocwSm7SAarD2lvd6JaEHfneoN-eLz0T65TPblgXiprVqCmjhQ91oCBZ37Rs9prQzXxgm8o3hfQN4LAqFRMM5gSJgZNXM4MzwSSZaiSD8EKPXya1cY2V', 1501440434514, 1501440434514),
(389, 0, 'Xiaomi MIX', '6.0.1', '11 (11)', 'eeb40f3', 'eJSXQyOFVlo:APA91bGOw81W_59KD4qBBg04gowykllT9mxRQq7UFfYDXc_sxdmeYBgVQfhazk6J8lD29gW5LlGaLR0cwD_IJkV818Zg42mkElgGM7x4Jw74uk2rGstC1maWvqcenVgTItvA5wprC3WJ', 1501485107061, 1501485107061),
(390, 0, 'OPPO A37f', '5.1.1', '11 (11)', '4426de15', 'dp-XZw3BGF4:APA91bHrop6A9AjMwnVIVNs4RSAY0CIoPdwzT6TNi-GnRIPTlHSxp5l70Z3gwlmSOr1E2C7d0F1C5DtYyNQVpjEFtWDxuaNBK3CuxGZbRno3HV0Y4cLwRt0YhehiZ5_Q1_bJ4jwNzj-P', 1501590049083, 1501590049083),
(391, 0, 'samsung SM-J120G', '5.1.1', '11 (11)', '4200b67dd89c4391', 'dwrxx3DC2vw:APA91bGfUD97tOegdx9OWoLmXFDUSxK4qs-OU7WpYrvH0F6DGHkUH01BZ7YgwAa04XztbJL1kNsBAkvB4cW2PYObbGIqk3AbhinzUEsBpYpbxt-fQSyMOWrtLo49dHhkpRy_uf48Kr9B', 1501643908023, 1501643908023),
(392, 0, 'Sony D5803', '6.0.1', '11 (11)', 'YT9113LDRP', 'do20_dEJeNM:APA91bEF811O5fbpQ4424vr64IPMT-N7yjjLzlRDvlOd5yD7uyK3ZWiZs-x7-3DxTEGlU3rq6sbTsPjDfkMjJdRbQ6qiUD9_ImIBTO3SebC72YN-q72fCXbNIXyZ7qwHeTUSLO-mLdjU', 1501645862250, 1501645862250),
(393, 0, 'samsung SM-G950F', '7.0', '13 (13)', 'ce031713dd502cf00d', 'fNibYsGX1kI:APA91bHYUnRem0GmbeqvSfSkWr7FM7UiZm7x9Lr5njXuBC0ElPLJVOUNbDdzW-VgmD3FqJYw8x8IPVabKIwKn868SSGAgOJLp4xtonr0IixFAZkEFJZ8fSfCdM4562--BMT-CZdFjrkH', 1504696034730, 1504696034730),
(394, 0, 'HUAWEI LUA-U22', '5.1', '13 (13)', 'G8M9XA1682903970', 'cmnFNfCm8Wg:APA91bELa5jmct2qPb4yIXgIvAnzVTrRatkL6iMVJ43N8Psyat0yJkbBpLpStqtJR8KiypypBpKgOvIhZb-eq-dWmJgsicI_Y3tYrUjyvjxfyl0ASqxIAzYC7q5SxayjlUDVSs7QChyp', 1504736596747, 1504736596747),
(395, 0, 'Xiaomi Redmi Note 4', '7.0', '13 (13)', '3257f4979904', 'cU8Jky31e6M:APA91bHFgkhDY5ifFleH6uyHV6bB1a_cbegs4sN2C3AM3202jgz7xSumg_YL65se6Cw1V9XZkfLylKBJMjH2H5zhMmi-XRmBspe83_DIGHtpfvJ6KnpZA19GjxUdENDitbdfd_Om3jzu', 1504739698074, 1504739698074),
(396, 0, 'Xiaomi Mi 4i', '5.0.2', '13 (13)', '64d3ee63', 'd4shgJo4Y9c:APA91bF_Pm782xh_zY4_STE8_EQOn06tY8vbiroB3AHbKh_KBsfesD-tm3n2aEEZB4jNqgBorjdqeceqvuxDwyeeEE-DDqcbSS_wIsemFCMkiXQWyaZQ1nVaI4Q-9KiAuhzQzglB6BGZ', 1504742802796, 1504742802796),
(397, 0, 'samsung SM-G950F', '7.0', '13 (13)', 'ce0317133d09080304', 'c8-Bwx2ljNw:APA91bFtNf7MhZa7tZ99uq2PKAV7G3NQbqUKKZ0X4tJRiOzqWvAGsKyLh_SnMugDA8hy_FLjEPT5dyEhL-LukgyhhQW3pZn8Z2mMVdNRkP2LZsV3tyPKOAqosqjXyOaQ31Q73smdh_Jh', 1504749430803, 1504749430803),
(398, 109, 'samsung SM-G532G', '6.0.1', '13 (13)', '42004b1ede2454b1', 'f4OueIedJ_k:APA91bFfOuHd1OQVP2SO7bCtIXf4yARSwGOP9X6d5Qq4D1gxxw8Ks1GECMR4J7D7s9LE1TgG5imJ0sM9DH1LFsPIi4Q9x66azmTTFzomgkaxf9MAh_oDk-QwbOjkfmC8x7LLoB7ELZ4n', 1504754610835, 1504754610835),
(399, 0, 'asus ASUS_T00F', '4.4.2', '13 (13)', 'E8AZCY296859', 'fXDTRVA2-7I:APA91bE07O0L5AfjbTKE6uP58fvaNtS6DSaQ9muuM_wkuV37v7iPy3IPlGj3zvYx-rbukHQ4LssF1-MyhVdzpqve1diaOJGwyfUNpt63UzrzsoGn2mPBuoOr3RaSZ3l5GMP7mToEZOiT', 1504768485181, 1504768485181),
(400, 0, 'Xiaomi Redmi 4X', '7.1.2', '13 (13)', '2eda9a3c7cf4', 'dtBO8kpws_s:APA91bGipmT0v_q1f9cX63ZF2xUfwKNCTmlAcMyWv6KSnKGkemfBmit1IB7LVyEAYOLu_8mtgt0g_ftoziYrhF_akBQ0kVhUd58CPFm4X_6P1hvjAcqu_HkypLNMn0pqZQmKSDe6r1E5', 1504804987039, 1504804987039),
(401, 0, 'vivo 1606', '6.0.1', '13 (13)', '126dcaf2', 'eGiGwiflxJ8:APA91bEg2-EXnio2GQtgrVdkiAOm-EvnOmrjpKokelt903TViDxVeLaPARUzJLP16AF0nL-yuHNMtyATbks5UnsLArJJicdZtb-VomFE72Iyu5nPEDH_g394uzgr4mZ4q7wyxem6jg4r', 1504807172477, 1504807172477),
(402, 0, 'Xiaomi Redmi 3S', '6.0.1', '13 (13)', 'b6f0224a7d53', 'cRbryWaQy5g:APA91bHwtEkEESXlcsVtgob0I9Qnch0j65tCvX0OFSkhz2TKMYKLzgUX1GXIqVGGtYPw7FLHbyZ8orgG_-j6BmQqxnIWANql-Jo0d6FtY_ueR7Go3O0sdHduJR76jnDWuhZOEAiKyIe7', 1504811298505, 1504811298505),
(403, 0, 'OPPO A1601', '5.1', '13 (13)', 'OF5TS8IBVGLJU8VG', 'fju-F6kqtgU:APA91bEEeX8DXjyS575jmpVaua05CQDXWXLJ-xI2CDoRPu_haGpUJ8BL_SrruOtWeW5LL1zwUQ2HvGyN5NPy_1WUOh4MUdXwJ8QMiKXMkj7lypQA3ZLhs1acGv0AfB_2MlQ20Z_OkyER', 1504837965272, 1504837965272),
(404, 0, 'LENOVO Lenovo P1ma40', '5.1', '13 (13)', '7PHAVWDUUG7PHUU4', 'ecC6qgBhemI:APA91bFgkL_VSdLQ3xLx307y9QTiJ4v_9-b8QwnWvxyz6gyYs2LPKNoDFFZVQTQPTXI5PQdsc62mP5ZxoP75--eQ233AtOdwUUd2y84cuC09R2qE0dlPcpfR2MAIBBRgUL3FnQni4Fum', 1504838761864, 1504838761864),
(405, 212, 'samsung SM-J700F', '6.0.1', '13 (13)', '3300ab9f3bee6227', 'ct5DMKVDFSU:APA91bGyoM0jgjpj8-wJnIoR3DHO6wzNL9P68ALtS1WQvGhMyiSlay_-lm0sFLxmxKuUKtmeq_CYHCde2l63dVJEwEn8O3HTqU0NbQqBIBGCFjjMCsum_BMIQYvEHCqpCd-ZkR4fF4Lf', 1504839133146, 1506596029514),
(406, 0, 'QUALCOMM S50D', '6.0.1', '13 (13)', '91c1aad6', 'fFFB6y7jdTk:APA91bGFjHUQdOFH6ZTVk3NFbXx4ewgF54H8Yuc83oZIsBkQe8DGSlEOTBBOvOmI8-DmmFKdc5RwXm9O3nb7q1xpUKvY4TOAq5ICvxchQYFugHvGErNOyLWt2MPMz9PIrQP0y5CpihOR', 1504839468524, 1504839468524);
INSERT INTO `fcm` (`id`, `userid`, `device`, `os_version`, `app_version`, `serial`, `regid`, `created_at`, `last_update`) VALUES
(407, 0, 'asus ASUS_Z00AD', '5.0', '13 (13)', 'F6AZFG08S160', 'cUyhUj8RNSw:APA91bEY_0aN6krnraEv2Vc4Mo7m_0Ogo8xGOiHtaPJPjSVNHIUOGbzZWB7a_HQER8xMlbKz8Y1UeL7tVU6RKScMwiApCJCPK9GFcOiT2fdT4q32q332UfiRghY-yDazKTQtRvHmg_4z', 1504885607490, 1504885607490),
(408, 0, 'Xiaomi Redmi 3S', '6.0.1', '13 (13)', '32d51e077d63', 'fZJa5PySXqY:APA91bEzWhOkGXpApXXK_OpHsEqf5Vi34qxQb0LR_se_K2YoCDqxULiXY1V5wShgt4MGMeAA2pGopmr-appoBJfoAkdDeZLdXhMavj0xL5uHGM2YHBnsed0_cjtqedWDwcG1MfkcbWdr', 1504937035773, 1504937035773),
(409, 0, 'Xiaomi Redmi 4X', '6.0.1', '13 (13)', '389890507cf4', 'fekKW7PtQq0:APA91bFYSLLRxA-K1_EIyNXS30sEsUcqFlpOmqZjzBF3P6yUqN8QCRw9DwOa0nAOhNXyHC8aUgorj7O2tRn2zDE7kC3Wx7Xe6S_epM0I_yMGaVGTjeotJrTMmJtORRxpJzGFGQn0GFwa', 1504959929751, 1504959929751),
(410, 0, 'Xiaomi Redmi 4X', '6.0.1', '13 (13)', 'e1da9a967ce4', 'fWu6kIkukcA:APA91bGWek06RT8I3Pg_tmrvzR5uSYO2sp6ACJ7m7ate7Hc4v7zr-iO3FjcDAZlt5aYJ4ZURfTglnHoaIhMYWTjyILO2hATZRNfgbQ2rsmg2iSlFS33Xxw7vxLGc5rLNex7g4ZQDvx-3', 1504961492105, 1504961492105),
(411, 0, 'Infinix-X600-LTE', '6.0', '13 (13)', 'H533X60001234567', 'e6ueqFp3Njc:APA91bE_InATbkxqgApqvKTvp3S8zjDNue42DG2BeSUF31r9o0CPptyRYy9zMNEGVItGCEagVXs7AR4U_sraXFjVUOFAKBM79UwBBMKC00RcAywcSHJSa_A19NC72xn_dRkPCg9x79V2', 1504966394941, 1504966394941),
(412, 0, 'Xiaomi Redmi Note 4X', '6.0', '13 (13)', 'V4AYCYS4RKO7VC59', 'fqiBz9oNe7A:APA91bHSpFwcOK--d4_Ul9kwlpOk-ryovQocZ1BXi9xF7N0gXugIak33lEZz-Vbvun5wfeu6p0wpJ812TKiej6lnJ3d_j-H_C3wdP1FgH0J54Hn0ZqTzvEKIDSXjM6MnZmRXmYs3xmuP', 1505029395858, 1505029395858),
(413, 0, 'asus ASUS_T00F', '4.4.2', '13 (13)', 'ECAZCY021572', 'fG5FCrklb1k:APA91bGoHWi0ZJ_e_ZKCFiJB4zL1K0-lgGjV_5IV7ZSFLY7H7adEhkynZtLGXh2Mb2eNmYXtCOR_dTJBfsB5kFGVY_G8d4zN20Zunuo71QLHgGa7x9iV_vHX8no0x6C0Z0_10kKHxXyB', 1505051313284, 1505051313284),
(414, 0, 'samsung SM-G532G', '6.0.1', '13 (13)', '42003dadda6044ff', 'f6YoBSJnjjk:APA91bEn_lTWaYrT730HpcB8HxMYKkS6cHd8F0gFLynahHhH7zO4iloOtG7DaGANy7ryAUx6x_Ek7L-qQZeh-V2Cwi83j8f_KaLGGnGtFtmratCCoC2bBgIjg-OE598IZmUdwHJyEeDN', 1505055427328, 1505055427328),
(415, 0, 'Xiaomi Redmi 4A', '6.0.1', '13 (13)', '34c786501f603', 'cMX6dkb9a3A:APA91bESICs-5Y6u3pJ87oLQU8IXrT-uDMvg31OK0-Tk-fmOYVmio9zs3EPSWc88VhiaTWwwQEQqdbLfc5Ur54_ZOEWifcfeqP0UXf_jVzn2MvpdRb8m8aJdrsl7jG-_6Lv9GW54G50s', 1505078625570, 1505078625570),
(416, 0, 'OPPO A37f', '5.1.1', '13 (13)', '4670992', 'dBF7jn9EkFU:APA91bEv1y2yiMrb1UG5Fi059FMob404vDn33ToQnXZ6qi1mugeshLIpuoNi9Fn4g2AAMmhHLm5YUazawVrj2rDOwX3Teuu4MYy-YmU1aUjKCdwhm7hbB5S-hL-DSAyI0KYRtXR_5X80', 1505094912185, 1505094912185),
(417, 0, 'Xiaomi MI MAX', '6.0.1', '13 (13)', '35c3e847', 'feFBHeuxbkQ:APA91bEceinSVwoKh0nQYt41NJliXelyeoLpqIqNsKmmFTPlKEdpD2gNMhgkNt6W708kvdnQLZOumSm65_zQpay2D03a5TBrIAJjaB-763qLq5t2YYY33mpeYbyMXLPO94iloLX_01xx', 1505110937068, 1505110937068),
(418, 0, 'samsung SM-J510FN', '6.0.1', '13 (13)', '4d0bc4ff', 'frt3RFdd_S8:APA91bGyR9qH1lw3RJkD460cA2t21Y7UDX-efe10oSTVqZsIT8r35cTJRZthAvuokwannNG1SFlgdKmvl5SSD1CF1pD8bH8oFRJsCDY5Oi_kcSkpRF2reyIJ-RiR2GzBit0yCSQdsJGT', 1505117082609, 1505117082609),
(419, 0, 'Xiaomi Redmi 4', '6.0.1', '13 (13)', '8ad9d4ec7d93', 'dxevHrvK1c0:APA91bFBzugYIRR7xC1i2-syBX28tvwWB70497dS-s8r7tx-uYHba1LyQ0HZyn69oOF2Ik8QsF5slwOZwAItJ63tjuDGtNnKlIUCKjc0iJ_lFw7OBqx4BhM_EddsA_jC541FWOd0sm-6', 1505123630542, 1505123630542),
(420, 0, 'OPPO CPH1701', '6.0.1', '13 (13)', '4cf1a6a0', 'eatyDApm5ko:APA91bHlBwfIHGiAsHtLQBSUTEWZO-LJcQfpU8l8bOUqQzBNhRnefOlEfFT73ffGdhUs6bZt02WTtkzHG9bJqUZ1_UbsSCJoy88AynqkyFrTi7FMOGQiiEUJmw3uBhq0Q6Yz_Zh7KvHH', 1505159131470, 1505159131470),
(421, 0, 'Xiaomi Redmi 4X', '6.0.1', '13 (13)', '2bc62d97d63', 'enGf7Rm7P1w:APA91bEAee5MA_5GpXN2NvkpbF2u-5xzHjzkgyg3ROSnUpjXphnmeKiRvn3SR_rCWJ73cwd9fgYK5pHbA4UCTYrebc8qS4SEmvXns2aA1yEOnVh350z_4H5OIWcTdQfAZLAiq9H4TqGC', 1505169559913, 1505169559913),
(422, 0, 'asus ASUS_X00AD', '6.0.1', '13 (13)', 'GCAXGF00Y7322PH', 'eZV2nTLO9y4:APA91bGGK7eItMd7BXX3QP81-dx5P4L6SOjQ5PfHwJh2aNGJJkBcvm6gAlXxAfiiAi0Tz0aN0R545UNh_5GfMXK_kTCX_G9RoElIVKVFVCOR3kBJddsq3ir5g9hDu-dCWSTJoEK4d5u7', 1505192069026, 1505192069026),
(423, 0, 'Infinix Zero 4', '7.0', '13 (13)', '01931106C1300559', 'egtYJE4NFAA:APA91bGDv17FQsE3_y-apTqFo7p-mJabsFTmKsmNoLeFuepvcYiIeKNSDkPCS8mqj2q7ghCPd-Q_xfOrGvjHCQJ6MtCjsyGtXo9E85o05JjshJOc1M8uvtKNnXmDCsfC6qEWfUWx9JCv', 1505198758073, 1506495055254),
(424, 0, 'samsung SM-G950F', '7.0', '13 (13)', 'ce03171332549c4c0c', 'dfake75Wrfg:APA91bHHpyNcrB7V2lo_-seUtmIr_X4PDT_ulI0cvZLiW84a_ukdrN6PHs2_bDPsveKEEub-RjcvzvUvca9uBrZRy6fyZRM0Xd9GNlEXezUHCD8IpldlJHkQBm3f2vd62WqbDIGztfH_', 1505200563965, 1505200563965),
(425, 0, 'samsung SM-G925F', '7.0', '13 (13)', '04157df479e87211', 'fdE7EKw2oQk:APA91bF5yi9wgkBs-IJSLqcKSKsPqmhSAwHMtlOgH_gCHzpUoXfGocbQ6TngdrOrMqTe61Z7FSLzywnmO2E1j09HcrxCB4ydvwD8p9dX9gWZSS8W_cjhgGcVwCsuu_NDwuVrUMSP2wif', 1505210719698, 1505298950413),
(426, 0, 'Meizu M5 Note', '6.0', '13 (13)', '621H2CQH225TQ', 'escIRU412jI:APA91bHHT_sdI_hqytWNh_yRWxPzyqw6FGqVupYKIHaLxeUj1a-HhXlOl3Cho87ilt-gjxEFPurvsBHPe25M9rI-1fQNYqYHXemdrWuIZrcRJnd6mEMGwcxeCmadrF-V0cpJtlUL9Y4E', 1505213198037, 1505213198037),
(427, 0, 'Xiaomi Redmi Note 4X', '6.0', '13 (13)', 'NBDQEQ9SKRA6SSSK', 'e-OyilF0cg0:APA91bH9Sw7mBPbgDm6IDmvlqE0HcPqfsITZ_fS4EhFft2oaTmwbhLeMLsSYFhVva2adcTZQN6wfICeX3OsRQdcb8WvlF40OSQhBWMS2W-iEaYXFftklSgwHQCj5g2RJ_XtuQ1lClmvf', 1505213473190, 1505213473190),
(428, 0, 'Xiaomi Redmi 4X', '6.0.1', '13 (13)', '98d69bea7cf4', 'f4-Px0tpt3g:APA91bHd0S3kQYQkmeHaad3YBOsXo4d9P7H7qN_DexsDH4x2sFin7p8dmKYtr7GPY_BXb1GO5VnMBpO9y6c_YujTLGwPjOaoye2igkPBPpaiLTsrK8MfEZckHJHt7MNnGtdCnm1uWIza', 1505220598495, 1505220598495),
(429, 0, 'Xiaomi Redmi Note 4', '6.0', '13 (13)', 'MJBAP7A6AAMZRO79', 'egJrDI2O708:APA91bEdWM7aWJ_kt3V1I3i-y0F3NuS6XP5t9uX2BwbGkNZP2mzmlX4ax8dFnhBu5zYNgFSaXhk0GClEo946nbON1OB_q7GAvk4u7oArrLxBb9foJ5izprzfw7pNRVVIbE46vE6k-hXx', 1505221686724, 1505221686724),
(430, 0, 'Xiaomi HM NOTE 1S', '4.4.4', '13 (13)', '7b66e6fe', 'd0uB1OZrkw0:APA91bGtvWRe4bXmqiNcYF_o754zcemo8jF5ERIrg40Hznqs2whLthmnLaNTPyXEMlMUEYlBr441E2hjPHo9SsLfRet2soMBZaAtMgwHYP964jsYUEEl50dy9AQA5VWXcBGCxOeY0L0M', 1505228127302, 1505228127302),
(431, 0, 'asus ASUS_Z00LDD', '6.0.1', '13 (13)', 'FCAZGF005239PND', 'e8hAO2PeTPY:APA91bHolpTLMGXxDE8TYDbKEu9P2MXink7fuPL-mpscTpCavq0olwTq96i1xny-VzNqgnz6ckn8DDxJdZvAFMS6A9AE_ZihJfzW8Gtqd2oYeYXLKOb2ZEy5uviIi6qQNlMbSoXuGy6n', 1505248044237, 1505248044237),
(432, 0, 'samsung SM-G531H', '5.1.1', '13 (13)', '4b135241149b824e', 'ezYm7PntLss:APA91bEriwRhTSFighhYrxzjNjSNgqmWaRM4jHdOcOnX40f557AlkS6p8IPpVI9Lsh9us-sOWaAQLTOanuMmIF9thzNIThDOq03S64U8X-VGBY81sL7uel3LV_gJXhO07iU32eF5J7tL', 1505267562902, 1505267562902),
(433, 0, 'samsung SM-J510FN', '6.0.1', '13 (13)', 'd68fe296', 'cCVQdc-TNzw:APA91bG0ig6xA5QAQG6HyZ773Q2GMFZbZA6H2RdlfzoqQ_0OwhArVB0Tp5FJUOU-H9z0TG4_wBFk3fPetkArx9ZnlAq5shXxIa-qNOyOEw5AzPxQFzGYGK58FTmM_CuyF5KN-yNslApy', 1505271726507, 1505271726507),
(434, 0, 'samsung SM-G955F', '7.0', '13 (13)', 'ce0317131df3e71f03', 'c9N5Vuo2sgU:APA91bFYmTtJ1XupSdfmej2O2kG1TDP-wll8WuVf_ZxMLe2yZ2kpwN1QyfhSyr_Wyh4lXKpwKN6alSWrWlk5ddqBUMadx6bvTRLpFGIeF1KEya24SnSueIXd9OSkuazMipMywz-ePoWH', 1505276658917, 1505741134463),
(435, 0, 'Haier Andromax A16C3H', '5.1.1', '13 (13)', 'eec54e4a', 'ddJaj50KQeE:APA91bF_6lGfIAdREzqNpSl1_o5nGSfmNG3gzrUpt55qvPeWMwiPoa24v5ZRX-4XvfLeIp4KiM1gIrr7wTRwVWTSmBwxCFNIsuWH2ku6KXYWGaTC2qnpwKhEzJNUxqvV__Z-2OiTr2BV', 1505278931106, 1505278931106),
(436, 0, 'Xiaomi Redmi Note 4X', '6.0', '13 (13)', 'INCIV87PLNRSH6T4', 'ewbRwVhrQUk:APA91bFr6bOs_wvcpCGNfC-tNPrjnv3j5aK2XxlVGn0IFGfN6LxQl3LCiBtEHGMlR0frKsnPXsg2rn3kbqQlSpzU84vitAeuRmHdjTBnHOMfgz6mPB7b66PdQm5yY0GwDQOL2DaywiuV', 1505292608976, 1505292608976),
(437, 0, 'Xiaomi Redmi Note 3', '6.0.1', '13 (13)', 'be84a3c3', 'fzHI5GfA1CQ:APA91bGxXKJmpoYBy7AAlEB9WSnsvYHcFVk1YB7hM0_AfxcMuP1k2-OQTCtmLpLS_JD-s0qX3z3UzGHYGfJQHmaul-QnOL8UYDDQ0KdguEdGnup-_trBM6ftTnp_suNTgScQOzQJfUfj', 1505297402100, 1505297402100),
(438, 0, 'Xiaomi HM NOTE 1LTE', '4.4.4', '13 (13)', '76248ef0', 'dML7kqjf9Wo:APA91bFDrid3gJonJ4aisxrvduwsWG-Qm341xzjo-bGW8VCiBZYpptpFqxhu6-zPSNW2UQTdOj-kMLY_5qEFGhAl-0Q1QxQXpMhMtT-rJxHGRJYk94j9lPeUON0hrRJUJzQAZB6c9WFR', 1505301979143, 1505301979143),
(439, 0, 'Xiaomi Redmi 4', '6.0.1', '13 (13)', '33a6dd097d73', 'euSOyyWC8gM:APA91bFY0cn6F2YEvamVqgcGQDZt6geTET8YGdakFgHHRW1KKP3I-ohNRejHu8njtn2qp03dk1S2tUjXAUn-eiyJLv4utUj8giizr8s-IPFH4D39zi32tA_EYHy3-UF-rkaeakrK0VR0', 1505327741988, 1505327741988),
(440, 0, 'samsung SM-T235Y', '4.4.2', '13 (13)', '3004134ce56d81cd', 'fMA6OkdSpC0:APA91bHyE26lrDlbdO4LsXUPlBlDAqZuENgqsi-F-hKY0vN-mPdOku_OYH5A8trtw1wmiWGLX1h0NI-DwPKKDt65ZSDw7NM6ybx79GLBLm5_S3YrvqZVFHtHOCP4Rq8BCXEOjs2U7lZY', 1505337782477, 1505337782477),
(441, 0, 'Xiaomi Redmi Note 4X', '6.0', '13 (13)', 'JB8TJB7LYHSOLBDM', 'dtDbJl6-Oa8:APA91bF4ittOEMETS4OUQ3g-FjivxTySAX9l66CehPEf1qzc9oV-1fcGRYzSQ0Z1eQhWWCOTcgNprIrM6UN3S4aGRDELW50eQmwio4gJDoHNGkEVqR_TXUPA3nV2YfzR_UqXkBcOeUJ7', 1505355325455, 1505355325455),
(442, 0, 'Xiaomi Redmi Note 4', '6.0', '13 (13)', '4LQSGU4TMFJB9DNR', 'e6zhzuB1M5I:APA91bHZur_cW6GFW-RD9HTz0AiWI7ihGgZuoTmAY46ZR0QCfR0xHvZk4MsFalYAVZfnYaPzyWluW0El1lVSw0G07qkY0Vv9XX0LUpmQZn_OjR16hnglEdTA2GlM1pt6g3EWYSCPlk24', 1505359459838, 1505359459838),
(443, 0, 'Xiaomi Redmi 4A', '6.0.1', '13 (13)', 'ec15e4ae1f603', 'ejrg04eWHg4:APA91bGafLL1j8ehS1ormUNQkb24Ia8R5_DyeyeumzKFcV2i6S_ZipnjJFuJzG6_9fkhQ8_JZZyVscK0Jd9LPBusTg_TuHGyKZA3HLV7FLbqdIgoL73A8RXZeUqFaHeHbBVqtJ_Pg2J-', 1505361209526, 1505361209526),
(444, 0, 'samsung SM-J111F', '5.1.1', '13 (13)', '4200d988b893b300', 'e5Whfbi2Huk:APA91bGnYFi_A7ZoBZVIFKMIV5ODUwd_QKY0umPlBRxqEkAMwfxVPVQevAfpayPWUoNzY8V6LEj3ii9LfmHQ_4AuOej8R8wEvrlhTIri5mNca5Bf4h6YZjtO2AHAGVQp-1psON1W6qdZ', 1505390132444, 1505390132444),
(445, 0, 'OPPO 1201', '4.4.2', '13 (13)', 'WSTS7SRSUKRKJBPV', 'fkg6_DNO_LM:APA91bHlsesSIM6-vEqmPcU-pVvK2gekC7khYZsm0xjONvioBP6W9d51v0zH7qnFR_H1t0n0KUopJ0GQHpvsjRsXWE7Hv9xNJfe0xqzKUDUCFNbFZtHo1KGTowSDdSg0P21lIx5t3zcw', 1505391618441, 1505391618441),
(446, 0, 'YuLong Coolpad E501', '4.4.4', '13 (13)', '3a2f419', 'cMCjQw6olYA:APA91bH_aQZEok3LufGsSpXcwnDr_kUv-2sdanlkozgxgo6hH_WgPNq5gbwr0cA1vMlQM7LVkGDVpTwQFl31HsFxaw0oaIJsJ8LVAVZxdcMFJHtzqfTu2z9RpF-qt66WOcB88Y0G92GB', 1505399053725, 1505399053725),
(447, 0, 'Blackview BV6000', '6.0', '13 (13)', 'MNMZMBGM5HSWUKBI', 'dGyTN_IF4RE:APA91bEsOxWPRYUUYrxiQF7J5VBwr1V2-KFF1n2KvzEmeLSzKpWTISuRA6Y7rp4k_J1wYgkxLXPWyfN1MTxzIuAm2nZLgtFQfotGNaNNarxgkyzsiM8Q5DFnV98PPbbnSNvJlFc7eMRw', 1505403479249, 1505403479249),
(448, 0, 'samsung SM-N900', '5.0', '13 (13)', '4d00704b4ea931f7', 'dwmTdELSZlc:APA91bFIYQ3TbhV_8E44vWl1GPGEKVbVddcZlCmtfvwl1va60vkGSvp_nCNX3GhKRBiGKKxsiJD_eTvoeL3eSUgKWjzYh1oAiPe6cC2Vu8QKi9ao1h2w2LCPtbc2kh3TpIc-OFkGGBB7', 1505408550965, 1505408550965),
(449, 0, 'vivo 1601', '6.0', '13 (13)', 'RSJJR48H59LJGYSW', 'duA6ap9Royo:APA91bHPra3kFsgeiNqkOh81VIwEGe2nyQucwAfUBnkAzt6mO7E4rj32z0l1txP1myC-TsnPlC4kXOIzUenULPPQUw3ZmvNdsHHL4FfzcylYn3n4IUN09ZiqBX87e88k0P8y8EaC30A5', 1505424108930, 1505424108930),
(450, 0, 'Xiaomi Redmi 4A', '6.0.1', '13 (13)', '21f7208d7ce4', 'fwpuXAxSD-I:APA91bEh_0tknJhMJiH2BIs6IXKFuoVvrOHvFWg2tpcIqrNlSBkn8fkb5Bk14KcJPTxolkIyZMmxvuTaeSz-JI2D4owQyiHPbBzSb27Q0iqUmUSgxLYQCkevc0idQuLAJHAMz-v39Nyl', 1505429961156, 1505429961156),
(451, 0, 'samsung SM-G532G', '6.0.1', '13 (13)', '42003278eccb145d', 'eiJ32g4rmjs:APA91bEg-z2uWHDKTAU_qRgzQ--fbd_wYi_S6jA9yQD1_L_9RvVpmbVbhZVQh0KPrnARLuroYtCHSvZpR4UHTtjDogoguh0Aeku0tGMmxSFlDfry6j7sLJj9Be8MvF6XRqOK030cF169', 1505447989042, 1505447989042),
(452, 0, 'Sony D6653', '6.0.1', '13 (13)', 'CB5A23SVCW', 'eFmvrITI4wY:APA91bGGZ1U0AFmk4AEl0_8knC61fSrryCSoLRT2HOlm2erW7AgBtD_jivqRtd5I4pXJiTm1LDzTYbXT-bpLLHGnymsDgo01wqxRHp1N9HiKNImw_0Npmxg5qKq9kLlLA6Z-3GpGdzF7', 1505449562561, 1505449562561),
(453, 0, 'OPPO A51w', '5.1.1', '13 (13)', '4139f21a', 'ebE2kjwewO4:APA91bHpUamGDWuaZGJCHI_GGKsAzINclIVvJAyLYZ6uxIYiEqKuEm28hN-2juVJED3SeXhBugkmsRLtCoGzAg2-5Ppx6T8I6OnZawPt26LWdc7Td59Egp0ReksKILBS__NMIwyMsXBM', 1505486601572, 1505486601572),
(454, 0, 'Xiaomi Redmi 3S', '6.0.1', '13 (13)', '45ea5dd57cf3', 'djbKWpR-3ns:APA91bH_t6WsTce0S7HJ7fSPkR9CXW7P-mcPASlx2puSbOCkypYEnUip-6vHeu7QfUaUg_UpxnRi8277H7smzeVBT1xYETDJqCK3KNePAbY8v0nSjCHf1i589zHPm55wB7jnBV-rxXvR', 1505496279411, 1505496279411),
(455, 0, 'QUALCOMM S50D', '6.0.1', '13 (13)', '91a5aafe', 'fzsJeywDPXI:APA91bFrYMnEfJmJflHGP-ARQkTy50rpJo12X6lbHiQQCYUZ_KYvambkLdkRiATkhuGK9OQ12uQ-jVMx24Pf4yCZRcpNCeu7apcbDn_Vy1DfPwxUyw6Aje6OzHYG3-cSxTyOyamha0At', 1505535490779, 1505535490779),
(456, 0, 'OPPO A33w', '5.1', '13 (13)', 'MBPJDISOVOSKMJU4', 'fPOYjgHZB1w:APA91bHl9pRUh3JO1F9JaOdWQZ9myUBrRdASawl_Oliwafc5mqXxVz3BWSMI3iENdPxfYJFYXtb-y-QXDG0G_9PPuyNBJ7_wce2zhSWUyoI6UnPJjrPTE4tCzvxEm903VpcFZXfkQgQ5', 1505560532122, 1505560532122),
(457, 0, 'samsung SM-G532G', '6.0.1', '13 (13)', '4200fa67f233b39d', 'f5bRK5ESQ0o:APA91bEWJeuudIV06nBE0aUKmhTEQTdyQP_y3qxyPCXIw6zEx07xM-VwTQ5QLEi-5dcu8vyzgJ_SS3VlAnMh1ZGYHYNi3As-IqQwOpcSKP5zuviJFsp_CtFL_f3fv02k3PfnXiINTUQK', 1505564299163, 1505564299163),
(458, 0, 'OPPO A1601', '5.1', '13 (13)', 'LZIJVSYST445PVZ5', 'fckLYX2r51k:APA91bEBDmCU6dOtsQ2n1l7udnQ-4mTEkoqD60zl3oqeiDO13U5yxZThSm-OMiFK5EzC6IFWkFYuudDuRmJBkha-V2EEpUbqHs-tRV6df6akIfNyjT2ez6iM4I_nwJLuirb6MzCp6nXF', 1505577290296, 1505577290296),
(459, 0, 'LENOVO Lenovo A6600d40', '6.0', '13 (13)', '62212910HY216C40FA1', 'fcReffrlGdo:APA91bHu5t8E20kZhXUfj65HRgu9diDNSeEXyK13pd0PulmVXdqm4eG_JSI8ar4JDVUwUOdXgL8rXh45pe3neMl5Th-2GVlmbLzmTNsfu9KUcQ-ySvzMN1ytTS-r-7mt6hPfGl6FCOZK', 1505577345914, 1505577345914),
(460, 0, 'LENOVO Lenovo A7000-a', '6.0', '13 (13)', 'JFPVYTDMAYBQKFQG', 'c2VxCRBlUFQ:APA91bHb8u4UzCl8oIIOrZ-1WaCZGgIE6ZAlraxK85nFahCIFpXUvZmiWbBHa_U9wIfV6Wk9CUyr0iP5tEsJeBhWLyfLondHXshPmXjGDj01CBLe2hjnEzP2N9A_u_RqcT2EFeB_DbqZ', 1505582221242, 1505582221242),
(461, 0, 'LGE LG-D855', '5.0', '13 (13)', 'LGD855c40d4017', 'dlIy5CTS3KY:APA91bF60YTNoqNhwcvgQfIZyHBLXIFpyy375nv9mykpLoDZGvTs59agKUwf2K8D5mEkwLuBQPffCaq6x7uOEgUt6q9UBGE5vCxhLjrJmkw0EP7jpfxVge146BO2CDtPqgJmiqUlkhuB', 1505588928548, 1505588928548),
(462, 0, 'samsung SM-G532G', '6.0.1', '13 (13)', '4200bdd4907624cf', 'dnLylGxHiw8:APA91bEsM363NCW-NtJQx2GEm_tQ6AIT5nZAuCfguK4Tgylph7kK5bKsGUtld33V5uKJf_61N4fRPzI7oplUtS6AMtiffuP26zVhkbl4I37Idf1NeZRVejj6JdpxAeyum-qKOIzfL6Vy', 1505621428334, 1505621428334),
(463, 0, 'Xiaomi Redmi Note 4X', '6.0.1', '13 (13)', 'e590ce3e0903', 'eZftrMQsmq4:APA91bFe9BO9pSB4nHfq3F0SLqO9oRDIUk_1hTtrvtf6jZY9VLUvWRFDP1893bodBXse0NZIdds2jzKhgQPODZkECbZA6VD0whsAlnJMJIwy8IudFW546VZJHUuvBvaVwUZUjGaLSx6o', 1505639793581, 1505639793581),
(464, 0, 'Xiaomi Redmi 3S', '6.0.1', '13 (13)', '2c3f0fa7d53', 'efVYLTqD4VQ:APA91bFI7yu7QHTw0gt_JyoVfzPIJbO5UpHn1pHaPvOohM_L_xAPuJKYmR955iCDN9PK0lmwt-e9dQkVO5D_fVOQjBMaS8uFYwPowSi9EL4us_-mpOqRcBE5N8XMuCuOoTHUKXkKSPiw', 1505646459057, 1505646459057),
(465, 0, 'asus ASUS_X014D', '5.1.1', '13 (13)', 'G7AXGV66E240J2C', 'ccffnXBYjKQ:APA91bGQBDaBAV0Let-yQio0qkK7UQTcwYGd8KKZgAf2w1zaBLKWZXwfaH1839PiMDZB9RVoDg0gqlgqOGItYMxQScXFiJNn_Zi6qx891A9yAEp_Fv6gYimuQgtB8okTzNsXWobPtHhV', 1505647881380, 1505647881380),
(466, 0, 'Xiaomi MI 4W', '6.0.1', '13 (13)', 'e12cd1de', 'd9GtLNnQZg8:APA91bHvqkJXitAifBp4GSqUibLpeS7JN8LdjCIiN8aIl0cfzywG9vCkqvn6bTM24GxzZYAgr5gCIimMGNfhDE12NujduV1Xp7sEKyx51l8z4ist5e_goDAE4NTqPMBGIZnyY0MehqWn', 1505659716291, 1505659716291),
(467, 0, 'LENOVO Lenovo A6000', '4.4.4', '13 (13)', '9e10e428', 'fB3Q6KEMiQA:APA91bGTysCOOFx8h5Ny05_pr6gYK1wqqNcwyYa_-okgynEfANp1FzoKKiOOS1aBPYuJQu1Y8iu8NWCUBR1K74EAfEFkkrd7AuZXEezKf1fpZWXi6KC9oFJisMXSH9C1DeCKCvmLihVF', 1505664988846, 1505664988846),
(468, 0, 'LENOVO Lenovo A7010a48', '5.1', '13 (13)', 'SCFQQKLZIB8HUCTC', 'drirK8k2l5g:APA91bE4k-Z0gEDpkJonrSxJZYf-ccJtF1OrvIl7AlVdlNqt9x4wD-_OMPyTFr4ybaYLlzqzCE6DlZCycRJy3xHnbX8O5Lc2o-i23nJNF79wM5rg5jioVN8_H86YJ_kEfZ-_KPdR5xmP', 1505677334876, 1505677334876),
(469, 0, 'Infinix_X601_LTE', '6.0', '13 (13)', '01824106C2605038', 'dUPOmtZ7060:APA91bFmxGZp-9X65TDQ94_XKramBGc7z-CgwzEkVpzdT8MOlnm7JOIGdUhgyenATNM2at15nXoXundluM6QJ8EnSjSNBioxCSB6WXm2uQLTIW58Cl1lRg7Mm26238AsmoO1PDNGBQgn', 1505695952036, 1505695952036),
(470, 0, 'OPPO 1201', '5.1', '13 (13)', '5TOBZPRSO7YDOVSC', 'dg3gOG_-Bis:APA91bE7zwsVixZKEwnYjem3D5mTsCL86hMYWQ7iiiIDvFEMW5R4ABYKpJE6nbgxigZ8LHvWJovqpiLh_H9CGx8WXcGIC2yGOCN6gHl-de-pHn2QubaoCt-q4AnaP11tYlLIvUr7vrQn', 1505697324109, 1505697324109),
(471, 0, 'OPPO 1206', '4.4.4', '13 (13)', 'edded021', 'c2QS12g_WTg:APA91bG_6reLLEOelUqIiuOk3HildhOLHCxb8kTroTip6OoP8JvCRnTEUPvdOMQl0R6HLO6dVFlo89EP_ggMEqp8lsyfAvtkxtxuOi1TMwg6G4U5xtSR2Yt_S3HZw1bbyf1Ee_jFcXUn', 1505785162519, 1505785162519),
(472, 0, 'samsung SM-G570Y', '6.0.1', '13 (13)', '42005101aa6a441f', 'c0BMd-D60Lk:APA91bHslVtGM8v3UJdAKh_miB5BEwN-_ZohurVhM1MVgf84dp-nuon7e_CN97QD-5C0ONWebAJp0LVDmxjEACrwUSJFMzTno1PrDPFDlBcJ6Ysv9LiDkGRUuYbr55f1-yzBNv-NA2UZ', 1505790931400, 1505790931400),
(473, 0, 'LGE LG-H845', '6.0.1', '13 (13)', 'LGH8457899c881', 'eZ5ZAUvUKUo:APA91bG6fNdS6PoZLF7h_z6re67mBjgKcSmxQ7FBomFs3ZnEPqdXzaYuAooPcjKR36BkFcQ_EVrSx5e9tVZOKkejoAfJ8lvrdP9k8aos0-4p-Otoaqq9nDXwCI1Y6u3KipKvDW0uBmzH', 1505798939922, 1505798939922),
(474, 0, 'Xiaomi MI 4LTE', '6.0.1', '13 (13)', 'aeb0beb6', 'eV-GeQjI8_c:APA91bHoNJ98f65pA26Ozkyiolj3StRsMj8x7RTwYp3TlttJ5VztVOLIf2geiSuGLlPVqRjHhrGYKBHV_L6EE56qMBP5j-UW5OgnKlfAzA4Q4K5Z5_umhTky871D-Ho3khXHZAEWAhyO', 1505816084183, 1505816084183),
(475, 0, 'samsung SM-A300H', '5.0.2', '13 (13)', 'a2a4c88b', 'cu9vTcJPSUY:APA91bHzO_fgrJrT5mrYFn3kGAsObzUK2PyryF02yezbhQX1OuIwnQwNXIZMMWWX_dmpgx4DymErjmm9CJPXRf1DWBSShfGFjPEJQki8ePCmv8eKBvHWuUc192Jd4eHbXUtaG7t649QO', 1505833802922, 1505833802922),
(476, 0, 'samsung SM-J700F', '5.1.1', '13 (13)', '33006f95a7f4a23d', 'ed5s6hHRdjM:APA91bEF9i0mjPEs7ZmWElQu8HMPNAP8CTuV2vuU73rfHO54mdxEweAUAaaYlI_IbwjKBJtgY0NiTMrrAvY0zatLsQVTZ-QU9nOLNwOqEhOcb_lKLaP5YrKF1ku-u8VC2MdK11EVb1va', 1505838806473, 1505838806473),
(477, 0, 'Xiaomi Redmi Note 4X', '6.0', '13 (13)', 'ZPP76SLZSO7DQOBA', 'eXqIGi939zQ:APA91bHEDO6kjF_bBiI3PLD5kU0TzhtGCQ0haZPd4P27cxdftEN-Qj55tsHyeVFo3yhkYrYfpOjVxquRTDMZRdv20f3yg5zECF2oigIl9xFgVhd80kyUQeyMBFYtfawM69nXfPGlo1P7', 1505845829061, 1505845829061),
(478, 0, 'OPPO A37f', '5.1.1', '13 (13)', 'ad656ec7', 'fMVnpUruVFw:APA91bF33kL-btKNXypXSjTDdsgqlIcgbJJ-fddU6ps9_td-HjdGEIMolspVaXeC3XnfPnnKZ13Wi-XEX0FTe5Z_dW-sfLmSaeFflPc7E9i9OPqf4m89z8jEiG4hKFPV59Q3m7fGizOH', 1505848526800, 1505848526800),
(479, 0, 'Xiaomi Redmi Note 3', '5.1.1', '13 (13)', '1c32c012', 'fSMRi8IP9cI:APA91bH_2ynRG3ZFfLA2l492Gf3w8_rfLzQAW1PvD-pswOvq52NgROChyX9YBXM11r3l9YgOSbvOMCRNaI2aXliamPbilnX96X_mbzKC7FTfw-8leuRcm0DPTSLUt1wjos24YsHDaxcr', 1505867281516, 1505867281516),
(480, 0, 'OPPO A1601', '5.1', '13 (13)', 'BUSKZPP799999999', 'f3QIInRWO9s:APA91bElCyHEDc_XrNw_XjwVHBFJRYIsivs8GYiSm1zFfwJuN4K8ffgWYOcKa2-xzPyNKX9iiorJKderkprCf_bIO_XrCfpJmGNDLSk8Phpn6fHhM9_5T9wRnX-Oxp-qj0G44QXf__rK', 1505896813700, 1505896813700),
(481, 0, 'samsung SM-G531H', '5.1.1', '13 (13)', '4b13042239ff824e', 'es0D7niHHjA:APA91bHwr595ZllGTr-P3MEivvLSTHtqOv-3X34r7ra8DPsbp-VOln6Gzj2aaP_fQrF9yBqQW4sT0rVgF3e-w0sER8ATCD5rLLjRvldq1MyKn8TEqm3PAiOoHpC8xlHMUl_UeXZY38sW', 1505906956937, 1505906956937),
(482, 0, 'Xiaomi MI 4S', '5.1.1', '13 (13)', '39cce6a2', 'fvup79HS-pQ:APA91bEUhmudfpqkY54nOvVu-rRacsAVOz6hfx7qhImGghdl1FC-J7KQ0ibqImF6ho0tvBqiUTOGkWi_GVsT6q32kMjApwPT7QhIoz__lezO627WZPUT_-Z5s4I8iUlbOl64Qzq7UXCD', 1505907415984, 1506049267665),
(483, 0, 'INFINIX Infinix HOT 3 LTE', '5.1.1', '13 (13)', '8cb6e098', 'fcEYSoa0f04:APA91bHEhSvEwE6_ch0A3cpXIFjpVoNfU3MX9cy-zSlW0NJatMPhtEALy99XivYbJQmtFCfxmiSWNYC1TVLfNhWi9lWw_3yPQYYmygMzxSNvagDzxtRYa0CAUP6CB3UpTKMUL9oqvUen', 1505909693728, 1505909693728),
(484, 0, 'samsung GT-P5200', '4.4.2', '13 (13)', '4300d70eb4836000', 'dQ1BIGdCtBo:APA91bGx2yfQJbb0wdnzc5icSe7BjstnRmDFqzMto4wrcOgNjiU3psRYsIY27o5QyGdJu78SqyoVquwulhxAla0MOQRuLpCg6z1_jfuczsjLsSG-pVrJPA6V5k8IJclpgCjdUc4Sti_5', 1505919652634, 1505919652634),
(485, 0, 'Xiaomi Redmi Note 3', '5.0.2', '13 (13)', 'OV5S59SWNJDEMNCM', 'frPHiB52qF0:APA91bErvtihFIb58PRyRhK2YZsp1ctE7DcSdw0-1XzKMbIHnyoG0I13sN_Qsd5P64Y3-9O1dfjGb7aEPmWbeYhoDau6s5WgpLdvwb1hTyzlAT4ntOx7hnLy6GlE0CIthlG_heQUNF_-', 1505927285681, 1505927285681),
(486, 0, 'samsung SHV-E330L', '5.0.1', '13 (13)', '3c9fb2f4', 'chKkO6DCTDg:APA91bGV0z-9HlJJBit7o_qhVhxtqpNHCyedfqr58sVo9cpckaJcOBWWpVyJg0h9NaLMEGXe21w0U9oLfO2dPvmDl7hUGRRKAPOpvIfwtnmPG72g85oNUG37MIFhg7rjE_Hb-iKeTVaM', 1505961226279, 1505961226279),
(487, 0, 'samsung SM-J530Y', '7.0', '13 (13)', '520057d5eca254dd', 'e2pkCjkbQn0:APA91bGW_h14aY5Q-lhTZVQ8nUGMuaE_LK24lhHHlePg3RTCt6kW-RUUrKDkloOWW6AnsrhYDtEbGvPWEngXoqkqte3ij5x4aUIq_UaY7dmp5x2xgQb5BIiOqm51trsz1Yb7G-K7Lxjx', 1505988384209, 1505988384209),
(488, 0, 'SPC Z2', '6.0', '13 (13)', 'H29P1056B16SO002374', 'fhRnqxVFoWU:APA91bHwHdavcm7IBG5F9QQdy3wcWEzBcobxA1xzaSNl23_r1BQ7cq89p2BzbEsfGq2A_jQdjL0yF-3MISW-Qbc6DZnu1YzxU7lDQI8ipBj2BABLXEHYcrsmwB_Ph3lP8uJNKyCY6D0i', 1505990836108, 1505990836108),
(489, 0, 'ADVAN T1GPlus', '4.4.2', '13 (13)', '2015060515250797', 'fHGrlpVrb_c:APA91bG13d68ZEzgKxgBeaob8BhTPzwywl9blzH9XeKCVyYoSCZxfFFShaj6pDAcRNFIZaiSSgnqsznd_6VCoBvufjWKTLQfMD5n3RR3tsZqEIFjPrLpyRFTueyFkIfACTawV_4yYOIU', 1505994673654, 1505994673654),
(490, 0, 'OPPO CPH1613', '6.0.1', '13 (13)', '96b1f43f', 'eVH1aUuo5hQ:APA91bFYSdVbf6vemeLqpmIEDvH_mnBzihGgAjgc4xXjOvb5PHRH9VlpcILg0hg-RJ71shpNcUUWyUsZTfG6JYJvxjzU8I5KakcccuD1cXbwdzv66fGJmNVr1BrDNSgejEB1I0UBIGvS', 1506005623111, 1506005623111),
(491, 0, 'Xiaomi Redmi Note 2', '5.0.2', '13 (13)', 'VWGY6PRSHEWSRWUG', 'erLrgZ5m5ts:APA91bG9GQ02JHywAnTe9IXOwsE2VaK020jK9jy7foIKni7FqSHREVBFOa5_4uwQDy2CtgcRRVmZ5OjzPv9hrUoQwRel-X0nDiIcWOQRGp3w7KFtNoutkdlJyo_wWEQCjRHATjedPVmz', 1506013791832, 1506013791832),
(492, 0, 'samsung SM-G610F', '6.0.1', '13 (13)', '330080b9cc639367', 'eyhkdce8XKw:APA91bGQ94PtWWThqESuSWrCtGRJYp488lu2bxyhg6YXE73WfbINvmOsPwojvWBk8k7STTyyl1CMshTMRPv7vxjh2RGkvF3LOgDG12g5BwMI1xvPkNIV4lGoKNFA44NPgfOPkeHOWV-3', 1506055858248, 1506055858248),
(493, 0, 'vivo 1601', '6.0', '13 (13)', 'EA6DEU7HSCK7GESC', 'ebD4wvfRVTA:APA91bGYcYM40vplRtY58EFUvyrwi5_eQe0Cd7lnK15QZFt0SDjRe8WvBqu04ccdFp7b1PT47GRFImHk4WZ_IPCg9dBPY1uy0FsElVl72f1vaHVbZrDORUPZzz1kCEUW9WjPpdNaduR6', 1506064321438, 1506064321438),
(494, 0, 'Xiaomi MI MAX', '6.0.1', '13 (13)', 'f3cc97e5', 'evLzxJxUd-s:APA91bH-m1OIdjojG1Zg2I_YkCqRJriUJe_w0zePLmCJ4zpGVaqOlsPFnuQgeThS1oqv9jWevWEJ8OpLpzd83cHj8fe3SvVWqTgE84gUckzNU4kcwxSpSDASl7a790FXP8gsbraXxPIo', 1506075460824, 1506075460824),
(495, 0, 'Xiaomi wt88047', '5.1.1', '13 (13)', 'b33dcc85', 'cI5IUHJMPl4:APA91bE3p8RK5KFSwyPiYrCXyRhXRrfGk_TY8DtUfHICTu467VQ_91m2pkmIZz4ktaueeRsMzCCPo-fML-3fNoJuAgXtEXdDopHVIjTxHRUwBchvjA9prb4X9RSPMpfGirHCCWvpfsI-', 1506096521723, 1506096521723),
(496, 0, 'LENOVO Lenovo A2020a40', '5.1.1', '13 (13)', '3674ce5c', 'em2Ib_3fvyQ:APA91bHl25R9Av7pG1qBBc4IVa-dJP3A7iGyGIOr2mUo0yf547SMt1-jl2i5irZAcM_pioGmioFVqUWrnKxeyg0FZe5qzZ3DcJch_iLsZUgCbc4cmnZpyp-NVTBJ25CbrGB5sQkJHQ4w', 1506098897588, 1506098897588),
(497, 0, 'Lenovo A5500-HV', '4.4.2', '13 (13)', 'HJA30D83', 'eXRJ4_q3h8Q:APA91bEexsZierLzRQ4i7-Mi5xj9vaWpIXsODO7JTWu5UGYxOZ6dHTTtuScAy8urovDJ08fzoyIbYLgI7gL3-lsT6SxLG3Z7vL_f9TffkCv1dkgyw_Gq-G3n3hCdom5VW8dUnji2g3SF', 1506107370890, 1506107370890),
(498, 0, 'Xiaomi Redmi Note 4', '6.0', '13 (13)', 'KNFUCELNE6RO5LUK', 'eOK69_NiokE:APA91bFPKHXciX-DTisTlsGZZnvhgDJxGOsspH-XAJZAuj_xB5m_-_aR9TE5hI_viXgZshyiP8B0_TrOQtCopvOaMoYavRdGWq8ncLOCqgxNyKdW8l88T-En3gxRhHxnt_7qx73rN9ul', 1506118492526, 1506118492526),
(499, 0, 'Coolpad E502', '6.0', '13 (13)', 'Z9UKAADIZTDEQKW4', 'eYQckYGelI4:APA91bFMaJY8bu3xKsmudgRlXFs9p5xLeOa3bF9M0zJlzVc6F1Oc98cZTJ2MUKhgIQvtCNPEM2oa5YNOm-E-q8Ha8SNMDS2r3qgyj9fPt5h9SNbGcyJPukZGwa797e5jcJOmP9VW13vD', 1506123484319, 1506123484319),
(500, 0, 'LENOVO Lenovo A7010a48', '5.1', '13 (13)', 'JZQ8EIAM95BUCAPB', 'cKYdAxQqY3k:APA91bHBxjuNA0-n9h-OmHF1x7uBp51zkiGTEstlqURBmxFnmo08aWq_4NYSI24UUbY9oZr4h7d2snsmP2z2LhfRPLJyL5mnwiLHYQz-eED3Txz3WLqNZgR8iSMAZudl7RLNCEE9juHd', 1506131605685, 1506131605685),
(501, 0, 'Xiaomi Redmi 4A', '6.0.1', '13 (13)', '75198171f603', 'dyFDcxfdBaM:APA91bHcObFVS0RuSUez_aqR-sAU-6co8ANDXB8G7Y-BhddZcbleaKKBNRJ9z7laCMwOA311TKFEeTI_Nkeqbngar7vPowCNvqwJfTMMvGU2UQoc1N6GswFvr3qoB4E3yyI66tRauFO9', 1506163505980, 1506163505980),
(502, 0, 'Xiaomi HM NOTE 1S', '4.4.4', '13 (13)', 'c087553b', 'ebujCln-7IA:APA91bH0xswEDK2snPNcUcvTaoLIX1nGhQltz1_MvsQRbzAfH0tzsII6VI7i-xKW35AdioilCsgVAPn9-kPchkA-_hl3lqWHQDfYRGLBRpRm9iQEZfwbCY9bfNYt34wI6WiopBXIvq0e', 1506175723176, 1506175723176),
(503, 0, 'Xiaomi Redmi 4X', '6.0.1', '13 (13)', '1af59b637d24', 'cdrfO-6X1Ag:APA91bEc9eIJTEsIbvyhCZOi-02TSv6S19vcvewMoEae3BhX4yYDuUMhFCdPX_evwfhmr7UmDDbOGn37B-jBY6rUE6Ptt4K9mloP3Qu8J9oarqdcuaScYUWH5Qpv-ODJqwiDCJDPl6bU', 1506175727530, 1506468377205),
(504, 0, 'samsung SM-N9208', '7.0', '13 (13)', '85754d4950373259', 'fRDMYqVQ41I:APA91bF7d259YIGMdzqaz-pXJl3EoDB9Bew2MGhXtz5oZ0MrWnTbMMv1vByoLRr32p6yrcrTN6IwF2b9a4gRwmIN16xJcciGmcuWnZUX-CqNNqx-py2qbUYGo9In1uhQCjpLBu-w2eb0', 1506183712880, 1506183712880),
(505, 0, 'HUAWEI CUN-L22', '5.1', '13 (13)', 'PNTBBBB651013884', 'ekaEpOBeZ_M:APA91bGPAWfkhtnmVjtVSDOE82oNJuO2_kfAlOAxK4APgbdrmaT98KneqYGBg09W_ADCDim9Hl2esC29sRJjCbo1hYVJlS4Cehg68q5wKsQEMfTK6er0ZBLigsKiiFZuJE9CXjUAa7yO', 1506231216449, 1506231216449),
(506, 0, 'Xiaomi Redmi Note 4', '7.0', '13 (13)', '4776d5c10204', 'fy3aIotM8-Q:APA91bG-JwT1MUYLS69PsAPvtkm1YgWZJ8nPXxhyI_EnEVJqxUbU6Pz0Ekf32z0t2Jv5CyRNQTIDD7nA-ZsZTGdF5x3h8fpsMPM88u9699YIOTqoeV7v--K0jzxxEwypCOJPImejg2Hy', 1506237182799, 1506237182799),
(507, 0, 'Xiaomi Redmi 3', '5.1.1', '13 (13)', '28b9e8577cf3', 'et_FSt7Bdz0:APA91bFcXNjygqneZKhgvvutcRtbH0Xt3Jt_rAvyq3wi9Q3ueklq0NmJzzPREi-0rWbmL2riXbcaHu59MLxOzDBRaRkJfJAn62xQx4GGuoR7jPlV42c0ypknFu0ZK-R_F0u-F1O6YKaq', 1506237503664, 1506237503664),
(508, 0, 'Xiaomi Redmi 4A', '6.0.1', '13 (13)', 'b7679a8a1f603', 'cW0CYqqzgHk:APA91bEZHo50Z_4gjGfoAe_X5kp3FgSWoC5e_tIUbN8pYPICZYPIUlwPCbXXGfYdn6APim3I3-JRc8Isyg4MZfN1HmBe91BK7UxmukwSAR1CGO5tKK-utoXHgH3Egd0gpQ0Od2s3XAHv', 1506242832916, 1506242832916),
(509, 0, 'Sony D6503', '6.0.1', '13 (13)', 'CB5A1Z1U09', 'cwJq4W_5WiY:APA91bH4LyVfiB-j93Gv7ye9cEF6mXsRlWRkiNW2vMUSFYa3Tc3yA68jdESZbAOkaPYwlLdcJev9nZrQGMyv_ZQCWZ_EGGEwEV1LkZwCv6_2-AJ3hmBm0EX7nokHZj8VxutrQN0wpFzr', 1506267098291, 1506267098291),
(510, 0, 'Xiaomi Mi-4c', '7.0', '13 (13)', 'aa7c996a', 'fFpNBmKAZqM:APA91bEAWvQLiKEw5keURnerTou8kNGgntgwHnPHQ6dJJiH94TEIjP986NwlWX8NeQJbMoe7-F957h0jBQ5bkxRljD8dZtSaPqx0VgcOmi5xa1xpLZNlVblrVZkQnp1H1G0dvsR0wBre', 1506267696974, 1506267696974),
(511, 0, 'Infinix Zero 3', '6.0', '13 (13)', '10H952X651707460', 'fPL2K8yrJj8:APA91bHuX5akMXdUlPhq__74_tJ-2UAmPWg_jXz6nCygiwB70qgUu_UQKiM5t7R0oDjNMlfu1hrjNrMRj_EfVUW8fI-hxvjGrJ7gUBOSaFJVoBAhH5kcSTyUiQsd7eB63uCU3BGvoKXZ', 1506268970079, 1506268970079),
(512, 0, 'Xiaomi Redmi Note 4', '6.0', '13 (13)', 'IZDAG65PIFTCSO69', 'eh4arCwUPBU:APA91bFQktGK47cH9jE857Uwlxz3hri-_CZEzF94fpS15j-paWmD7D28O6065XvxoxuS5bg7C05ZLxfA60PIDTWFOl0-uYnHSgeh0iNDMcvxiaIS4sVYiWswpYNU4GFalHzO0SAf9Hd2', 1506272068050, 1506272068050),
(513, 0, 'samsung SM-G318HZ', '4.4.4', '13 (13)', '11015ca8bed2824a', 'f2kE_SzVjyc:APA91bHm2iefpt2gMGnp3UhHNtiv-kWOQqPT1GwxQCmEI0_T6HWLO88B_8sfu8q4eNTK4anRggHEsS4Z3_VMFB0hPLEkMsN29eHKsdYC0scACaA3s7N73Tu0FNIaVH2TYFQ-MCY5qhOj', 1506316193551, 1506316193551),
(514, 0, 'Xiaomi MI 5C', '6.0', '13 (13)', 'a50f8da2', 'ciyS4kR0h9c:APA91bEpGMPtEdjfA2Y-tOJ7ImEvBX_dJHk_Ot_ZN8w9Kpzm2u81DRNfxox0WvkxQi7JfokKQnjeCG6ZdV_BVd1SUIkvvfBpE4nfSRXsraEG2BerhWF8KQQ5onUCUa17qY2_gESXc8s1', 1506319168343, 1506319168343),
(515, 0, 'asus ASUS_T00G', '4.4.2', '13 (13)', 'EAAZCY04K061', 'cp_lBAP6kTQ:APA91bGB-f_oN57xulB7r36lmHcxSJ1VJRkhILWQ_JU6-1jyLFHYlGnlJl7VNJWL4jwDj89cVRiii4trdg7NB5BnjpBP0Lc1pd_aQESejJy7wok54DKt9tjuvL0HkRE-5wXCP1LanlWh', 1506332080871, 1506332080871),
(516, 0, 'samsung GT-I9200', '4.4.2', '13 (13)', '918c2519', 'cD8GXTrxZbA:APA91bFL1u5OKbF5RZP-r3kKF3p8EV2duSXLPD-P6pnlsFTi0qoZEgRgMlulGnxvj5YSf69RS4iui2PAPc2Vhde0FVcan3r2ZK0ErZVlZR3CVTpm49o4IXQIAGMLaAqiOxCaIYSwcccy', 1506346384340, 1506346384340),
(517, 0, 'Sony C6903', '5.1.1', '13 (13)', 'BH915ESH0D', 'eOuFkuxSTgY:APA91bEh8BoJnLbLsLHrCeUHgzBg5e38JG6OjW1I-qpIvPakHdNuPytYzXU6wZ-qLR84NUxWzkDrDnu0NwHMKN-wl7njYxiYuH-G-iSUF9sQ_l5J8LhKfXO9UJdDHpbo8b8M0S24L6x6', 1506350539526, 1506350539526),
(518, 0, 'samsung SM-J110G', '4.4.4', '13 (13)', '42006371565c6200', 'fELICjnVet8:APA91bE4yfJY4LH_Df6b5unKInDYBenHumWCEEAfqKPovPlVAASUgQ18m1OKnRCV8b1ADIE9Cc_jAFm8xSHDLS3om5jAzaUxxmZJUkjJ_iKz99f1Bp0DEN2DDde5_J6cod0idf_S0dXq', 1506363999001, 1506363999001),
(519, 0, 'Haier Andromax A16C3H', '5.1.1', '13 (13)', '1a2ceee', 'fVJEnqSkkMo:APA91bGPUAJBnTCIxRtn056ybI9kYCrenkyYi35Jy-9UAWhu5P5KlbL1Rl00gUjl81SAwM_DGAYgR4Dr6VyKW8SFyru6dvPs0awRgVF_ECPjhrK13yvpWknohsb6ryZ2GpSZjjdXUIxs', 1506382926214, 1506382926214),
(520, 0, 'Xiaomi wt88047', '5.1.1', '13 (13)', '5aedc808', 'eT7Hmz-VRRs:APA91bHQrkqBuMQ6N7FP_kiclH0-qUoA5jf9gixMB-aKStkUj5XowmkrbpLAnTHiz_dKuCsuudrAopdxbmunpv5RFneJt9H8RF8RqrxVpSE8an14r1__hw0DfPmbeXTBpGkFILZ3mlH3', 1506383093380, 1506383093380),
(521, 0, 'Xiaomi Redmi 4X', '6.0.1', '13 (13)', '1c9a9a827d24', 'dtrNuDUX3wE:APA91bGdaQfbF4jR4vsZVib1TQpKgI3LfRDPUKNS6xTTF2Lf0xidw19H5oh2ak6t53dhbPHs_aiieZbuxrblXdg7ZxI_5mhJ_YN-6LaV5OB_CN4ky1i-5-LWLQurfpbffdwqnmoQuqa0', 1506386699368, 1506386699368),
(522, 0, 'HUAWEI LUA-U22', '5.1', '13 (13)', 'G8M9XAB6B2301356', 'fd_yvQgsU1M:APA91bFhJfqE-pH83OSSILcsx0PFTtOiAARIEW_5tZBgjyjY6m90CVQuuqP43QSWAjgSAVyfrvtTwT3dH_GXXIOswmwEMiHFmm0wsHR3uhbKojwOy-qRAhLvkay-KVFv7hI5JZqRlpTS', 1506387721151, 1506387721151),
(523, 0, 'asus ASUS_Z00RD', '5.0.2', '13 (13)', 'FAAZCY189090', 'dOA_vwP9OAQ:APA91bGOu1O8gs-CmIsnjSU-cA-4hXxgZWUhTqaEb7Le8HcaxruEngH11-6s-nbCmPc3HdelqH0WOvwWvniK-ACP_o8wJFvB0zA1yzR2YSJ-fg4Q0J0cSth3-t3lt6IhDtBUiCwBCKX_', 1506398186135, 1506398186135),
(524, 0, 'samsung SM-N900', '5.0', '13 (13)', '4d00991242928089', 'f_O2PWcO0IY:APA91bGxcpB6wYa_sVg_eyHNiTky65WVVlVbNgjb0v4esFWjj11jeUl7Vv0Ry_aFrSuSpvTvgK5zVnE-wekeRmwjoohgRRYmtLTFCieLYbuBuWo-rgRlZdhhTVjIf9Tp-9njvvV50wPi', 1506413906588, 1506413906588),
(525, 0, 'samsung SM-G570Y', '6.0.1', '13 (13)', '42009ff3f414b30b', 'eMF3RtTei_o:APA91bFe1rio3YX3dwyoKjTs5yWErbzFh9wNksBPtpylYrdL0tP7kNLfmR1so-cdaJfE4VDH-GKH78ctrMVuj5hi5EI5YuAH_wUHdraW8Snn2_FXQ8fvJezw9WC78WyCuajuFpMt4-Hw', 1506414880441, 1506414880441),
(526, 0, 'samsung SM-J710F', '6.0.1', '13 (13)', '5203e81eb499739f', 'f97BubhfVSo:APA91bF7xz7lewXpQbOl_cWIUClFbjiQq6_GY7BoCnNV9LltSwyl5QMbCLCzbzEqK5Ap2tDjuMSrMzMVkR-aUI0f3FfA6kBdwRfRoeEtI8Oty3b1U74cHUSmuKFpIIXMubzXjOsOZK9A', 1506415202245, 1506415202245),
(527, 0, 'samsung SM-G920F', '7.0', '13 (13)', '04157df4a5d13311', 'dEnNLB-fMeE:APA91bEzV13c6wT6XOfv1-UYumIOuPV5JG_GqPoqT6_7rDdZoqR-5HfAOOAU3kmTGQBmd-u--ubHoMMj8LrWH-CwhVBWnXlmzn88YP69ObHKPQTe5hz2g5ehgfkoITdJ3UevRiGJYvFY', 1506416619845, 1506416619845),
(528, 0, 'Xiaomi Redmi 4A', '6.0.1', '13 (13)', '452b0457d530', 'dDin9iSCzAc:APA91bFj-WuCyGdFDzvPQZyeMc_ifGCxy5S3Xkwogf_iZVTO4uZk9bNnY0sG5jhpHCrf6ivtQNXQw1R1-EARAdaaIhcxw6Sg9-WG6HBzcBx8i9zo8_NJOsadN-5oL6ManybLWaHSj4oX', 1506417559428, 1506417559428),
(529, 0, 'samsung SM-J710F', '6.0.1', '13 (13)', '5203dc71faae7391', 'cbQtYkm-DIo:APA91bGG-VFQAGszbIvVC1Rg2EKD9D9STMpRVQ1M2BEYAaEr4UZQ6aigPWhXPcgRNxju7AFii-eSDVNz_GvHR7zS6wUmSvxHMkhLe9NRYznn1pPkBmZ8VjbhqlvEdSyrBJUpn8nNn-nk', 1506466647482, 1506466647482),
(530, 0, 'HUAWEI TAG-L32', '5.1', '13 (13)', 'DUQBBBB661400258', 'cNAGUZQ5bog:APA91bHnY5bnkRbWQyRxTDNDJLM8CawNm9f7DMU8A68Lt_NEem0_BihSfdNGaeY42koiXXLt_eBU8ql_HvRDifDRI3_wa3kU8NcmsfZ9bwn4bHfWeqFDX7DsvkUQ-Tp7Bq2YjZktA_qr', 1506491125847, 1506491125847),
(531, 0, 'OPPO A37f', '5.1.1', '13 (13)', '77899aa8', 'f_fUY9KDljM:APA91bGv5JxV9DXm4bMu3fan_uWxkU15-K34DXulb9odZjqELXoHUSeh0PTdO1tEfu1jRAgOm6X4TviF9ZM6dIJKOZmTmSEkDN8adtX3blmaVp1Y3IPQM1M-PU04e1RhRlnalLmx_-lC', 1506500555794, 1506500555794),
(532, 0, 'HUAWEI EVA-L19', '7.0', '13 (13)', 'QWFFG16B21000417', 'f9jc11D9bLg:APA91bGIIDU9aOPZDtFHfE9TIU5BgJou3y0P6WIRZ3fXTy2QzNJGRG9qATq3X3_1JW2mbWouhp1VOFO0F-CklakMxhRXb0A208vDyqHT1ZbliimDISTv0X34b62pUQWK-Wy_8O_S9-dZ', 1506503598258, 1506503598258),
(533, 0, 'asus ASUS_Z00UD', '6.0.1', '13 (13)', 'FBAZCY196137', 'cegodTv3NLo:APA91bE19JYx09sZUF740LaNuD2IUG6abdbU23R9a3zl4TBowtRpoOnDCqskc3QqSf32F7edIoqBX57bEwaFiS7ZaJahrGCdOfl9sHf3VmWBUo_S67N7sydrrVTdfPY_QNcnjyfBwsrJ', 1506524873719, 1506524873719),
(534, 0, 'Xiaomi Redmi 4X', '6.0.1', '13 (13)', '1b589a197d24', 'c9OYqWJkdBM:APA91bFlipWObsNQTpK338pCYqABmQW77obnTusaDoI4JV3nqRrb9HsgFSe_UJ5hSjD5HU_sILCzmy5jAPvEtc8ifk7OHA5yHWLIm-Q-DUopl0KuD7_XN2J8VYkqo7ux_urqBYSF0JAi', 1506528692960, 1506528692960),
(535, 0, 'OPPO A37f', '5.1.1', '13 (13)', 'd8b26865', 'eP40AicjtAo:APA91bEEf4Le1ci-kUrjxaZq59cj3PXgDrSs3cY-u70jAmb10N4wlHMw7hjd7D93sxnwRXMOZ4ZbvyQ-elx2YvcUcfCY7E2PYNaEyeMHmcwFhhHl5wX-OiX9Kr1JRKFgsGgF9zT-C5fA', 1506529504408, 1506529504408),
(536, 0, 'OPPO CPH1613', '6.0.1', '13 (13)', 'a2e7ea50', 'ee0n-VGjw54:APA91bGUW-GSsUHAExo6mh005fmbIRbI4-XQNa1XFcq7QgeYVJWtxvnLEVCYsh6gB-mpNphPNQoYSD3kbBf5O-5n6Eqz1nQ7mr1KBZCoQ8ktHIjjuYg87OfSjSR5djtqBkXxPEU0CEtq', 1506556300320, 1506556300320),
(537, 0, 'OPPO A1601', '5.1', '13 (13)', '69JB69NB99999999', 'ecEQJVHYgwY:APA91bEySJyE7vAlZk8_Aovjxqd0-6uSJ4M73aGh8nNlZbsZ0eZ637bG0j6ouGbjh5HlXpYqMjE34wyXgf4oQBYyo0sgTFVjpfYtGO06Amg_RFOVK_r6QQYy4lRJ5V9m0Ru_2Jrjn3As', 1506568345129, 1506568345129),
(538, 0, 'Haier Andromax A16C3H', '5.1.1', '13 (13)', 'b93dca05', 'fLMMhuIlG6Y:APA91bEjJSL_VvtI7wm8ihQTOEvabbJyfovgUp96diDOjvNQpsn8sc3D9whTQjIQqUnQR-FLS3PAoYMPrR_omgWtpZ61USQ8Uc4pZiWEdhXqIbjw2k2ipw-HrHHBG_hAn6cV11I0V1ny', 1506579504061, 1506579504061),
(539, 0, 'samsung GT-I9060I', '4.4.4', '13 (13)', '4d0094a1ca893200', 'cElOagbQkOo:APA91bFoEhTjoXDvtF1Ax-893WovwghtWdyHyO5z9F9wnp1iHkdzrxspdzck-EOT8DRd12T6FSP-obc9N5PqFhtT6CttyoH5tU8v-kF4Xn2Je0TehvzaUu3G45_n0DK0lO1DYcP2ZL4W', 1506580821306, 1506580821306),
(540, 0, 'OPPO X9009', '5.1', '13 (13)', 'GUJNBEEM99999999', 'cCxIJU4n-M8:APA91bF6k52lDgPYJppypcSrnvfZZGwGBk2P6_pnSeCntJq9SU7YmJKUP2dqCUoB4WV-ZsZLiuv53pFlSr47uaPOutyZeA70FYlBnrm_dYJpYVuTYvi75vowtBrrppMA77W-Z33Eandu', 1506595758043, 1506595758043),
(541, 0, 'Infinix HOT 4 Pro', '6.0', '13 (13)', '0188510751200345', 'dA2UiVminv0:APA91bEtaj5A5tvBgTTcs01L5XeOHSejk-nJjinmmN1LNavYsKUeY4Ws5jt_FGnU2VNS-AGgG_6mWJU_4xmXVstVaLPiV5H9ui9DjcsDvLNQfL-kboGDHjN5_S6Wyl2gJWFQriA2OXfw', 1506604458650, 1506604458650),
(542, 0, 'asus ASUS_T00F', '4.4.2', '13 (13)', 'F4AZCY02J962', 'd9LeEwQ90pc:APA91bFcn6SSg_5zw6GD9iQhVOfSwoCBOYZwZp6IFoHk8l_6tvrjCRDguEVnDRSd7z-oy2C4gsDhDYTfG8nBIYhAR566nylZ6zekOKiRB5CbJWvxIMiKykJliUd9u8lX48ZrXIbtCmZb', 1506608704022, 1506608704022),
(543, 0, 'asus ASUS_Z00UD', '6.0.1', '13 (13)', 'G4AZCY00T834', 'fewlFcX1pBA:APA91bHDkYnxNAV86tKr7Rqzh7OMC7b2UFbhg8oQqlS4U5x1tO8-Z-eiiRQgtKSp7bBcZMX3kfrW7KRXjEdaSkYQKsdOvxgX5Z6kB9Ax8KT0Y7qCEXdRfO0F1XJcKVGT3S8xxKgGf4MA', 1506618680197, 1506618680197),
(544, 0, 'samsung SM-G7102', '4.4.2', '13 (13)', '948c50b0', 'cwlP8sPQ3sQ:APA91bFPBqz84Kc0gG45e0QKKbYKN2yUlHxWfzQkMoFvr7PNeHKY_R_yfNrlh7H4ddRSM9FFUIq4EzHf_ePmLd58JpYx-Ux52WVOI33mz7TTGsHTTCai2UUuUnM9oEczfpTtuY4x1x-s', 1506619161942, 1506619161942),
(545, 0, 'Xiaomi Redmi 4X', '6.0.1', '13 (13)', '3417cdad7d04', 'flCmbjtuOtQ:APA91bHj8f2VaVZNwmP7LYkY4YYeqzFAbViAa-FfL_sY4W0SXlYOtCFPPy-V3TpdJpPYgDxeWHUM5Fgam6DvegtMURjrhPrO6ZsOQ7AiGtdktxanbzozLTFjmG4LjojydqUOSFQ2EhEs', 1506653826180, 1506653826180),
(546, 0, 'samsung SM-J105F', '5.1.1', '13 (13)', '4200ee8cee18b300', 'eag1zF28j_Q:APA91bG-fPuD_Y3ZQBrgTA03akVtHqLm4w7uoors4AfYMyKtMPqJrW29Sm4aZ8HI5Aa-0AeK_igACaa2dLqrZO9DptZOk1yON83GkuzTavFTOD1_LPtlyeLc8FL4SvEMzYhqBYYMJHXJ', 1506664595518, 1506664595518),
(547, 0, 'samsung SM-G7102', '4.4.2', '13 (13)', '637c5e7e', 'eI2VdVToEpg:APA91bGUXSEopRxZfp6iV7h7F3rorQ0j-4WtcDHn1IJ7K6q7iGnzi-SnT7IjPijWkYufUtMzuIqUIRK7ukDg8_RvuQVlIlhB--DsnyNhKGcB8TZ98nBQ4Cc6Rlu8F0OrcxIy0-wX8vVm', 1506676167579, 1506676167579),
(548, 0, 'LENOVO Lenovo P1a42', '6.0.1', '13 (13)', '382ae0c9', 'flMa_2fkwx8:APA91bGRSsCEfgMMh4fRL0ljpHDBgiMnMsMoLfyvLixR5oTaD-PtrtteTGghWtyRIxfrW__SaTGTtLrmUjmJrLZPY-vkabjjDkjg9ap0B1bX-PMMJOvnL6zV5UXeSTpZ3K-AENUju7Ue', 1506684653463, 1506684653463),
(549, 0, 'Coolpad E571', '5.1.1', '13 (13)', 'd3b8d623', 'fN2pdtz73PM:APA91bHxLn5F7xoP7LeVRtx08G-Dfl-ZaztcjV2Ocdt9oziQOVyuU-w91BgSUQn7YdyeenO0TuApkEBZwH7u__UXpnHlgTJSG-FWsj70Kgr6Uhf8BC5f9gac1ieFg8bRWZQybysvRw6R', 1506694806646, 1506694806646),
(550, 0, 'Xiaomi Redmi Note 4X', '6.0', '13 (13)', '5TLRRGGQ4LHYHM79', 'fN5srP1vE1Y:APA91bF0qwERUnhFosd8obptoRSx48lXVPmlhKG2QJNiI_gVYTqRs9Rbxy8ar6XHPP9fc0JPoBBH7MZLh4ndWV1johLQVhTbQajMWk2POhpUgjVlmkpOt6iC4rRESrK-76LdVT3DSbJE', 1506754539396, 1506754539396),
(551, 0, 'Xiaomi Redmi Note 4X', '6.0', '13 (13)', 'GYPF9SGMAUPRN7GU', 'el4baskItU0:APA91bFQHn7S74Cda5aHr4bzJAomVLxvHe1tTjQCk5tMNVdrj2M0cCme8GsWft80HEg-61bHC23_LfEWIBbd603eea93M0Ao5aouLAIFbeSyyVSwsbGmdAA-7EjFcgFMBc7Kik0c4zNM', 1506760869574, 1506760869574),
(552, 0, 'samsung SM-N750', '5.1.1', '13 (13)', '3204142f39b71133', 'eX0L0dZCtpQ:APA91bEfJdZkBmsyfjn1S-CrnXjsiUK6yPETFFwJj8oK9mghvZCYqrPYWAX7Q-5Rd5F9qKn_Q1nLcuQzTZ9GztcC5CZKIS4oLRTBB34snW3YQEghJrSH7VGEZU5aasevk8xnXwuXigks', 1506800478278, 1506800478278),
(553, 0, 'ADVAN 5059', '6.0', '13 (13)', 'S5E6S32S0D6170118395', 'fApP8LBsHAw:APA91bEpTVUUhEph8Q_vdyc6BkAhWigitFQWyYyjcIEYVS_UaAhHRzHN0DxqI7h4oqhqHz-dRtOJHdEZY7nUKgE6cbA28ANK-ksLPUKKfeYtNb5xWavOgzWalqCJo2ZOLNVecFiw8O38', 1506804892640, 1506804892640),
(554, 258, 'OPPO A33w', '5.1', '13 (13)', 'IJ6TJZNR99999999', 'fdGRR_nAK9Y:APA91bF29qxRdPwWuBii25bt24u6n_IwtOCzk2sRhO8PsEO0U_ISKKJ7TUEHLGoCDzEwgvshSW8Te52ISuetXZND9PNDwPd82sd8Rz0F567M4DTbYtzkUHBzR7H9TWjXsP5JHjL05Er9', 1506810908693, 1506810908693),
(555, 0, 'OPPO CPH1701', '6.0.1', '13 (13)', '4da4e588', 'cCqR35AAl5k:APA91bGOvRsSNyJumI25Jr1E6LfzgLN-MTRTV6XlPnpK5QXnn59XPRRD3YbdSxLlS6qHFmZcO2mEGv-d586zBCrsQrEGIxvu146gC0D9kp4t45bB26n5DUJ5CQyJHYutSfmsmEEYyIyD', 1506825639802, 1506825639802),
(556, 0, 'Xiaomi Redmi Note 4', '6.0', '13 (13)', 'OJ99WWVG5LI7GE5P', 'fL3-Ykl06I4:APA91bET9jExHrcyceE6q2RvDWFgtVj1qoLKmAzWtCWlXxH83PG4h77iGV41c9YuPrdVBdP4nN9JeYkLXJM97DSY5u2HgiFIKNq2QYLkUcCE0kdBZ3ED_0GRGCk5wkROsUQ2SztcCL_D', 1506853759880, 1506853759880),
(557, 0, 'OPPO A33w', '5.1', '13 (13)', 'FEIROZPB99999999', 'fNX6gXCZdX4:APA91bFGD1RRZGMb-PbhAdPkzTSBKiZMaC3bGdBpUAvDAhEmBD8VdJFDIKTYz2vCqxGiB5njUw4hPFcmTLpsTQQOPAWNj2Xo2YpaMci2VZNSlm5E4CW9QNo2Zv1GbvkJHUbxRMVX8y5R', 1506856819150, 1506856819150),
(558, 0, 'samsung SM-A510F', '7.0', '13 (13)', '3300a9633fe1a333', 'eKwoc02u86g:APA91bGQvJ_jNAG5UOQU1AUQoS-A2IV0_nO-RbBvc00E8IfpQZr09UYApjL9wsTQ1lrOKm6SGboHsxdUsTB_bE0cKufCKuqtBR3sf6AB7FvUGwn8srzgozHe4cOgdMOkvciClL-7I_GE', 1506859329067, 1506859329067),
(559, 0, 'ZTE N939Sc', '5.1.1', '13 (13)', '4a70dc67', 'fNDSfZYjWMw:APA91bGO6pCzf2nCazB1qpO3TCigAla7NyIq3qgpFddQjzhv1mBkn0JzQ6QMadWLdqps7AZHil51Oc3MHU8G9B9l_HB0Ua4TC1HrtBgR085fAmZDk0gEEjPu1bukoxyEwVokEP8K1HTA', 1506869842083, 1506869842083),
(560, 0, 'OPPO A37f', '5.1.1', '13 (13)', 'b39490a0', 'c63ZT9w0Y0E:APA91bHpsRintVEvc0mOx_HIqqzsjVtfmJW56FNaBuimpDgNXcNhaoYFaT_tK3os8ZefxOryYcG13n2ziHBclN6uNjNvbeOlpC8vJ2BEEo1KYCWvmlMVpZH-M-W5bT5cxHx5xi4wCP9M', 1506879492238, 1506879492238),
(561, 0, 'Haier Smartfren Andromax AD6B1H', '4.4.2', '13 (13)', '1831e0f9', 'dSEHrIqgv_Q:APA91bFO0ES6QfL5DiRTJUjLGTkkjmgHnNvCE675-PpmWiNDhc2ifIuPIooTQ5O5xuDOiIQthGvPeUq4-IWU-G6ji8t2HV_PdycwNtyUVqz3KJPClg8HhNUYffcM4EAT-wlwoqmr8BSS', 1506880454629, 1506880454629),
(562, 0, 'HUAWEI LUA-U22', '5.1', '13 (13)', 'G8M9XAA721602428', 'dH5p05IMR8U:APA91bGiZp20Zum24brx5kmZoVzFBKa9E_7pCpMZc97qs2b8ijn5U0wc6-wMHYIky3gwYGPNdycbFTEFzErDpOcSsh1ULRgyrv9JhCEAO8nxBr-Cnt56qhu3B2S4xkQ96FAbwGR1vukL', 1506881628808, 1506881628808),
(563, 0, 'Xiaomi Redmi Note 4X', '6.0', '13 (13)', 'NFJBJR5T8TKRHE7L', 'd4gtFe5uxZ4:APA91bE1AkVBw82KESa0jF_scx0bm7q2sqUFccbwL8iztDmuIeglK6Vfyl5T-vbIUUtCWN8-wdXnpK5jltJ7v6uZx2qy2ZLJBmRGrUnE9B8KM278Txh7IVAYS91ABrK69ADvs1xkrBHN', 1506882348856, 1506882348856),
(564, 0, 'PANTECH IM-A920S', '4.4.2', '13 (13)', '7d18be6a', 'dfcDepVRgdA:APA91bH09Fu2itn5DCcW_ZIjQOXNd2xkx4Vgj4IfiXGqfJuypFSOEO1H6uNJ3bPE5ZKHN9YAon-SHG--LHnoPT1-eR1_G7YGTEmdgW0xJWMjqn75D7i3DHAUu1GjRNbzCiS0HqGNmnnb', 1506898110311, 1506898110311),
(565, 0, 'Xiaomi Redmi 3', '5.1.1', '13 (13)', 'eac5a6f47cf3', 'c-Yo9U63Uew:APA91bG7w5HBLRC7vjDk9AcCvN2rKm7xy1EdNVB02pH35Sus0-libfsnlr5F_-0uuJPAkUOTUkSoBpJ0STO9ILxATqKaJhkXWFkyC7BxduWuJ8iSCcuBO8UHbblle5F3-fJ1Zt_zgfMs', 1506903701557, 1506903701557),
(566, 0, 'samsung SM-J710F', '6.0.1', '13 (13)', '5203eca25f38a3b9', 'f50CSIw9nno:APA91bG3D49V93ZHhsFCypCVDEjQc2hhTDvPmqcYuivXfJnUm-tXCC7ZOtRD0Mi5hGDRhhlw2-RpCyazZblqRmM698_J_oN2Yt32aCEtLbM1HZpNakhTQLDRnV-nunFy2yLWYOL09mtc', 1506917128307, 1506917128307),
(567, 268, 'BlackBerry BBC100-1', '7.1.1', '13 (13)', '1163958128', 'emdGRxxFXYo:APA91bHIqEK_CkzZCKNBdMvIaHkWgCkySHPOnYuzbsyZHBsBWugvQxtdvVGj_8tDxPZZ1P2E6SqzkYKUfsBmQ1EpQTr6NBS4wFN0kQQSCo_ZJU250qR01w4mdGKxqD7nV1QE1wR8V2rC', 1506927208557, 1506927208557);

-- --------------------------------------------------------

--
-- Struktur dari tabel `merchant`
--

CREATE TABLE `merchant` (
  `id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `alamat` varchar(39) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `news_info`
--

CREATE TABLE `news_info` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `brief_content` varchar(200) NOT NULL,
  `full_content` text NOT NULL,
  `image` varchar(110) NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `news_info`
--

INSERT INTO `news_info` (`id`, `title`, `brief_content`, `full_content`, `image`, `draft`, `status`, `created_at`, `last_update`) VALUES
(11, 'Paket Umrah Ramadhan MTT', '10 Hari awal Ramadhan (29 Mei)\n15 Hari akhir ramadhan (12 Juni)', '<p>Majelis Taâ€™lim Telkomsel menyelenggarakan paket Ibadah Umroh dengan \nbeberapa paket yang menarik dan harga terjangkau. Pelayanan Prima, \nKemudahan dan Pembinaan Agama bagi jamaah umroh menjadi prioritas kami.</p>\n<p>Pemesanan bisa pilih menu travel disini, selanjutnya kami akan mengkontak anda.<br></p><p>Info lebih lebih lengkap klik :&nbsp;http://www.mtt.or.id/umroh-mtt-2/</p>\n<p>atau hubungi langsung : 081285688212</p><br>', 'Paket Umrah Ramadhan MTT.jpg', 0, 'FEATURED', 1495336887152, 1495336887152);

-- --------------------------------------------------------

--
-- Struktur dari tabel `notification`
--

CREATE TABLE `notification` (
  `id_notification` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `for_id` int(11) NOT NULL,
  `subject` varchar(300) NOT NULL,
  `text` text NOT NULL,
  `comment` varchar(400) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `type_notification` varchar(50) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `notification`
--

INSERT INTO `notification` (`id_notification`, `from_id`, `for_id`, `subject`, `text`, `comment`, `product_id`, `type_notification`, `status`, `created_at`) VALUES
(54, 95, 95, '@yusronzain', ' menambahkan komentar di produk Indomie Telor (MTT)', 'wah enak sekali', 6, 'order_cancel', 1, '2017-10-12 08:34:57'),
(55, 95, 95, '@yusronzain', ' menambahkan komentar di produk Indomie Telor (MTT)', 'wah enak sekali', 6, 'diskusi', 1, '2017-09-25 09:00:56'),
(56, 95, 77, '@yusronzain', ' menambahkan komentar di produk Rujak Buah', 'tes1', 154, 'diskusi', 0, '2017-10-06 08:32:06'),
(57, 95, 5, '@yusronzain', ' telah memesan Nasi Ayam Komplit (MTT)', NULL, 3, 'order_waiting', 1, '2017-10-16 04:15:00'),
(58, 95, 5, '@yusronzain', ' telah memesan Nasi Bakar (MTT)', NULL, 4, 'order_waiting', 1, '2017-10-16 04:15:00'),
(59, 5, 95, '@admin', ' telah menerima order produkGorengan Bakwan,Tahu (MTT)', NULL, 8, 'order_process', 1, '2017-10-16 02:03:51'),
(60, 5, 95, '@admin', ' menambahkan komentar di produk Nasi Sayur (MTT)', 'aaaaaa', 5, 'diskusi', 1, '2017-10-16 02:03:51'),
(61, 5, 0, 'aaaaa', 'aaaa', NULL, NULL, 'Broadcast', 0, '2017-10-16 03:52:40'),
(62, 5, 0, 'aa', 'aa', NULL, NULL, 'Broadcast', 0, '2017-10-16 04:02:06'),
(63, 5, 2147483647, 'AAAA', 'AAAA', NULL, NULL, 'Broadcast', 0, '2017-10-16 04:05:53'),
(64, 5, 922, 'aaa', 'aaaa', NULL, NULL, 'Broadcast', 0, '2017-10-16 04:08:20'),
(65, 5, 921, 'sadasa', 'sadasdsad', NULL, NULL, 'Broadcast', 0, '2017-10-16 04:09:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `merchant_id` int(11) NOT NULL DEFAULT '5',
  `category_id` varchar(50) NOT NULL DEFAULT '22',
  `image` varchar(110) NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `fee` double NOT NULL DEFAULT '1000',
  `approve` int(2) NOT NULL DEFAULT '0',
  `stock` int(10) NOT NULL DEFAULT '1',
  `draft` tinyint(1) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL,
  `total_rate` int(11) NOT NULL DEFAULT '0',
  `count_rate` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `name`, `type`, `merchant_id`, `category_id`, `image`, `price`, `fee`, `approve`, `stock`, `draft`, `description`, `status`, `created_at`, `last_update`, `total_rate`, `count_rate`) VALUES
(1, 'Nasi Pecel Madiun (MTT)', 0, 5, '22', 'Nasi pecel madiun.jpg', 19000, 0, 1, 100, 0, 'Nasi pecel madiun nikmat<br>', 'READY STOCK', 1495705459000, 1508128421, 0, 0),
(2, 'Nasi Gado Gado (MTT)', 0, 5, '22', 'Nasi Gado Gado MTT.jpg', 20000, 0, 1, 98, 0, 'Nasi Gado Gado<br>', 'READY STOCK', 1495705459000, 1507019637, 0, 0),
(3, 'Nasi Ayam Komplit (MTT)', 0, 5, '22', 'Nasi Ayam Komplit MTT.jpg', 26000, 0, 1, 100, 0, 'Nasi ayam plus sayur<br>', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(4, 'Nasi Bakar (MTT)', 0, 5, '11', 'Nasi Bakar MTT.jpg', 22000, 0, 1, 99, 0, 'Nasi Bakar isi Teri dan Jamur', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(5, 'Nasi Sayur (MTT)', 0, 5, '22', 'Nasi Sayur MTT.jpg', 15000, 0, 1, 100, 0, 'nasi sayur<br>', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(6, 'Indomie Telor (MTT)', 0, 5, '22', 'Indomie Telor MTT.jpg', 10000, 0, 1, 100, 0, 'indomie telor<br>', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(7, 'Indomie Telor Plus sosis, nugget, keju (MTT)', 0, 5, '22', 'Indomie Telor Plus sosis nugget keju MTT.jpg', 15000, 0, 1, 100, 0, 'Indomie telor pus<br>', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(8, 'Gorengan Bakwan,Tahu (MTT)', 0, 5, '22', 'Gorengan BakwanTahu MTT.jpg', 3000, 0, 1, 98, 0, 'Gorengan Bakwan, Tahu', 'READY STOCK', 1495705459000, 1507801550, 0, 0),
(9, 'Habatussauda', 0, 5, '22', 'Habatussauda.jpg', 60000, 0, 1, 100, 0, 'Obat Herbal Favorit Habatussauda<br>', 'READY STOCK', 1495705459000, 1506999019, 0, 0),
(10, 'Kopi Hijau Diet Kopi Kawi', 0, 5, '22', 'Kopi Hijau Diet Kopi Kawi.jpg', 65000, 0, 1, 99, 0, 'Diduga, asam klorogenat ini memiliki banyak manfaat&nbsp;terhadap kesehatan. <b>Kopi hijau</b>\n menjadi populer untuk menurunkan berat badan setelah ditampilkan pada \nacara Dr. Oz pada 2012. Dalam acara itu disebutkan bahwa biji kopi jenis\n ini dapat membakar lemak dengan cepat tanpa olahraga tambahan.', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(11, 'Kurma Date Crown Khalas 1 kg', 0, 5, '22', 'Kurma Date Crown Khalas 1 kg.jpg', 74000, 0, 1, 100, 0, 'Kurma Date Crown Khalas 1 kg', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(12, 'Kurma Date Crown Khenizi 1 kg', 0, 5, '22', 'Kurma Date Crown Khenizi 1 kg.jpg', 78000, 0, 1, 100, 0, 'Kurma Date Crown Khenizi 1 kg', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(13, 'Kurma Dattes 1 Kg (Khalas)', 0, 5, '22', 'Kurma Dattes 1 Kg Khalas.jpg', 60000, 0, 1, 68, 0, 'Kurma Dattes 1 Kg (Khalas)<br><div>Awali buka puasa anda dengan kurma golden dates khalas</div>', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(14, 'Kurma Golden Dates 1 Kg (Sayer)', 0, 5, '22', 'Kurma Golden Dates 1 Kg Sayer.jpg', 52000, 0, 1, 100, 0, 'Kurma Golden Dates 1 Kg (Sayer)', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(15, 'Madu Lengkeng Al Amin', 0, 5, '22', 'Madu Lengkeng Al Amin.jpg', 125000, 0, 1, 100, 0, 'Madu Kesehatan <br>', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(16, 'Madu Pahit Az Zikra', 0, 5, '22', 'Madu Pahit Az Zikra.jpg', 100000, 0, 1, 100, 0, 'Madu pahit penuh khasiat<br>', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(17, 'Madu Super Liar Al Amin', 0, 5, '22', 'Madu Super Liar Al Amin.jpg', 105000, 0, 1, 100, 0, 'Madu Super Liar Al Amin<br>', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(18, 'Minyak Habbatussauda', 0, 5, '22', 'Minyak Habbatussauda.jpg', 75000, 0, 1, 100, 0, 'â€œSesungguhnya di dalam Habbatussauda (jintan hitam) terdapat penyembuh bagi segala macam penyakit kecuali kematian.â€ (HR. Bukhori &amp; Muslim)', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(19, 'Minyak Zaitun Extra Virgin', 0, 5, '22', 'Minyak Zaitun Extra Virgin.jpg', 70000, 0, 1, 100, 0, 'Minyak Zaitun Extra Virgin', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(20, 'Siwak Al Hijazi', 0, 5, '22', 'Siwak Al Hijazi.png', 10000, 0, 1, 100, 0, 'Siwak Al Hijazi', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(21, 'Kripik KEPO', 0, 5, '22', 'Kripik KEPO.jpg', 15000, 0, 1, 99, 0, 'Kripik Enak MTT<br>', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(22, 'Celana Sirwal Eksekutif', 0, 5, '22', 'Celana Sirwal Eksekutif.jpg', 110000, 0, 1, 100, 0, '<p>Celana Sirwal Serba Guna, bisa dipakai dalam berbagai acara.</p>\n<p>Bahan nyaman, Tersedia aneka pilihan : Biru, Krem, Coklat</p>', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(23, 'Kemeja Taqwa Bordir', 0, 5, '22', 'Kemeja Taqwa Bordir.jpg', 90000, 0, 1, 100, 0, 'Kemeja Taqwa Bordir , tersedia aneka pilihan warna : Biru, Orange, Coklat, Merah', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(24, 'Kopiah', 0, 5, '22', 'Kopiah.jpg', 10000, 0, 1, 100, 0, 'Kopiah Haji , tersedia 3 warna : Hitam , Putih dan Abu-abu', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(25, 'Tas Ransel Eiger MTT', 0, 5, '22', 'Tas Ransel Eiger MTT.png', 340000, 0, 1, 100, 0, 'Tas Ransel Eiger MTT', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(26, 'Ruko di Apartement Bogor Valley', 0, 5, '22', 'Ruko di Apartement Bogor Valley.jpg', 375000000, 0, 1, 1, 0, 'Ruko di Apartement Bogor Valley, untuk lebih detail bisa kontak MTT<br>', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(27, 'Rumah di Bekasi Selatan', 0, 5, '22', 'Rumah di Bekasi Selatan.jpg', 625000000, 0, 1, 1, 0, '<p>Lokasi : Taman Galaxi Indah 1 Bekasi Selatan</p>\n<p>Lokasi sangat-sangat strategis. Posisi depan Masjid Persis (Masjid \nal-Muhajirin), hanya 2 menit dari pusat pelayanan publik (Kantor Polsek \ndan Kantor Koramil, KUA, Puskesmas, SMPN 12 Bekasi, SMUN 3 Bekasi, \nKantor Kelurahan, Kantor Kecamatan, Masjid Jamie Muhammad Ramadhan, \nWisata Kuliner) , 5 menit dari pusat perbelanjaan Mall Grand Galaxi Park\n dan Pusat Niaga, kolam renang Tirta Mas , 10 menit dari tol penghubung \nJakarta pintu tol Cikunir dan pintu tol Bekasi Barat.</p>\n<p>Luas : lt. 90 m lb. 90 m,</p>\n<p>Kondisi : 3 kamar tidur , &nbsp;1 kamar mandi, listrik 1300watt, air tanah kencang, jln cor bisa lewat 2 mobil</p>\nHarga masih bisa nego\n<p>Minat Hubungi : 081285688212</p>', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(28, 'Umroh Bersama MTT', 0, 5, '22', 'Umroh Bersama MTT.jpg', 26000000, 0, 1, 70, 0, '<p>Majelis Taâ€™lim Telkomsel menyelenggarakan paket Ibadah Umroh dengan \nbeberapa paket yang menarik dan harga terjangkau. Pelayanan Prima, \nKemudahan dan Pembinaan Agama bagi jamaah umroh menjadi prioritas kami.</p>\n<p>Info lebih lebih lengkap klik :&nbsp;http://www.mtt.or.id/umroh-mtt-2/</p>\n<p>atau Hubungi : 081285688212</p>', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(29, 'Al Quran Al Haramain', 0, 5, '22', 'Al Quran Al Haramain.png', 80000, 0, 1, 100, 0, 'Al Quran Al Haramain', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(30, 'Metode Tartila (Praktis Tahsin & Tilawah)', 0, 5, '17', 'Metode Tartila Praktis Tahsin  Tilawah.png', 35000, 0, 1, 100, 0, 'Belajar tahsin &amp; tilawah dengan praktis metode tartila<br>', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(47, 'Nasi Tengkleng', 0, 0, '22', 'Nasi Tengkleng.jpg', 35000, 0, 1, 10, 0, 'Nasi Tengkleng Kambing&nbsp;<div>Bumbunta mantap pedasnya</div>', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(49, 'Kurma Date Crown (Khalas) 1 Kg', 0, 20, '12', 'Cover_Kurma_Date_Crown_Khalas_1_Kg.jpg', 75000, 0, 1, 100, 0, 'Kurma Date Crown (Khalas) 1 Kg. Premium Emirates Dates.\nKhalas : Melts in Your Mouth . Grown all over UAE farm especially the Eastern Region, it is characterized by smooth fibers and soft delicate texture, unique rich flavor with balance sweetness,light golden colour,large size fruit with high demand on its rutab during ripening season.', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(51, 'Bubur Kuningan', 0, 21, '11', '20170522_100902-1.jpg', 17000, 0, 1, 0, 0, '', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(52, 'Batagor', 0, 21, '11', '20170313_134609-1.jpg', 16000, 0, 1, 10, 0, 'Batagor Mantap', 'READY STOCK', 1495705459000, 1506997871, 0, 0),
(53, 'Tafsir Sesat', 0, 5, '17', 'IMG_20170522_214058_222.jpg', 100000, 0, 1, 30, 0, 'Karya Ustadz Fahmi Salim', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(54, 'Baju Taqwa Riyan', 0, 5, '15', 'IMG_20170522_142424_179.jpg', 150000, 0, 1, 6, 0, 'Bordir depan, Belakang dan Lengan. Bahan katun nyaman dipakai', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(56, 'Bangga Menjadi Ibu', 0, 25, '17', '20170523_061559-1.jpg', 67000, 0, 1, 3, 0, '<p>Kumpulan karya pena para ibu yang menjadi finalis kompetisi penulisan "Bangga Menjadi Ibu". Dengan membaca buku ini, anda akan meresapi kisah-kisah perjuangan menjadi seorang ibu, memahami proses pembelajaran yang para ibu alami, dan banyak kisah penuh cinta dan kasih sayang para ibu</p>', 'READY STOCK', 1495863900032, 1495863900032, 0, 0),
(58, 'Duren-Durian Medan', 0, 27, '13', '', 120000, 0, 1, 0, 0, 'Pancake Duren Medan asli dikirim langsung dari Medan :)', 'SUSPEND', 1495705459000, 1495705459000, 0, 0),
(59, 'Sepatu Vibram Fivefingers for Men', 0, 23, '15', 'IMG-20170523-WA0007.jpg', 0, 0, 1, 0, 0, 'Sepatu berbentuk jari kaki yg nyaman untuk aktifitas harian dan olahraga.\nHarga tergantung model, mulai 1,35 - 2,5 jt + ongkos JNE atau Gojek.\nModel dan warna berbeda untuk laki-laki dan perempuan.\n\nContact 0811412344 utk detil produk', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(60, 'Sepatu Vibram Fivefingers for women', 0, 23, '15', 'IMG-20170523-WA0006.jpg', 0, 0, 1, 0, 0, 'Sepatu berbentuk jari kaki yg nyaman untuk aktifitas harian dan olahraga.\nHarga tergantung model, mulai 1,35 - 2,5 jt + ongkos JNE atau Gojek.\nModel dan warna berbeda untuk laki-laki dan perempuan\n\nContact 0811412344 utk detil produk', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(72, 'Al-Qolam - Smart Hafiz', 0, 36, '22', 'Smart_Hafiz.jpg', 1850000, 0, 1, 5, 0, 'Assalamu''alaikum Ayah Bunda ...\n\nSudah pernah dengar Smart Hafiz belum?\nItu lho, produk terbaru dari Al Qolam yang dipersembahkan bagi keluarga Muslim Indonesia... \n\nProduk ini merupakan salah satu, dari sekian banyak produk edukasi yang layak dimiliki.\n\nYuk kita intip, apa saja yaaa yang ada di dalam video player mungil portable ini... \n\n1. Sing A Song\na. Badanamu : ada 44 lagu Badanamu\nb. Songs : ada 3 lagu theme song Al Qolam ★ 3 lagu Doa ★ 5 lagu daerah ★ 6 lagu Animal Series ★ 20 lagu anak muslim\nc. Ngaji Yuk : Juz 30 oleh Qari Anak Farid ★ Juz 30 oleh Qariah Anak Millah ★ Maqamat Juz 30 oleh Qariah Dewasa\nd. Adzan : ada 7 maqam Adzan (Sika, Shaba, Rast, Nahawand, Jiharkah, Hijaz, & Bayyati) ★ Adzan Subuh ★ Iqomat\ne. Senandung Asmaul Husna\n\n2. Mengaji Yuk\na. Metode Al Qolam : ada 12 Bab Metode Al Qolam\nb. Asmaul Husna : ada 99 Asmaul Husna\nc. Da''i Cilik : ada 6 materi Da''i Cilik yang dibawakan oleh Aisyah dan Fuadi\n\n3. Cerita\na. Hari Besar Umat Islam : ada 7 Hari Besar Umat Islam\nb. Jejak Islami : ada 15 Kota yang memiliki jejak Islam di berbagai belahan dunia diceritakan di sini\nc. Sirah Nabawiyah : ada 60 judul cerita tentang kisah hidup Nabi Muhammad SAW\nd. Hafiz dan Hafizah Umroh : kisah Hafiz dan Hafizah beribadah umroh\ne. Kisah 25 Nabi : ada 25 judul cerita tentang 25 Nabi dan Rasul yang wajib kita imani, dalam bentuk story telling\nf. Khalifah Burung Bangau : kisah tentang Khalifah Burung Bangau\ng. Fable Story : ada 10 cerita tentang dongeng binatang (contoh: Kelinci dan Kura-Kura)\nh. Fairy Tale : ada 9 cerita dongeng anak internasional (contoh: Pinokio)\ni. Cerita Rakyat : ada 10 cerita rakyat Indonesia (contoh: Legenda Sangkuriang)\nj. Kosakata : ada 7 kelompok kosakata 3 bahasa (Indonesia - Inggris - Arab)\n\n4. Movies\na. Animasi Pre School : ada 9 video animasi pre school (contoh: Mengenal Bentuk dan Warna)\nb. Animasi Pendidikan : ada 6 video animasi pendidikan (contoh: Ku Tahu Nama Satwa)\nc. Seri Ibadah : ada 7 video seri ibadah (contoh: Belajar Bersuci)\n\n5. Akhlak Terpuji\nAda 9 video cerita tentang akhlak-akhlak yang terpuji (contoh: Belajar Bertanggung Jawab)\n\n6. Others\na. Produk Al Qolam : ada 11 video tentang produk Al Qolam yang bermanfaat untuk keluarga\nb. Manual : ada 2 video petunjuk manual tentang cara menggunakan smart hafiz\nc. Recording : fitur merekam \nd. Hasil Recording : untuk menyimpan dan mendengarkan hasil rekaman\ne. Music Download : folder untuk menyimpan dan menampilkan musik favorit yang ingin kita dengar melalui Smart Hafiz\nf. Movie Download : folder untuk menyimpan dan menampilkan film favorit yang ingin kita lihat melalui smart hafiz\ng. Pictures : folder untuk menyimpan dan menampilkan foto atau gambar favorit yang ingin kita lihat melalui smart hafiz\nh. My File : untuk menampilkan external memory ataupun memory card yang aktif terpasang \ni. Setting : untuk mengatur tampilan smart hafiz\n\nBanyaaaak ya Ayah-Bunda ... \nIn syaa Allah sangat lengkap dan cocok sekali untuk menemani Ananda bermain sambil belajar di mana saja, kapan saja.. Karena smart hafiz menggunakan baterai yang dapat dicharge ????\n\nYuk, hadirkan smart hafiz di tengah-tengah kehangatan keluarga ...', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(73, 'Buku Mendidik Anak Laki-laki', 0, 35, '17', 'aqwam1.jpg', 36550, 0, 1, 3, 0, 'Judul : Mendidik Anak Laki-laki\nPenulis : Dr.Khalid Asy-Syantut\nPenerbit : Aqwam\nSoftcover', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(75, 'Al-Fatih vs Vlad Dracula #1 (Kegelapan)', 0, 35, '17', 'alfatih.jpg', 65000, 0, 1, 3, 0, 'Al-Fatih vs Vlad Dracula #1 (Kegelapan)\n\nPenerbit : Salsabila\nSoft Cover\nBerat : 200 gram', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(76, 'Daihatsu Xenia R A/T Deluxe 2012/2011 istimewa km baru 36rb-an', 0, 39, '19', 'IMG_20160619_111811_hdr.jpg', 125000000, 0, 1, 1, 0, 'Xenia R A/T Deluxe 2012/2011 km36rb ASLI terawat apik istimewa banget  \nDaihatsu Xenia 1.3 R Deluxe Automatic type tertinggi dan jarang ada\nWarna Hitam Mengkilat\n\nKhusus buat yang ngerti mobil dan cari mobil bagus dan terawat bukan mobil bekas rental atau taxi online\n\nKelebihan mobil saya ini:\n1. Jarang pakai (KM 36rb-an), bisa dibuktikan keaslian-nya dari service record-nya di buku service dan di bengkel resmi\n2. Ban-ban masih tebal asli sejak baru belum pernah diganti, karena baru 36rban kilometernya\n3. Tangan kedua dari baru atas nama sendiri bukan PT, bisa dicek dari Faktur-nya\n4. Pemakaian tahun 2012, rakitan 2011 bulan December tanggal 30 (1 hari sebelum tahun 2012)\n5. Kunci serep, manual book dan service book lengkap\n6. Sudah ada monitor bawaan asli (Daihatsu genuine accessories) bisa CD, VCD, DVD\n7. Bahan bakar selalu pertamax (ada kumpulan struk pembelian pertamax-nya)\n8. Pajak masih panjang... bulan 01-2018\n9. Dokumen lengkap, STNK, BPKB, Faktur Asli\n\nSpesifikasi Daihatsu Xenia 1.3 R Deluxe Automatic (selengkapnya bisa di cari di google):\n1. Mesin 1300 CC 4 silinder, irit dan tangguh\n2. EM/Electric Mirror, pengaturan spion elektronis\n3. AC double blower\n4. Rear spoiler\n5. Mirror turning light/lampu sen di spion kanan dan kiri\n\nDijual sesuai harga pasaran CASH aja gak pakai mahal...\n\nMobil bisa dilihat di basement TSO dengan janji\n\nAtau setiap hari di Kampus UIN Syarif Hidayatullah, Fakultas Kedokteran, Cireundeu, Ciputat, Kertamukti, Jl.Pisangan Raya\n\nSilahkan janjian dulu via WhatsApp dan telpon 0811-92-33-66', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(77, 'Ford Everest diesel TDCI A/T 2010', 0, 39, '19', '20160923_122904.jpg', 189000000, 0, 1, 1, 0, 'Jual Ford Everest 2010\n\nKelebihan mobil saya sbb:\n+ warna putih mulus (warna favourite dan paling banyak yang nyari utk SUV)\n+ pajak masih panjang sampai bulan Sept tahun 2017\n+ STNK, BPKB, Faktur asli semua\n+ ex Dokter\n+ Ban besar 265/70/R16 masih tebal semua, sudah di balance dan spooring\n+ Oli mesin baru diganti, gak perlu ganti oli lagi sampai 5000km ke depan\n+ Km sedikit baru 141rb-an artinya pemakaian normal hanya 60km per hari (55km x 365 hari x 7 tahun = 140.524km)\n+ buku service, buku manual lengkap\n+ kunci serep lengkap\n+ toolkit dan dongkrak asli lengkap\n+ Head unit asli Ford, ada iPod/iPhone/iPad connector, kamera mundur, bisa Radio, CD, VCD\n+ sudah ada 2 unit monitor asli Ford di Headrest, canggih, pas mundur head unit akan otomatis menampilkan kondisi sekitar, tapi monitor yg di headrest tetap memutar film dari VCD\n+ insya Allah mobil dalam kondisi siap pakai dalam dan luar kota\n\nKelebihan Ford Everest 2010\n1. Lebih bertenaga dibanding Fortuner 2010\n2. Lebih lega dibanding Pajero 2010\n3. Lebih nyaman dibanding Innova 2010\n4. Lebih gagah dibanding Captiva 2010\n5. Lebih masuk akal harganya dibanding mobil sejenis (Fortuner 2010 dan Pajero 2010 Rp250jtan, Everest 2010 dibawah Rp200jt)\n\nSpecifikasi singkat Ford Everest 2010:\n1. Mesin DURATORQ 2.5L Diesel, 4-Cyl, DOHC, Direct Injection Commonrail Turbo with Intercooler, sangat bertenaga namun tetap irit dan tidak masalah menggunakan bahan bakar solar apa saja\n2. System rem sudah menggunakan LSPV (Load Sensing Proportioning Valve) menghasilkan rem yg tetap pakem baik pada saat muatan sedikit maupun penuh\n\nPerbandingan SUV Keluarga (otomotifnetdotcom):\n\nKemajuan teknologi, terutama dapur pacu diesel bisa dirasakan sempurna pada semua SUV (Everest, Fortuner, Pajero, Captiva). Diesel yg dulu dikenal loyo, kini berlimpah tenaga dan torsi. Apalagi semua sudah menggunakan turbo dgn variable geometry, kecuali Grand New Fortuner.\n\nNamun keiritan bahan bakar ternyata dimenangkan oleh Ford Everest. SUV ini sekaligus memberikan kelegaan kabin dan kenyamanan karena memang dimensinya paling besar dan bantingan suspensi empuk. Selain itu banderol Ford Everest adalah yg paling terjangkau. Jadi buat Anda lelaki sejati yg cinta keluarga dan mengutamakan value for money maka Ford Everest adalah pilihan yg paling pas.\n\nMobil bisa dilihat dengan janji via telp atau WhatsApp 0811-923-366\n\nSenin-Jumat jam 9-16 di\nTelkomsel Smart Office, Jl.Gatsu 52 Jaksel\n\nSabtu-Ahad di Kampus UIN Syarif Hidayatullah, Ciputat, Fakultas Kedokteran', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(78, 'Motor listrik Mr.Jackie', 0, 39, '19', '20161002_100604.jpg', 5500000, 0, 1, 1, 0, 'Motor listrik merek Mr.Jackie\nCocok buat ke Masjid dan jalan-jalan di dalam komplek\nDaya tahan batere sekitar 2 jam non stop', 'READY STOCK', 1495705459000, 1495705459000, 0, 0),
(79, 'Kurma Ajwa Al-Madina Al-Mubaraka ( 500gr)', 0, 25, '12', '10407786_af6c1712-1a7d-4285-a8ca-d19b41284434-1.jpg', 200000, 0, 1, 5, 0, '<p>Kurma ajwa biasa dikenal sebagai Kurma Nabi. Produk handcarry langsung dari Saudi Arabia dengan kualitas premium dan ukuran buah sedang.</p>', 'OUT OF STOCK', 1495863900032, 1495863900032, 0, 0),
(80, 'Alas Sajadah Microsatin', 0, 41, '14', 'pjimage.jpg', 50000, 0, 1, 0, 0, '<p>Alas Sajadah Microsatin :)</p>\n<p>&nbsp;</p>\n<p>Alas Sajadah yang cocok digunakan pada saat sholat Ied nanti. Terbuat dari bahan yang sangat lentur, warna karakter bervariasi tidak mudah luntur, dapat dicuci atau dilap dengan kanebo dan tidak mudah mengelupas walaupun sering di lipat.</p>\n<p>&nbsp;</p>\n<p>Bahan : Microsatin</p>\n<p>Ukuran : 120 x 60 cm</p>\n<p>&nbsp;</p>\n<p>Kelebihan dari Alas Sajadah ini :</p>\n<p>&nbsp;</p>\n<p>- Praktis : mudah dibawa, dengan lipatan kecil sedemikian rupa tentunya menjadikan mudah dibawa berpergian.</p>\n<p>- Hemat tempat : mudah disimpan karena tidak memerlukan tempat/ruang yang besar untuk penyimpanannya.</p>\n<p>- Hemat biaya : jika dibawa ke tempat sholat ied di lapangan/jalan atau wisata/piknik tidak perlu lagi sewa tikar.</p>\n<p>- Mudah dibersihkan : alas ini berbahan micro yang bersifat tidak tembus air (waterproof) sehingga mudah dilap/dibersihkan.</p>\n<p>- Beragam motif &amp; warna yang dapat dipilih sesuai dengan kesukaan.</p>\n<p>&nbsp;</p>\n<p>Stok Terbatas...jadi buruan pesan sebelum kehabisan :)</p>\n<p>&nbsp;</p>\n<p>Terima kasih :)</p>\n<p>&nbsp;</p>', 'READY STOCK', 1496272736550, 1496272736550, 0, 0),
(81, 'Sarung Wadimor Type Horison', 0, 43, '15', 'IMG-20170522-WA0017_35ndjruk46o0o.jpg', 70000, 0, 1, 3, 0, '<p>Sarung Wadimor Asli Buatan Pabrik.. Barang Bagus Cocok Untuk Sholat, Santai dirumah juga untuk gaya..</p>\n<p>silahkan diborong.. yang borong saya do''ain bersama-sama saya masuk Syurga.. Aamiin</p>', 'READY STOCK', 1495871643706, 1495871643706, 0, 0),
(82, 'Sarung Wadimor Type 3Dara', 0, 43, '15', 'IMG-20170522-WA0016.jpg', 70000, 0, 1, 3, 0, '<p>Variasi Warna.. Pesan 1 kodi lebih murah...</p>\n<p>monggo diborong..</p>\n<p>yang borong saya do''ain bareng2 masuk syurga.. Aamiin.</p>\n<p>&nbsp;</p>\n<p>.</p>', 'READY STOCK', 1495872082406, 1495872082406, 0, 0),
(83, 'Sarung Wadimor Type Horison2', 0, 43, '15', 'IMG-20170522-WA0014.jpeg', 70000, 0, 1, 3, 0, '<p>Variasi Warna.. Pesan 1 kodi lebih murah...</p>\n<p>monggo diborong..</p>\n<p>yang borong saya do''ain bareng2 masuk syurga.. Aamiin.</p>', 'READY STOCK', 1495872082406, 1495872082406, 0, 0),
(84, 'Sarung Wadimor Type Darussalam', 0, 43, '15', 'IMG-20170522-WA0002.jpeg', 70000, 0, 1, 3, 0, '<p>Variasi Warna.. Pesan 1 kodi lebih murah...</p>\n<p>monggo diborong..</p>\n<p>yang borong saya do''ain bareng2 masuk syurga.. Aamiin.</p>', 'READY STOCK', 1495872082406, 1495872082406, 0, 0),
(85, 'Baju Koko Al Mi''a', 0, 43, '15', 'quickgrid_201751721152527.jpg', 275000, 0, 1, 6, 0, '<p>Koko Al - Mi''a size S - XXL hanya 275.000 (harga bandrol 369.000).. monggo diborong pak????</p>\n<p>Yang Borong Saya Do''ain bareng2 saya disegerakan Allah berangkat Umroh.. Aamiin</p>\n<p>&nbsp;</p>', 'READY STOCK', 1495872082406, 1495872082406, 0, 0),
(86, 'Sarung Murah', 0, 43, '15', 'IMG-20170526-WA0000.jpg', 35000, 0, 1, 12, 0, '<p>Sarung Murah Berkualitas Cocok utk berbagi dibulan Nan Fitri..</p>\n<p>&nbsp;</p>', 'READY STOCK', 1495872082406, 1495872082406, 0, 0),
(87, 'Koko Al Mi''a Putih', 0, 43, '15', '20170517_205625.jpg', 275000, 0, 1, 3, 0, '<p>Tersedia uk. S - XXL</p>', 'READY STOCK', 1495886373813, 1495886373813, 0, 0),
(88, 'Sarung Anak Cap Gajah Suci', 0, 43, '15', 'IMG-20170527-WA0009.jpg', 40000, 0, 1, 12, 0, '<p>Cocok utk anak TK - SD</p>\n<p>&nbsp;</p>', 'READY STOCK', 1495886373813, 1495886373813, 0, 0),
(89, 'Emping Melinjo Khas Jogja', 0, 43, '13', 'IMG-20170527-WA0008.jpg', 22500, 0, 1, 20, 0, '<p>Emping mlinjo khas jogja, sdh berbumbu..tinggal digoreng, makriuuuk bingit..only 22500/ 250gr. Teman santap sahur n berbuka, bisa dimix dg sup2an, gulai, opor, lodeh, dicolek sambel kecap, dll. Pesen yuks bro..sist..????????</p>', 'READY STOCK', 1495886373813, 1495886373813, 0, 0),
(90, 'Belajar Bareng - Ilmu Shorof', 0, 46, '20', 'IMG_20170528_043135_35niezytkds04.jpg', 0, 0, 1, 0, 0, '<p>Assalamu ''alaykum Wr. Wb.</p>\n<p>&nbsp;</p>\n<p>al-Qur''an adalah sumber Hukum dan Petunjuk Hidup bagi Umat Islam, namun demikian banyak sekali umat Islam di Indonesia lebih memahami Bahasa Inggris dibandingkan Bahasa al-Qur''an.</p>\n<p>Akibatnya, ilmu atau pemahaman yang disebarkan dengan bahasa Inggris lebih banyak diserap oleh umat Islam dibandingkan ayat-ayat al-Qur''an.</p>\n<p>Mari kita mulai berkenalan dgn al-Qur''an, setidaknya memahami Bentuk-bentuk kata yang ada di al-Qur''an yang dikenal dengan ilmu Shorof.</p>\n<p>&nbsp;</p>\n<p>Wassalamu''alaykum Wr. Wb.</p>', 'READY STOCK', 1495921198334, 1495921198334, 0, 0),
(91, 'Sarung Wadimor Donggala', 0, 43, '15', 'IMG-20170528-WA0001.jpeg', 70000, 0, 1, 10, 0, '', 'READY STOCK', 1495952822437, 1495952822437, 0, 0),
(92, 'Kacang Kudus', 0, 24, '13', 'IMG_20170528_171416_bd6kuipo0i5f.jpg', 17500, 0, 1, 20, 0, '<p>Kacang Kudus aseli didatangkan dari Kota Kudus.</p>\n<p>Dengan rasa bawang gurih sangat cocok untuk camilan dan sajian bagi Anda...</p>\n<p>Harga Rp.17500 @250gr</p>', 'READY STOCK', 1496037005830, 1496037005830, 0, 0),
(93, 'Madu Malika 500gr', 0, 20, '12', 'Madu_Malika_500gr.JPG', 75000, 0, 1, 10, 0, '<p>Madu Malika : Madu Bunga Jintan Hitam (Black Seed Flower Honey) 500gr</p>', 'READY STOCK', 1496132393932, 1496132393932, 0, 0),
(94, 'Tas Decoupage Goni Holland', 0, 37, '21', 'IMG-20170524-WA0013.jpg', 375000, 0, 1, 1, 0, '', 'READY STOCK', 1496804531873, 1496804531873, 0, 0),
(95, 'Tas Decoupage Goni Kampung Halaman', 0, 37, '21', 'IMG-20170524-WA0014_bd86tl3gaky1.jpg', 375000, 0, 1, 1, 0, '<p>Tas Unik hasil kerajinan tangan</p>', 'READY STOCK', 1496804531873, 1496804531873, 0, 0),
(96, 'Tikar Lipat Kekinian', 0, 41, '14', 'LongChamp1.jpg', 125000, 0, 1, 0, 0, '<p>Suka piknik? Suka main ke pantai? Malas bawa tikar yang besar? Atau capek keluar uang untuk terus-terusan sewa tikar di tempat wisata?</p>\n<p>Gak usah kuatir lagi. Sekarang ada tikar lipat yang praktis, hemat tempat, anti air dan nyaman dibawa dengan motif trendy.</p>\n<p>&nbsp;</p>\n<p>Bahan: Microsatin atau Long Champ</p>\n<p>Ukuran: 200 cm x 150 cm</p>\n<p>Ukuran setelah dilipat: 25 x 15 cm</p>\n<p>Motif Ready bisa dilihat di : http://bit.ly/KatalogTikarLipat</p>\n<p>&nbsp;</p>\n<p>Pesan sekarang, stok terbatas!</p>\n<p>SMS / Whatsapp: 0813-9538-9062</p>\n<p>Fanspage FB : @TikarLipatKekinian</p>', 'READY STOCK', 1496673764418, 1496673764418, 0, 0),
(97, 'Tas bantal decoupage', 0, 37, '21', 'IMG-20170608-WA0013.jpg', 200000, 0, 1, 1, 0, '', 'READY STOCK', 1496916755265, 1496916755265, 0, 0),
(99, '', 0, 66, '22', '', 0, 0, 1, 0, 0, '', 'READY STOCK', 1497334659848, 1497334659848, 0, 0),
(100, 'Egg Chicken Roll', 0, 69, '13', '1-eggroll.jpg', 32000, 0, 1, 100, 1, '<p>Sekarang gak perlu bingung atau repot siapkan menu bekal sekolah buat si kecil atau sarapan pagi keluarga, Egg Chicken dari Kraukk Frozen Food ini dibuat khusus dari daging ayam segar yang dicincang, dibumbui, dan dibungkus dengan kulit berbahan telur serta dalam balutan tepung roti.</p>\n<p>&nbsp;</p>\n<p>Rasanya yang lezat dan renyah hingga akhir, merupakan panganan yang cukup digemari di kalangan anak-anak dan masyarakat di semua lapisan, terutama bagi Anda penikmat hidangan masakan Jepang ala bento.</p>\n<p>&nbsp;</p>\n<p>Sensasi daging ayam cincang segar berkualitas yang diolah bersama bumbu rempah, dan dibalut dengan kulit telur sehingga menghasilkan lauk masakan jepang yang disuka seluruh kalangan, terutama penggemar lauk ala bento.</p>\n<p>&nbsp;</p>\n<p>Rasanya yang lezat tidak kalah dari menu masakan jepang di restoran bento ternama di Indonesia. Sudah gak sabar menyantap masakan jepang di rumah anda ?&nbsp;</p>\n<p>&nbsp;</p>\n<p>Yuuk pesan sekarang juga !!</p>\n<p>&nbsp;</p>\n<p>Berat Per Pack : 475 Gr</p>\n<p>Isi : 18 Pcs</p>\n<p>&nbsp;</p>\n<p>Bukan HANYA menunya yang siap goreng dan praktis saja, Egg Chicken Roll ini juga punya kelebihan sebagai berikut:</p>\n<p>- Tanpa Bahan Pengawet</p>\n<p>- Kualitas sama dengan Resto Jepang ala Bento ternama</p>\n<p>- Baik untuk pertumbuhan (mengandung sayuran atau Seafood)</p>\n<p>- Bahan baku Pilihan Kualitas No#1</p>\n<p>&nbsp;</p>\n<p>Dengan adanya menu dari KRAUKK, kini menghidangkan SARAPAN atau BEKAL makanan SEHAT &amp; NIKMAT ala Restoran untuk putra/i kita cukup dari rumah saja. Tinggal keluarkan varian frozen food KRAUKK, lalu goreng dalam 5 menit, menu untuk BEKAL dan sarapanpun siap.</p>\n<p>&nbsp;</p>\n<p>Berat Per Pack : 475 Gr</p>\n<p>Isi : 18</p>', 'READY STOCK', 1497335158562, 1497335158562, 0, 0),
(101, 'Shrimp Roll', 0, 69, '13', '1-shrimp-roll.jpg', 29000, 0, 1, 100, 1, '<p>Masakan Jepang ala Kraukk ini merupakan cincangan udang segar berkualitas dengan tepung tapioka yang telah diracik bersama bumbu rempah dan dibalut tepung roti yang membuatnya menjadi renyah setelah digoreng dan nikmat hingga gigitan terakhir.</p>\n<p>&nbsp;</p>\n<p>Rasanya yang lezat tidak kalah dari menu masakan jepang di restoran bento ternama di Indonesia. Sudah gak sabar menyantap masakan jepang di rumah anda ?&nbsp;</p>\n<p>&nbsp;</p>\n<p>Yuuk pesan sekarang juga !!</p>\n<p>&nbsp;</p>\n<p>Berat Per Pack : 350 Gr</p>\n<p>Isi : 12 Pcs</p>\n<p>&nbsp;</p>\n<p>Kraukk menyediakan Menu Bekal Sekolah Frozen Food yang praktis dan lezat tersaji dalam hitungan menit, dengan varian yang lengkap berupa olahan dari udang, ikan, cumi, kepiting dan bahkan makanan olahan ayam juga dapat Anda pesan langsung .</p>\n<p>&nbsp;</p>\n<p>Bukan HANYA menunya yang siap goreng dan praktis saja, KRAUKK juga punya kelebihan sebagai berikut:</p>\n<p>- Tanpa Bahan Pengawet</p>\n<p>- Kualitas Hotel Berbintang</p>\n<p>- Free MSG (Kecuali Beberapa Produk)</p>\n<p>- Baik untuk pertumbuhan (mengandung sayuran atau Seafood)</p>\n<p>- Bahan baku Pilihan Kualitas No#1</p>\n<p>- Telah bersertifikat halal MUI</p>\n<p>- Telah memiliki izin edar dari BPOM / Depkes</p>\n<p>&nbsp;</p>\n<p>SARAPAN PAGI KINI JADI LEBIH MUDAH</p>\n<p>Dengan adanya KRAUKK, kini menghidangkan SARAPAN atau BEKAL makanan SEHAT &amp; NIKMAT ala Restoran untuk putra/i kita cukup dari rumah saja. Tingal keluarkan varian frozen food KRAUKK, lalu goreng dalam 5 menit, menu untuk BEKAL dan sarapanpun siap.</p>\n<p>Dengan rasa yang DISUKA, dan kandungan sehatnya yang tanpa perasa MSG juga TANPA PENGAWET, membuat anak-anak dan seluruh keluarga tetap sehat, bersemangat ke sekolah dan bekerja.</p>\n<p>&nbsp;</p>\n<p>Berat Per Pack : 350 Gr</p>\n<p>Isi : 12 Pcs</p>', 'READY STOCK', 1497335158562, 1497335158562, 0, 0),
(102, 'Udang Tempura', 0, 69, '13', '1-Udang-Tempura.jpg', 24000, 0, 1, 100, 1, '<p>Udang Tempura merupakan hidangan berbahan dasar Udang yang dicelup kedalam adonan berupa tepung terigu dan kuning telur yang diencerkan dengan air bersuhu dingin lalu digoreng dengan minyak gorengyang banyak hingga berwarna kuning muda.</p>\n<p>&nbsp;</p>\n<p>Udang Tempura ini adalah Masakan Jepang populer dan banyak disukai. Balutan adonan tepungnya terasa renyah di bagian luar serasi dengan celupan saus sambal. Nasi hangat membuat sajian ini makin komplit dan mengenyangkan. Cocok dijadikan menu hidangan Anda dan keluarga.</p>\n<p>&nbsp;</p>\n<p>Meskipun Udang Tempura populer sebagai Masakan Jepang, namun sajian gorengan ini praktis dibuat dan rasanya yang renyah dan enak membuatnya banyak disukai termasuk oleh orang Indonesia. Udang Tempura yang diproduksi oleh Kraukk Indonesia ini dibuat dengan tepung khusus berkualitas ekspor yang lazim digunakan oleh para produsen pizza sehingga rasanya bisa renyah dan gurih di bagian luarnya dan lembut pada bagian dalam.</p>\n<p>&nbsp;</p>\n<p>Rasanya yang lezat tidak kalah dari menu masakan jepang di restoran bento ternama di Indonesia. Sudah gak sabar menyantap masakan jepang di rumah anda ?&nbsp;</p>\n<p>&nbsp;</p>\n<p>Yuuk pesan sekarang juga !!</p>\n<p>&nbsp;</p>\n<p>Berat Per Pack : 250 Gr</p>\n<p>Isi : 8 Pcs</p>\n<p>&nbsp;</p>\n<p>Kraukk menyediakan Menu Bekal Sekolah Frozen Food yang praktis dan lezat tersaji dalam hitungan menit, dengan varian yang lengkap berupa olahan dari udang, ikan, cumi, kepiting dan bahkan makanan olahan ayam juga dapat Anda pesan langsung .</p>\n<p>&nbsp;</p>\n<p>Bukan HANYA menunya yang siap goreng dan praktis saja, KRAUKK juga punya kelebihan sebagai berikut:</p>\n<p>- Tanpa Bahan Pengawet</p>\n<p>- Kualitas Hotel Berbintang</p>\n<p>- Free MSG (Kecuali Beberapa Produk)</p>\n<p>- Baik untuk pertumbuhan (mengandung sayuran atau Seafood)</p>\n<p>- Bahan baku Pilihan Kualitas No#1</p>\n<p>- Telah bersertifikat halal MUI</p>\n<p>- Telah memiliki izin edar dari BPOM / Depkes</p>\n<p>&nbsp;</p>\n<p>Berat Per Pack : 250 Gr</p>\n<p>Isi : 8 Pcs</p>', 'READY STOCK', 1497335158562, 1497335158562, 0, 0),
(103, 'Moneybag', 0, 69, '13', '1-moneybag.jpg', 19500, 0, 1, 100, 1, '<p>Makanan sehat yang berbentuk kantung untuk menyimpan uang ini lebih dikenal dengan sebutan Money Bag. Frozen food berbahan baku ikan, udang, dansayuran yang dihasilkan oleh Kraukk Indonesia ini bersifat sehat dan bebas dari bahan kimia apapun, dibungkus dalam kulit lumpia (kulit pangsit) laludibentuk menyerupai kantung yang diikat dengan tali dari daun kucai yang aman dikonsumsi.</p>\n<p>&nbsp;</p>\n<p>Moneybag termasuk ke dalam kategori dim sum goreng. Kulitnya yang crispy dengan cacahan udang, ikan, dan sayuran yang lekat dengan adonan tepung di dalamnya sangat cocok dijadikan salah satu menu pelengkap hidangan Anda dan keluarga. Menjadi salah satu produk terlaris Kraukk karena bentuknya yang unik dengan rasa yang lezat.</p>\n<p>&nbsp;</p>\n<p>Makanan sehat dalam bentuk moneybag dari KRAUKK ini dibuat tanpa menggunakan bahan pengawet, pewarna, ataupun MSG, tersedia dalam bentuk makanan beku atau frozen food .</p>\n<p>&nbsp;</p>\n<p>Berat Per Pack : 250 Gr</p>\n<p>Isi : 15 Pcs</p>\n<p>&nbsp;</p>\n<p>Kraukk menyediakan Menu Bekal Sekolah Frozen Food yang praktis dan lezat tersaji dalam hitungan menit, dengan varian yang lengkap berupa olahan dari udang, ikan, cumi, kepiting dan bahkan makanan olahan ayam juga dapat Anda pesan langsung .</p>\n<p>&nbsp;</p>\n<p>Bukan HANYA menunya yang siap goreng dan praktis saja, KRAUKK juga punya kelebihan sebagai berikut:</p>\n<p>- Tanpa Bahan Pengawet</p>\n<p>- Kualitas Hotel Berbintang</p>\n<p>- Free MSG (Kecuali Beberapa Produk)</p>\n<p>- Baik untuk pertumbuhan (mengandung sayuran atau Seafood)</p>\n<p>- Bahan baku Pilihan Kualitas No#1</p>\n<p>- Telah bersertifikat halal MUI</p>\n<p>- Telah memiliki izin edar dari BPOM / Depkes</p>\n<p>&nbsp;</p>\n<p>Berat Per Pack : 250 Gr</p>\n<p>Isi : 15 Pcs</p>', 'READY STOCK', 1497335723740, 1497335723740, 0, 0),
(105, 'More Tea - Rasa Original', 0, 73, '13', '', 1500, 0, 1, 100, 0, '<p>More Tea - Homemade Thai Tea</p>\r\n<p>Rasa Original</p>', 'OUT OF STOCK', 1497335542102, 1506937714, 0, 0),
(106, 'More Tea - Rasa Green Tea', 0, 73, '13', '', 0, 0, 1, 0, 0, '<p>More Tea - Homemade Thai Tea</p>\n<p>Rasa Green Tea</p>', 'OUT OF STOCK', 1497335542102, 1497335542102, 0, 0),
(107, 'Rosida Jas Hujan - Cowok', 0, 76, '14', '', 170000, 0, 1, 3, 0, '<p>Quality Export, Berbahan tebal, tersedia warna Merah Hati, Biru Dan Hitam dgn Ukuran M-L-XL</p>', 'READY STOCK', 1497354943712, 1497453334385, 0, 0),
(108, 'Bakso Frozen Halus', 0, 76, '13', '', 60000, 0, 1, 5, 0, '<p>Pakkar Bakso diproduksi dgn higienis, tanpa bahan pengawat Dan tanpa MSG. Tahan sampai 5 bulan dalam freezer Dan 15 jam di luar kulkas.</p>', 'READY STOCK', 1497354943712, 1497453313593, 0, 0),
(109, 'Camry V 2010', 0, 79, '19', 'IMG-20170609-WA0005.jpg', 220000000, 0, 1, 1, 0, '<p>Assalamualaikum Wr. Wb</p>\n<p>Dijual santai, camry v 2010, barang simpanan</p>\n<p>kondisi sangat baik km rendah 38.000 on going</p>\n<p>ban serep belum turun, sangat jarang jarak jauh</p>\n<p>jok leather electric semua original dan berjalan sangat baik&nbsp;</p>\n<p>buat Sahabat yg mencari mobil sangat layak pakai monggo dilihat , tapi janjian dulu ya soalnya mobil kerudungan terus di rumah ????.</p>\n<p>japri dulu call / &nbsp;wa ke 08121139007 hatur nuhun</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', 'READY STOCK', 1497409045997, 1497453356890, 0, 0),
(110, 'Fossil FIONA black', 0, 81, '15', 'IMG-20170614-WA0155_35rp6jp2x5c0c.jpg', 3200000, 0, 1, 1, 0, '<p>Fossil authentic ..</p>\n<p>Fiona black</p>\n<p>full leather</p>\n<p>Size 30 cm</p>\n<p>Utk lbh detail silahkan &nbsp;wa 08117700122 ( no call )</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', 'READY STOCK', 1497454387957, 1497454387957, 0, 0),
(111, 'Beras Hitam', 0, 82, '12', 'berashitam0.jpg', 35000, 0, 1, 30, 0, '<p><span style="color: #555555; font-family: Helveticaff, Helvetica, arial, sans-serif; font-size: 14px; background-color: #f1f1f1;">Dibanding kedua beras lain, beras hitam cenderung lebih sulit didapatkan. Namun beras ini tentunya berbeda dengan ketan hitam. Bulir berasnya mengilap dan berukuran lebih panjang serta lebih langsing. Warna dari beras ini akan sedikit luntur dan berubah menjadi ungu setelah dimasak.</span><br style="color: #555555; font-family: Helveticaff, Helvetica, arial, sans-serif; font-size: 14px; background-color: #f1f1f1;" /><br style="color: #555555; font-family: Helveticaff, Helvetica, arial, sans-serif; font-size: 14px; background-color: #f1f1f1;" /><span style="color: #555555; font-family: Helveticaff, Helvetica, arial, sans-serif; font-size: 14px; background-color: #f1f1f1;">Varietas beras merah ini memiliki manfaat gizi yang lebih tinggi dibanding dengan beras merah dan beras cokelat, bahkan ketika keduanya digabungkan. Varietas beras ini kaya akan serat dan mengandung antioksidan, fitonutrien, phytochemical, vitamin E, protein, zat besi, dan nutrisi lainnya. Hal ini diyakini bermanfaat untuk hati, ginjal dan lambung.</span><br style="color: #555555; font-family: Helveticaff, Helvetica, arial, sans-serif; font-size: 14px; background-color: #f1f1f1;" /><br style="color: #555555; font-family: Helveticaff, Helvetica, arial, sans-serif; font-size: 14px; background-color: #f1f1f1;" /><span style="color: #555555; font-family: Helveticaff, Helvetica, arial, sans-serif; font-size: 14px; background-color: #f1f1f1;">Kandungan anthocyanin ini akan membantu mencegah risiko kanker. Ini adalah santapan yang rendah gula dan memiliki nilai indeks glikemik yang rendah. Beras ini sangat dianjurkan bagi pasien penyakit jantung, diabetes dan tekanan darah tinggi.</span><br style="color: #555555; font-family: Helveticaff, Helvetica, arial, sans-serif; font-size: 14px; background-color: #f1f1f1;" /><br style="color: #555555; font-family: Helveticaff, Helvetica, arial, sans-serif; font-size: 14px; background-color: #f1f1f1;" /><span style="color: #555555; font-family: Helveticaff, Helvetica, arial, sans-serif; font-size: 14px; background-color: #f1f1f1;">"Sesendok beras hitam mengandung lebih banyak antioksidan dan anthocyanin. Ini memberikan manfaat kesehatan yang lebih besar daripada sesendok blueberry. Kandungan gulanya sedikit namun lebih banyak serat, vitamin dan antioksidan," kata Zhimin Zu, Profesor dari Louisiana and State University, Amerika.</span></p>', 'READY STOCK', 1497522115239, 1497522115239, 0, 0),
(112, 'Salma dress', 0, 86, '15', 'IMG_20170605_161603_064.jpg', 250000, 0, 1, 4, 0, '<p>Dress /gamis A line dengan aksen layer pada dada .Cantik untuk tampil anggun di hari raya. Warna hijau segar .</p>\n<p>All size :&nbsp;</p>\n<p>Lingkar dada : 100 cm</p>\n<p>Panjang :140 cm</p>\n<p>Material : katun&nbsp;</p>', 'READY STOCK', 1497574015661, 1497574015661, 0, 0),
(113, 'Keripik talas padang', 0, 87, '13', 'IMG20170523192014_bdlq76ssrhf0.jpg', 15000, 0, 1, 50, 0, '<p>Kerpiki talas ini adalah home mad buatan salah desa di purwakarta.&nbsp;</p>\n<p>Dibuat dari talas padang, &nbsp;yang biasanya orang diabetes suka dikukus biasanya. Dan menjadi makanan ringan atau makanan cemilannya.&nbsp;</p>\n<p>Kemasan untuk keripik ini saya gunakan kemasan plastik berbahan cukup tebal namun transparan agar dapat dilihat dari luar dan ada zipper locknya. &nbsp;Sehingga jika tidak habis bisa ditutup kembali dan keripik masih renyah untuk dimakan dikemudian waktu.&nbsp;</p>\n<p>Yuk diorder keripik talasnya. Saya juga menjual keripik singkong original, &nbsp;singkong balado, &nbsp;keripik ubi ungu dan sukun. Namun mohon maaf sukun masih kosong.</p>\n<p>Isi dalam nya sebesar 230 gram</p>', 'READY STOCK', 1497575394835, 1497575394835, 0, 0),
(114, 'Spicy Macaroni (Makaroni Pedas)', 0, 90, '13', '20170616_091756.jpg', 5000, 0, 1, 50, 0, '<p>Spicy Macaroni (Makaroni Pedas), Terlaris semenjak di Ciplaz lt 11 (IT)</p>', 'READY STOCK', 1497579407263, 1497579407263, 0, 0),
(115, 'Salted Macaroni (Makaroni Asin)', 0, 90, '13', '20170616_091809.jpg', 5000, 0, 1, 50, 0, '<p>Salted Macaroni (Makaroni Asin), Terlaris semenjak di Ciplaz lt 11 (IT)</p>', 'READY STOCK', 1497580716219, 1497580716219, 0, 0),
(116, 'Mixed Nuts (Kacang Campur)', 0, 90, '13', '20170616_092019.jpg', 5000, 0, 1, 50, 0, '<p>Mixed Nuts (Kacang Campur)</p>', 'READY STOCK', 1497580751237, 1497580751237, 0, 0),
(117, 'Cassava Chips (Kripik Singkong)', 0, 90, '13', '20170616_092029.jpg', 5000, 0, 1, 50, 0, '<p>Cassava Chips (Kripik Singkong)</p>', 'READY STOCK', 1497580751237, 1497580751237, 0, 0),
(118, 'Rambak', 0, 90, '13', '20170616_091948.jpg', 5000, 0, 1, 50, 0, '<p>Rambak Kulit Sapi</p>', 'READY STOCK', 1497581061600, 1497581061600, 0, 0),
(120, 'Blueberry Astor', 0, 90, '13', '20170616_091923.jpg', 5000, 0, 1, 50, 0, '<p>Astor ungu dengan rasa blueberry</p>', 'READY STOCK', 1497581741498, 1497581741498, 0, 0),
(121, 'Chocolate Astor', 0, 90, '13', '20170616_091910.jpg', 5000, 0, 1, 50, 0, '<p>Astor dengan&nbsp;rasa coklat</p>', 'READY STOCK', 1497581741498, 1497581741498, 0, 0),
(122, 'Vanilla Astor', 0, 90, '13', '20170616_091845.jpg', 5000, 0, 1, 50, 0, '<p>Astor dengan rasa vanilla</p>', 'READY STOCK', 1497581741498, 1497581741498, 0, 0),
(123, 'Rendang Daging Sapi (1/4) KG', 0, 94, '13', 'photo_2017-06-16_10-38-27.jpg', 125000, 0, 1, 99, 0, '<h1><span style="font-size: 12pt; font-family: ''Times New Roman'', serif; border: 1pt none windowtext; padding: 0in;">Rendang Daging (Sapi)</span></h1>\n<ul>\n<li><strong>Paket &frac14; KG : 125k</strong></li>\n<li><strong>Paket &frac12; KG : 225k</strong></li>\n<li><strong>Paket 1 &nbsp;KG : 425k</strong></li>\n<li><strong>Paket 2&nbsp; KG : 825k</strong></li>\n</ul>\n<ol>\n<li>100% Halal</li>\n<li>Tidak mengandung pengawet</li>\n<li>Tidak mengunakan pewarna buatan</li>\n<li>Tidak mengunakan MSG (monosodium glutamate)</li>\n<li>Dimasak secara industri rumahan</li>\n<li>Dikemas dengan kemasan khusus plastik microwavable vacuum sealed&nbsp;kemudian di masukkan ke dalam kotak microwavable</li>\n<li>Berat adalah Berat&nbsp;dari daging sapinya saja. Berat bersih setelah product di masak lebih besar</li>\n<li>Pemesanan minimal H-2</li>\n</ol>', 'READY STOCK', 1497582905643, 1497582905643, 0, 0),
(124, 'Rendang Daging Sapi 1/2 KG', 0, 94, '13', 'photo_2017-06-16_10-38-27_35s2aejik08ww.jpg', 225000, 0, 1, 99, 0, '<h1><span style="font-size: 12pt; font-family: ''Times New Roman'', serif; border: 1pt none windowtext; padding: 0in;">Rendang Daging (Sapi)</span></h1>\n<p>&nbsp;</p>\n<ul>\n<li><strong>Paket &frac14; KG : 125k</strong></li>\n<li><strong>Paket &frac12; KG : 225k</strong></li>\n<li><strong>Paket 1 &nbsp;KG : 425k</strong></li>\n<li><strong>Paket 2&nbsp; KG : 825k</strong></li>\n</ul>\n<p>&nbsp;</p>\n<ol>\n<li>100% Halal</li>\n<li>Tidak mengandung pengawet</li>\n<li>Tidak mengunakan pewarna buatan</li>\n<li>Tidak mengunakan MSG (monosodium glutamate)</li>\n<li>Dimasak secara industri rumahan</li>\n<li>Dikemas dengan kemasan khusus plastik microwavable vacuum sealed&nbsp;kemudian di masukkan ke dalam kotak microwavable</li>\n<li>Berat adalah Berat&nbsp;dari daging sapinya saja. Berat bersih setelah product di masak lebih besar</li>\n<li>Pemesanan minimal H-2</li>\n</ol>', 'READY STOCK', 1497582905643, 1497582905643, 0, 0),
(125, 'Rendang Daging Sapi 1 KG', 0, 94, '13', 'photo_2017-06-16_10-38-27_bdltsd21r8lu.jpg', 425000, 0, 1, 99, 0, '<h1><span style="font-size: 12pt; font-family: ''Times New Roman'', serif; border: 1pt none windowtext; padding: 0in;">Rendang Daging (Sapi)</span></h1>\n<p>&nbsp;</p>\n<ul>\n<li><strong>Paket &frac14; KG : 125k</strong></li>\n<li><strong>Paket &frac12; KG : 225k</strong></li>\n<li><strong>Paket 1 &nbsp;KG : 425k</strong></li>\n<li><strong>Paket 2&nbsp; KG : 825k</strong></li>\n</ul>\n<p>&nbsp;</p>\n<ol>\n<li>100% Halal</li>\n<li>Tidak mengandung pengawet</li>\n<li>Tidak mengunakan pewarna buatan</li>\n<li>Tidak mengunakan MSG (monosodium glutamate)</li>\n<li>Dimasak secara industri rumahan</li>\n<li>Dikemas dengan kemasan khusus plastik microwavable vacuum sealed&nbsp;kemudian di masukkan ke dalam kotak microwavable</li>\n<li>Berat adalah Berat&nbsp;dari daging sapinya saja. Berat bersih setelah product di masak lebih besar</li>\n<li>Pemesanan minimal H-2</li>\n</ol>', 'READY STOCK', 1497582905643, 1497582905643, 0, 0),
(126, 'Kurma Sukkari Ruthab', 0, 95, '12', 'kurma.jpg', 95000, 0, 1, 10, 0, '<p>Kurma Sukkari Ruthob asli dari Riyadh. Berat per toples 550gr. Jenis kurmanya adalah kurma basah. Expired date Juni 2018</p>', 'READY STOCK', 1497587769552, 1497587769552, 0, 0),
(127, 'Stelan batwing', 0, 100, '15', 'IMG_20170518_210704_041.jpg', 250000, 0, 1, 5, 0, '<p>Stelan batwing bahan crape tebal</p>\n<p>Kulot fit to xl</p>\n<p>Blus all size fit to xl</p>\n<p>&nbsp;</p>', 'READY STOCK', 1497606365779, 1497606365779, 0, 0),
(128, 'Jumpsuit kombi', 0, 100, '15', 'IMG_20170616_163803.jpg', 350000, 0, 1, 4, 0, '<p>Jumpsuit kombinasi ini cantik banget.</p>\n<p>Bahannya adem&nbsp;</p>\n<p>Size Fit to L</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', 'READY STOCK', 1497606345664, 1497606345664, 0, 0),
(129, 'Outer kupu2', 0, 100, '15', 'IMG_20170616_163815.jpg', 350000, 0, 1, 4, 0, '<p>Outer kupu2 cantik ini cocok buat yg ingin tampil beda.</p>\n<p>Bahannya tebal namun adem.</p>\n<p>Size fit to L</p>\n<p>&nbsp;</p>', 'READY STOCK', 1497606307842, 1497606307842, 0, 0),
(130, 'Ramiez blus', 0, 100, '15', '2017-06-16_16.55.58.jpg', 200000, 0, 1, 2, 0, '<p>Size fit to L kecil</p>', 'READY STOCK', 1497607055811, 1497607055811, 0, 0),
(131, 'Blus bunga', 0, 100, '15', '2017-06-16_16.54.00.jpg', 200000, 0, 1, 2, 0, '<p>Bahan adem&nbsp;</p>\n<p>Size fit to L kecil</p>', 'READY STOCK', 1497607055811, 1497607055811, 0, 0),
(132, 'Gamis Elsiete', 0, 101, '15', '', 0, 0, 1, 0, 0, '', 'READY STOCK', 1497658779017, 1497658779017, 0, 0),
(133, 'Ranginang Mentah', 0, 46, '13', 'IMG_20170617_190801.jpg', 25000, 0, 1, 0, 0, '<p>Ranginang Terasi Khas Kuningan Jawa Barat.</p>\n<p>Satu Bungkus isi 25 Biji.</p>\n<p>Masih Mentah, tidak digoreng agar Pembeli menggoreng sendiri dengan Minyak yang Baik dan Biasa Digunakan, serta dalam keadaan Fresh.</p>', 'READY STOCK', 1497701489848, 1497701489848, 0, 0),
(134, 'Ranginang Gundu Mentah', 0, 46, '13', 'IMG_20170617_190900.jpg', 25000, 0, 1, 0, 0, '<p>Ranginang Terasi Khas Kuningan Jawa Barat.</p>\n<p>Satu Bungkus isi 25 Biji.</p>\n<p>Masih Mentah, tidak digoreng agar Pembeli menggoreng sendiri dengan Minyak yang Baik dan Biasa Digunakan, serta dalam keadaan Fresh.</p>', 'READY STOCK', 1497701489848, 1497701489848, 0, 0),
(135, 'Uang Koin Rp. 1 th 1970', 0, 103, '22', 'uang_kuno_rp_1.jpg', 50000, 0, 1, 100, 0, '<p>Uang Kuno Rp. 1 tahun 1970.</p>\n<p>Kondisi : kinclong mulus</p>\n<p>Harga : Rp. 50.000 / keping</p>', 'READY STOCK', 1497944585513, 1497944585513, 0, 0),
(136, 'Uang Koin Rp. 2 th 1970', 0, 103, '22', 'koin_rp2_depan_belakang_3k.jpg', 75000, 0, 1, 50, 0, '<p>Uang Koin Rp. 2 Tahun 1970</p>\n<p>Kondisi : mulus kinclong</p>\n<p>Harga : Rp. 75.000 / keping</p>', 'READY STOCK', 1497944664829, 1497944664829, 0, 0),
(137, 'Sirwal Sunnah by LaIsbal Clothing', 0, 104, '15', 'textgram_1497970886.png', 200000, 0, 1, 0, 0, '<p>Sirwal Sunnah by LaIsbal Clothing&nbsp;</p>\n<p>&nbsp;</p>\n<p>Bahan katun stretch</p>\n<p>Dingin dan halus sehingga sangat nyaman untuk digunakan pada berbagai aktivitas seperti sholat, ke kantor, kuliah, jalan-jalan maupun kegiatan santai.&nbsp;</p>\n<p>&nbsp;</p>\n<p>Ukuran Panjang : 7 cm di atas mata kaki (86cm)</p>\n<p>Lingkar bawah : ukuran 33 : 38cm, ukuran 35 : 40cm</p>\n<p>&nbsp;</p>\n<p>Stok :&nbsp;</p>\n<p>- Navy blue 31, 33, 35 (Regular Fit)</p>\n<p>- Dark night 31, 33, 35 (Regular Fit)</p>\n<p><span style="font-size: 9.46px;">- Dark grey 31, 33, 35 (Regular Fit)</span></p>\n<p>&nbsp;</p>\n<p>Mohon konfirmasi ulang ya untuk ketersediaan stoknya.</p>\n<p>&nbsp;</p>\n<p>Patokan size lingkar pinggang :</p>\n<p>26=71 cm, 27=74 cm,&nbsp;</p>\n<p>28=77 cm, 29=80 cm</p>\n<p>30=83 cm, 31=86 cm</p>\n<p>32=89 cm, 33=92 cm</p>\n<p>34=95 cm, 35=98 cm</p>\n<p>36=101 cm, 37=104 cm</p>\n<p>38=107 cm, 39=110 cm</p>\n<p>40=113 cm, 41=116 cm</p>\n<p>42=119 cm, 43=122 cm</p>\n<p>&nbsp;</p>\n<p>Mohon konfirmasi ulang ya untuk ketersediaan barangnya untuk memastikan.</p>', 'READY STOCK', 1497970928973, 1497970928973, 0, 0),
(138, 'Uang kertas Rp. 100 th 1992', 0, 103, '22', '20170621_132858.jpg', 50000, 0, 1, 100, 0, '<p>Uang kertas Rp. 100 tahun 1992</p>\n<p>Kondisi : mulus, kertas kaku, uang belum pernah dipakai.</p>\n<p>Harga per lembar Rp. 50.000</p>\n<p>Kami punya 100 lembar nomer seri urut (boleh beli 1 lembar)</p>', 'READY STOCK', 1498026595605, 1498026595605, 0, 0),
(139, 'Uang kertas Rp. 100 th 1977', 0, 103, '22', 'images-7.jpg', 250000, 0, 1, 100, 0, '<p>Uang kertas Rp. 100 tahun 1977</p>\n<p>Kondisi : mulus, kertas kaku, uang belum pernah dipakai.</p>\n<p>&nbsp;</p>', 'READY STOCK', 1498027149726, 1498027149726, 0, 0),
(140, 'Uang kertas Rp. 500 th 1988', 0, 103, '22', 'uang_kuno_rp500_rusa_UNC_ZBV_depan_8k.jpg', 150000, 0, 1, 10, 0, '<p>Uang kertas Rp. 500 tahun 1988</p>\n<p>Kondisi : mulus, kertas kaku, uang belum pernah dipakai</p>', 'READY STOCK', 1498027668740, 1498027668740, 0, 0);
INSERT INTO `product` (`id`, `name`, `type`, `merchant_id`, `category_id`, `image`, `price`, `fee`, `approve`, `stock`, `draft`, `description`, `status`, `created_at`, `last_update`, `total_rate`, `count_rate`) VALUES
(141, 'Huawei Mate 9 Harga dibawah Pasar', 0, 68, '22', 'JualMurahHuaweiMate9InternationalEdition64GB4GBOctacoreLeica_2.jpg.jpg', 7200000, 0, 1, 1, 0, '<p>CP Akbar 08118135416</p>\n<p>CoD di TSO, Gatsu, dan Villa Kelapa Dua Jakbar</p>\n<p>SPECIFICATIONS:</p>\n<p>&nbsp;</p>\n<p>- NETWORK</p>\n<p>*Technology: GSM (2G) / HSPA (3G) / LTE (4G)</p>\n<p>&nbsp;</p>\n<p>- BODY&nbsp;</p>\n<p>*Dimensions: 156.9 x 78.9 x 7.9 mm</p>\n<p>*Weight: 190 gram</p>\n<p>*SIM: Dual SIM (Nano-SIM, dual stand-by)</p>\n<p>&nbsp;</p>\n<p>- DISPLAY&nbsp;</p>\n<p>*Type: IPS LCD capacitive touchscreen, 16M colors</p>\n<p>*Size: 5.9 inches (~77.5% screen-to-body ratio)</p>\n<p>*Resolution: 1080 x 1920 pixels (~373 ppi pixel density)</p>\n<p>*Multitouch: Yes</p>\n<p>*EMUI 5.0</p>\n<p>&nbsp;</p>\n<p>- PLATFORM&nbsp;</p>\n<p>*OS: Android OS, v7.0 (Nougat)</p>\n<p>*Chipset: Hisilicon Kirin 960</p>\n<p>*CPU: Octa-core (4x2.4 GHz Cortex-A73 &amp;amp;amp;amp;amp;amp;amp; 4x1.8 GHz Cortex-A53)</p>\n<p>*GPU: Mali-G71 MP8</p>\n<p>&nbsp;</p>\n<p>- MEMORY</p>\n<p>*Card slot: microSD, up to 256 GB (uses SIM 2 slot)</p>\n<p>*Internal: 64 GB, 4 GB RAM</p>\n<p>&nbsp;</p>\n<p>- CAMERA&nbsp;</p>\n<p>*Primary: Dual 20 MP +12 MP, f/2.2, OIS, 2x zoom, Leica optics, phase detection &amp;amp;amp;amp;amp;amp;amp; laser autofocus, dual-LED (dual tone) flash</p>\n<p>*Features: Geo-tagging, touch focus, face/smile detection, panorama, HDR</p>\n<p>*Video: 2160p@30fps</p>\n<p>*Secondary: 8 MP, f/1.9, 1080p</p>\n<p>&nbsp;</p>\n<p>- SOUND</p>\n<p>*Alert types: Vibration; MP3, WAV ringtones</p>\n<p>*Loudspeaker: Yes, with stereo speakers</p>\n<p>*3.5mm jack: Yes</p>\n<p>*Active noise cancellation with dedicated mic</p>\n<p>&nbsp;</p>\n<p>- COMMS</p>\n<p>*WLAN: Wi-Fi 802.11 a/b/g/n/ac, dual-band, DLNA, WiFi Direct, hotspot</p>\n<p>*Bluetooth: v4.2, A2DP, EDR, LE</p>\n<p>*GPS: Yes, with A-GPS, GLONASS, BDS, GALILEO</p>\n<p>*NFC: Yes</p>\n<p>*Infrared Port: Yes</p>\n<p>*Radio: No</p>\n<p>*USB:  v2.0, Type-C 1.0 reversible connector</p>\n<p>&nbsp;</p>\n<p>- FEATURES</p>\n<p>*Sensors: Fingerprint (rear-mounted), accelerometer, gyro, proximity, barometer, compass</p>\n<p>*Messaging: SMS (threaded view), MMS, Email, IM, Push Email</p>\n<p>*Browser: HTML5</p>\n<p>*Java: No</p>\n<p>*Fast battery charging</p>\n<p>*DivX/XviD/MP4/H.265/WMV player</p>\n<p>*MP3/eAAC+/WMA/WAV/Flac player</p>\n<p>*Photo/video editor</p>\n<p>*Document editor</p>\n<p>&nbsp;</p>\n<p>- BATTERY &nbsp;</p>\n<p>*Non-removable Li-Ion 4000 mAh battery</p>\n<p>&nbsp;</p>\n<p>- TESTS</p>\n<p>*Performance: Basemark OS II: 3280 / Basemark OS II 2.0: 2637; Basemark X: 36519</p>\n<p>*Display: Contrast ratio: 1622 (nominal), 3.680 (sunlight)</p>\n<p>*Camera: Photo / Video</p>\n<p>*Loudspeaker: Voice 83dB / Noise 74dB / Ring 85dB</p>\n<p>*Audio quality: Noise -92.2dB / Crosstalk -93.3dB</p>\n<p>*Battery life: Endurance rating 82h</p>', 'READY STOCK', 1498059415233, 1498059415233, 0, 0),
(142, 'Katoe MegaMendung Shirt for Women', 0, 105, '15', '1491900995267.JPEG', 175000, 0, 1, 24, 0, '<p>NEW ARRIVAL!</p>\n<p>Kemeja Wanita MEGA MENDUNG.</p>\n<p>&nbsp;</p>\n<p>Terbuat dari bahan katun berkualitas yang sangat lembut dan nyaman dikulit, sehingga tidak mengganggu wanita dalam beraktifitas.</p>\n<p>Hadir dengan desain Batik Mega Mendung, yang merupakan ikon khas dari kota Cirebon, Indonesia.</p>\n<p>Tampil fashionable untuk para kaum muslimah dan tetap elegan dengan desain batik.</p>\n<p>&nbsp;</p>\n<p>Dapatkan segera, stok terbatas.</p>', 'READY STOCK', 1498102518833, 1498102518833, 0, 0),
(143, 'Service ac Tangerang, bsd, cipondoh, gading serpong', 0, 108, '20', 'images_19.jpg', 70000, 0, 1, 100, 0, '', 'READY STOCK', 1498176338742, 1498176338742, 0, 0),
(144, 'Service ac gading serpong', 0, 108, '20', 'images_19_bdrnadpxqx80.jpg', 70000, 0, 1, 100, 0, '', 'READY STOCK', 1498176338742, 1498176338742, 0, 0),
(145, 'Sirup jahe', 0, 115, '13', 'images_3.jpg', 35000, 0, 1, 5, 0, '<p>Sirup Jahe alami</p>\n<p>Isi 600 ml</p>\n<p>Komposisi: Jahe,gula...tanpa bawan pengawet</p>\n<p>Cocok utk diminum bersama rekan di kantor TSO yang diingin serta bersama keluarga dirumah</p>', 'READY STOCK', 1499515911544, 1499515911544, 0, 0),
(146, 'Susu GOMARS', 0, 116, '12', 'IMG_20170615_161357_133.jpg', 12500, 0, 1, 300, 1, '<p style="border: 0px; outline: 0px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; margin: 0px 0px 1.5em; padding: 0px; line-height: 1.5em; color: #888888; font-family: ''Helvetica Neue'', arial, sans-serif;"><strong style="border: 0px; outline: 0px; vertical-align: baseline; background: transparent; margin: 0px; padding: 0px;">Susu Kambing Etawa Gomars&nbsp;</strong>merupakan produk susu yang memiliki kandungan protein dan gizi. Susu kambing etawa ada yang mengklaim sebagai salah satu susu baik , walaupun masih dibawah kualitas ASI.&nbsp;<strong style="border: 0px; outline: 0px; vertical-align: baseline; background: transparent; margin: 0px; padding: 0px;">Susu Kambing Etawa Gomars&nbsp;</strong>terbuat dari&nbsp;<strong style="border: 0px; outline: 0px; vertical-align: baseline; background: transparent; margin: 0px; padding: 0px;">Susu Kambing Etawa&nbsp;</strong>yang diolah sedemikian rupa untuk menjaga manfaat dan kualitasnya, baik untuk diminum bagi balita sampai dengan lansia.&nbsp;<strong style="border: 0px; outline: 0px; vertical-align: baseline; background: transparent; margin: 0px; padding: 0px;">Susu Kambing Etawa Gomars&nbsp;</strong>mempunyai manfaat dan khasiat yang baik untuk kesehatan.&nbsp;<strong style="border: 0px; outline: 0px; vertical-align: baseline; background: transparent; margin: 0px; padding: 0px;">Susu Kambing Etawa</strong>&nbsp;ini dihasilkan langsung dari peternakan kambing etawa.</p>\n<p style="border: 0px; outline: 0px; vertical-align: baseline; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; margin: 0px 0px 1.5em; padding: 0px; line-height: 1.5em; color: #888888; font-family: ''Helvetica Neue'', arial, sans-serif;">Manfaat&nbsp;Susu kambing Etawa Gomars untuk pengobatan memang sudah tidak diragukan lagi. Dari hasil penelitian membuktikan bahwa susu kambing etawa ternyata memiliki khasiat dan manfaat yang lebih baik dari susu yang beredar dipasaran atau susu sapi. Banyak yang mengakui bahwa khasiat susu kambing etawa baik untuk mengobati berbagai macam penyakit.</p>', 'READY STOCK', 1499356375605, 1499356375605, 0, 0),
(147, 'Honda Beat 2013', 0, 25, '19', '', 8500000, 0, 1, 1, 0, '<p>Warna Biru, ban tubles, service rutin dibengkel AHASS, km baru 28rb, Pajak masih panjang banget (Juli 2018)&nbsp;</p>\n<p>Motor&nbsp;bisa dilihat di parkiran motor TSO setiap hari kerja.</p>\n<p>Silahkan janjian dulu via WhatsApp dan telpon 0811700360</p>', 'READY STOCK', 1499381537924, 1499381537924, 0, 0),
(148, 'CCTV Indihome View 2.0', 0, 59, '14', 'Indihomeview2_150dkygkb4f1.jpg', 675000, 0, 1, 4, 0, '<p>Indihome View merupakan Layanan inovatif untuk menikmati Live Camera dengan harga yang murah dan proses instalasi yang sangat mudah dengan menggunakan Plug &amp; Play IP-Cam melalui Gadget (perangkat Android maupun IOS)</p>\n<p>CCTV dapat diakses lewat HP, Laptop atau PC</p>\n<p>Layanan Indihome View tidak memerlukan pengaturan IP Publik, Port Mapping atau DDNS untuk konfigurasi router/IP Cam. FITUR : Menggunakan Teknologi P2P (Plug and Play), Merekam dan menyimpan gambar menggunakan SD Card (max 32Gb) , Bisa digunakan untuk Komunikasi dua arah menggunakan speaker, Bisa mendeteksi gerakan dan mengirimkan Notifikasi.</p>\n<p>&nbsp;</p>\n<p>Harga per Unit Rp. 675.000,-</p>\n<p>Stock CCTV : 4 unit, ada diskon untuk yang langsung beli 4 CCTV</p>\n<p>&nbsp;</p>\n<p>Bagi yg berminat bisa contact : 08119953080</p>\n<p>Barang masih bagus (SECOND), baru di bulan Juli 2016 beli nya</p>\n<p>COD bisa di Jakarta atau Tangerang</p>', 'READY STOCK', 1499407939668, 1499407939668, 0, 0),
(149, 'Wedang Uwuh', 0, 37, '13', 'IMG-20170710-WA0032.jpg', 7000, 0, 1, 10, 0, '<p>WEDANG UWUH, minuman tradisional yang terbuat dari rempah-rempah alami yang mempunyai banyak manfaat. Seperti menghangatkan badan, mengurangi masuk angin, migrain, asam urat, kolesterol, radang tenggorokan dan melancarkan peredaran darah... tinggal seduh dengan air mendidih, dan siap utk dikonsumsi ????</p>', 'READY STOCK', 1499696805469, 1499696805469, 0, 0),
(150, 'Toner PAF 12A PAF PREMIUM BLACK', 0, 124, '20', '0_d6f714e4-00d0-40bc-99e6-3bb3a73dce2a_700_1166.jpg', 140000, 0, 1, 50, 1, '<p>Serbuk toner printer paf 12a premium black all one printer laser jet</p>', 'READY STOCK', 1499887190609, 1499887190609, 0, 0),
(152, 'Fresh Fruits Juice', 0, 77, '11', 'juiceall_7x51_be9mdz3jbmum.png', 20000, 0, 1, 1000, 0, '<p>Tersedia Aneka Jus Buah Segar Asli bukan sirup atau perasa : buah sirsak, kiwi, naga, dll</p>', 'READY STOCK', 1500339616439, 1500339616439, 0, 0),
(153, 'Aneka Buah Potong', 0, 77, '11', 'buah-potong_35zmo1lrpzs4w.jpg', 25000, 0, 1, 1000, 0, '<p>Tersedia semua aneka buah potong segar langsung di potong berdasarkan request</p>\n<p>&nbsp;</p>', 'READY STOCK', 1500352824544, 1500352824544, 0, 0),
(154, 'Rujak Buah', 0, 77, '11', 'rujak-buah.jpg', 20000, 0, 1, 1000, 0, '<p>Tersedia rujak buah segar</p>', 'READY STOCK', 1500352260191, 1500352260191, 0, 0),
(155, 'Mangga Harum Manis Potong', 0, 77, '11', 'Aneka_Buah_Potong_Mangga1.jpg', 30000, 0, 1, 1000, 0, '<p>Tersedia Buah Potong Mangga Harum Manis</p>', 'READY STOCK', 1500352824544, 1500352824544, 0, 0),
(156, 'Buah Potong Mix', 0, 77, '11', 'Buah_Potong_..jpg', 25000, 0, 1, 1000, 0, '<p>Tersedia buah potong mix</p>', 'READY STOCK', 1500353248058, 1500353248058, 0, 0),
(157, 'Salad Buah', 0, 77, '11', 'Salad_Buah_1.jpg', 20000, 0, 1, 100, 0, '<p>Tersedia Salad Buah Lengkap</p>', 'READY STOCK', 1500353248058, 1500353248058, 0, 0),
(158, 'Rujak Buah - KiselDrink-JuiceFriend', 0, 77, '13', 'rujakbuah.png', 20000, 0, 1, 1000, 0, '<p>Tersedia Rujak Buah di KiselDrink-Juice Friend Lt.11</p>', 'READY STOCK', 1500353248058, 1500353248058, 0, 0),
(159, 'Aneka Salad Sayur', 0, 77, '11', 'salad-sayur.jpg', 20000, 0, 1, 100, 0, '<p>Tersedia Salad Sayur Segar</p>', 'READY STOCK', 1500353248058, 1500353248058, 0, 0),
(160, 'Roti - BreadFriend', 0, 77, '13', 'Aneka_Roti_BF.png', 7000, 0, 1, 100, 0, '<p>Tersedia Roti mulai dari harga 7k - 10k dengan berbagai macam rasa, coklat, keju, dll</p>', 'READY STOCK', 1500363968584, 1500363968584, 0, 0),
(161, 'Thai Tea', 0, 77, '11', 'THAI_TEA.png', 15000, 0, 1, 100, 0, '<p>Tersedia aneka minuman Thai Tea, Green Tea dengan aroma khas teh asli thailand yg enak dan nikmat disajikan dingin</p>\n<p>Kemasan sedang Rp 15k</p>\n<p>Kemasan besar Rp 20k</p>', 'READY STOCK', 1500428035900, 1500428035900, 0, 0),
(162, 'Teh Tarik', 0, 77, '11', 'teh-tarik.jpg', 15000, 0, 1, 1000, 0, '<p>Tersedia Minuman Hangat/Dingin Teh Tarik khas JuiceFriend di Lt.11 Booth KiselDrink</p>', 'READY STOCK', 1500364505468, 1500364505468, 0, 0),
(163, 'Avocado Latte', 0, 77, '11', 'avocado-latte.jpg', 25000, 0, 1, 1000, 0, '<p>Rasa Avocado dikombinasi susu dan rasa original menjadi nikmat disajikan dingin</p>', 'READY STOCK', 1500365268102, 1500365268102, 0, 0),
(164, 'Green Tea', 0, 77, '11', 'Green_Tea.png', 15000, 0, 1, 100, 0, '<p>Rasa Green Tea yg nikmat asli teh thailand</p>', 'READY STOCK', 1500365268102, 1500365268102, 0, 0),
(165, 'es Thai Tea', 0, 77, '11', 'es-thai-tea.jpg', 15000, 0, 1, 100, 0, '<p>nikmat teh asli thailand harga kaki lima rasa bintang lima</p>', 'READY STOCK', 1500365268102, 1500365268102, 0, 0),
(166, 'Manggo Latte', 0, 77, '11', 'manggo-latte.jpg', 25000, 0, 1, 100, 0, '<p>Manggo Latte dengan rasa mangga asli dan susu khas latte menjadikannya nikmat dan segar</p>', 'READY STOCK', 1500366508716, 1500366508716, 0, 0),
(167, 'es mukidi - lemon sereh madu', 0, 77, '22', 'es-mukidi.jpg', 20000, 0, 1, 100, 0, '<p>perpaduan lemon sereh dan madu sebagai minuman imun tubuh dan antioksidan alami</p>', 'READY STOCK', 1500366508716, 1500366508716, 0, 0),
(168, 'es vanilla shake', 0, 77, '11', 'Es_Vanilla_Shake.jpg', 20000, 0, 1, 100, 0, '<p>Vanilla Asli dengna olahan susu menjadi minuman segar shake</p>', 'READY STOCK', 1500369474363, 1500369474363, 0, 0),
(169, 'es cokolate dinosaurus', 0, 77, '11', 'IMG20170206081922.jpg', 20000, 0, 1, 100, 0, '', 'READY STOCK', 1500369474363, 1500369474363, 0, 0),
(170, 'infused water', 0, 77, '11', 'infused_water.png', 20000, 0, 1, 100, 0, '<p>minuman ringan dengan khasiat yg luar biasa dgn buah asli</p>', 'READY STOCK', 1500371064237, 1500371064237, 0, 0),
(171, 'infused water lemon', 0, 77, '11', 'infusedwater.png', 20000, 0, 1, 1000, 0, '<p>infused water lemon asli</p>', 'READY STOCK', 1500369474363, 1500369474363, 0, 0),
(172, 'infused water original', 0, 77, '11', 'apple_lemon_mint.png', 20000, 0, 1, 100, 0, '', 'READY STOCK', 1500370414348, 1500370414348, 0, 0),
(173, 'infused water jahe lemon', 0, 77, '22', 'Infused_water_jahe_lemon.png', 20000, 0, 1, 1000, 0, '', 'READY STOCK', 1500369474363, 1500369474363, 0, 0),
(174, 'infused water lemon nenas', 0, 77, '11', 'pineapples_lemon_mint.png', 20000, 0, 1, 100, 0, '', 'READY STOCK', 1500370414348, 1500370414348, 0, 0),
(175, 'infused water strawbeery lemon mint', 0, 77, '11', 'strawberry__lemon_mint.png', 20000, 0, 1, 100, 0, '', 'READY STOCK', 1500370414348, 1500370414348, 0, 0),
(176, 'infused water strawberry cucumber lime', 0, 77, '11', 'strawberry_cucumber_lime.png', 20000, 0, 1, 100, 0, '', 'READY STOCK', 1500371064237, 1500371064237, 0, 0),
(177, 'jus mangga vip', 0, 77, '11', 'jus-mangga.jpg', 20000, 0, 1, 100, 0, '', 'READY STOCK', 1500371064237, 1500371064237, 0, 0),
(178, 'jus alpukat', 0, 77, '11', 'jus-alpukat.jpg', 20000, 0, 1, 100, 0, '', 'READY STOCK', 1500371064237, 1500371064237, 0, 0),
(179, 'jus jeruk vip', 0, 77, '11', 'jus-jeruk.jpg', 15000, 0, 1, 100, 0, '', 'READY STOCK', 1500371064237, 1500371064237, 0, 0),
(180, 'jus semangka', 0, 77, '11', 'jus_semangka.png', 15000, 0, 1, 100, 0, '', 'READY STOCK', 1500371064237, 1500371064237, 0, 0),
(181, 'aneka jus vip', 0, 77, '11', 'Aneka_Jus.jpg', 20000, 0, 1, 1000, 0, '<p>aneka jus buah segar mulai dari jus kedondong, jeruk, terong belanda, pear, melon, tomat, semangka, pepaya, nenas, timun, jambu, belimbing, apel, kiwi, lemon,</p>', 'READY STOCK', 1500371852773, 1500371852773, 0, 0),
(182, 'jus kesehatan khusus - VVIP Juice', 0, 77, '11', 'Brosur_2.png', 28000, 0, 1, 100, 0, '<p>jus khusus untuk terapi kesehatan khusus</p>\n<p>pelangsing, asem urat, awet muda, stamina pria, flu, sinusitis, magh, cancer, jerawat, kolesterol, darah tinggi, darah rendah, stroke, jantung, mata, BAB, panas dalam, rematik, dll untuk menghasilkan maksimal agar dilakukan secara rutin dan mengurangi makan karbo</p>', 'READY STOCK', 1500372218073, 1500372218073, 0, 0),
(183, 'Premium Juice - VVIP Juice', 0, 77, '11', 'Premium_Juice_-_VVIP_Juice1.1.jpg', 40000, 0, 1, 100, 0, '<p>Premium Juice - VVIP Juice adalah jus murni buah segar tanpa campuran air, gula, susu</p>\n<p>dikhususkan untuk kenikmatan murni buah import asli produk allfresh</p>', 'READY STOCK', 1500428035900, 1500428035900, 0, 0),
(184, 'Pakan Artemia 425gr', 0, 138, '22', 'IMG_20160725_WA0000_scaled.jpg', 950000, 0, 1, 100, 1, '<p><strong>Supreme Plus Golden,</strong> pakan alami untuk burayak ikan dengan daya tetas kultur 90℅ dijamin burayak hidup 95℅, dalam waktu 15-24jam saja</p>', 'READY STOCK', 1500439618926, 1500439618926, 0, 0),
(185, 'Pakan Artemia 35gr', 0, 138, '12,22', '002New_Artemia_SP_JPEG.jpg', 70000, 0, 1, 100, 1, '<ul>\n<li>Supreme Plus Golden</li>\n<li>Kemasan 35gr</li>\n</ul>', 'READY STOCK', 1500440685323, 1500440685323, 0, 0),
(186, 'Pakan Artemia 45gr', 0, 138, '12,22', '002New_Artemia_SP_JPEG_bedxwkg3gnvm.jpg', 105000, 0, 1, 100, 1, '<ul>\n<li>Supreme Plus Goden</li>\n<li>Kemasan 45gr</li>\n</ul>', 'READY STOCK', 1500440685323, 1500440685323, 0, 0),
(187, 'Artemia Vitellus 50gr', 0, 138, '12', '001NEW_Artemia-Cysts-VITELLUS_JPEG.jpg', 85000, 0, 1, 100, 1, '<ul>\r\n<li>Artemia Cysts VITELLUS</li>\r\n<li>Kemasan 50gr</li>\r\n<li>Tanpa kultur</li>\r\n<li>Instan </li>\r\n</ul>', 'READY STOCK', 1500440685323, 1506997904, 0, 0),
(188, 'Saringan Khusus Artemia', 0, 138, '22', 'IMG-20170316-WA0003.jpg', 15000, 0, 1, 1000, 0, '<ul>\n<li>Saringan Khusus Artemia</li>\n<li>Gagang plastik</li>\n<li>Kawat anti karat</li>\n<li>Panjang 25cm</li>\n</ul>', 'READY STOCK', 1500440685323, 1500440685323, 0, 0),
(189, 'Spirulina Powder 50gr', 0, 138, '12', '003New_Spirulina_JPEG.jpg', 75000, 0, 1, 100, 1, '<ul>\n<li>Spirulina Powder</li>\n<li>Kemasan 50gr</li>\n<li>Obat ikan hias</li>\n<li>Obat pewarnaan ikan hias</li>\n</ul>', 'READY STOCK', 1500440685323, 1500440685323, 0, 0),
(190, 'Garam Ikan', 0, 138, '12', 'GaramIkan_1.jpg.jpg', 10000, 0, 1, 1000, 1, '<ul>\n<li>Garam Ikan</li>\n<li>Kemasan 500gr</li>\n<li>Obat ikan hias</li>\n<li>Pembasmi jamur</li>\n<li>Pembasmi bakteri</li>\n</ul>', 'READY STOCK', 1500440685323, 1500440685323, 0, 0),
(191, 'Pipet Plastik', 0, 138, '12', 'PipetPlastik_1.jpg.jpg', 7500, 0, 1, 1000, 1, '<ul>\n<li>Pipet Plastik</li>\n<li>Alat khusus penyedot artemia</li>\n<li>Uk 3ml</li>\n</ul>', 'READY STOCK', 1500440685323, 1500440685323, 0, 0),
(192, 'Paket Alat Kultur + Artemia 20gr', 0, 138, '12,22', 'IMG_20160910_WA0014.jpeg', 185000, 0, 1, 100, 1, '<ul>\n<li>Garam Ikan 500gr</li>\n<li>Pipet Plastik 3ml</li>\n<li>Mesin Aerator 1set</li>\n<li>Artemia 20gr</li>\n<li>Paket alat kultur</li>\n</ul>', 'READY STOCK', 1500442135499, 1500442135499, 0, 0),
(193, 'Sale Hyundai Santafe 2013', 0, 139, '19', 'IMG20170719173516.jpg', 340000000, 0, 1, 1, 0, '', 'READY STOCK', 1500513075477, 1500513075477, 0, 0),
(194, 'Dus parfum roll. Tempat parfum roll', 0, 148, '21', 'dusparfumrollontempatparfumrollutkdisplay_1.jpg.jpg', 5000, 0, 1, 100, 0, '<p>Dijual dus parfum utk display parfum roll.. Muat 30pc. Minat pm ya</p>\r\n<p> </p>', 'READY STOCK', 1500959880545, 1506937616, 0, 0),
(195, 'Moment propolis brazilian', 0, 149, '12', '20170723_210436.jpg', 250000, 0, 1, 100, 1, '<p>"Propolis Moment Brazilian" ingat bukan PROPOLIS lain tp propolis dari PT Momen global Internasional, karna banyak merk dan kemasan propolis yg mirip sama..</p>\n<p>&nbsp;</p>\n<p>cocok untuk terapi obat siap siaga kluarga anda, dg multifungsi khasiat :&nbsp;</p>\n<p>-Perawatan dan penyembuhan organ tubuh bagian dalam dengan cara DIMINUM.</p>\n<p>-Membantu proses penyembuhan luka luar dg cara DIOLESKAN</p>\n<p>&nbsp;</p>\n<p>DENGAN CARA DIMINUM:</p>\n<p>ambil 1/4 gelas 250cc air putih hangat-hangat kuku atau suhu sekitar 40-45 derajat celcius. Bermanfaat untuk perawatan dan penyembuhan organ dalam seperti asam urat, batu ginjal, ambien, ayan, anemia, asma, amandel, bau mulut/badan, darah tinggi, darah rendah, demam, diare, kolesterol, kista, kanker (payudara, rahim, otak, tulang dll) , leukimia, migrain, malaria, osteoporosis, pegal2, rematik, stoke, radang, sakit kepala, sariawan, thypus, TBC, tumor, radang, pencernaan,paru2, dll.</p>\n<p>Untuk orang sehat : 3-4 tetes sehari 2-3 kali, diminum pagi sebelum sarapan, siang dan sebelum tidur</p>\n<p>Aturan pakai nya:</p>\n<p>-Untuk orang sakit : 5-9 tetes sehari 3-4 kali diminum pagi, siang, sore dan sebelum tidur.</p>\n<p>JANGAN mengaduk propolis dengan sendok dari besi atau logam sejenis karena dapat mengurangi khasiat propolis</p>\n<p>JANGAN dicampur dengan air es atau air dingin karena propolis tidak mudah larut dalam air dingin</p>\n<p>JANGAN dicampur dengan air panas/mendidih karena akan merusak zat-zat yang terkandung dalam propolis</p>\n<p>JANGAN diminum bersamaan dengan obat-obatan dari kimia (non alami)</p>\n<p>&nbsp;</p>\n<p>DENGAN CARA DIOLESKAN:</p>\n<p>dioleskan dengan merata kebagian yang sakit, 3 kali sehari untuk proses penyembuhan luka bisul, eksim, panu, gtal-gatal, borok, jerawat, luka berdarah, luka bakar,tersiram air panas, dll.</p>\n<p>&nbsp;</p>\n<p>---free 2 sachet glucogen kemasan terbaru dg khasiat perawatan kulit anda, mengencangkan kulit, mencegah timbulnya jerawat, mengurangi keriput muka.</p>\n<p>&nbsp;</p>\n<p>==Tersedia juga 1 box isi 5 botol</p>\n<p>&nbsp;</p>\n<p>Trimakasih smoga bermanfaat.</p>\n<p>&nbsp;</p>\n<p>info WA : 081296757599 / 085693576882</p>\n<p>id member moment : 8207452 an Yayan Iskandar</p>\n<p>&nbsp;</p>\n<p>PT MOMENT GLOBAL INTERNASIONAL</p>', 'READY STOCK', 1501164398426, 1501164398426, 0, 0),
(196, 'Sepatu anak Adidas Yeezy Boost V2 Beluga', 0, 156, '15', 'sepatuanakAdidasyeezyboost350V2kidsBeluga_3.jpg_152b4vatby1m.jpg', 400000, 0, 1, 6, 0, '<p>Ready size 28 - 35</p>\n<p>Adidas Yeezyboost Kids</p>\n<p>- super premium grade</p>\n<p>- mirror 1 : 1</p>\n<p>- Made in Vietnam</p>\n<p>- Size 28 sampai 35</p>\n<p>- Barang 100% sesuai dengan gambar.</p>\n<p>- Bantalan Sol Empuk sehingga nyaman saat dipakai.</p>\n<p>- Packing + box.adidas</p>\n<p>- kwalitas terjamin boleh di uji.</p>\n<p>- Informasi size dan warna terlebih dahulu sebelum memesan barang, agar dapat di check ketersediaan barang.</p>', 'READY STOCK', 1501370203481, 1501370203481, 0, 0),
(197, 'Krupuk Kulit Sapi rambak krecek', 0, 157, '13', '20170730_213552.jpg', 20000, 0, 1, 10, 0, '<p>Kerupuk/Krupuk Kulit atau Jangek atau Rambak ini rasanya sangat renyah dan gurih, sedikit asin, tetapi tidak serat di tenggorokan. sengaja dibuat dalam bentuk dan ukuran sedemikian sehingga sangat pas dimakan satu per satu, serasa tidak ingin berhenti dilahap terus.</p>\n<p>&nbsp;</p>\n<p>Cocok untuk disantap sebagai lauk tambahan saat menyantap makanan, atau sebagai cemilan sambil menonton televisi, saat santai sendiri, saat berkumpul bersama keluarga, atau di saat kapan saja.</p>\n<p>&nbsp;</p>\n<p>Kerupuk/Krupuk Kulit atau Jangek atau Rambak terbuat dari bahan kulit sapi yang diolah dengan bumbu dan rempah secukupnya, lalu dikeringkan di bawah terik matahari sampai siap digoreng menjadi kerupuk renyah dan siap dinikmati setiap saat.</p>\n<p>&nbsp;</p>\n<p>Krupuk Rambak ini juga dikenal bagus untuk membantu penyembuhan sakit maag bila dikonsumsi sebelum makan.</p>\n<p>=========================================================</p>', 'READY STOCK', 1501425775636, 1501425775636, 0, 0),
(198, 'Sepatu anak lucu UB001', 0, 156, '15', 'IMG_20170722_121445.jpg', 120000, 0, 1, 5, 0, '<p>Fast response WA 081291673067</p>\n<p>Ready size 21 - 25.</p>\n<p>P<span style="font-size: 11px;">remium grade.</span></p>\n<p>Kwalitas import terjamin boleh di uji.</p>\n<p>Sol lembut nyaman dipakai.</p>', 'READY STOCK', 1501640773346, 1501640773346, 0, 0),
(199, 'Sepatu anak Adidas Yeezy boost LED', 0, 156, '15', 'IMG-20170727-WA0039.jpg', 320000, 0, 1, 5, 0, '<p>Fast response WA 081291673067</p>\n<p>Adidas Yeezy boost LED kids.</p>\n<p>Ready size 26 - 35.</p>\n<p>Made in Vietnam.</p>\n<p>Super Premium grade.</p>\n<p>Mirror 1:1.</p>\n<p>Kwalitas import terjamin boleh di uji.</p>\n<p>Sol lembut nyaman dipakai.</p>\n<p>Packing Box Ori.</p>', 'READY STOCK', 1501640773346, 1501640773346, 0, 0),
(200, 'Sepatu anak Adidas nmd runner Primeknit', 0, 156, '15', 'sepatuanakadidasnmdrunnerblackkid_2.jpg.jpg', 330000, 0, 1, 5, 0, '<p>Fast response WA 081291673067</p>\n<p>Adidas nmd runner kids.</p>\n<p>Ready size 28 - 35.</p>\n<p>Made in Vietnam.</p>\n<p>Super Premium grade.</p>\n<p>Mirror 1:1.</p>\n<p>Kwalitas import terjamin boleh di uji.</p>\n<p>Sol lembut nyaman dipakai.</p>\n<p>Packing Box Ori.</p>', 'READY STOCK', 1501640773346, 1501640773346, 0, 0),
(201, 'Sepatu anak lucu UB002', 0, 156, '15', '1500699941416.jpg', 120000, 0, 1, 5, 0, '<p>Fast response WA 081291673067</p>\n<p>Ready size 21 - 25.</p>\n<p>Premium grade.</p>\n<p>Kwalitas import terjamin boleh di uji.</p>\n<p>Sol lembut nyaman dipakai.</p>', 'READY STOCK', 1501640773346, 1501640773346, 0, 0),
(202, 'Sepatu anak lucu SR001', 0, 156, '15', 'IMG_20170729_115558.jpg', 160000, 0, 1, 5, 0, '<p>Fast response WA 081291673067</p>\n<p>Ready size 21 - 30.</p>\n<p><span style="font-size: 11px;">P</span><span style="font-size: 11px;">remium grade.</span></p>\n<p>Kwalitas import terjamin boleh di uji.</p>\n<p>Sol lembut nyaman dipakai.</p>', 'READY STOCK', 1501640773346, 1501640773346, 0, 0),
(203, 'Sepatu anak Puma Rihanna rainbow silver', 0, 156, '15', 'IMG-20170727-WA0063.jpg', 250000, 0, 1, 5, 0, '<p>Fast response WA 081291673067</p>\n<p>Puma Rihanna kids.</p>\n<p>Ready size 31 - 36.</p>\n<p>Made in Vietnam.</p>\n<p>Super Premium grade.</p>\n<p>Mirror 1:1.</p>\n<p>Kwalitas import terjamin boleh di uji.</p>\n<p>Sol lembut nyaman dipakai.</p>\n<p>Packing Box Ori.</p>', 'READY STOCK', 1501640773346, 1501640773346, 0, 0),
(205, 'ok', 0, 156, '15', 'IMG-20170727-WA0063.jpg', 250000, 0, 1, 5, 0, '<p>Fast response WA 081291673067</p>\r\n<p>Puma Rihanna kids.</p>\r\n<p>Ready size 31 - 36.</p>\r\n<p>Made in Vietnam.</p>\r\n<p>Super Premium grade.</p>\r\n<p>Mirror 1:1.</p>\r\n<p>Kwalitas import terjamin boleh di uji.</p>\r\n<p>Sol lembut nyaman dipakai.</p>\r\n<p>Packing Box Ori.</p>', 'READY STOCK', 1501640773346, 1501640773346, 0, 0),
(231, 'Fresh Fruits Juice', 0, 5, '11', 'juiceall_7x51_be9mdz3jbmum.png', 20000, 0, 1, 1000, 0, '<p>Tersedia Aneka Jus Buah Segar Asli bukan sirup atau perasa : buah sirsak, kiwi, naga, dll</p>', 'READY STOCK', 1500339616439, 1500339616439, 0, 0),
(232, 'Aneka Buah Potong', 0, 5, '11', 'buah-potong_35zmo1lrpzs4w.jpg', 25000, 0, 1, 1000, 0, '<p>Tersedia semua aneka buah potong segar langsung di potong berdasarkan request</p>\n<p>&nbsp;</p>', 'READY STOCK', 1500352824544, 1500352824544, 0, 0),
(233, 'Rujak Buah', 0, 5, '11', 'rujak-buah.jpg', 20000, 0, 1, 1000, 0, '<p>Tersedia rujak buah segar</p>', 'READY STOCK', 1500352260191, 1500352260191, 0, 0),
(234, 'Mangga Harum Manis Potong', 0, 5, '11', 'Aneka_Buah_Potong_Mangga1.jpg', 30000, 0, 1, 1000, 0, '<p>Tersedia Buah Potong Mangga Harum Manis</p>', 'READY STOCK', 1500352824544, 1500352824544, 0, 0),
(235, 'Buah Potong Mix', 0, 5, '11', 'Buah_Potong_..jpg', 25000, 0, 1, 1000, 0, '<p>Tersedia buah potong mix</p>', 'READY STOCK', 1500353248058, 1500353248058, 0, 0),
(236, 'Salad Buah', 0, 5, '11', 'Salad_Buah_1.jpg', 20000, 0, 1, 100, 0, '<p>Tersedia Salad Buah Lengkap</p>', 'READY STOCK', 1500353248058, 1500353248058, 0, 0),
(237, 'Rujak Buah - KiselDrink-JuiceFriend', 0, 5, '13', 'rujakbuah.png', 20000, 0, 1, 1000, 0, '<p>Tersedia Rujak Buah di KiselDrink-Juice Friend Lt.11</p>', 'READY STOCK', 1500353248058, 1500353248058, 0, 0),
(238, 'Aneka Salad Sayur', 0, 5, '11', 'salad-sayur.jpg', 20000, 0, 1, 100, 0, '<p>Tersedia Salad Sayur Segar</p>', 'READY STOCK', 1500353248058, 1500353248058, 0, 0),
(239, 'Roti - BreadFriend', 0, 5, '13', 'Aneka_Roti_BF.png', 7000, 0, 1, 100, 0, '<p>Tersedia Roti mulai dari harga 7k - 10k dengan berbagai macam rasa, coklat, keju, dll</p>', 'READY STOCK', 1500363968584, 1500363968584, 0, 0),
(240, 'Thai Tea', 0, 5, '11', 'THAI_TEA.png', 15000, 0, 1, 100, 0, '<p>Tersedia aneka minuman Thai Tea, Green Tea dengan aroma khas teh asli thailand yg enak dan nikmat disajikan dingin</p>\n<p>Kemasan sedang Rp 15k</p>\n<p>Kemasan besar Rp 20k</p>', 'READY STOCK', 1500428035900, 1500428035900, 0, 0),
(241, 'Teh Tarik', 0, 5, '11', 'teh-tarik.jpg', 15000, 0, 1, 1000, 0, '<p>Tersedia Minuman Hangat/Dingin Teh Tarik khas JuiceFriend di Lt.11 Booth KiselDrink</p>', 'READY STOCK', 1500364505468, 1500364505468, 0, 0),
(242, 'Avocado Latte', 0, 5, '11', 'avocado-latte.jpg', 25000, 0, 1, 1000, 0, '<p>Rasa Avocado dikombinasi susu dan rasa original menjadi nikmat disajikan dingin</p>', 'READY STOCK', 1500365268102, 1500365268102, 0, 0),
(243, 'Green Tea', 0, 5, '11', 'Green_Tea.png', 15000, 0, 1, 100, 0, '<p>Rasa Green Tea yg nikmat asli teh thailand</p>', 'READY STOCK', 1500365268102, 1500365268102, 0, 0),
(244, 'es Thai Tea', 0, 5, '11', 'es-thai-tea.jpg', 15000, 0, 1, 100, 0, '<p>nikmat teh asli thailand harga kaki lima rasa bintang lima</p>', 'READY STOCK', 1500365268102, 1500365268102, 0, 0),
(245, 'Manggo Latte', 0, 5, '11', 'manggo-latte.jpg', 25000, 0, 1, 100, 0, '<p>Manggo Latte dengan rasa mangga asli dan susu khas latte menjadikannya nikmat dan segar</p>', 'READY STOCK', 1500366508716, 1500366508716, 0, 0),
(246, 'es mukidi - lemon sereh madu', 0, 5, '22', 'es-mukidi.jpg', 20000, 0, 1, 100, 0, '<p>perpaduan lemon sereh dan madu sebagai minuman imun tubuh dan antioksidan alami</p>', 'READY STOCK', 1500366508716, 1500366508716, 0, 0),
(247, 'es vanilla shake', 0, 5, '11', 'Es_Vanilla_Shake.jpg', 20000, 0, 1, 100, 0, '<p>Vanilla Asli dengna olahan susu menjadi minuman segar shake</p>', 'READY STOCK', 1500369474363, 1500369474363, 0, 0),
(248, 'es cokolate dinosaurus', 0, 5, '11', 'IMG20170206081922.jpg', 20000, 0, 1, 100, 0, '', 'READY STOCK', 1500369474363, 1500369474363, 0, 0),
(249, 'infused water', 0, 5, '11', 'infused_water.png', 20000, 0, 1, 100, 0, '<p>minuman ringan dengan khasiat yg luar biasa dgn buah asli</p>', 'READY STOCK', 1500371064237, 1500371064237, 0, 0),
(250, 'infused water lemon', 0, 5, '11', 'infusedwater.png', 20000, 0, 1, 1000, 0, '<p>infused water lemon asli</p>', 'READY STOCK', 1500369474363, 1500369474363, 0, 0),
(251, 'infused water original', 0, 5, '11', 'apple_lemon_mint.png', 20000, 0, 1, 100, 0, '', 'READY STOCK', 1500370414348, 1500370414348, 0, 0),
(252, 'infused water jahe lemon', 0, 5, '22', 'Infused_water_jahe_lemon.png', 20000, 0, 1, 1000, 0, '', 'READY STOCK', 1500369474363, 1500369474363, 0, 0),
(253, 'infused water lemon nenas', 0, 5, '11', 'pineapples_lemon_mint.png', 20000, 0, 1, 100, 0, '', 'READY STOCK', 1500370414348, 1500370414348, 0, 0),
(254, 'infused water strawbeery lemon mint', 0, 5, '11', 'strawberry__lemon_mint.png', 20000, 0, 1, 100, 0, '', 'READY STOCK', 1500370414348, 1500370414348, 0, 0),
(255, 'infused water strawberry cucumber lime', 0, 5, '11', 'strawberry_cucumber_lime.png', 20000, 0, 1, 100, 0, '', 'READY STOCK', 1500371064237, 1500371064237, 0, 0),
(258, 'DIJUAL Honda CRV 2013', 2, 5, '19', '20170910_172630.jpg', 260000000, 1000, 1, 1, 0, 'Bismillah.. \n\nAssalamualaikum, Dijual cepat mobil Honda CRV 2000cc tahun 2013\n\n- Atas nama pemakai pertama \n- Interior bersih dan tidak bau rokok \n- Surat - surat lengkap \n- Akselerasi sangat enteng \n- Bantingan stir sangat ringan  \n- KM masih rendah 38rb-an\n\nFitur tambahan: \n- Head unit LCD touchscreen + GPS + TV \n- Kamera depan dan belakang\n- Ban depan baru\n- Karet weaper baru\n- Lampu rem tambahan bagian bawah\n- Spion otomatis melipat ketika mengunci\n- Twitter sound tambahan\n- Knalpot tampak racing\n- Kaca film master piece\n\nPosisi :\nSenin s.d Jumat di jl. Gatot subroto Kuningan Jaksel\nWeekend di Rawa lumbu Bekasi\n\nHarga nego tipis \nKeterangan lebih lanjut : 08118705533\nTrima kasih :) \n\nWassalamualaikum.', 'READY STOCK', 1506420701020, 1506420701020, 0, 0),
(259, 'DIJUAL Honda CRV 2013', 2, 5, '19', '20170910_172630.jpg', 260000000, 1000, 1, 1, 0, 'Bismillah.. \n\nAssalamualaikum, Dijual cepat mobil Honda CRV 2000cc tahun 2013\n\n- Atas nama pemakai pertama \n- Interior bersih dan tidak bau rokok \n- Surat - surat lengkap \n- Akselerasi sangat enteng \n- Bantingan stir sangat ringan  \n- KM masih rendah 38rb-an\n\nFitur tambahan: \n- Head unit LCD touchscreen + GPS + TV \n- Kamera depan dan belakang\n- Ban depan baru\n- Karet weaper baru\n- Lampu rem tambahan bagian bawah\n- Spion otomatis melipat ketika mengunci\n- Twitter sound tambahan\n- Knalpot tampak racing\n- Kaca film master piece\n\nPosisi :\nSenin s.d Jumat di jl. Gatot subroto Kuningan Jaksel\nWeekend di Rawa lumbu Bekasi\n\nHarga nego tipis \nKeterangan lebih lanjut : 08118705533\nTrima kasih :) \n\nWassalamualaikum.', 'READY STOCK', 1506420731401, 1506420731401, 0, 0),
(261, 'Sepatu Running Nike', 0, 212, '14,15', 'Screenshot_20170921-094145.png', 899000, 1000, 1, 5, 0, 'Ukuran yang tersedia : 42,43,44,45\nWarna : Blue, Red, Black', 'READY STOCK', 1506573730847, 1506573730847, 0, 0),
(262, 'Dijual Nissan All New Grand Livina SV Matic 2014', 2, 5, '19', 'IMG-20170929-WA0013.jpg', 132000000, 1000, 1, 1, 0, '1. All New Grand Livina Facelift SV CVT (Matic) Grey Color\n(Original) Kondisi Like New Mulusss kabin Bersih\n\n2. Surat super lengkap BPKB, STNK, Faktur, Milik nama\nsendiri pemakaian sendiri dari baru,\n\n3. (STNK Oktober 2014)\n\n4. Kondisi Gress Like New, dan dijamin Full original, selalu\nService di Bengkel resmi Nissan,buku manual,\nbook record Service lengkap, \n5.  KM 39.xxx on going, pemakaian Normal\n\n6. Bonus Head Unit Double Din 7 Inch skeleton support Bluetooth, Subwoofer, Speaker Pioneer\nsensor parkir, dan camera\n\n7. Spion Electric, Dual Airbag, TV in-roof, kaca film Heat Protection depan + solar guard SKKB.\n\n8. tidak pernah kena banjir dan tidak pernah\nbekas tabrak dijamin, Ban Nitrogen.\n\n9. Asuransi masih aktif ACA Allrisk..terjamin aman.\n\n10. Mesin halus, irit, dan responsif\n11.stnk baru diperpanjang ( 3,3 juta)\n12.baru saja service rutin KM 40.000\n\nInformasi lebih lanjut : 0811-864-683', 'READY STOCK', 1506733019882, 1506733019882, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_category`
--

CREATE TABLE `product_category` (
  `product_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product_category`
--

INSERT INTO `product_category` (`product_id`, `category_id`) VALUES
(1, 11),
(2, 11),
(3, 11),
(4, 11),
(5, 11),
(6, 11),
(7, 11),
(8, 11),
(9, 12),
(10, 12),
(10, 13),
(11, 12),
(12, 12),
(13, 12),
(14, 12),
(15, 12),
(16, 12),
(17, 12),
(18, 12),
(19, 12),
(20, 12),
(21, 13),
(22, 15),
(23, 15),
(24, 15),
(25, 14),
(26, 16),
(27, 16),
(28, 18),
(29, 17),
(30, 17),
(47, 11),
(49, 12),
(51, 11),
(52, 11),
(53, 17),
(54, 15),
(56, 17),
(58, 13),
(59, 15),
(60, 15),
(73, 17),
(75, 17),
(76, 19),
(77, 19),
(78, 19),
(79, 12),
(80, 14),
(81, 15),
(82, 15),
(83, 15),
(84, 15),
(85, 15),
(86, 15),
(87, 15),
(88, 15),
(89, 13),
(90, 20),
(91, 15),
(92, 13),
(93, 12),
(94, 21),
(95, 21),
(96, 14),
(97, 21),
(100, 13),
(101, 13),
(102, 13),
(103, 13),
(105, 13),
(106, 13),
(107, 14),
(108, 13),
(108, 14),
(109, 19),
(110, 15),
(111, 12),
(112, 15),
(113, 13),
(114, 13),
(115, 13),
(116, 13),
(117, 13),
(118, 13),
(120, 13),
(121, 13),
(122, 13),
(123, 13),
(124, 13),
(125, 13),
(126, 12),
(127, 15),
(128, 15),
(129, 15),
(130, 15),
(131, 15),
(132, 15),
(133, 13),
(134, 13),
(135, 22),
(136, 22),
(137, 15),
(138, 22),
(139, 22),
(140, 22),
(141, 22),
(142, 15),
(143, 20),
(144, 20),
(145, 13),
(146, 12),
(147, 19),
(148, 14),
(149, 13),
(150, 20),
(152, 13),
(153, 11),
(154, 11),
(155, 11),
(156, 11),
(157, 11),
(158, 13),
(159, 11),
(160, 13),
(161, 11),
(162, 11),
(163, 11),
(164, 11),
(165, 11),
(166, 11),
(168, 11),
(169, 11),
(170, 11),
(171, 11),
(172, 11),
(174, 11),
(175, 11),
(176, 11),
(177, 11),
(178, 11),
(179, 11),
(180, 11),
(181, 11),
(182, 11),
(183, 11),
(184, 22),
(185, 12),
(185, 22),
(186, 12),
(186, 22),
(187, 12),
(187, 22),
(188, 21),
(188, 22),
(189, 12),
(189, 22),
(190, 12),
(190, 22),
(191, 12),
(191, 22),
(192, 12),
(192, 22),
(193, 19),
(194, 21),
(195, 12),
(196, 15),
(197, 13),
(198, 15),
(199, 15),
(200, 15),
(201, 15),
(202, 15),
(203, 15);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_image`
--

CREATE TABLE `product_image` (
  `product_id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product_image`
--

INSERT INTO `product_image` (`product_id`, `name`) VALUES
(3, 'Nasi Ayam Komplit (MTT)_01495330493177.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_order`
--

CREATE TABLE `product_order` (
  `id` bigint(20) NOT NULL,
  `code` varchar(20) NOT NULL,
  `buyer` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(300) NOT NULL,
  `email` varchar(50) NOT NULL,
  `shipping` varchar(20) NOT NULL,
  `date_ship` bigint(20) NOT NULL,
  `time_ship` varchar(5) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `comment` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `total_fees` decimal(12,2) NOT NULL,
  `tax` decimal(12,2) NOT NULL,
  `fee_delivery` double NOT NULL,
  `fee_infaq` double NOT NULL,
  `trxid` varchar(32) NOT NULL DEFAULT '',
  `ref_num` varchar(25) NOT NULL DEFAULT '',
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product_order`
--

INSERT INTO `product_order` (`id`, `code`, `buyer`, `user_id`, `address`, `email`, `shipping`, `date_ship`, `time_ship`, `phone`, `comment`, `status`, `total_fees`, `tax`, `fee_delivery`, `fee_infaq`, `trxid`, `ref_num`, `created_at`, `last_update`, `date_time`) VALUES
(1, 'LO76366JW', 'Qomar', 0, 'Lantai 11', 'qomarullah.mail@gmail.com', 'COD (Cash On Deliver', 1495299802585, '', '08118003585', 'test', 'WAITING', '26000.00', '0.00', 0, 0, '', '', 1495299808368, 1495299808368, '0000-00-00 00:00:00'),
(2, 'JX45983AP', 'Qomar', 0, 'Lantai 11', 'qomarullah.mail@gmail.com', 'COD (Cash On Deliver', 1495336022805, '', '08118003585', 'test', 'WAITING', '128000.00', '0.00', 0, 0, '', '', 1495336030207, 1495336030207, '0000-00-00 00:00:00'),
(3, 'IG23519VG', 'Qomar', 0, 'Lantai 11', 'qomarullah.mail@gmail.com', 'Ambil di Sekre MTT l', 1495338610695, '', '08118003585', 'cek', 'WAITING', '26080000.00', '0.00', 0, 0, '', '', 1495338620373, 1495338620373, '0000-00-00 00:00:00'),
(4, 'JS84974GQ', 'Fitri', 0, 'kirim lt 16', 'test@gmail.com', 'TOD (T-Cash On Deliv', 1495340279951, '', '0811111111', 'test note', 'WAITING', '625437000.00', '0.00', 0, 0, '', '', 1495340289400, 1495340289400, '0000-00-00 00:00:00'),
(5, 'QD70575MP', 'Fitri', 0, 'kirim lt 16', 'test@gmail.com', 'COD (Cash On Deliver', 1495340486070, '', '0811111111', 'kasih rawit', 'WAITING', '10000.00', '0.00', 0, 0, '', '', 1495340502454, 1495340502454, '0000-00-00 00:00:00'),
(6, 'DZ18160ON', 'Fitri', 0, 'kirim lt 16', 'test@gmail.com', 'TOD (T-Cash On Deliv', 1495340981217, '', '0811111111', 'test', 'WAITING', '1000.00', '0.00', 0, 0, '', '', 1495340988873, 1495340988873, '0000-00-00 00:00:00'),
(7, 'MY58617DE', 'y', 0, 'g', 'mttpreneurship@gmail.com', 'TOD (T-Cash On Deliv', 1495521267448, '', '081285688212', 'snsndnd', 'WAITING', '44000.00', '0.00', 0, 0, '', '', 1495348477699, 1495348477699, '0000-00-00 00:00:00'),
(8, 'CJ41423TV', 'y', 0, 'g', 'mttpreneurship@gmail.com', 'TOD (T-Cash On Deliv', 1495521337051, '', '081285688212', 'bjj', 'WAITING', '44000.00', '0.00', 0, 0, '', '', 1495348544981, 1495348544981, '0000-00-00 00:00:00'),
(12, 'AT80640MG', 'y', 0, 'g', 'mttpreneurship@gmail.com', 'TOD (T-Cash On Deliv', 1495437091068, '', '081285688212', 'tt', 'WAITING', '15000.00', '0.00', 0, 0, '', '', 1495350695348, 1495350695348, '0000-00-00 00:00:00'),
(13, 'AV21873AE', 'qomar', 0, 'Lantai 16 TSO, breakout', 'qomarullah.mail@gmail.com', 'TOD (T-Cash On Deliv', 1495411914450, '', '08118003585', 'minta kirim siangan jam 13.00', 'WAITING', '35000.00', '0.00', 0, 0, '', '', 1495411934386, 1495411934386, '0000-00-00 00:00:00'),
(14, 'LZ07569TU', 'kardi', 0, 'tso lt.16', 'kardi@telkomsel.co.id', 'COD (Cash On Deliver', 1495418380612, '', '0811100677', 'jam 10:00 ya...', 'WAITING', '15000.00', '0.00', 0, 0, '', '', 1495418412221, 1495418412221, '0000-00-00 00:00:00'),
(15, 'QD33851LC', 'Yuwono Eko', 0, 'TSO lantai 16', 'yuwono_eko@telkomsel.co.id', 'COD (Cash On Deliver', 1495424324292, '', '0811310021', 'jam 11:00', 'PROCESSED', '25000.00', '0.00', 0, 0, '', '', 1495424352950, 1495424352950, '0000-00-00 00:00:00'),
(16, 'NF60129NC', 'vanul', 0, 'tso lt.9', 'mttpreneurship@gmail.com', 'TOD (T-Cash On Deliv', 1495554057001, '', '081285688212', 'tes', 'WAITING', '150000.00', '0.00', 0, 0, '', '', 1495467669556, 1495467669556, '0000-00-00 00:00:00'),
(17, 'XM46774FK', 'Novi Faldian', 0, 'lantai 8', 'faldian2002@gmail.com', 'COD (Cash On Deliver', 1495578420560, '', '0811830500', 'jam 10 pagi', 'WAITING', '10000.00', '0.00', 0, 0, '', '', 1495492045373, 1495492045373, '0000-00-00 00:00:00'),
(18, 'JO87907DT', 'furqon ahkamy', 0, 'TSO Lt. 12', 'furqon.ahkamy@gmail.com', 'COD (Cash On Deliver', 1495578922484, '', '0811646446', 'Mohon info stock rasa yg ready, syukron', 'PROCESSED', '15000.00', '0.00', 0, 0, '', '', 1495492562129, 1495492562129, '0000-00-00 00:00:00'),
(19, 'GO90946AJ', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'TOD (T-Cash On Deliv', 1495496623808, '', '08118003585', 'lagi test, mohon ignore', 'WAITING', '15000.00', '0.00', 0, 0, '', '', 1495496642360, 1495496642360, '0000-00-00 00:00:00'),
(20, 'NY58332MP', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'TOD (T-Cash On Deliv', 1495496623808, '', '08118003585', 'lagi test, mohon ignore', 'WAITING', '15000.00', '0.00', 0, 0, '', '', 1495496653121, 1495496653121, '0000-00-00 00:00:00'),
(21, 'NR93340CH', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'TOD (T-Cash On Deliv', 1495496623808, '', '08118003585', 'lagi test, mohon ignore', 'WAITING', '15000.00', '0.00', 0, 0, '', '', 1495496804028, 1495496804028, '0000-00-00 00:00:00'),
(22, 'FZ71137MD', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'TOD (T-Cash On Deliv', 1495499941837, '', '08118003585', 'testing', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1495499950733, 1495499950733, '0000-00-00 00:00:00'),
(23, 'NJ79465CW', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'TOD (T-Cash On Deliv', 1495501020416, '', '08118003585', 'test 2 kali telegram', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1495501044204, 1495501044204, '0000-00-00 00:00:00'),
(24, 'WH65998UN', 'kardi', 0, 'tso lt.16', 'kardi@telkomsel.co.id', 'TOD (T-Cash On Deliv', 1495593015840, '', '0811100677', 'kirim ke ruang Maroko lt.16. Tolong dipotong-potong 6 mendoan & 6 bakwan', 'WAITING', '36000.00', '0.00', 0, 0, '', '', 1495593261763, 1495593261763, '0000-00-00 00:00:00'),
(25, 'HL43131VA', 'KY', 0, '23', 'yanto_santoso@telkomsel.co.id', 'TOD (T-Cash On Deliv', 1495599976183, '', '0811293333', 'jam 3 sore aja ya...', 'WAITING', '30000.00', '0.00', 0, 0, '', '', 1495600025762, 1495600025762, '0000-00-00 00:00:00'),
(26, 'AZ48548YI', 'jowvy', 0, 'lt.23', 'jowvy_kumala@telkomsel.co.id', 'TOD (T-Cash On Deliv', 1495600173104, '', '0811412344', 'jam 16.00 wib', 'PROCESSED', '65000.00', '0.00', 0, 0, '', '', 1495600207335, 1495600207335, '0000-00-00 00:00:00'),
(27, 'UJ69348JF', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'TOD (T-Cash On Deliv', 1495706200711, '', '08118003585', 'test', 'WAITING', '26000.00', '0.00', 0, 0, '', '', 1495706205404, 1495706205404, '0000-00-00 00:00:00'),
(28, 'PO26079ID', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'TOD (T-Cash On Deliv', 1495706200711, '', '08118003585', 'test', 'WAITING', '26000.00', '0.00', 0, 0, '', '', 1495706310816, 1495706310816, '0000-00-00 00:00:00'),
(29, 'HU80053JS', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'COD (Cash On Deliver', 1495706430264, '', '08118003585', 'test lagi', 'WAITING', '26000.00', '0.00', 0, 0, '', '', 1495706438353, 1495706438353, '0000-00-00 00:00:00'),
(30, 'KI85471HI', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'COD (Cash On Deliver', 1495706687774, '', '08118003585', 'test', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1495706693334, 1495706693334, '0000-00-00 00:00:00'),
(31, 'IO10105CZ', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'COD (Cash On Deliver', 1495707663266, '', '08118003585', 'test', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1495707670121, 1495707670121, '0000-00-00 00:00:00'),
(32, 'HK02011JP', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'COD (Cash On Deliver', 1495707663266, '', '08118003585', 'test', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1495707704793, 1495707704793, '0000-00-00 00:00:00'),
(33, 'XS70693EJ', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'COD (Cash On Deliver', 1495707748685, '', '08118003585', 'test', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1495707754927, 1495707754927, '0000-00-00 00:00:00'),
(34, 'LE10263EK', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'COD (Cash On Deliver', 1495707748685, '', '08118003585', 'test', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1495707760907, 1495707760907, '0000-00-00 00:00:00'),
(35, 'IQ40472YJ', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'COD (Cash On Deliver', 1495707748685, '', '08118003585', 'test', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1495707939077, 1495707939077, '0000-00-00 00:00:00'),
(36, 'YK93067MO', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'TOD (T-Cash On Deliv', 1495715911898, '', '08118003585', 'cuma test', 'WAITING', '35000.00', '0.00', 0, 0, '', '', 1495715924028, 1495715924028, '0000-00-00 00:00:00'),
(37, 'QK63922ZB', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'COD (Cash On Deliver', 1495753824154, '', '08118003585', 'test', 'WAITING', '17000.00', '0.00', 0, 0, '', '', 1495753829964, 1495753829964, '0000-00-00 00:00:00'),
(38, 'FJ83266MO', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'COD (Cash On Deliver', 1495753928110, '', '08118003585', 'test', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1495753933959, 1495753933959, '0000-00-00 00:00:00'),
(39, 'ER58186TH', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'COD (Cash On Deliver', 1495753928110, '', '08118003585', 'test', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1495754616476, 1495754616476, '0000-00-00 00:00:00'),
(40, 'RQ62155KL', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'COD (Cash On Deliver', 1495754774414, '', '08118003585', 'test', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1495754781735, 1495754781735, '0000-00-00 00:00:00'),
(41, 'PJ03384EU', 'vanul', 0, 'tso lt.9', 'mttpreneurship@gmail.com', 'Ambil di Sekre MTT l', 1496037814433, '', '081285688212', 'tes. bisa pilih tgl kirim', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1495865033812, 1495865033812, '0000-00-00 00:00:00'),
(42, 'MZ14528TG', 'qomar', 0, 'lt 16', 'qomarullah.mail@gmail.com', 'COD (Cash On Deliver', 1495945697464, '', '08118003585', 'testing', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1495945705268, 1495945705268, '0000-00-00 00:00:00'),
(43, 'MM21629AO', 'Agung Handoko', 0, 'TSO Lantai 12', 'agung_handoko@telkomsel.co.id', 'Tunai Saat Penerimaa', 1496221354935, '', '0811864686', 'sekarang', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1496221367783, 1496221367783, '2017-05-31 09:02:48'),
(44, 'MQ59439UL', 'qomar', 0, '16', 'qomarullah.mail@gmail.com', 'T-Cash Saat Penerima', 1496223695618, '', '08118003585', 'test', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1496223702570, 1496223702570, '2017-05-31 09:41:42'),
(45, 'XZ23293WV', 'qomar', 0, '16', 'qomarullah.mail@gmail.com', 'T-Cash Saat Penerima', 1496223790579, '', '08118003585', 'testing nyampe telegram', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1496223801096, 1496223801096, '2017-05-31 09:43:20'),
(46, 'VQ75396WC', 'qomar', 0, '16', 'qomarullah.mail@gmail.com', 'Tunai Saat Penerimaa', 1496223895540, '', '08118003585', 'test', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1496223905846, 1496223905846, '2017-05-31 09:45:05'),
(47, 'KB15316KC', 'qomar', 0, '16', 'qomarullah.mail@gmail.com', 'Tunai Saat Penerimaa', 1496245282217, '', '08118003585', 'test', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1496245292572, 1496245292572, '2017-05-31 15:41:32'),
(48, 'CM62286KT', 'qomar', 0, '16', 'qomarullah.mail@gmail.com', 'Tunai Saat Penerimaa', 1496245282217, '', '08118003585', 'test', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1496245309555, 1496245309555, '2017-05-31 15:41:49'),
(49, 'PI23496ZR', 'qomar', 0, '16', 'qomarullah.mail@gmail.com', 'Tunai Saat Penerimaa', 1496245380086, '', '08118003585', 'test', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1496245386157, 1496245386157, '2017-05-31 15:43:06'),
(50, 'DN31857GO', 'Hari Suryono', 0, 'TSO LT 12', 'hari_suryono@telkomsel.co.id', 'T-Cash Saat Penerima', 1497334654356, '', '0811159429', 'ini ada tempat laptopnya gak ya? ada pilihan warnanya?', 'WAITING', '340000.00', '0.00', 0, 0, '', '', 1497334703128, 1497334703128, '2017-06-13 06:18:23'),
(51, 'FV61822MP', 'qomar', 0, '16', 'qomarullah.mail@gmail.com', 'Transfer T-Cash 0812', 1497344987059, '', '08118003585', 'test', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1497344999481, 1497344999481, '2017-06-13 09:09:57'),
(52, 'JB71015XK', 'SURYA ARGANDI', 0, 'TSO LANTAI 8 DIVISI NAM', 'surya.argandi8490@gmail.com', 'Transfer T-Cash 0812', 1497592930331, '', '082138175884', '', 'WAITING', '38000.00', '0.00', 0, 0, '', '', 1497593012457, 1497593012457, '2017-06-16 06:03:31'),
(53, 'WF18853VP', 'testing', 0, '16', 'qomar@testing.com', 'Transfer T-Cash 0812', 1498701624418, '', '08118003585', 'testing', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1498701701634, 1498701701634, '2017-06-29 02:01:41'),
(54, 'YD33783VY', 'kardi', 0, 'lt.16', 'kardi@telkomsel.co.id', 'Transfer T-Cash 0812', 1499408291824, '', '0811100677', 'jam 16:00\nmaaf, ini test aja\nmohon diabaikan', 'WAITING', '15000.00', '0.00', 0, 0, '', '', 1499408322935, 1499408322935, '2017-07-07 06:18:40'),
(55, 'PY48779GM', 'kardi', 0, 'lt.16 tso', 'kardi@telkomsel.co.id', 'T-Cash Saat Penerima', 1499870946584, '', '0811100677', 'jam 09:30\n4 bakwan Dan 4 mendoan dipotong-potong dgn bumbu pecel', 'WAITING', '120000.00', '0.00', 0, 0, '', '', 1499784594065, 1499784594065, '2017-07-11 14:49:53'),
(56, 'QM99166GD', 'kardi', 0, 'lt.16 tso', 'kardi@telkomsel.co.id', 'T-Cash Saat Penerima', 1499871155975, '', '0811100677', 'jam 09:30\n4 bakwan Dan 4 mendoan dipotong-potong dgn bumbu pecel', 'WAITING', '24000.00', '0.00', 0, 0, '', '', 1499784774461, 1499784774461, '2017-07-11 14:52:54'),
(57, 'GA10710VE', 'rochman saefulloh basyari', 0, 'lantai 16 TSO dekat meja pa kardi', 'rochman_s_basyari@telkomsel.co.id', 'Transfer T-Cash 0812', 1499828187506, '', '08119510106', 'jam set11 atau jam 3', 'WAITING', '160000.00', '0.00', 0, 0, '', '', 1499828228228, 1499828228228, '2017-07-12 02:57:07'),
(58, 'OO64155YH', 'Fredy Hermawan', 0, 'Lantai 8 TSO', 'fredy_hermawan@telkomsel.co.id', 'T-Cash Saat Penerima', 1499840236145, '', '0811987802', '', 'WAITING', '105000.00', '0.00', 0, 0, '', '', 1499840253182, 1499840253182, '2017-07-12 06:17:32'),
(59, 'WN63507VE', 'Fredy Hermawan', 0, 'Lantai 8 TSO', 'fredy_hermawan@telkomsel.co.id', 'T-Cash Saat Penerima', 1499840307921, '', '0811987802', '', 'WAITING', '105000.00', '0.00', 0, 0, '', '', 1499840317052, 1499840317052, '2017-07-12 06:18:37'),
(60, 'OK83227QO', 'Fredy Hermawan', 0, 'Lantai 8 TSO', 'fredy_hermawan@telkomsel.co.id', 'T-Cash Saat Penerima', 1499840426363, '', '0811987802', '', 'WAITING', '105000.00', '0.00', 0, 0, '', '', 1499840437555, 1499840437555, '2017-07-12 06:20:36'),
(61, 'AZ15221LV', 'Swanto', 0, 'Harco mangga dua elektronic lt.d.blk.b no.134f-j jakarta pusat ', 'Swanto9611@gmail.com', 'Tunai Saat Penerimaa', 1499888097881, '', '081287232309', 'sebelum jam 12 siang pesanan sudah sampai \nkirim melalui gojek', 'WAITING', '38000.00', '0.00', 0, 0, '', '', 1499888215309, 1499888215309, '2017-07-12 19:36:53'),
(62, 'PX25695LD', 'Rendyka', 0, 'TSO lt.22 (procurement)', 'rendyka_anasis@telkomsel.co.id', 'T-Cash Saat Penerima', 1500273795678, '', '08111987776', '14:00 (2 siang)', 'WAITING', '20000.00', '0.00', 0, 0, '', '', 1500273851792, 1500273851792, '2017-07-17 06:44:13'),
(63, 'HU43790XC', 'damar darbito', 0, 'Lt 16', 'damaraaaa@gmail.com', 'Transfer T-Cash 0812', 1500354058283, '', '08111194484', 'Jam 13.30', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1500354077039, 1500354077039, '2017-07-18 05:01:16'),
(64, 'KQ72460HU', 'damar darbito', 0, 'Lt 16', 'damaraaaa@gmail.com', 'Transfer T-Cash 0812', 1500354058283, '', '08111194484', 'Jam 13.30', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1500354091575, 1500354091575, '2017-07-18 05:01:31'),
(65, 'MM24477KK', 'damar darbito', 0, 'Lt 16', 'damaraaaa@gmail.com', 'Transfer T-Cash 0812', 1500354058283, '', '08111194484', 'Jam 13.30', 'WAITING', '16000.00', '0.00', 0, 0, '', '', 1500354105443, 1500354105443, '2017-07-18 05:01:46'),
(66, 'RF76401AZ', 'damar darbito', 0, 'Lt 16', 'damaraaaa@gmail.com', 'Transfer T-Cash 0812', 1500443253876, '', '08111194484', 'Kirim jam 13.30 juice gk pake susu dan gula, original', 'WAITING', '20000.00', '0.00', 0, 0, '', '', 1500443297051, 1500443297051, '2017-07-19 05:48:47'),
(67, 'UA05793BD', 'damar darbito', 0, 'Lt 16', 'damaraaaa@gmail.com', 'Transfer T-Cash 0812', 1500443253876, '', '08111194484', 'Kirim jam 13.30 juice gk pake susu dan gula, original', 'WAITING', '20000.00', '0.00', 0, 0, '', '', 1500443318620, 1500443318620, '2017-07-19 05:48:59'),
(68, 'XX14675DN', 'Mulyana kombes csr', 0, '23 csr pak kombes', 'nana_mulyana@telkomsel.co.id', 'T-Cash Saat Penerima', 1500444783182, '', '0811101696', 'jam 16:00\nrasa jeruk dingin', 'WAITING', '40000.00', '0.00', 0, 0, '', '', 1500444899059, 1500444899059, '2017-07-19 06:15:03'),
(69, 'GV88300XO', 'iman', 0, 'Tso lt 19', 'imanurachman@gmail.com', 'Tunai Saat Penerimaa', 1500620546434, '', '08119705031', 'Telornya diganti jadi mie saja. Jadi indomienya dobel. Jam 2.15 dianter ya. Makasih.', 'WAITING', '15000.00', '0.00', 0, 0, '', '', 1500620937743, 1500620937743, '2017-07-21 07:08:58'),
(70, 'IS75406YY', 'iman', 0, 'Tso lt 19', 'imanurachman@gmail.com', 'Tunai Saat Penerimaa', 1500620546434, '', '08119705031', 'Telornya diganti jadi mie saja. Jadi indomienya dobel. Jam 2.15 dianter ya. Makasih.', 'WAITING', '15000.00', '0.00', 0, 0, '', '', 1500621109533, 1500621109533, '2017-07-21 07:12:00'),
(71, 'TC06577QX', 'Arif Alhadi Putra', 0, 'TSO Lantai 19', 'arif_a_putra@telkomsel.co.id', 'T-Cash Saat Penerima', 1500949783187, '', '08111700997', 'segera sebelum jam 10', 'WAITING', '20000.00', '0.00', 0, 0, '', '', 1500949799003, 1500949799003, '2017-07-25 02:29:56'),
(72, 'KJ03970HO', 'Rendyka', 0, 'TSO lt.22 (procurement)', 'rendyka_anasis@telkomsel.co.id', 'Transfer T-Cash 0812', 1500965764190, '', '08111987776', '14:00', 'WAITING', '20000.00', '0.00', 0, 0, '', '', 1500965796251, 1500965796251, '2017-07-25 06:56:35'),
(73, 'RK58126BK', 'Dina Purnama Sari', 0, 'TSO Lantai 19', 'dina_p_sari1@telkomsel.co.id', 'Transfer T-Cash 0812', 1501484919832, '', '08119988484', 'sekarang juga ya mas trims..', 'WAITING', '25000.00', '0.00', 0, 0, '', '', 1501484968144, 1501484968144, '2017-07-31 07:09:24'),
(74, 'YJ50733NV', 'Dina Purnama Sari', 0, 'TSO Lantai 19', 'dina_p_sari1@telkomsel.co.id', 'Transfer T-Cash 0812', 1501484919832, '', '08119988484', 'sekarang juga ya mas trims..', 'WAITING', '25000.00', '0.00', 0, 0, '', '', 1501484983853, 1501484983853, '2017-07-31 07:09:40'),
(75, 'KP80243QT', 'Dina Purnama Sari', 0, 'TSO Lantai 19', 'dina_p_sari1@telkomsel.co.id', 'Transfer T-Cash 0812', 1501484919832, '', '08119988484', 'sekarang juga ya mas trims..', 'WAITING', '25000.00', '0.00', 0, 0, '', '', 1501485002822, 1501485002822, '2017-07-31 07:09:59'),
(76, 'ZY35934VH', 'Dina Purnama Sari', 0, 'TSO Lantai 19', 'dina_p_sari1@telkomsel.co.id', 'Transfer T-Cash 0812', 1501484919832, '', '08119988484', 'sekarang juga ya mas trims..', 'WAITING', '25000.00', '0.00', 0, 0, '', '', 1501485007009, 1501485007009, '2017-07-31 07:10:04'),
(77, 'BQ31592OO', 'dyka', 0, '9', 'andyka23@gmail.com', 'Transfer T-Cash 0812', 1501487592990, '', '08111193932', 'jam 16.00', 'WAITING', '40000.00', '0.00', 0, 0, '', '', 1501487611803, 1501487611803, '2017-07-31 07:53:32'),
(78, 'RD86338IE', 'dyka', 0, '9', 'andyka23@gmail.com', 'Transfer T-Cash 0812', 1501488537343, '', '08111193932', 'tempe mendoan aj yah', 'WAITING', '9000.00', '0.00', 0, 0, '', '', 1501488551289, 1501488551289, '2017-07-31 08:09:11'),
(79, 'PL64557BF', 'dyka', 0, '9', 'andyka23@gmail.com', 'T-Cash Saat Penerima', 1501561064646, '', '08111193932', 'skrg yahhh', 'WAITING', '20000.00', '0.00', 0, 0, '', '', 1501561074160, 1501561074160, '2017-08-01 04:17:53'),
(80, 'HF90246RJ', 'Ardiansyah Pratomo Saputra ', 0, 'Lantai 9', 'ardiansyah.pratomo@gmail.com', 'T-Cash Saat Penerima', 1501656355305, '', '082115561531', '14.00', 'WAITING', '10000.00', '0.00', 0, 0, '', '', 1501656385073, 1501656385073, '2017-08-02 06:46:22'),
(81, 'FO13086WT', 'dyka', 0, '9', 'andyka23@gmail.com', 'T-Cash Saat Penerima', 1501656734930, '', '08111193932', '', 'WAITING', '31000.00', '0.00', 0, 0, '', '', 1501656746498, 1501656746498, '2017-08-02 06:52:24'),
(82, 'SO90580EW', 'dyka', 0, '9', 'andyka23@gmail.com', 'T-Cash Saat Penerima', 1501749035427, '', '08111193932', '', 'WAITING', '36000.00', '0.00', 0, 0, '', '', 1501749041678, 1501749041678, '2017-08-03 08:30:39'),
(83, 'WU91565KT', 'Arif Alhadi Putra', 0, 'TSO Lantai 19', 'arif_a_putra@telkomsel.co.id', 'Transfer T-Cash 0812', 1501818692768, '', '08111700997', 'sebelum jumatan udah bisa dimakan', 'WAITING', '20000.00', '0.00', 0, 0, '', '', 1501818713973, 1501818713973, '2017-08-04 03:51:45'),
(84, 'RO25857GO', 'nurul', 160, 'testing abaikan', 'nurulfitri.mail@gmail.com', 'T-Cash', 1504745694210, '7:54', '6285322881993', 'testing admin abaikan', 'Menunggu Pembayaran', '44000.00', '0.00', 0, 2000, '', '', 1504745728309, 1504745728309, '2017-09-07 00:55:30'),
(85, 'DC21597OY', 'nurul', 160, 'test', 'nurulfitri.mail@gmail.com', 'T-Cash', 1504746783108, '8:13', '8118003585', 'testing', 'Menunggu Pembayaran', '19000.00', '0.00', 0, 0, '', '', 1504746795288, 1504746795288, '2017-09-07 01:13:18'),
(86, 'UD51226QT', 'fredy', 161, 'Lt 8 TSO', 'fredy_hermawan@telkomsel.co.id', 'T-Cash', 1504763105279, '16:0', '811987802', '', 'Order Dibatalkan', '105000.00', '0.00', 0, 0, '', '', 1504763169929, 1504763169929, '2017-09-07 05:46:10'),
(87, 'VG87084IO', 'fredy', 161, 'TSO LT 8', 'fredy_hermawan@telkomsel.co.id', 'T-Cash', 1504876702912, '10:0', '811987802', '', 'Menunggu Pembayaran', '105000.00', '0.00', 0, 0, '', '', 1504790327125, 1504790327125, '2017-09-07 13:18:50'),
(88, 'ZQ20496LK', 'fredy', 161, 'TSO LT 8', 'fredy_hermawan@telkomsel.co.id', 'T-Cash', 1504877063440, '10:0', '811987802', '', 'Menunggu Pembayaran', '105000.00', '0.00', 0, 0, '', '', 1504790677769, 1504790677769, '2017-09-07 13:24:41'),
(89, 'WT48701LN', 'ikarahma', 177, 'TSO Lantai 16', 'ika_rahmawati@telkomsel.co.id', 'T-Cash', 1505183630790, '9:33', '8111006456', '', 'Menunggu Pembayaran', '17000.00', '0.00', 0, 0, '', '', 1505183648811, 1505183648811, '2017-09-12 02:34:11'),
(90, 'HL00812AG', 'saefulrohman', 184, 'Graha XL Mega Kuningan Jakarta Selatan ', 'saeful.rohman.ittelkom@gmail.com', 'T-Cash', 1505385293602, '17:34', '87717216986', 'Test', 'Menunggu Pembayaran', '26650000.00', '0.00', 0, 0, '', '', 1505298912747, 1505298912747, '2017-09-13 10:35:13'),
(91, 'GI05830AD', 'kardi', 187, 'TSO lt.16', 'kardi@telkomsel.co.id', 'T-Cash', 1505356989115, '10:5', '811100677', '3 mendoan Dan 3 bakwan', 'Order Dibatalkan', '20000.00', '0.00', 0, 2000, '', '', 1505357092396, 1505357092396, '2017-09-14 02:44:55'),
(92, 'PC77893XK', 'rochmansb', 189, 'lantai 15 ( ruang vendor MII )', 'rochman_s_basyari@telkomsel.co.id', 'T-Cash', 1505373541657, '14:45', '8119510106', 'gorenganya campur bakwan dan tempe', 'Menunggu Pembayaran', '20000.00', '0.00', 0, 2000, '', '', 1505373576873, 1505373576873, '2017-09-14 07:19:39'),
(93, 'MX74238AA', 'nurul', 160, 'test', 'nurulfitri.mail@gmail.com', 'T-Cash', 1505432967738, '6:49', '8118003585', 'testing', 'Menunggu Pembayaran', '19000.00', '0.00', 0, 0, '', '', 1505432977392, 1505432977392, '2017-09-14 23:49:38'),
(94, 'LN83336KZ', 'nurul', 160, 'test', 'nurulfitri.mail@gmail.com', 'T-Cash', 1505433025184, '6:50', '8118003585', 'test', 'Menunggu Pembayaran', '19000.00', '0.00', 0, 0, '', '', 1505433037795, 1505433037795, '2017-09-14 23:50:40'),
(95, 'GY73212NN', 'nurul', 160, 'test', 'nurulfitri.mail@gmail.com', 'T-Cash', 1505433168287, '6:52', '8118003585', 'test', 'Menunggu Pembayaran', '16000.00', '0.00', 0, 0, '', '', 1505433177768, 1505433177768, '2017-09-14 23:53:00'),
(96, 'FF81276LQ', 'nurul', 160, 'test', 'nurulfitri.mail@gmail.com', 'T-Cash', 1505435740216, '7:35', '8118003585', 'test', 'Menunggu Pembayaran', '16000.00', '0.00', 0, 0, '422396', 'waroe17091507422309786', 1505435822544, 1505435822544, '2017-09-15 00:37:04'),
(97, 'LU10671FG', 'kardi', 187, 'TSO lt.16', 'kardi@telkomsel.co.id', 'T-Cash', 1505443622145, '10:0', '811100677', '', 'Sudah Dibayar', '20000.00', '0.00', 0, 2000, '473797', 'waroe17091509473712450', 1505443648589, 1505443648589, '2017-09-15 02:47:29'),
(98, 'DJ49341QN', 'dyka', 104, 'lantai 9', 'andyka23@gmail.com', 'T-Cash', 1505710168382, '4:0', '8111193932', 'buat pak dyka', 'Sudah Dibayar', '20000.00', '0.00', 0, 0, '544798', '', 1505623813902, 1505623813902, '2017-09-17 04:50:15'),
(99, 'PL58753QW', 'Indah', 113, 'indah mtt lt 9', 'sns.nurindah@gmail.com', 'T-Cash', 1505890031421, '13:47', '85288493094', 'mi rebus', 'Menunggu Pembayaran', '24000.00', '0.00', 0, 0, '474799', 'waroe17092013474733371', 1505890070255, 1505890070255, '2017-09-20 06:47:34'),
(100, 'MP33617TQ', 'rafidiaaqil', 211, 'Telkomsel Smart Office Lt. 9', 'rafidiaar007@gmail.com', 'T-Cash', 1506080465051, '22:41', '81333978900', 'MTT', 'Order Dibatalkan', '172000.00', '0.00', 0, 0, '324410', 'waroe17092814324426415', 1505907700932, 1505907700932, '2017-09-20 11:41:44'),
(101, 'EV84752HR', 'Indah', 113, 'mtt lantai 9', 'sns.nurindah@gmail.com', 'T-Cash', 1506047737406, '10:0', '85288493094', 'bubur tanpa kecap', 'Tagihkan ke Admin', '53000.00', '0.00', 0, 0, '372310', 'waroe17092209372394750', 1506047813695, 1506047813695, '2017-09-22 02:36:37'),
(102, 'BL17651UM', 'rafidiaaqil', 211, 'TSO Lt 9', 'rafidiaar007@gmail.com', 'T-Cash', 1506660313893, '11:45', '81333978900', '', 'Selesai Kirim', '899000.00', '0.00', 0, 0, '464510', 'waroe17092811464720673', 1506573932602, 1506573932602, '2017-09-28 04:45:37'),
(103, 'DV41958FL', 'gatot', 254, 'tso lt 2, ruang SEPAKAT', 'gatot_d_utomo@telkomsel.co.id', 'T-Cash', 1506666578327, '13:29', '811139193', '', 'Menunggu Pembayaran', '78000.00', '0.00', 0, 0, '311310', 'waroe17092913311367711', 1506666595203, 1506666595203, '2017-09-29 06:29:56'),
(104, 'CG70235RT', 'arifput', 267, 'TSO Lt. 19', 'arif_a_putra@telkomsel.co.id', 'T-Cash', 1506910534969, '9:15', '8111700997', '', 'Sudah Dibayar', '20000.00', '0.00', 0, 3000, '273010', 'waroe17100209273075904', 1506910558778, 1506910558778, '2017-10-02 02:15:57'),
(105, '14wtu3FNs', 'yusron', 95, 'jl kuningan barat 2', 'yusronzain@gmail.com', 'Ambil di lokasi Merc', 1507240800, '', '082251461912', ' opsi', '', '446000.00', '0.00', 0, 500, '', '', 2017, 2017, '2017-10-06 08:38:16'),
(106, 'qUYmEi9ax', 'yusron', 95, 'jl kuningan barat 2', 'yusronzain@gmail.com', 'Diantar ke Lokasi', 1507759200, '', '082251461912', ' aaa', 'Pesanan ditujukan ke Merchant', '50000.00', '0.00', 0, 500, '', '', 2017, 2017, '2017-10-12 05:05:40'),
(107, 'qUYmEi9ax', 'yusron', 95, 'jl kuningan barat 2', 'yusronzain@gmail.com', 'Diantar ke Lokasi', 1507759200, '', '082251461912', ' aaa', 'Pesanan ditujukan ke Merchant', '50000.00', '0.00', 0, 500, '', '', 2017, 2017, '2017-10-12 05:06:04'),
(108, 'yMsEG0raL', 'yusron', 95, 'jl kuningan barat 2', 'yusronzain@gmail.com', 'Diantar ke Lokasi', 1507759200, '', '082251461912', ' aa', '', '27000.00', '0.00', 0, 500, '', '', 2017, 2017, '2017-10-12 05:07:23'),
(109, 'TrmFhf7jH', 'yusron', 95, 'jl kuningan barat 2', 'yusronzain@gmail.com', 'Diantar ke Lokasi', 1507759200, '', '082251461912', ' aa', '', '23500.00', '0.00', 0, 0, '', '', 2017, 2017, '2017-10-12 08:30:08'),
(110, 'TrmFhf7jH', 'yusron', 95, 'jl kuningan barat 2', 'yusronzain@gmail.com', 'Diantar ke Lokasi', 1507759200, '', '082251461912', ' aa', '', '23500.00', '0.00', 0, 0, '', '', 2017, 2017, '2017-10-12 08:30:31'),
(111, 'CVmKZJx0U', 'yusron', 95, 'jl kuningan barat 2', 'yusronzain@gmail.com', 'Diantar ke Lokasi', 1507759200, '', '082251461912', ' aa', '', '16000.00', '0.00', 0, 0, '', '', 2017, 2017, '2017-10-12 08:30:58'),
(112, 'zvVe6P2uZ', 'yusron', 95, 'jl kuningan barat 2', 'yusronzain@gmail.com', 'Diantar ke Lokasi', 1507759200, '', '082251461912', 'aaaa', '', '76000.00', '0.00', 0, 0, '', '', 2017, 2017, '2017-10-12 09:21:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_order_detail`
--

CREATE TABLE `product_order_detail` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `merchant_name` varchar(30) NOT NULL,
  `merchant_phone` varchar(20) NOT NULL,
  `merchant_email` varchar(40) NOT NULL,
  `status` varchar(50) NOT NULL,
  `feedback` varchar(250) NOT NULL,
  `emotion` varchar(100) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `price_item` decimal(12,2) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product_order_detail`
--

INSERT INTO `product_order_detail` (`id`, `order_id`, `product_id`, `product_name`, `merchant_id`, `merchant_name`, `merchant_phone`, `merchant_email`, `status`, `feedback`, `emotion`, `amount`, `price_item`, `created_at`, `last_update`) VALUES
(1, 1, 6, 'Indomie Telor (MTT)', 5, '', '', '', 'Order Dibatalkan', '', NULL, 1, '10000.00', 1495299808369, 1495299808369),
(2, 1, 7, 'Indomie Telor Plus sosis, nugget, keju (MTT)', 5, '', '', '', 'Selesai', '', NULL, 1, '15000.00', 1495299808369, 1495299808369),
(3, 1, 8, 'Gorengan Bakwan,Tahu (MTT)', 5, '', '', '', 'Selesai', '', NULL, 1, '1000.00', 1495299808369, 1495299808369),
(4, 2, 1, 'Nasi Pecel Madiun (MTT)', 5, '', '', '', 'Selesai', '', NULL, 1, '19000.00', 1495336030208, 1495336030208),
(5, 2, 2, 'Nasi Gado Gado (MTT)', 5, '', '', '', 'Proses Kirim', '', NULL, 1, '20000.00', 1495336030208, 1495336030208),
(6, 2, 3, 'Nasi Ayam Komplit (MTT)', 5, '', '', '', 'Order Dibatalkan', '', NULL, 1, '26000.00', 1495336030208, 1495336030208),
(7, 2, 7, 'Indomie Telor Plus sosis, nugget, keju (MTT)', 5, '', '', '', 'Order Dibatalkan', '', NULL, 1, '15000.00', 1495336030208, 1495336030208),
(8, 2, 8, 'Gorengan Bakwan,Tahu (MTT)', 5, '', '', '', 'Proses Kirim', '', NULL, 1, '1000.00', 1495336030208, 1495336030208),
(9, 2, 5, 'Nasi Sayur (MTT)', 5, '', '', '', 'Order Dibatalkan', '', NULL, 1, '15000.00', 1495336030208, 1495336030208),
(10, 2, 6, 'Indomie Telor (MTT)', 5, '', '', '', 'Order Dibatalkan', '', NULL, 1, '10000.00', 1495336030208, 1495336030208),
(11, 2, 4, 'Nasi Bakar (MTT)', 5, '', '', '', '', '', NULL, 1, '22000.00', 1495336030208, 1495336030208),
(12, 3, 28, 'Umroh Bersama MTT', 5, '', '', '', '', '', NULL, 1, '26000000.00', 1495338620374, 1495338620374),
(13, 3, 10, 'Kopi Hijau Diet Kopi Kawi', 5, '', '', '', '', '', NULL, 1, '65000.00', 1495338620374, 1495338620374),
(14, 3, 21, 'Kripik KEPO', 5, '', '', '', '', '', NULL, 1, '15000.00', 1495338620374, 1495338620374),
(15, 4, 30, 'Metode Tartila (Praktis Tahsin & Tilawah)', 5, '', '', '', '', '', NULL, 1, '35000.00', 1495340289401, 1495340289401),
(16, 4, 27, 'Rumah di Bekasi Selatan', 5, '', '', '', '', '', NULL, 1, '625000000.00', 1495340289401, 1495340289401),
(17, 4, 24, 'Kopiah', 5, '', '', '', '', '', NULL, 1, '10000.00', 1495340289401, 1495340289401),
(18, 4, 25, 'Tas Ransel Eiger MTT', 5, '', '', '', '', '', NULL, 1, '340000.00', 1495340289401, 1495340289401),
(19, 4, 7, 'Indomie Telor Plus sosis, nugget, keju (MTT)', 5, '', '', '', '', '', NULL, 1, '15000.00', 1495340289401, 1495340289401),
(20, 4, 3, 'Nasi Ayam Komplit (MTT)', 5, '', '', '', '', '', NULL, 1, '26000.00', 1495340289401, 1495340289401),
(21, 4, 6, 'Indomie Telor (MTT)', 5, '', '', '', '', '', NULL, 1, '10000.00', 1495340289401, 1495340289401),
(22, 4, 8, 'Gorengan Bakwan,Tahu (MTT)', 5, '', '', '', '', '', NULL, 1, '1000.00', 1495340289401, 1495340289401),
(23, 5, 6, 'Indomie Telor (MTT)', 5, '', '', '', '', '', NULL, 1, '10000.00', 1495340502454, 1495340502454),
(24, 6, 8, 'Gorengan Bakwan,Tahu (MTT)', 5, '', '', '', '', '', NULL, 1, '1000.00', 1495340988875, 1495340988875),
(25, 7, 4, 'Nasi Bakar (MTT)', 5, '', '', '', '', '', NULL, 2, '22000.00', 1495348477701, 1495348477701),
(26, 8, 4, 'Nasi Bakar (MTT)', 5, '', '', '', '', '', NULL, 2, '22000.00', 1495348544982, 1495348544982),
(27, 12, 8, 'Gorengan Bakwan,Tahu (MTT)', 5, '', '', '', '', '', NULL, 5, '3000.00', 1495350695350, 1495350695350),
(28, 13, 47, 'Nasi Tengkleng', 5, '', '', '', '', '', NULL, 1, '35000.00', 1495411934388, 1495411934388),
(29, 14, 8, 'Gorengan Bakwan,Tahu (MTT)', 5, '', '', '', '', '', NULL, 5, '3000.00', 1495418412221, 1495418412221),
(30, 15, 8, 'Gorengan Bakwan,Tahu (MTT)', 5, '', '', '', '', '', NULL, 1, '3000.00', 1495424352951, 1495424352951),
(31, 15, 4, 'Nasi Bakar (MTT)', 5, '', '', '', '', '', NULL, 1, '22000.00', 1495424352951, 1495424352951),
(32, 16, 54, 'Baju Taqwa Riyan', 5, '', '', '', '', '', NULL, 1, '150000.00', 1495467669556, 1495467669556),
(33, 17, 24, 'Kopiah', 5, '', '', '', '', '', NULL, 1, '10000.00', 1495492045373, 1495492045373),
(34, 18, 21, 'Kripik KEPO', 5, '', '', '', '', '', NULL, 1, '15000.00', 1495492562129, 1495492562129),
(35, 21, 21, 'Kripik KEPO', 5, '', '', '', '', '', NULL, 1, '15000.00', 1495496804028, 1495496804028),
(36, 22, 52, 'Batagor', 5, '', '', '', '', '', NULL, 1, '16000.00', 1495499950734, 1495499950734),
(37, 23, 52, 'Batagor', 5, '', '', '', '', '', NULL, 1, '16000.00', 1495501044206, 1495501044206),
(38, 24, 8, 'Gorengan Bakwan,Tahu (MTT)', 5, '', '', '', '', '', NULL, 12, '3000.00', 1495593261763, 1495593261763),
(39, 25, 8, 'Gorengan Bakwan,Tahu (MTT)', 5, '', '', '', '', '', NULL, 10, '3000.00', 1495600025762, 1495600025762),
(40, 26, 10, 'Kopi Hijau Diet Kopi Kawi', 5, '', '', '', '', '', NULL, 1, '65000.00', 1495600207335, 1495600207335),
(41, 28, 3, 'Nasi Ayam Komplit (MTT)', 5, '', '', '', '', '', NULL, 1, '26000.00', 1495706310816, 1495706310816),
(42, 29, 3, 'Nasi Ayam Komplit (MTT)', 5, '', '', '', '', '', NULL, 1, '26000.00', 1495706438355, 1495706438355),
(43, 30, 52, 'Batagor', 21, '', '', '', '', '', NULL, 1, '16000.00', 1495706693336, 1495706693336),
(44, 35, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1495707939077, 1495707939077),
(45, 36, 47, 'Nasi Tengkleng', 0, '', '', '', '', '', NULL, 1, '35000.00', 1495715924030, 1495715924030),
(46, 37, 51, 'Bubur Kuningan', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '17000.00', 1495753829966, 1495753829966),
(47, 38, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1495753933960, 1495753933960),
(48, 39, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1495754616476, 1495754616476),
(49, 40, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1495754781735, 1495754781735),
(50, 41, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1495865033812, 1495865033812),
(51, 42, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1495945705269, 1495945705269),
(52, 43, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1496221367784, 1496221367784),
(53, 44, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1496223702571, 1496223702571),
(54, 45, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1496223801096, 1496223801096),
(55, 46, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1496223905846, 1496223905846),
(56, 47, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1496245292573, 1496245292573),
(57, 48, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1496245309555, 1496245309555),
(58, 49, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1496245386157, 1496245386157),
(59, 50, 25, 'Tas Ransel Eiger MTT', 5, 'admin', '08118003585', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '340000.00', 1497334703128, 1497334703128),
(60, 51, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1497344999482, 1497344999482),
(61, 52, 63, 'Kurma Coklat GreenTea', 29, 'adhtie', '082188889472', 'adhtiekha@gmail.com', '', '', NULL, 1, '38000.00', 1497593012459, 1497593012459),
(62, 53, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1498701701634, 1498701701634),
(63, 54, 5, 'Nasi Sayur (MTT)', 5, 'admin', '08118003585', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '15000.00', 1499408322935, 1499408322935),
(64, 55, 7, 'Indomie Telor Plus sosis, nugget, keju (MTT)', 5, 'admin', '08118003585', 'qomarullah.mail@gmail.comx', '', '', NULL, 8, '15000.00', 1499784594066, 1499784594066),
(65, 56, 8, 'Gorengan Bakwan,Tahu (MTT)', 5, 'admin', '08118003585', 'qomarullah.mail@gmail.comx', '', '', NULL, 8, '3000.00', 1499784774462, 1499784774462),
(66, 57, 9, 'Habatussauda', 5, 'admin', '08118003585', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '60000.00', 1499828228242, 1499828228242),
(67, 57, 16, 'Madu Pahit Az Zikra', 5, 'admin', '08118003585', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '100000.00', 1499828228242, 1499828228242),
(68, 58, 17, 'Madu Super Liar Al Amin', 5, 'admin', '08118003585', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '105000.00', 1499840253183, 1499840253183),
(69, 59, 17, 'Madu Super Liar Al Amin', 5, 'admin', '08118003585', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '105000.00', 1499840317053, 1499840317053),
(70, 60, 17, 'Madu Super Liar Al Amin', 5, 'admin', '08118003585', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '105000.00', 1499840437555, 1499840437555),
(71, 61, 1, 'Nasi Pecel Madiun (MTT)', 5, 'admin', '08118003585', 'qomarullah.mail@gmail.comx', '', '', NULL, 2, '19000.00', 1499888215310, 1499888215310),
(72, 62, 2, 'Nasi Gado Gado (MTT)', 5, 'admin', '08118003585', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '20000.00', 1500273851793, 1500273851793),
(73, 63, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1500354077039, 1500354077039),
(74, 64, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1500354091575, 1500354091575),
(75, 65, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1500354105443, 1500354105443),
(76, 66, 178, 'jus alpukat', 77, 'Juicefriend', '0811101696', 'juicefriend.com@gmail.com', '', '', NULL, 1, '20000.00', 1500443297051, 1500443297051),
(77, 67, 178, 'jus alpukat', 77, 'Juicefriend', '0811101696', 'juicefriend.com@gmail.com', '', '', NULL, 1, '20000.00', 1500443318620, 1500443318620),
(78, 68, 183, 'Premium Juice - VVIP Juice', 77, 'Juicefriend', '0811101696', 'juicefriend.com@gmail.com', '', '', NULL, 1, '40000.00', 1500444899060, 1500444899060),
(79, 69, 7, 'Indomie Telor Plus sosis, nugget, keju (MTT)', 5, 'admin', '08118003585', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '15000.00', 1500620937744, 1500620937744),
(80, 70, 7, 'Indomie Telor Plus sosis, nugget, keju (MTT)', 5, 'admin', '08118003585', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '15000.00', 1500621109534, 1500621109534),
(81, 71, 2, 'Nasi Gado Gado (MTT)', 5, 'admin', '08118003585', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '20000.00', 1500949799004, 1500949799004),
(82, 72, 2, 'Nasi Gado Gado (MTT)', 5, 'admin', '08118003585', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '20000.00', 1500965796251, 1500965796251),
(83, 73, 156, 'Buah Potong Mix', 77, 'Juicefriend', '0811101696', 'juicefriend.com@gmail.com', '', '', NULL, 1, '25000.00', 1501484968144, 1501484968144),
(84, 74, 156, 'Buah Potong Mix', 77, 'Juicefriend', '0811101696', 'juicefriend.com@gmail.com', '', '', NULL, 1, '25000.00', 1501484983853, 1501484983853),
(85, 75, 156, 'Buah Potong Mix', 77, 'Juicefriend', '0811101696', 'juicefriend.com@gmail.com', '', '', NULL, 1, '25000.00', 1501485002822, 1501485002822),
(86, 76, 156, 'Buah Potong Mix', 77, 'Juicefriend', '0811101696', 'juicefriend.com@gmail.com', '', '', NULL, 1, '25000.00', 1501485007009, 1501485007009),
(87, 77, 157, 'Salad Buah', 77, 'Juicefriend', '0811101696', 'juicefriend.com@gmail.com', '', '', NULL, 1, '20000.00', 1501487611804, 1501487611804),
(88, 77, 176, 'infused water strawberry cucumber lime', 77, 'Juicefriend', '0811101696', 'juicefriend.com@gmail.com', '', '', NULL, 1, '20000.00', 1501487611804, 1501487611804),
(89, 78, 8, 'Gorengan Bakwan,Tahu (MTT)', 5, 'admin', '08118003585', 'qomarullah.mail@gmail.comx', '', '', NULL, 3, '3000.00', 1501488551289, 1501488551289),
(90, 79, 157, 'Salad Buah', 77, 'Juicefriend', '0811101696', 'juicefriend.com@gmail.com', '', '', NULL, 1, '20000.00', 1501561074160, 1501561074160),
(91, 80, 6, 'Indomie Telor (MTT)', 5, 'admin', '08118003585', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '10000.00', 1501656385079, 1501656385079),
(92, 81, 180, 'jus semangka', 77, 'Juicefriend', '0811101696', 'juicefriend.com@gmail.com', '', '', NULL, 1, '15000.00', 1501656746498, 1501656746498),
(93, 81, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1501656746498, 1501656746498),
(94, 82, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1501749041678, 1501749041678),
(95, 82, 157, 'Salad Buah', 77, 'Juicefriend', '0811101696', 'juicefriend.com@gmail.com', '', '', NULL, 1, '20000.00', 1501749041679, 1501749041679),
(96, 83, 2, 'Nasi Gado Gado (MTT)', 5, 'admin', '08118003585', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '20000.00', 1501818713973, 1501818713973),
(97, 84, 179, 'jus jeruk vip', 77, 'Juicefriend', '0811101696', 'juicefriend.com@gmail.com', '', '', NULL, 1, '15000.00', 1504745728317, 1504745728317),
(98, 84, 51, 'Bubur Kuningan', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '17000.00', 1504745728317, 1504745728317),
(99, 84, 6, 'Indomie Telor (MTT)', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '10000.00', 1504745728317, 1504745728317),
(100, 85, 1, 'Nasi Pecel Madiun (MTT)', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '19000.00', 1504746795293, 1504746795293),
(101, 86, 17, 'Madu Super Liar Al Amin', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '105000.00', 1504763169931, 1504763169931),
(102, 87, 17, 'Madu Super Liar Al Amin', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '105000.00', 1504790327134, 1504790327134),
(103, 88, 17, 'Madu Super Liar Al Amin', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '105000.00', 1504790677773, 1504790677773),
(104, 89, 51, 'Bubur Kuningan', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '17000.00', 1505183648819, 1505183648819),
(105, 90, 153, 'Aneka Buah Potong', 77, 'Juicefriend', '0811101696', 'juicefriend.com@gmail.com', '', '', NULL, 2, '25000.00', 1505298912752, 1505298912752),
(106, 90, 28, 'Umroh Bersama MTT', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '26000000.00', 1505298912752, 1505298912752),
(107, 90, 8, 'Gorengan Bakwan,Tahu (MTT)', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '3000.00', 1505298912752, 1505298912752),
(108, 90, 198, 'Sepatu anak lucu UB001', 156, 'Lilysportswear', '081291673067', 'lilysportswear@gmail.com', '', '', NULL, 1, '120000.00', 1505298912752, 1505298912752),
(109, 90, 199, 'Sepatu anak Adidas Yeezy boost LED', 156, 'Lilysportswear', '081291673067', 'lilysportswear@gmail.com', '', '', NULL, 1, '320000.00', 1505298912752, 1505298912752),
(110, 90, 47, 'Nasi Tengkleng', 0, '', '', '', '', '', NULL, 3, '35000.00', 1505298912752, 1505298912752),
(111, 90, 3, 'Nasi Ayam Komplit (MTT)', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 2, '26000.00', 1505298912752, 1505298912752),
(112, 91, 8, 'Gorengan Bakwan,Tahu (MTT)', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 6, '3000.00', 1505357092400, 1505357092400),
(113, 92, 8, 'Gorengan Bakwan,Tahu (MTT)', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 6, '3000.00', 1505373576882, 1505373576882),
(114, 93, 1, 'Nasi Pecel Madiun (MTT)', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '19000.00', 1505432977401, 1505432977401),
(115, 94, 1, 'Nasi Pecel Madiun (MTT)', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '19000.00', 1505433037803, 1505433037803),
(116, 95, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1505433177782, 1505433177782),
(117, 96, 52, 'Batagor', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '16000.00', 1505435822558, 1505435822558),
(118, 97, 8, 'Gorengan Bakwan,Tahu (MTT)', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 6, '3000.00', 1505443648591, 1505443648591),
(119, 98, 157, 'Salad Buah', 77, 'Juicefriend', '0811101696', 'juicefriend.com@gmail.com', '', '', NULL, 1, '20000.00', 1505623813906, 1505623813906),
(120, 99, 8, 'Gorengan Bakwan,Tahu (MTT)', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 3, '3000.00', 1505890070271, 1505890070271),
(121, 99, 7, 'Indomie Telor Plus sosis, nugget, keju (MTT)', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '15000.00', 1505890070271, 1505890070271),
(122, 100, 14, 'Kurma Golden Dates 1 Kg (Sayer)', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '52000.00', 1505907700952, 1505907700952),
(123, 100, 13, 'Kurma Dattes 1 Kg (Khalas)', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '60000.00', 1505907700952, 1505907700952),
(124, 100, 9, 'Habatussauda', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 1, '60000.00', 1505907700952, 1505907700952),
(125, 101, 8, 'Gorengan Bakwan,Tahu (MTT)', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 2, '3000.00', 1506047813704, 1506047813704),
(126, 101, 155, 'Mangga Harum Manis Potong', 77, 'Juicefriend', '0811101696', 'juicefriend.com@gmail.com', '', '', NULL, 1, '30000.00', 1506047813704, 1506047813704),
(127, 101, 51, 'Bubur Kuningan', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '17000.00', 1506047813704, 1506047813704),
(128, 102, 261, 'Sepatu Running Nike', 212, 'yusronzain', '082251461910', 'yusronzain@gmail.com', '', '', NULL, 1, '899000.00', 1506573932616, 1506573932616),
(129, 103, 3, 'Nasi Ayam Komplit (MTT)', 5, 'admin', '6281285688212', 'qomarullah.mail@gmail.comx', '', '', NULL, 3, '26000.00', 1506666595208, 1506666595208),
(130, 104, 51, 'Bubur Kuningan', 21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', '', '', NULL, 1, '17000.00', 1506910558783, 1506910558783),
(131, 105, 53, 'Tafsir Sesat', 5, 'qomarullah', '8118003585', 'qomarullah.mail@gmail.com', 'Selesai', 'baik', 'smile', 3, '100000.00', 1507279023, 1507279097),
(132, 105, 5, 'Nasi Sayur (MTT)', 5, 'qomarullah', '8118003585', 'qomarullah.mail@gmail.com', 'Selesai', 'aa', 'sad', 6, '15000.00', 1507279023, 1507789666),
(133, 105, 7, 'Indomie Telor Plus sosis, nugget, keju (MTT)', 5, 'qomarullah', '8118003585', 'qomarullah.mail@gmail.com', 'Selesai', '', NULL, 1, '15000.00', 1507279023, 1507793933),
(134, 105, 3, 'Nasi Ayam Komplit (MTT)', 5, 'qomarullah', '8118003585', 'qomarullah.mail@gmail.com', 'Selesai', '', NULL, 1, '26000.00', 1507279023, 1507793925),
(135, 105, 6, 'Indomie Telor (MTT)', 5, 'qomarullah', '8118003585', 'qomarullah.mail@gmail.com', 'Selesai', '', NULL, 1, '10000.00', 1507279023, 1507793769),
(136, 106, 4, 'Nasi Bakar (MTT)', 5, 'qomarullah', '8118003585', 'qomarullah.mail@gmail.com', 'WAITING', '', NULL, 1, '22000.00', 1507784729, 1507784729),
(137, 106, 3, 'Nasi Ayam Komplit (MTT)', 5, 'qomarullah', '8118003585', 'qomarullah.mail@gmail.com', 'WAITING', '', NULL, 1, '26000.00', 1507784729, 1507784729),
(138, 106, 4, 'Nasi Bakar (MTT)', 5, 'qomarullah', '8118003585', 'qomarullah.mail@gmail.com', 'WAITING', '', NULL, 1, '22000.00', 1507784729, 1507784729),
(139, 106, 3, 'Nasi Ayam Komplit (MTT)', 5, 'qomarullah', '8118003585', 'qomarullah.mail@gmail.com', 'WAITING', '', NULL, 1, '26000.00', 1507784729, 1507784729),
(140, 108, 3, 'Nasi Ayam Komplit (MTT)', 5, 'qomarullah', '8118003585', 'qomarullah.mail@gmail.com', 'WAITING', '', NULL, 1, '26000.00', 1507784834, 1507784834),
(141, 109, 89, 'Emping Melinjo Khas Jogja', 43, '', '0811978464', 'jerman90@gmail.com', 'Menunggu Pembayaran', '', NULL, 1, '22500.00', 1507796988, 1507796988),
(142, 109, 89, 'Emping Melinjo Khas Jogja', 43, '', '0811978464', 'jerman90@gmail.com', 'Menunggu Pembayaran', '', NULL, 1, '22500.00', 1507796988, 1507796988),
(143, 111, 5, 'Nasi Sayur (MTT)', 5, 'qomarullah', '8118003585', 'qomarullah.mail@gmail.com', 'Menunggu Pembayaran', '', NULL, 1, '15000.00', 1507797051, 1507797051),
(144, 112, 3, 'Nasi Ayam Komplit (MTT)', 5, 'qomarullah', '8118003585', 'qomarullah.mail@gmail.com', 'Menunggu Pembayaran', '', NULL, 2, '26000.00', 1507800084, 1507800084),
(145, 112, 4, 'Nasi Bakar (MTT)', 5, 'qomarullah', '8118003585', 'qomarullah.mail@gmail.com', 'Menunggu Pembayaran', '', NULL, 1, '22000.00', 1507800084, 1507800084);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` bigint(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `email`, `password`) VALUES
(1, 'Admin Jual Beli', 'admin', 'qomarullah.mail@gmail.com', '0192023a7bbd73250516f069df18b500');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_merchant`
--

CREATE TABLE `user_merchant` (
  `id` int(11) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `is_merchant` tinyint(1) DEFAULT '0',
  `level` int(2) NOT NULL DEFAULT '0',
  `address` varchar(50) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `image` text,
  `merchant_name` varchar(100) DEFAULT NULL,
  `image_merchant` text,
  `deskripsi_merchant` varchar(200) DEFAULT NULL,
  `open` smallint(6) DEFAULT '1',
  `open_time` bigint(20) DEFAULT NULL,
  `close_time` bigint(20) DEFAULT NULL,
  `telegram` varchar(20) DEFAULT NULL,
  `nik_tsel` varchar(20) DEFAULT NULL,
  `email_tsel` varchar(50) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `google_id` varchar(20) DEFAULT NULL,
  `google_email` varchar(50) DEFAULT NULL,
  `fb_id` varchar(50) DEFAULT NULL,
  `fb_email` varchar(50) DEFAULT NULL,
  `token` varchar(10) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_merchant`
--

INSERT INTO `user_merchant` (`id`, `username`, `phone`, `email`, `password`, `is_merchant`, `level`, `address`, `name`, `image`, `merchant_name`, `image_merchant`, `deskripsi_merchant`, `open`, `open_time`, `close_time`, `telegram`, `nik_tsel`, `email_tsel`, `location`, `google_id`, `google_email`, `fb_id`, `fb_email`, `token`, `last_update`) VALUES
(2, 'test', '08132432432', 'user_markeet@gmail.com', '0192023a7bbd73250516f069df18b500', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(5, 'admin', '8118003585', 'qomarullah.mail@gmail.com', '0192023a7bbd73250516f069df18b500', 1, 0, '', 'qomarullah', NULL, NULL, NULL, NULL, 0, 0, 0, 'qomarullah', '85136', 'qomarullah@telkomsel.co.id', 'ts3', '', '', '', '', 'beGcXqhD', '2017-07-24 11:01:45'),
(16, 'ok', '0811800358883', 'qomarullahjsjjs@jsjjs', 'e3a36dae0fe547beb0c3e470ec5f69a6', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(18, 'user', '6285322881993', 'qomarullah.mail@gmail.comx', '29e3bb7ccc535f829fcbd5604b596089', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(19, 'lukiisw', '0811917674', 'luki.iswara2010@gmail.com', 'd2be10e091562cad850e9701ab9dc4e0', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(20, 'mapri', '081399848387', 'mapri.new@gmail.com', 'd3ec549861b667962a6f96cf66cb9990', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(21, 'BuburKuningan', '081296363064', 'rudianabinkasmad@gmail.com', 'c94fd0ca8f2ce10778f44fe96d5fa604', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(22, 'betha', '08111987781', 'betha_r_yulianto@telkomsel.co.id', 'efa533f214ddcdb52d1c6d96c7c513c4', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(23, 'JowvyKum', '0811412344', 'jowvy_kumala@telkomsel.co.id', '612f2291963cf47efc97b5dc7ed266b6', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(24, 'furqon', '0811646446', 'furqon.ahkamy@gmail.com', '9937fa0084be826cde4ab55f125e2706', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(25, 'AMstore', '0811700360', 'taofik.haryanto@gmail.com', 'ca9637601eadbb7971821668113b7586', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(26, 'mfmahdi', '0811806256', 'mfmahdi@gmail.com', '2c43ef84af60fa45e64240f0ad119038', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(27, 'iDew', '08119629991', 'dewi_at_putri@telkomsel.co.ud', '36e498f319d7ca06e8969ba1fee3c142', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(28, 'abe', '0811530084', 'javac_abe@yahoo.com', 'b45746b95e3ca1a2486ad63222c37c4b', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(29, 'adhtie', '082188889472', 'adhtiekha@gmail.com', '207cf643f255fe8e7a556f46e295b432', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(30, 'Megabintar', '085322536906', 'mega.putriana@gmail.com', 'b4a19a9fc334ee64ca0614e91fe5f21e', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(35, 'miaQBooth', '0811983973', 'miaamalia@gmail.com', '586b66de2f1ba8b0f7f21331a6046c71', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(36, 'Deby Sandra Putri', '0811149712', 'debysandraputri@gmail.com', '0b779014cd08a5f875a0678a3c702a47', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(37, 'zaraqu', '0811830500', 'faldian2000@gmail.com', 'b24a94e6a7626d4451084846fd21d9e9', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(38, 'abahalek', '0811871434', 'alekpn@gmail.com', 'fc788d57dc97a2e1e55ebd6c2dfd8471', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(39, 'Fajarfe', '0811923366', 'fajar_fe_haryanto@telkomsel.co.id', '16d222a5fac9d8d7a3ee790f9ee46af5', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(40, 'Riswan', '0811970399 ', 'riswan@telkomsel.co.id', '1892a43973bfb5fac054a197911e0023', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(41, 'Sholehhudin', '08111987745', 'sholehhudin@gmail.com', 'dd2a913c637472f7f2cdf9730aed3ac4', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(43, 'als', '0811978464', 'jerman90@gmail.com', '0d645d0dfa437e95e94228b047fa3e9d', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(46, 'wawanset', '0811187372', 'setiawan.wawan@gmail.com', 'ccfcbcb802b5436158b775207cd6a849', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(50, '', '+62811300890', 'arikademaya@gmail.com', '87fd14420279e90619cd0f609d83d3db', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(54, 'arikamaya', '0811300890', 'arika_d_maya@telkomsel.co.id', '67baca674578a741c37c78e30e566c37', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(55, 'Cheeqa', '0811414411', 'cheeqa@gmail.com', '1a137c4c35b41267c58fba8307619727', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(58, 'acep1013', '08111177755', 'acepsugianto8@gmail.com', '12c6fbf08ff901cc0c783ea25c5cf9f0', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(59, 'soekarnosan', '08119953080', 'soekarnosan@gmail.com', 'ab950d123f5e75b5be8b8780a4167b06', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(60, 'dianck', '0811888204', 'dianck2002@gmail.com', '0786a6c27e40d5f6c0f8af2fbe6939ce', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(65, 'Verdania Puri', '0811101738', 'verdania83@gmail.com', '63d3a794e88997f1bf884668c7a42965', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(66, 'chacha', '082113655655', 'rizcha.87@gmail.com', 'c33367701511b4f6020ec61ded352059', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(67, 'imamroh', '08118705533', 'imam_rohendi@telkomsel.co.id', '5c25d20e275385468f5b70599856ab2b', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(68, 'diakbar', '08118135416', 'adhitya.akbar@gmail.com', 'a6e4b235a89d8ca4721c3424e164d7cb', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(69, 'kraukk', '085695856155', 'kraukk.com@gmail.com', '96e79218965eb72c92a549dd5a330112', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(70, 'aomrochman', '08119510106', 'saefullohrochman@gmail.com', '4a6a329c106ba24c46356d8fe2a3fa79', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(71, 'ariffir', '081311660223', 'firmansyah2308@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(72, 'aquila', '0811987712', 'avindoym@gmail.com', '4f96de345f5dda75503f5355d6f7e4b9', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(73, 'moretea', '0811916446', 'imanuel@telkomsel.co.id', '26a618681be56824fa07355355dcaf69', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(74, 'Nanaari', '08111987786', 'Nana_d_arianti@telkomsel.co.id', 'b8bcec03495cf39f3b0af1a4a95ca5e5', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(75, 'BaksoExmud', '0811100033', 'purwadi.hari@yahoo.com', 'd316f1b34717f63bf6a5938f2f91a95d', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(76, 'pakkarasa', '0811100677', 'kardijarot21@gmail.com', '84178a2f7bfeb1ec97a7178228e7a794', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(77, 'Juicefriend', '0811101696', 'juicefriend.com@gmail.com', '92e98df77fc911bfd81d2d776c9694c8', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(79, 'dennyabe', '08119309007', 'dennyabe@yahoo.com', '70b3c7860de673c6e66882d0e1a3c6f5', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(81, 'Bin jannah', '08111802753', 'ridarnasari0972@gmail.com', 'a8c66843d2688c364f36967fb5faf79f', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(88, 'apa7', '', 'saja7@test.com', '24af0bef1bab1b79a195782ea3a5cdda', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(89, 'apa8', '', 'saja8@test.com', '24af0bef1bab1b79a195782ea3a5cdda', 1, 0, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '', '', '', '', '', '', '', '', NULL, '0000-00-00 00:00:00'),
(90, 'sadsad', '0324324324', 'sdsdsdsd@testcom', '827ccb0eea8a706c4c34a16891f84e7b', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 'testing', '081118003464', 'kodok@test.com', '76419c58730d9f35de7ac538c2fd6737', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 'test123', '0811111111', 'kodok@yahoo.com123', 'cc03e747a6afbbcbf8be7668acfebee5', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 'boleh123', '8111111800', 'qomarullah@gmail.com', '24af0bef1bab1b79a195782ea3a5cdda', 0, 0, NULL, 'kodok lagi', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 'test7', '', 'test7@testcom', '827ccb0eea8a706c4c34a16891f84e7b', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 'yusronzain', '082251461912', 'yusronzain@gmail.com', '3fb3495ac2d1056b7f16370a6f01f941', 1, 1, 'jl kuningan barat 2', 'yusron', 'Screenshot_(59).png', NULL, NULL, NULL, 0, NULL, NULL, 'yusronzain', '00978645677', 'yusronzain@telkomsel.co.id', 'lantai 10', NULL, NULL, NULL, NULL, 'n8Nxed1m', '0000-00-00 00:00:00'),
(96, 'pedagang', '082251461910', 'pedagang@telkomsel.co.id', '3fb3495ac2d1056b7f16370a6f01f941', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 'rafidiaaqil', '082251461911', 'rafidiaar007@gmail.com', 'e172dd95f4feb21412a692e73929961e', 1, 0, 'asdasdasdasd', 'ada', 'IMG-20151012-WA0022.jpg', NULL, NULL, NULL, 1, NULL, NULL, 'sadasasdas', '8765342', 'ada@telkomsel.co.id', 'mtt lt9', NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(98, 'rajacarcover', '81320336093', 'benzcharlito@gmail.com', '6cfd7e5ebdb27e4af5fa0353cb9d7d5d', 0, 0, NULL, 'benzza', NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '123456', 'rajacarcover@telkomsel.co.id', 'bandung', NULL, NULL, NULL, NULL, 'top4IPMZ', '2017-08-19 15:30:07'),
(99, 'heriwibowo', '08386428924', 'heri.wibowo68@yahoo.com', 'dfd79780fac157af76fcf578bfc56d0d', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, 'dani', '81239007894', 'ramdaniramdani034@gmail.com', '', 0, 0, NULL, 'dani', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 'arikurnia', '83869843831', 'kurniaari199@gmail.com', '', 0, 0, NULL, 'arikurnia', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 'azharnas', '08118600878', 'azhar.ariadani@gmail.com', 'e941c76e12b5bf25305b28a85374baf4', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '87014', 'azhar_a_nasution@telkomsel.co.id', 'TSO', NULL, NULL, NULL, NULL, '54h6icWV', '2017-08-21 06:28:41'),
(103, 'defacomp', '85842233747', 'dewiardiningsih@yahoo.com', '', 0, 0, NULL, 'dewi ardiningsih', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 'dyka', '08111193932', 'andyka23@gmail.com', '1d3e0f633b7937164dad38ccd4095fad', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 'threedeescolection', '81214454946', 'reglankarakter@gmail.com', '', 0, 0, NULL, 'Iwan setiawan', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 'abang', '81802169375', 'rahelaril03@Gmail.com', '', 0, 0, NULL, 'abng', NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '081802169375', '081802169375@telkomsel.co.id', 'bandung', NULL, NULL, NULL, NULL, 'E3PWYo30', '2017-08-22 02:32:16'),
(107, 'FRSURABAYA', '087701763112', 'coy.sadiz@yahoo.co.id', 'f36a6befe49ff1ea2cd3b2fab804a2c8', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 'vanul', '081285688212', 'yanuarisvanul@gmail.com', '88760982d78f1c7cd7a41b7e3885a707', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 'mttpreneurship', '081285688212', 'mttpreneurship@gmail.com', '906279781ed1aa76f81a1350b3c7ab4a', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '111111', 'mttpreneurship@gmail.com', 'lt.9', NULL, NULL, NULL, NULL, '6yWudCSy', '2017-08-22 07:33:23'),
(110, 'nyccyagma', '08111991978', 'nyccyagma@gmail.com', '61ce3b1112fa90b49263d08d07e8001c', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, 'agus193', '82225637119', 'agus193@yahoo.com', '', 0, 0, NULL, 'agus', NULL, NULL, NULL, NULL, 0, NULL, NULL, '082225637119', '123456789', 'agus193@telkomsel.co.id', 'jawa timur', NULL, NULL, NULL, NULL, 'D3aGQFtt', '2017-08-22 19:03:37'),
(112, 'aguzodiak', '081331441765', 'aguz.setiawan@yahoo.com', '64085619fb338d0d755fd27ba988d581', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 'Indah', '085288493094', 'sns.nurindah@gmail.com', 'eca668dc75817302a247db4942bf5007', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 'Ardi', '082115561531', 'ardiansyah.pratomo@gmail.com', '931760ab13b91ca416c9afcc1be9c8d2', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 'supardi', '83813850566', 'ardyvanhouten@yahoo.com', '', 0, 0, NULL, 'supardi', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(116, 'bolala12', '081295070303', 'abaiksj44@gmail.com', '6c29010dae5004445c43fd367a42adef', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'bolala12', '3309042206840003', '@telkomsel.com@telkomsel.co.id@telkomsel.co.id', 'jabodetabek', NULL, NULL, NULL, NULL, 'mVPkjCBx', '2017-08-25 07:48:34'),
(117, 'exitomei', '83873983987', 'meilianatjong@ymail.com', '', 0, 0, NULL, 'exitomei', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 'VienShopID', '+628113934577', 'vienshop77@gmail.com', '', 0, 0, NULL, 'Vien', NULL, NULL, NULL, NULL, 0, NULL, NULL, '', '08113934577', 'vienshop@telkomsel.co.id', 'Jl. Prof Dr Soepomo No 7', NULL, NULL, NULL, NULL, 'fs5G03ta', '2017-08-26 04:58:24'),
(119, 'syerilia', '85881203010', 'saripudin50719@gmail.com', '', 0, 0, NULL, 'syerilia', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 'Homesport', '82219000074', 'glosirbaselayer659@gmail.com', '', 0, 0, NULL, 'arif ahmad', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 'Fitrianishop', '85256990848', 'ibuidafitriani@gmail.com', '', 0, 0, NULL, 'Ibu Ida Fitriani', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'IdaFitriani', '2524668788888', 'fitriani@telkomsel.co.id', 'Jakarta utara', NULL, NULL, NULL, NULL, 'B07NqHpk', '2017-08-27 23:52:54'),
(122, 'Uny', '89603922901', 'chasantri@gmail.com', '', 0, 0, NULL, 'uny', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 'greenshopbatam', '082170312658', 'greenshoppingbatam@gmail.com', '', 0, 0, NULL, 'tika', NULL, NULL, NULL, NULL, 0, NULL, NULL, '082170312658', '082170312658', 'greenshoppingbatam@telkomsel.co.id', 'jabodetabek', NULL, NULL, NULL, NULL, 'Q2PqffLa', '2017-08-28 09:21:01'),
(124, 'ridamastoer', '085102424363', 'ridamastoer@gmail.com', 'e175d81013b66ab9e26bf8104153a5ec', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(125, 'ruzzhepsport', '83829434670', 'shanybankai567@gmail.com', '', 0, 0, NULL, 'asep rusmana', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(126, 'saffan', '085705917934', 'saffanmuh@gmail.com', 'f1d87deaaf68be92cec84bf4541c2456', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(127, 'cobanamaasdasd', '08251190128e2e232423', 'coba@gmail.comas', '25d55ad283aa400af464c76d713c07ad', 1, 0, 'adresscobaasdasdsadasdsadsdasdaasdas', 'nama belakang sadsadsda asdasd', '470x672kurma6.jpg', 'coba@gmail.com', '79375.jpg', 'adasdasdsdawdsasdasd', 1, NULL, NULL, 'adjkbasdaskjbdsa', '3099001943', 'aadas@telkomsel.co.id', 'jaskbdkjasdbsadb', NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(128, NULL, 'asdas', 'dasdas', '2deb000b57bfac9d72c14d4ed967b572', 0, 0, 'saasd', 'asdas asdas', 'coba2.jpg', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'sadas', NULL, NULL, NULL, NULL, NULL, NULL),
(129, 'tidakada', '0822514619101928', 'tidakada@gmail.com', 'f8e91de987eb30875899545cd84f56c4', 0, 0, 'tidakadaaddress', 'tidak ada', 'coba10.jpg', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'tidakadalocation', NULL, NULL, NULL, NULL, NULL, NULL),
(130, 'AdminMTT', '082927', 'adminmtt@gmail.com', 'AdminMTT', 1, 1, 'jl kuningan barat 1, jaksel', 'Admintt', NULL, 'admin mtt', NULL, 'kanjsjknasnklsaasdasd', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_merchant_google`
--

CREATE TABLE `user_merchant_google` (
  `id` int(11) NOT NULL,
  `oauth_provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `oauth_uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `user_merchant_google`
--

INSERT INTO `user_merchant_google` (`id`, `oauth_provider`, `oauth_uid`, `first_name`, `last_name`, `email`, `gender`, `locale`, `picture`, `link`, `created`, `modified`) VALUES
(1, 'google', '104261500942024268827', 'qomarullah', 'qomarullah', 'qomarullah.mail@gmail.com', 'male', 'in', 'https://lh6.googleusercontent.com/-3VwzkxjTI5s/AAAAAAAAAAI/AAAAAAAAAL0/Wp-Jy2gfGcg/photo.jpg', 'https://plus.google.com/104261500942024268827', '2017-05-19 15:33:57', '2017-05-19 23:11:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_rating`
--

CREATE TABLE `user_rating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `review` text NOT NULL,
  `rate` int(11) NOT NULL DEFAULT '0',
  `created_at` bigint(20) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `wishlist_merchant`
--

CREATE TABLE `wishlist_merchant` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `wishlist_merchant`
--

INSERT INTO `wishlist_merchant` (`id`, `id_user`, `merchant_id`) VALUES
(4, 95, 3),
(28, 95, 14),
(29, 95, 13),
(50, 1, 35);

-- --------------------------------------------------------

--
-- Struktur dari tabel `wishlist_product`
--

CREATE TABLE `wishlist_product` (
  `id` int(5) NOT NULL,
  `id_user` int(5) NOT NULL,
  `product_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `wishlist_product`
--

INSERT INTO `wishlist_product` (`id`, `id_user`, `product_id`) VALUES
(171, 95, 6),
(173, 95, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_version`
--
ALTER TABLE `app_version`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_table_orders_item` (`order_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_cart`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique` (`name`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discussion`
--
ALTER TABLE `discussion`
  ADD PRIMARY KEY (`id_discussion`);

--
-- Indexes for table `fcm`
--
ALTER TABLE `fcm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merchant`
--
ALTER TABLE `merchant`
  ADD KEY `id` (`id`);

--
-- Indexes for table `news_info`
--
ALTER TABLE `news_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id_notification`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD UNIQUE KEY `product_id` (`product_id`,`category_id`),
  ADD KEY `fk_product_category_1` (`product_id`),
  ADD KEY `fk_product_category_2` (`category_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD KEY `fk_table_images` (`product_id`);

--
-- Indexes for table `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_order_detail`
--
ALTER TABLE `product_order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_table_orders_item` (`order_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_username` (`username`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- Indexes for table `user_merchant`
--
ALTER TABLE `user_merchant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_merchant_google`
--
ALTER TABLE `user_merchant_google`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_rating`
--
ALTER TABLE `user_rating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist_merchant`
--
ALTER TABLE `wishlist_merchant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist_product`
--
ALTER TABLE `wishlist_product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_version`
--
ALTER TABLE `app_version`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id_cart` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;
--
-- AUTO_INCREMENT for table `discussion`
--
ALTER TABLE `discussion`
  MODIFY `id_discussion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `fcm`
--
ALTER TABLE `fcm`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=568;
--
-- AUTO_INCREMENT for table `merchant`
--
ALTER TABLE `merchant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `news_info`
--
ALTER TABLE `news_info`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id_notification` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;
--
-- AUTO_INCREMENT for table `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT for table `product_order_detail`
--
ALTER TABLE `product_order_detail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_merchant`
--
ALTER TABLE `user_merchant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;
--
-- AUTO_INCREMENT for table `user_merchant_google`
--
ALTER TABLE `user_merchant_google`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_rating`
--
ALTER TABLE `user_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wishlist_merchant`
--
ALTER TABLE `wishlist_merchant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `wishlist_product`
--
ALTER TABLE `wishlist_product`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `fk_product_category_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_product_category_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `fk_table_images` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `product_order_detail`
--
ALTER TABLE `product_order_detail`
  ADD CONSTRAINT `fk_table_orders_item` FOREIGN KEY (`order_id`) REFERENCES `product_order` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
