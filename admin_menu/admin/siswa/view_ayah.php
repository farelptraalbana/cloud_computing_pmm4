<?php
if (isset($_GET['kode'])) {
	$sql_cek = "SELECT biodata_siswa.*, biodata_ayah.*
	FROM biodata_siswa
	INNER JOIN biodata_ayah ON biodata_siswa.id_siswa = biodata_ayah.id_siswa WHERE id_ayah='" . $_GET['kode'] . "'";
	$query_cek = mysqli_query($koneksi, $sql_cek);
	$data_cek = mysqli_fetch_array($query_cek, MYSQLI_BOTH);

	if ($data_cek) {
?>
		<div class="row text-center">
			<div align="center" class="col-md-8 mx-auto">
				<div class="card card-info">
					<div class="card-header">
						<h3 class="card-title">Detail Biodata ayah - <span style="color: white;"><?php echo $data_cek['nama_siswa']; ?></span></h3>
						<div class="card-tools">
						</div>
					</div>
					<div class="card-body p-0">
						<table class="table">
							<tbody>
								<tr>
									<td style="width: 180px">
										<b>Nama ayah</b>
									</td>
									<td>:
										<?php echo $data_cek['nama_ayah']; ?>
									</td>
								</tr>
								<tr>
									<td style="width: 180px">
										<b>Tempat Lahir</b>
									</td>
									<td>:
										<?php echo $data_cek['tempat_lahir_ayah']; ?>
									</td>
								</tr>
								<tr>
									<td style="width: 180px">
										<b>Tanggal Lahir</b>
									</td>
									<td>:
										<?php echo $data_cek['tgl_lahir_ayah']; ?>
									</td>
								</tr>
								<tr>
									<td style="width: 180px">
										<b>Alamat</b>
									</td>
									<td>:
										<?php echo $data_cek['alamat_ayah']; ?>
									</td>
								</tr>
								<tr>
									<td style="width: 180px">
										<b>No Hp</b>
									</td>
									<td>:
										<?php echo $data_cek['no_hp_ayah']; ?>
									</td>
								</tr>
								<tr>
									<td style="width: 180px">
										<b>Pekerjaan ayah</b>
									</td>
									<td>:
										<?php echo $data_cek['pekerjaan_ayah']; ?>
									</td>
								</tr>
								<tr>
									<td style="width: 180px">
										<b>Pendidikan Terakhir</b>
									</td>
									<td>:
										<?php echo $data_cek['pend_terakhir_ayah']; ?>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="card-footer">
							<a href="?page=data-siswa" class="btn btn-warning">Kembali</a>
							<a href="./report/cetak-ayah.php?nip=<?php echo $data_cek['id_ayah']; ?>" target=" _blank" title="Cetak Data Siswa" class="btn btn-primary">Print</a>
						</div>
					</div>
				</div>
			</div>
		</div>
<?php
	} else {
		// Data ayah Tidak ditemukan
		echo '<div class="row text-center">';
		echo '<div align="center" class="col-md-8 mx-auto">';
		echo '<div class="card card-info">';
		echo '<div class="card-header">';
		echo '<h3 class="card-title">Detail Biodata Ayah</h3>';
		echo '<div class="card-tools"></div>';
		echo '</div>';
		echo '<div class="card-body">';
		echo '<p>Data Ayah Tidak ditemukan. Silakan kembali ke halaman sebelumnya.</p>';
		echo '</div>';
		echo '<div class="card-footer">';
		echo '<a href="?page=data-siswa" class="btn btn-warning">Kembali</a>';
		echo '</div>';
		echo '</div>';
		echo '</div>';
		echo '</div>';
	}
}
?>