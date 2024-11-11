class Movie {
  final String title;
  final String genre; // Store genre names here
  final double rating;
  final String releaseDate;
  final String posterPath;

  Movie({
    required this.title,
    required this.genre,
    required this.rating,
    required this.releaseDate,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    // Convert genre IDs to genre names
    final genreIds = List<int>.from(json['genre_ids'] ?? []);
    final genreNames = getGenreNames(genreIds);

    return Movie(
      title: json['title'] ?? 'Unknown Title',
      genre: genreNames, // Store genre names here
      rating: json['vote_average'] ?? 0.0,
      releaseDate: json['release_date'] ?? 'Unknown Date',
      posterPath: json['poster_path'] != null
          ? 'https://image.tmdb.org/t/p/w200${json['poster_path']}'
          : "",
    );
  }
}

// Genre data mapping (put this in a common file or at the top of your code file)
const List<Map<String, dynamic>> genreList = [
  { "id": 28, "name": "Action" },
  { "id": 12, "name": "Adventure" },
  { "id": 16, "name": "Animation" },
  { "id": 35, "name": "Comedy" },
  { "id": 80, "name": "Crime" },
  { "id": 99, "name": "Documentary" },
  { "id": 18, "name": "Drama" },
  { "id": 10751, "name": "Family" },
  { "id": 14, "name": "Fantasy" },
  { "id": 36, "name": "History" },
  { "id": 27, "name": "Horror" },
  { "id": 10402, "name": "Music" },
  { "id": 9648, "name": "Mystery" },
  { "id": 10749, "name": "Romance" },
  { "id": 878, "name": "Science Fiction" },
  { "id": 10770, "name": "TV Movie" },
  { "id": 53, "name": "Thriller" },
  { "id": 10752, "name": "War" },
  { "id": 37, "name": "Western" },
];

// Helper function to map genre IDs to names
String getGenreNames(List<int> genreIds) {
  return genreIds
      .map((id) => genreList.firstWhere((genre) => genre['id'] == id, orElse: () => {'name': 'Unknown'})['name'])
      .join(' | ');
}
