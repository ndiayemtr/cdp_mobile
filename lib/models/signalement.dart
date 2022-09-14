class Signalement {
  String prenom;
  String nom;
  String telephone;
  String objet;
  String message_signalement;

  Signalement({
    required this.prenom,
    required this.nom,
    required this.telephone,
    required this.objet,
    required this.message_signalement,
  });

  factory Signalement.fromJson(Map<String, dynamic> json) {
    return Signalement(
      prenom: json['prenom'] as String,
      nom: json['nom'] as String,
      telephone: json['telephone'] as String,
      objet: json['objet'] as String,
      message_signalement: json['message_signalement'] as String,
    );
  }

  Map toMap() {
    return {
      "prenom": prenom,
      "nom": nom,
      "telephone": telephone,
      "objet": objet,
      "message_signalement": message_signalement,
    };
  }
}
