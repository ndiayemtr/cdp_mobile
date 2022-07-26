<?php
require 'connection.php';

$post = json_decode($_POST['data']);
$prenom = $post->prenom;
$nom = $post->nom;
$telephone = $post->telephone;
$objet = $post->objet;
$message_signalement = $post->message_signalement;
$msg = '';
$isok = false;


try {
    $req = $db->prepare("INSERT INTO signalement VALUES (null,?,?,?,?,?)");
    $req->execute(array($prenom, $nom, $telephone, $objet, $message_signalement));

    if ($req) {
        $msg = "Signalement envoyé";
        $isok = true;
    } else {
        $msg = "echec de l'envoi";
    }
} catch (\Throwable $th) {
    $msg = 'Erreur: ' . $th->getMessage();
}

echo json_encode([
    "data" => [
        $isok,
        $msg,
    ]
]);