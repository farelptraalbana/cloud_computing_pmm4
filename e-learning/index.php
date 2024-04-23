<!DOCTYPE html>
<html>

<head>
    <title>Login | E-Learnig</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <!-- Favicons -->
    <link href="../assets/img/clients/Tutwurihandayani.png" rel="icon">
    <link href="../assets/img/clients/Tutwurihandayani.png" rel="apple-touch-icon">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/webrtc-adapter/3.3.3/adapter.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.1.10/vue.min.js"></script>
    <script type="text/javascript" src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js"></script>
    <style>
        /* Center text vertically */
        .center-text {
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        /* Center placeholder text */
        input::placeholder {
            text-align: center;
        }
    </style>
</head>

<body>
    <form action="login.php" method="post">

        <h2><strong>Masuk E-Learning <br> SD Negeri 013 Tanjungpinang Barat</strong></h2>

        <?php if (isset($_GET['error'])) { ?>
            <p class="error"><?php echo $_GET['error']; ?></p>
        <?php } ?>

        <div class="row">
            <div class="col-md-6">
                <video id="preview" width="100%"></video>
            </div>
            <div class="col-md-6">
                <form method="post" class="form-horizontal">
                    <label class="center-text">SCAN QR CODE</label>
                    <input type="text" name="qrcode_text" id="text" readonyy="" placeholder="Masukkan Code QR" class="form-control" readonly> <br>
                    <button align="center"><a href="../index.php">Kembali</a></button>
                </form>
            </div>
        </div>
    </form>
    <script>
        let scanner = new Instascan.Scanner({
            video: document.getElementById('preview')
        });
        Instascan.Camera.getCameras().then(function(cameras) {
            if (cameras.length > 0) {
                scanner.start(cameras[0]);
            } else {
                alert('Tidak ada kamera yang ditemukan');
            }

        }).catch(function(e) {
            console.error(e);
        });

        scanner.addListener('scan', function(c) {
            document.getElementById('text').value = c;
            document.forms[0].submit();
        });
    </script>
</body>

</html>