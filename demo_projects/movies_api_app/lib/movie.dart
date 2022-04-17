class Movie {
  final String name;
  final String posterPath;

  Movie({
    required this.name,
    required this.posterPath,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : name = json['title'] ?? '',
        posterPath = json['poster_path'] ?? '';

  factory Movie.fromJson2(Map<String, dynamic> json) {
    return Movie(
      name: json['title'],
      posterPath: json['poster_path'],
    );
  }

  String get fullImageUrl => 'https://image.tmdb.org/t/p/w200$posterPath';
}
