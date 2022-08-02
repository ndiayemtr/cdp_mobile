class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Dois-je demander la permission à une personne avant de publier sa photo sur un site Internet ou dans les réseaux sociaux ?",
    "options": [
      "Non, ce n'est pas vraiment pas necessaire",
      "Oui, car une photo est une donnée personnelle",
      "Elle sera tellement contente qu'elle ne dira rien",
      "C'est une chose que tout le monde fait alors pourquoi pas"
    ],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question":
        "Que faire si mon profil sur Internet( un reseau social) est usurpé ?",
    "options": [
      "S'adresser dierctement au responsable du site et à la CDP en cas de refus du responsable",
      "S'adresser directement à la CDP",
      "Supprimer votre compte",
      "Changer votre compte"
    ],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question":
        "Mon patron a-t-il le droit de mettre une caméra pour surveiller nos vestiaire?",
    "options": [
      "Oui, si la charte de l'entreprise le prévoit et l'exige",
      "Oui, pour des mesures de sécurité des personnes et des biens",
      "Non, cest une atteinteà l'intimité de la vie privée des salariés",
      "Oui, si c'est un patron pervers"
    ],
    "answer_index": 3,
  },
  {
    "id": 4,
    "question":
        "Une entreprise qui collecte des données personnelles peut-elle les revendre par la suite à d'autres entreprises?",
    "options": [
      "Normal, c'est la loi du marché",
      "Oui, si les personnes concernées par la collecte sont d'accord",
      "Non, c'est un détournement de finalité",
      "Oui, si elle déclare la finalité devant la CDP"
    ],
    "answer_index": 2,
  },
];
