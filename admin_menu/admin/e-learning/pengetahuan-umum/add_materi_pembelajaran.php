<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fa fa-edit"></i> Tambah Data</h3>
    </div>
    <form action="" method="post" enctype="multipart/form-data"> <!-- Menambahkan enctype -->
        <div class="card-body">

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Judul Materi</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="judul_konten" name="judul_konten" placeholder="Masukkan Judul Materi" required>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Link Materi</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="link_yt" name="link_yt" placeholder="Masukkan Link Materi" required>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">File</label>
                <div class="col-sm-6">
                    <input type="file" class="form-control" id="file" name="file" accept=".pdf" required> <!-- Mengubah type menjadi file -->
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Kategori</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="kategori" name="kategori" value="Materi" readonly>
                    <input type="hidden" name="kategori" value="materi">
                </div>
            </div>

        </div>
        <div class="card-footer">
            <input type="submit" name="Simpan" value="Simpan" class="btn btn-info">
            <a href="?page=konten-yt" title="Kembali" class="btn btn-secondary">Batal</a>
        </div>
    </form>
</div>
<?php
if (isset($_POST['Simpan'])) {
    // Mendapatkan informasi file yang diunggah
    $file_name = $_FILES['file']['name'];
    $file_tmp = $_FILES['file']['tmp_name'];
    $file_size = $_FILES['file']['size'];
    $file_error = $_FILES['file']['error'];

    // Memeriksa apakah file berhasil diunggah
    if ($file_error === 0) {
        // Pindahkan file ke direktori yang ditentukan
        $upload_directory = 'file_materi/';
        $file_destination = $upload_directory . $file_name;
        
        // Memeriksa apakah file dengan nama yang sama sudah ada
        if (file_exists($file_destination)) {
            echo "<script>
                Swal.fire({
                    title: 'File Sudah Ada',
                    text: 'Silakan ubah nama file atau unggah file dengan nama yang berbeda.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
            </script>";
        } else {
            // Jika belum ada file dengan nama yang sama, pindahkan file
            if (move_uploaded_file($file_tmp, $file_destination)) {
                // Mulai proses simpan data
                $judul_konten = $_POST['judul_konten'];
                $link_yt = $_POST['link_yt'];
                $kategori = $_POST['kategori'];

                $sql_simpan = "INSERT INTO e_learning (judul_konten, link_yt, file, kategori) VALUES (
                    '$judul_konten',
                    '$link_yt',
                    '$file_name',
                    '$kategori'
                )";

                // Melanjutkan dengan kueri SQL
                $query_simpan = mysqli_query($koneksi, $sql_simpan);
                mysqli_close($koneksi);

                // Menangani kesalahan jika kueri tidak berhasil
                if ($query_simpan) {
                    echo "<script>
                        Swal.fire({
                            title: 'Tambah Data Berhasil',
                            text: '',
                            icon: 'success',
                            confirmButtonText: 'OK'
                        }).then((result) => {
                            if (result.value) {
                                window.location = 'data.php?page=materi-pembelajaran';
                            }
                        });
                    </script>";
                } else {
                    echo "<script>
                        Swal.fire({
                            title: 'Tambah Data Gagal',
                            text: '',
                            icon: 'error',
                            confirmButtonText: 'OK'
                        }).then((result) => {
                            if (result.value) {
                                window.location = 'data.php?page=add-materi-pembelajaran';
                            }
                        });
                    </script>";
                }
            } else {
                // Penanganan kesalahan jika file gagal dipindahkan
                echo "<script>
                    Swal.fire({
                        title: 'Gagal Mengunggah File',
                        text: 'Maaf, terjadi kesalahan saat mengunggah file.',
                        icon: 'error',
                        confirmButtonText: 'OK'
                    });
                </script>";
            }
        }
    } else {
        // Penanganan kesalahan jika file gagal diunggah
        echo "<script>
            Swal.fire({
                title: 'Gagal Mengunggah File',
                text: 'Maaf, terjadi kesalahan saat mengunggah file.',
                icon: 'error',
                confirmButtonText: 'OK'
            });
        </script>";
    }
}
?>