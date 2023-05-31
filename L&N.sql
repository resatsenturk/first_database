-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 30 May 2023, 06:36:40
-- Sunucu sürümü: 10.4.25-MariaDB
-- PHP Sürümü: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `ln`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `arac_cins`
--

CREATE TABLE `arac_cins` (
  `arac_cins_id` int(11) NOT NULL,
  `arac_cins_adi` varchar(50) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `arac_cins`
--

INSERT INTO `arac_cins` (`arac_cins_id`, `arac_cins_adi`) VALUES
(1, 'Bisiklet'),
(2, 'At Arabası'),
(3, 'Motorlu Bisiklet'),
(4, 'Motosiklet'),
(5, 'Otomobil'),
(6, 'Minibüs'),
(7, 'Kamyonet'),
(8, 'Kamyon'),
(9, 'Çekici'),
(10, 'Otobüs'),
(11, 'Traktör'),
(12, 'Arazi Taşıtı'),
(13, 'Özel Amaçlı Taşıt'),
(14, 'İş Makinesi'),
(15, 'Ambulans'),
(16, 'Tanker'),
(17, 'Tren'),
(18, 'Tramvay'),
(19, 'Diğer');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ceza`
--

CREATE TABLE `ceza` (
  `ceza_id` int(11) NOT NULL,
  `ceza_adi` varchar(50) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `ceza`
--

INSERT INTO `ceza` (`ceza_id`, `ceza_adi`) VALUES
(1, 'Yayalara Uygulanan'),
(2, 'Yolculara Uygulanan'),
(3, 'Sürücülere Uygulanan'),
(4, 'Araç Plakasına Uygulanan');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cins`
--

CREATE TABLE `cins` (
  `kaza_id` int(11) NOT NULL,
  `arac_cins_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `cins`
--

INSERT INTO `cins` (`kaza_id`, `arac_cins_id`) VALUES
(1, 15),
(2, 12);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kaza`
--

CREATE TABLE `kaza` (
  `kaza_id` int(11) NOT NULL,
  `sehir_id` int(11) NOT NULL,
  `kazaya_karisan_arac_sayisi` varchar(50) COLLATE utf32_turkish_ci NOT NULL,
  `kaza_turu_id` int(11) NOT NULL,
  `unsur_id` int(11) NOT NULL,
  `arac_cins_id` int(11) NOT NULL,
  `surucu_kusur_id` int(11) NOT NULL,
  `olus_turu_id` int(11) NOT NULL,
  `ceza_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_turkish_ci;

--
-- Tablo döküm verisi `kaza`
--

INSERT INTO `kaza` (`kaza_id`, `sehir_id`, `kazaya_karisan_arac_sayisi`, `kaza_turu_id`, `unsur_id`, `arac_cins_id`, `surucu_kusur_id`, `olus_turu_id`, `ceza_id`) VALUES
(1, 60, '0', 2, 3, 5, 15, 14, 2),
(2, 9, '3', 0, 0, 0, 0, 0, 0),
(3, 21, '3', 1, 1, 2, 11, 6, 4),
(4, 31, '1', 3, 5, 17, 1, 12, 0),
(5, 16, '2', 2, 1, 4, 4, 5, 3),
(6, 65, '3', 1, 3, 13, 9, 7, 4),
(7, 59, '1', 3, 3, 12, 6, 11, 0),
(8, 7, '2', 2, 2, 7, 10, 3, 1),
(9, 28, '1', 3, 1, 19, 3, 13, 3),
(10, 44, '3', 1, 5, 4, 15, 13, 0),
(11, 69, '4', 1, 2, 2, 11, 6, 4),
(12, 81, '3', 3, 5, 9, 5, 3, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kaza_ceza`
--

CREATE TABLE `kaza_ceza` (
  `ceza_id` int(11) NOT NULL,
  `kaza_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kaza_olus`
--

CREATE TABLE `kaza_olus` (
  `olus_turu_id` int(11) NOT NULL,
  `olus_adi` varchar(60) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kaza_olus`
--

INSERT INTO `kaza_olus` (`olus_turu_id`, `olus_adi`) VALUES
(1, 'Karşılıklı Çarpışma'),
(2, 'Arkadan Çarpma'),
(3, 'Yandan Çarpma'),
(4, 'Yan Yana Çarpışma'),
(5, 'Duran Araca Çarpma'),
(6, 'Zincirleme Çarpışma'),
(7, 'Çoklu Çarpışma'),
(8, 'Engel/Cisim ile Çarpışma'),
(9, 'Yayaya Çarpma'),
(10, 'Hayvana Çarpma'),
(11, 'Devrilme/Savrulma/Takla'),
(12, 'Yoldan Çıkma'),
(13, 'Araçtan İnsan Düşmesi'),
(14, 'Araçtan Cisim Düşmesi'),
(15, 'Park Etmiş Araca Çarpma');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kaza_turu`
--

CREATE TABLE `kaza_turu` (
  `kaza_turu_id` int(11) NOT NULL,
  `tur_adi` varchar(50) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kaza_turu`
--

INSERT INTO `kaza_turu` (`kaza_turu_id`, `tur_adi`) VALUES
(1, 'Ölümlü Kaza'),
(2, 'Yaralanmalı Kaza'),
(3, 'Maddi Hasarlı Kaza');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kaza_unsur`
--

CREATE TABLE `kaza_unsur` (
  `kaza_id` int(11) NOT NULL,
  `unsur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kaza_unsur`
--

INSERT INTO `kaza_unsur` (`kaza_id`, `unsur_id`) VALUES
(1, 1),
(8, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `konum`
--

CREATE TABLE `konum` (
  `sehir_id` int(11) NOT NULL,
  `sehir_adi` varchar(50) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `konum`
--

INSERT INTO `konum` (`sehir_id`, `sehir_adi`) VALUES
(1, 'Adana'),
(2, 'Adıyaman'),
(3, 'Afyonkarahisar'),
(4, 'Ağrı'),
(5, 'Aksaray'),
(6, 'Amasya'),
(7, 'Ankara'),
(8, 'Antalya'),
(9, 'Ardahan'),
(10, 'Artvin'),
(11, 'Aydın'),
(12, 'Balıkesir'),
(13, 'Bartın'),
(14, 'Batman'),
(15, 'Bayburt'),
(16, 'Bilecik'),
(17, 'Bingöl'),
(18, 'Bitlis'),
(19, 'Bolu'),
(20, 'Burdur'),
(21, 'Bursa'),
(22, 'Çanakkale'),
(23, 'Çankırı'),
(24, 'Çorum'),
(25, 'Denizli'),
(26, 'Diyarbakır'),
(27, 'Düzce'),
(28, 'Edirne'),
(29, 'Elazığ'),
(30, 'Erzincan'),
(31, 'Erzurum'),
(32, 'Eskişehir'),
(33, 'Gaziantep'),
(34, 'Giresun'),
(35, 'Gümüşhane'),
(36, 'Hakkari'),
(37, 'Hatay'),
(38, 'Iğdır'),
(39, 'Isparta'),
(40, 'İstanbul'),
(41, 'İzmir'),
(42, 'Kahramanmaraş'),
(43, 'Karabük'),
(44, 'Karaman'),
(45, 'Kars'),
(46, 'Kastamonu'),
(47, 'Kayseri'),
(48, 'Kırıkkale'),
(49, 'Kırklareli'),
(50, 'Kırşehir'),
(51, 'Kilis'),
(52, 'Kocaeli'),
(53, 'Konya'),
(54, 'Kütahya'),
(55, 'Malatya'),
(56, 'Manisa'),
(57, 'Mardin'),
(58, 'Mersin'),
(59, 'Muğla'),
(60, 'Muş'),
(61, 'Nevşehir'),
(62, 'Niğde'),
(63, 'Ordu'),
(64, 'Osmaniye'),
(65, 'Rize'),
(66, 'Sakarya'),
(67, 'Samsun'),
(68, 'Siirt'),
(69, 'Sinop'),
(70, 'Sivas'),
(71, 'Şanlıurfa'),
(72, 'Şırnak'),
(73, 'Tekirdağ'),
(74, 'Tokat'),
(75, 'Trabzon'),
(76, 'Tunceli'),
(77, 'Uşak'),
(78, 'Van'),
(79, 'Yalova'),
(80, 'Yozgat'),
(81, 'Zonguldak');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kusur`
--

CREATE TABLE `kusur` (
  `kaza_id` int(11) NOT NULL,
  `surucu_kusur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `olus`
--

CREATE TABLE `olus` (
  `kaza_id` int(11) NOT NULL,
  `olus_turu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `surucu_kusur`
--

CREATE TABLE `surucu_kusur` (
  `surucu_kusur_id` int(11) NOT NULL,
  `surucu_kusur_adi` varchar(150) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `surucu_kusur`
--

INSERT INTO `surucu_kusur` (`surucu_kusur_id`, `surucu_kusur_adi`) VALUES
(1, 'Araç hızını yol, hava ve trafiğin gerektirdiği şartlara uydurmamak'),
(2, 'Kavşak, geçit ve kaplamanın dar olduğu yerlerde geçiş önceliğine uymamak'),
(3, 'Şerit izleme ve değiştirme kurallarına uymamak'),
(4, 'Arkadan Çarpma'),
(5, 'Doğrultu Değiştirme (dönüş) kurallarına uymamak'),
(6, 'Manevraları düzenleyen genel şartlara uymamak'),
(7, 'Kırmızı ışık veya görevlinin dur işaretinde durmamak'),
(8, 'Taşıt giremez trafik işareti bulunan yerlere girmek'),
(9, 'Trafik güvenliği ile ilgili diğer kurallara uymamak'),
(10, 'Yaya ve okul geçitlerinde yavaşlamamak, yayalara geçiş hakkı vermemek'),
(11, 'Alkollü olarak araç kullanmak'),
(12, 'Aşırı hızla araç kullanmak'),
(13, 'Geçme yasağı olan yerlerden geçmek'),
(14, 'Hatalı şekilde veya yasak olan yerlere park etmek'),
(15, 'DİĞER');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tur`
--

CREATE TABLE `tur` (
  `kaza_id` int(11) NOT NULL,
  `kaza_turu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `unsur`
--

CREATE TABLE `unsur` (
  `unsur_id` int(11) NOT NULL,
  `unsur_adi` varchar(150) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `unsur`
--

INSERT INTO `unsur` (`unsur_id`, `unsur_adi`) VALUES
(1, 'Sürücü'),
(2, 'Yaya'),
(3, 'Yolcu'),
(4, 'Araç'),
(5, 'Yol');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `arac_cins`
--
ALTER TABLE `arac_cins`
  ADD PRIMARY KEY (`arac_cins_id`);

--
-- Tablo için indeksler `ceza`
--
ALTER TABLE `ceza`
  ADD PRIMARY KEY (`ceza_id`);

--
-- Tablo için indeksler `cins`
--
ALTER TABLE `cins`
  ADD KEY `kaza_id` (`kaza_id`),
  ADD KEY `arac_cins_id` (`arac_cins_id`);

--
-- Tablo için indeksler `kaza`
--
ALTER TABLE `kaza`
  ADD PRIMARY KEY (`kaza_id`),
  ADD KEY `sehir_id` (`sehir_id`);

--
-- Tablo için indeksler `kaza_ceza`
--
ALTER TABLE `kaza_ceza`
  ADD KEY `kaza_id` (`kaza_id`),
  ADD KEY `ceza_id` (`ceza_id`);

--
-- Tablo için indeksler `kaza_olus`
--
ALTER TABLE `kaza_olus`
  ADD PRIMARY KEY (`olus_turu_id`);

--
-- Tablo için indeksler `kaza_turu`
--
ALTER TABLE `kaza_turu`
  ADD PRIMARY KEY (`kaza_turu_id`);

--
-- Tablo için indeksler `kaza_unsur`
--
ALTER TABLE `kaza_unsur`
  ADD KEY `kaza_id` (`kaza_id`),
  ADD KEY `unsur_id` (`unsur_id`);

--
-- Tablo için indeksler `konum`
--
ALTER TABLE `konum`
  ADD PRIMARY KEY (`sehir_id`);

--
-- Tablo için indeksler `kusur`
--
ALTER TABLE `kusur`
  ADD KEY `kaza_id` (`kaza_id`),
  ADD KEY `surucu_kusur_id` (`surucu_kusur_id`);

--
-- Tablo için indeksler `olus`
--
ALTER TABLE `olus`
  ADD KEY `kaza_id` (`kaza_id`),
  ADD KEY `olus_turu_id` (`olus_turu_id`);

--
-- Tablo için indeksler `surucu_kusur`
--
ALTER TABLE `surucu_kusur`
  ADD PRIMARY KEY (`surucu_kusur_id`);

--
-- Tablo için indeksler `tur`
--
ALTER TABLE `tur`
  ADD KEY `kaza_id` (`kaza_id`),
  ADD KEY `kaza_turu_id` (`kaza_turu_id`);

--
-- Tablo için indeksler `unsur`
--
ALTER TABLE `unsur`
  ADD PRIMARY KEY (`unsur_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `arac_cins`
--
ALTER TABLE `arac_cins`
  MODIFY `arac_cins_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Tablo için AUTO_INCREMENT değeri `ceza`
--
ALTER TABLE `ceza`
  MODIFY `ceza_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `kaza`
--
ALTER TABLE `kaza`
  MODIFY `kaza_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `kaza_olus`
--
ALTER TABLE `kaza_olus`
  MODIFY `olus_turu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `kaza_turu`
--
ALTER TABLE `kaza_turu`
  MODIFY `kaza_turu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `konum`
--
ALTER TABLE `konum`
  MODIFY `sehir_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Tablo için AUTO_INCREMENT değeri `surucu_kusur`
--
ALTER TABLE `surucu_kusur`
  MODIFY `surucu_kusur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `unsur`
--
ALTER TABLE `unsur`
  MODIFY `unsur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `cins`
--
ALTER TABLE `cins`
  ADD CONSTRAINT `cins_ibfk_1` FOREIGN KEY (`kaza_id`) REFERENCES `kaza` (`kaza_id`),
  ADD CONSTRAINT `cins_ibfk_2` FOREIGN KEY (`arac_cins_id`) REFERENCES `arac_cins` (`arac_cins_id`);

--
-- Tablo kısıtlamaları `kaza`
--
ALTER TABLE `kaza`
  ADD CONSTRAINT `kaza_ibfk_1` FOREIGN KEY (`sehir_id`) REFERENCES `konum` (`sehir_id`);

--
-- Tablo kısıtlamaları `kaza_ceza`
--
ALTER TABLE `kaza_ceza`
  ADD CONSTRAINT `kaza_ceza_ibfk_1` FOREIGN KEY (`kaza_id`) REFERENCES `kaza` (`kaza_id`),
  ADD CONSTRAINT `kaza_ceza_ibfk_2` FOREIGN KEY (`ceza_id`) REFERENCES `ceza` (`ceza_id`);

--
-- Tablo kısıtlamaları `kaza_unsur`
--
ALTER TABLE `kaza_unsur`
  ADD CONSTRAINT `kaza_unsur_ibfk_1` FOREIGN KEY (`kaza_id`) REFERENCES `kaza` (`kaza_id`),
  ADD CONSTRAINT `kaza_unsur_ibfk_2` FOREIGN KEY (`unsur_id`) REFERENCES `unsur` (`unsur_id`);

--
-- Tablo kısıtlamaları `kusur`
--
ALTER TABLE `kusur`
  ADD CONSTRAINT `kusur_ibfk_1` FOREIGN KEY (`kaza_id`) REFERENCES `kaza` (`kaza_id`),
  ADD CONSTRAINT `kusur_ibfk_2` FOREIGN KEY (`surucu_kusur_id`) REFERENCES `surucu_kusur` (`surucu_kusur_id`);

--
-- Tablo kısıtlamaları `olus`
--
ALTER TABLE `olus`
  ADD CONSTRAINT `olus_ibfk_1` FOREIGN KEY (`kaza_id`) REFERENCES `kaza` (`kaza_id`),
  ADD CONSTRAINT `olus_ibfk_2` FOREIGN KEY (`olus_turu_id`) REFERENCES `kaza_olus` (`olus_turu_id`);

--
-- Tablo kısıtlamaları `tur`
--
ALTER TABLE `tur`
  ADD CONSTRAINT `tur_ibfk_1` FOREIGN KEY (`kaza_id`) REFERENCES `kaza` (`kaza_id`),
  ADD CONSTRAINT `tur_ibfk_2` FOREIGN KEY (`kaza_turu_id`) REFERENCES `kaza_turu` (`kaza_turu_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
