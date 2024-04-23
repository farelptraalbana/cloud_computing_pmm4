<?php
// Menghubungkan ke database
$koneksi = mysqli_connect("localhost", "root", "", "ppdb_sd13");

// Memeriksa koneksi
if (mysqli_connect_errno()) {
    echo "Koneksi database gagal: " . mysqli_connect_error();
    exit();
}

// Melakukan query untuk mengambil jumlah data materi pembelajaran
$query_count = "SELECT COUNT(*) as total FROM e_learning WHERE kategori = 'materi'";
$result_count = mysqli_query($koneksi, $query_count);
$row_count = mysqli_fetch_assoc($result_count);
$total_materi = $row_count['total'];

// Melakukan query untuk mengambil data materi pembelajaran
$query = "SELECT * FROM e_learning WHERE kategori = 'materi'";
$result = mysqli_query($koneksi, $query);

// Memeriksa apakah query berhasil dieksekusi
if (!$result) {
    // Jika query gagal, tampilkan pesan error atau lakukan penanganan yang sesuai
    echo "Gagal mengambil data materi pembelajaran: " . mysqli_error($koneksi);
    exit();
}

// Menutup koneksi database
mysqli_close($koneksi);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>E-LEARNING</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <link rel="stylesheet" href="fontawesome-free-5/css/all.min.css">

    <!-- Favicons -->
    <link href="../assets/img/clients/Tutwurihandayani.png" rel="icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css?= time();?>" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="../assets/css/style.css?= time();?>" rel="stylesheet">

    <style>
        /*--------------------------------------------------------------
    # Cta
    --------------------------------------------------------------*/
        .cta {
            background: linear-gradient(rgba(40, 58, 90, 0.9), rgba(40, 58, 90, 0.9)), url("../assets/img/gedung.png") fixed center center;
            background-size: cover;
            padding: 120px 0;
        }

        .cta h3 {
            color: #fff;
            font-size: 28px;
            font-weight: 700;
        }

        .cta p {
            color: #fff;
        }

        .cta .cta-btn {
            font-family: "Jost", sans-serif;
            font-weight: 500;
            font-size: 16px;
            letter-spacing: 1px;
            display: inline-block;
            padding: 12px 40px;
            border-radius: 50px;
            transition: 0.5s;
            margin: 10px;
            border: 2px solid #fff;
            color: #fff;
        }

        .cta .cta-btn:hover {
            background: #47b2e4;
            border: 2px solid #47b2e4;
        }

        @media (min-width: 769px) {
            .cta .cta-btn-container {
                display: flex;
                align-items: center;
                justify-content: flex-end;
            }
        }

        /*--------------------------------------------------------------
            # Features
        --------------------------------------------------------------*/
        .features {
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            padding-top: 20px;
        }

        .features .row {
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid #ddd;
            border-radius: 5px;
            margin: 10px 0;
        }

        .features .col-lg-6 {
            display: flex;
            flex-direction: column;
        }

        .features .icon-box {
            padding-left: 15px;
            text-align: left;
        }

        .features .icon-box h4 {
            font-size: 20px;
            font-weight: 700;
            margin: 5px 0 10px 0;
        }

        .features .icon-box i {
            font-size: 48px;
            color: #ffc451;
        }

        .features .icon-box p {
            font-size: 15px;
            color: #848484;
            margin: 0;
        }

        .features .image {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px;
            box-sizing: border-box;
        }

        .features .image img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }

        .btn-download-certificate {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 10px 20px;
            background-color: red;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }

        .btn-download-certificate:hover {
            background-color: rgb(9, 207, 9);
            color: #fff;
        }

        .features .icon-box .download i {
            font-size: 15px;
            color: #fff;
            /* Menambah margin agar ikon terpisah dari teks */
        }

        .features .icon-box .date i {
            font-size: 15px;
            color: black;
        }

        @media (max-width: 767px) {
            .download {
                margin-bottom: 5px;
                font-size: 15px
            }
        }

        /*--------------------------------------------------------------
# Section Title
--------------------------------------------------------------*/
        .section-title1 {
            padding-bottom: 40px;
        }

        .section-title1 h2 {
            font-size: 14px;
            font-weight: 500;
            padding: 0;
            line-height: 1px;
            margin: 0 0 5px 0;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: #aaaaaa;
            font-family: "Poppins", sans-serif;
        }

        .section-title1 h5 {
            padding: 0;
            line-height: 1px;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: black;
            font-family: "Poppins", sans-serif;
        }

        .section-title1 h5::after {
            content: "";
            width: 120px;
            height: 2px;
            display: inline-block;
            background: #ffde9e;
            margin: 4px 10px;
        }


        .section-title1 h2::after {
            content: "";
            width: 120px;
            height: 2px;
            display: inline-block;
            background: #ffde9e;
            margin: 4px 10px;
        }

        .section-title1 p {
            margin: 0;
            margin: 0;
            font-size: 36px;
            font-weight: 700;
            text-transform: uppercase;
            font-family: "Poppins", sans-serif;
            color: #151515;
        }

        @media (max-width: 767px) {
            .section-title1 h5 {
                margin-top: 30px;
                margin-bottom: -15px;
            }
        }
    </style>

