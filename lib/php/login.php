<?php
require 'connection.php';

$email = $_POST['email'];
$password = md5($_POST['password']);

try {
    if (isset($email, $password)) {
        $req = $db->prepare("SELECT * FROM users WHERE email = ? AND password = ?");
        $req->execute(array($email, $password));
        $exist = $req->rowCount();
        if ($exist == 1) {
            $user = $req->fetch();
            $sucess = 1;
            $msg = "vous etes conncetes";
        } else {
            $msg = "email ou mot de mot n'existe deja";
            $sucess = 0;
        }
    } else {
        $msg = "Veillez remplir tous les champs";
        $sucess = 0;
    }
} catch (\Throwable $th) {
    $sucess = 0;
    $msg = 'Erreur: ' . $th->getMessage();
}

echo json_encode([
    "data" => [
        $msg,
        $sucess,
        $user
    ]
]);