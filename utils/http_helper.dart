import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../modeles/film.dart';

class HttpHelper {
  Future<List<Film>> recevoirNouveauxFilms() async {
    String urlNouveauxFilms = 'https://api.themoviedb.org/3/movie/popular?'
        'api_key=09a89ef7582bdbc3193b3785def783b4';

    http.Response resultat = await http.get(Uri.parse(urlNouveauxFilms));

    if (resultat.statusCode == HttpStatus.ok) {
      final chaineJson = json.decode(resultat.body);
      final filmsMap = chaineJson['results'] as List<dynamic>;

      List<Film> films = filmsMap.map((i) => Film.fromJson(i as Map<String,
          dynamic>)).toList();

      return films;
    }
    else {
      throw Exception('Erreur 404');
    }
  }
}
