class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "Dois-je demander la permission à une personne avant de publier sa photo sur un site Internet ou dans les réseaux sociaux ?",
    [
      Answer("Non, ce n'est pas vraiment pas necessaire", false),
      Answer("Oui, car une photo est une donnée personnelle", true),
      Answer("Elle sera tellement contente qu'elle ne dira rien", false),
      Answer(
          "C'est une chose que tout le monde fait alors pourquoi pas", false),
    ],
  ));

  list.add(Question(
    "Que faire si mon profil sur Internet( un reseau social) est usurpé ?",
    [
      Answer(
          "S'adresser dierctement au responsable du site et à la CDP en cas de refus du responsable",
          false),
      Answer("S'adresser directement à la CDP", true),
      Answer("Supprimer votre compte", false),
      Answer("Changer votre compte", false),
    ],
  ));

  list.add(Question(
    "Mon patron a-t-il le droit de mettre une caméra pour surveiller nos vestiaire?",
    [
      Answer("Oui, si la charte de l'entreprise le prévoit et l'exige", false),
      Answer("Oui, pour des mesures de sécurité des personnes et des biens",
          false),
      Answer("Non, cest une atteinteà l'intimité de la vie privée des salariés",
          false),
      Answer("Oui, si c'est un patron pervers", true),
    ],
  ));

  list.add(Question(
    "Une entreprise qui collecte des données personnelles peut-elle les revendre par la suite à d'autres ntreprises?",
    [
      Answer("Normal, c'est la loi du marché", false),
      Answer("Oui, si les personnes concernées par la collecte sont d'accord",
          false),
      Answer("Non, c'est un détournement de finalité", true),
      Answer("Oui, si elle déclare la finalité devant la CDP", false),
    ],
  ));

  return list;
}
