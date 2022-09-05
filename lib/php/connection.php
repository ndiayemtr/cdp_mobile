<?php
$host = "localhost";
$dbname = "yhfwsmyc_dbn_cdpmobile";
$dbuser = "yhfwsmyc_dbu_cdpmobil";
$dbpassword = "@!BFqUDVmH8QzXp";

try {
    $db = new PDO("mysql:host=$host; dbname=$dbname", $dbuser, $dbpassword);
    echo "connection reussi....";
} catch (\Throwable $th) {
    echo 'Erreur: ' . $th->getMessage();
}