<?php
require 'connection.php';

$prenom = $_POST['prenom'];
$nom = $_POST['nom'];
$email = $_POST['email'];
$password = md5($_POST['password']);

try {
    if (isset($prenom, $nom, $email, $password)) {
        $req = $db->prepare("SELECT * FROM users WHERE email = ?");
        $req->execute(array($email));
        $mailExist = $req->rowCount();
        if ($mailExist == 0) {
            $req = $db->prepare("INSERT INTO users VALUES (null,?,?,?,?)");
            $req->execute(array($prenom, $nom, $email, $password));

            if ($req) {
                $msg = "Inscription reussi";
                $sucess = 1;
            } else {
                $sucess = 0;
                $msg = "erreur dans l'inscription";
            }
        } else {
            $msg = "email existe deja";
        }
    }
} catch (\Throwable $th) {
    $sucess = 0;
    $msg = 'Erreur: ' . $th->getMessage();
}

echo json_encode([
    "data" => [
        $msg,
        $sucess,
    ]
]);