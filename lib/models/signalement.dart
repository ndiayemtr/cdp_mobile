class Signalement {
  int id;
  String prenom;
  String nom;
  String message_signalement;

  Signalement({
    required this.id,
    required this.prenom,
    required this.nom,
    required this.message_signalement,
  });

  factory Signalement.fromJson(Map<String, dynamic> json) {
    return Signalement(
      id: json['id'] as int,
      prenom: json['prenom'] as String,
      nom: json['prenom'] as String,
      message_signalement: json['message_plainiant'] as String,
    );
  }
}
