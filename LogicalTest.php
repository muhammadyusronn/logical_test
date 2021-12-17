<?php
function soalPertama()
{
    $aplikasi[1] = 'gtAkademik';
    $aplikasi[2] = 'gtFinansi';
    $aplikasi[3] = 'gtPerizinan';
    $aplikasi[4] = 'eCampuz';
    $aplikasi[5] = 'eOviz';
    $i = 1;
    while ($i <= count($aplikasi)) {
        echo $aplikasi[$i] . '<br>';
        $i++;
    }
}

function soalKedua()
{
    $conn = mysqli_connect('localhost', 'root', '', 'db_tes');
    if (!$conn) {
        echo 'Connection failed';
        echo '<br>';
    }
    $qwery = "SELECT tbl_mahasiswa.mhs_nama as nama FROM tbl_mahasiswa,tbl_mahasiswa_nilai,tbl_matakuliah 
    WHERE tbl_mahasiswa.mhs_id=tbl_mahasiswa_nilai.mhs_id AND 
    tbl_mahasiswa_nilai.mk_id=(SELECT tbl_matakuliah.mk_id FROM tbl_matakuliah WHERE tbl_matakuliah.mk_kode='MK303') 
    AND tbl_matakuliah.mk_id=(SELECT tbl_matakuliah.mk_id FROM tbl_matakuliah WHERE tbl_matakuliah.mk_kode='MK303') ORDER BY tbl_mahasiswa_nilai.nilai DESC LIMIT 1";
    $sql = mysqli_query($conn, $qwery);
    $data = mysqli_fetch_array($sql);
    echo 'Mahasiswa dengan nilai tertinggi mata kuliah MK303 adalah ' . $data['nama'];
}

function soalKetiga($pembilang, $pembagi)
{
    if ($pembilang < 0) {
        echo 'Bilangan harus bernilai positif';
    } else {
        $hasil = 0;
        $x = $pembagi;
        while ($x <= $pembilang) {
            $x = $x + $pembagi;
            $hasil++;
        }
        echo $hasil;
    }
}

function soalKeempat($nilai = 0)
{
    for ($i = 1; $i <= $nilai; $i++) {
        if ($i % 3 == 0 && $i % 5 == 0) {
            echo 'FooBar';
        } else 
        if ($i % 3 == 0) {
            echo 'Foo';
        } else
        if ($i % 5 == 0) {
            echo 'Bar';
        } else {
            echo $i;
        }
    }
}
echo 'Soal Pertama : ';
echo "<br>";
soalPertama();
echo "<br>";
echo 'Soal Kedua : ';
echo "<br>";
soalKedua();
echo "<br>";
echo 'Soal Ketiga : ';
echo "<br>";
soalKetiga(7, 2);
echo "<br>";
echo 'Soal Keempat : ';
echo "<br>";
soalKeempat(50);
