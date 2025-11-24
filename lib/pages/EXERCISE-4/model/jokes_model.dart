class JokesModel {
  final String title;
  final String description;
  bool isFavorite; // default

  JokesModel({
    required this.title,
    required this.description,
    this.isFavorite = false,
  });
}
