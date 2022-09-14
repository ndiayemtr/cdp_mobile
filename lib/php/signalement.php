<?php
require 'connection.php';

$post = json_decode($_POST['data']);
$prenom = $post->prenom;
$nom = $post->nom;
//$telephone = $post->telephone;
$telephone = '77 111 11 11';
$objet = $post->objet;
$message_signalement = $post->message_signalement;
echo $telephone;
$msg = '';
$isok = false;


try {
    $req = $db->prepare("INSERT INTO signalement (`id`, `prenom`, `nom`, `telephone`, `objet`, `message_signalement`, `date_signalement`) VALUES (null,?,?,?,?,?, current_timestamp())");
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