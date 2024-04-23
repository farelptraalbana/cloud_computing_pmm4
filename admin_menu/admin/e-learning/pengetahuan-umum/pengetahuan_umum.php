<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<style>
		thead .tabel {
			display: flex;
			justify-content: center;
			align-items: center;
			text-align: center;
		}

		.tabel-aksi {
			display: flex;
			justify-content: center;
			align-items: center;
			text-align: center;
		}
	</style>
</head>

<body>
	<div align="center" class="card card-info">
		<div class="card-header">
			<h3 class="card-title">
				<i class="fa fa-table"></i> Muatan Pengetahuan Umum
			</h3>
		</div>
	</div>

	<?php
	$sql = $koneksi->query("SELECT count(id_learning) as materi from e_learning where kategori='materi'");
	while ($data = $sql->fetch_assoc()) {
	
		$materi = $data['materi'];
	}
	?>

	<div class="row">
		
		<div class="col-lg-3 col-6">
			<!-- small box -->
			<div class="small-box bg-purple">
				<div class="inner">
					<h3>
						<?php echo $materi;  ?>
					</h3>

					<p>Materi Pembelajaran</p>
				</div>
				<div class="icon">
					<i class="ion ion-ios-paper"></i>
				</div>
				<a href="?page=materi-pembelajaran" class="small-box-footer">Selengkapnya
					<i class="fas fa-arrow-circle-right"></i>
				</a>
			</div>
		</div>
		
	</div>
</body>

</html>