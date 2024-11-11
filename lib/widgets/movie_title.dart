import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;

  MovieTile({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 250,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          Positioned(
            height: 150,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: movie.posterPath.isEmpty
                  ? Image.asset(
                "assets/images/not.jpg",
                height: 240,
                width: 160,
                fit: BoxFit.cover,
              )
                  : Image.network(
                movie.posterPath,
                height: 240,
                width: 160,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            height: 120,
            bottom: 10,
            child: Row(
              children: [
                SizedBox(width: 190),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        movie.genre, // Now shows genre names
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: movie.rating <= 6
                              ? Color(0xFF1C7EEB)
                              : Color(0xFF5EC570),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${(movie.rating * 10).round() / 10} IMDB',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

