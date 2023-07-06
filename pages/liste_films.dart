import 'package:flutter/material.dart';
import '../utils/http_helper.dart';
import '../modeles/film.dart';
import '../pages/detail_film.dart';

class ListeFilms extends StatefulWidget {
  @override
  _ListeFilmsState createState() => _ListeFilmsState();
}

class _ListeFilmsState extends State<ListeFilms> {
  List<Film> films = [];
  late HttpHelper helper;
  final String iconBase = 'https://image.tmdb.org/t/p/w92/';
  final String imageParDefaut = 'https://images.freeimages.com/images'
      '/large-previews/5eb/movie-clapboard-1184339.jpg';

  @override
  void initState() {
    super.initState();
    helper = HttpHelper();
    helper.recevoirNouveauxFilms().then((value) {
      setState(() {
        films = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: films.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.network(
                  'https://image.tmdb.org/t/p/w500${films[index].urlAffiche}'),
              title: Text(films[index].titre ?? 'Pas de titre'),
              subtitle: Text(films[index].resume ?? 'Pas de résumé'),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => DetailFilm(film: films[index])
                );
                Navigator.push(context, route);
              },
            ),
          );
        },
      ),
    );
  }
}
