import 'package:assignment_for_tradexa/widgets/movie_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';


class SearchScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric( vertical: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16 ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
                  filled: true,
                  fillColor: Colors.transparent,
                  suffixIcon: Icon(Icons.search, color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                ),
                onSubmitted: (query) {
                  movieProvider.searchMovies(query);
                },
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: movieProvider.movies.isEmpty
                  ? Center(
                child: Text(
                  'Search movie',
                  style: TextStyle(fontFamily: 'Montserrat', color: Color(0xFF262e2e)),
                ),
              )
                  : ListView.builder(
                itemCount: movieProvider.movies.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: MovieTile(movie: movieProvider.movies[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
    );
  }
}
