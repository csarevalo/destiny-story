class Story {
  Story({
    required this.id,
    required this.title,
    required this.choice1,
    required this.choice2,
    this.ending = false,
  });

  final int id;
  final String title;
  final String choice1;
  final String choice2;
  final bool ending;
}
