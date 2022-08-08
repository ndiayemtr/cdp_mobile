class Plainte {
  int id;
  String prenom;
  String nom;
  String message_plainiant;

  Plainte({
    required this.id,
    required this.prenom,
    required this.nom,
    required this.message_plainiant,
  });

  factory Plainte.fromJson(Map<String, dynamic> json) {
    return Plainte(
      id: json['id'] as int,
      prenom: json['prenom'] as String,
      nom: json['prenom'] as String,
      message_plainiant: json['message_plainiant'] as String,
    );
  }
}