</head>

<body>

    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top d-flex align-items-center">
        <div class="container d-flex justify-content-between">

            <div class="logo">
                <a href="konten_yt.php"><img src="../assets/img/clients/sidikatbiru.png" alt="" class="img-fluid" width="150" height="100"></a>
            </div>

            <nav id="navbar" class="navbar">
                <ul>
                    <li><a class="getstarted scrollto" href="logout.php">Logout</a></li>
                </ul>
                <i class="bi bi-list mobile-nav-toggle text-dark"></i>

            </nav><!-- .navbar -->

        </div>
    </header><!-- #header -->

    <main id="main">
        <section id="mitra" class="services section-bg">
            <div class="container" data-aos="fade-up">
                <div class="section-title">
                    <h2 class="mt-4">Materi Pembelajaran</h2>
                    <h5>Materi yang tersedia merupakan materi yang diambil dari berbagai sumber media pembelajaran ayo lihat dan pelajari!</h5>
                </div>
                <div class="section-title1 mt-5">
                    <h2>Materi Pembelajaran</h2>
                    <p>Silahkan Lihat Materi Pembelajaran</p>
                    <h2>Total Materi: <?php echo $total_materi; ?></h2>
                </div>
            </div>
        </section>
        <!-- Kode section Features di sini -->
        <section id="features" class="features">
            <div class="container" data-aos="fade-up">
                <?php while ($row = mysqli_fetch_assoc($result)) : ?>
                    <div class="row">
                        <div class="col-lg-12" data-aos="fade-left" data-aos-delay="100">
                            <div class="icon-box mt-5 mt-lg-0" data-aos="zoom-in" data-aos-delay="150">
                                <i class="bx bx-receipt"></i>
                                <h4>Judul Materi: <?php echo $row['judul_konten']; ?></h4>
                                <div class="date mt-2">
                                    <?php if ($row['link_yt'] != '-') : ?>
                                        <a href="<?php echo $row['link_yt']; ?>" target="_blank">Link Materi - Klik Disini</a>
                                    <?php else : ?>
                                        Link Materi: <?php echo $row['link_yt']; ?>
                                    <?php endif; ?>
                                </div>
                                <div class="download mt-2 mb-2">
                                    <a href="../admin_menu/file_materi/<?php echo $row['file']; ?>" download="<?php echo $row['file']; ?>" class="btn-download-certificate">
                                        <i class="fas fa-download"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php endwhile; ?>
            </div>
        </section>
    </main>

    <footer id="footer">
        <div class="footer-newsletter">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <img src="../assets/img/clients/sidikathitam.png" class="img-fluid animated" alt="">
                    </div>
                </div>
            </div>
        </div>

    </footer>

    <!-- ======= Footer ======= -->
    <footer id="footerr">

        <div class="container footer-bottom clearfix">
            <div class="copyright">
                &copy; Copyright <strong><span>SDN 013 Tanjungpinang Barat</span></strong>.
            </div>
            <div class="creditss">
                Designed by<a href="#">PKM-PM24</a>
            </div>
        </div>
    </footer><!-- End Footer -->
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>

</body>

</html>