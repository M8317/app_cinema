import 'package:flutter/material.dart';
import '../modeles/film.dart';

class DetailFilm extends StatelessWidget {
  final Film film;
  final String urlBaseAffiche = 'https://image.tmdb.org/t/p/w500/';

  DetailFilm({required this.film});

  @override
  Widget build(BuildContext context) {
    String chemin;
    if (film.urlAffiche != null) {
      chemin = urlBaseAffiche + (film.urlAffiche ?? "");
    } else {
      chemin =
      'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(film.titre ?? 'Pas de titre'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                height: height / 1.5,
                child: Image.network(chemin),
              ),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(film.resume ?? 'Pas de résumé')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
