<?php
$host = "localhost";
$dbname = "id19382762_dbn_cdpmobile";
$dbuser = "id19382762_dbu_cdpmobile";
$dbpassword = "4F7ZtdEx*WLz(u(4J437vgrV";

try {
    $db = new PDO("mysql:host=$host; dbname=$dbname", $dbuser, $dbpassword);
    echo "connection reussi....";
} catch (\Throwable $th) {
    echo 'Erreur: ' . $th->getMessage();
}