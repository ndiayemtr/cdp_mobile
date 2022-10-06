class Plainte {
  String prenom;
  String nom;
  String telephone;
  String motif_plainte;
  String objet;
  String message_plainte;

  Plainte({
    required this.prenom,
    required this.nom,
    required this.telephone,
    required this.motif_plainte,
    required this.objet,
    required this.message_plainte,
  });

  factory Plainte.fromJson(Map<String, dynamic> json) {
    return Plainte(
      prenom: json['prenom'] as String,
      nom: json['nom'] as String,
      telephone: json['telephone'] as String,
      motif_plainte: json['motif_plainte'] as String,
      objet: json['objet'] as String,
      message_plainte: json['message_plainte'] as String,
    );
  }

  Map toMap() {
    return {
      "prenom": prenom,
      "nom": nom,
      "telephone": telephone,
      "motif_plainte": motif_plainte,
      "objet": objet,
      "message_plainte": message_plainte,
    };
  }
}
