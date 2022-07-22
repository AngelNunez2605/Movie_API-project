import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//https://api.themoviedb.org/3/discover/tv?api_key=0180294cf747525a4350bf781a812c7d&language=en-US&sort_by=popularity.desc&page=1&timezone=America%2FNew_York&include_null_first_air_dates=false&with_watch_monetization_types=flatrate&with_status=0&with_type=0
class MoviesProvider3 extends ChangeNotifier{
  final String _apiKey ='0180294cf747525a4350bf781a812c7d';
  final String _baseUrl= 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<dynamic> dataMovies = [];

MoviesProvider3(){
  this.getMovies();
}

getMovies() async{
  var url =
      Uri.https(_baseUrl, '3/discover/tv', 
      {'api_key': _apiKey,'language': _language,'page': '1'});

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    final Map<String,dynamic> jsonResponse = json.decode(response.body);
    print(jsonResponse);

    dataMovies = jsonResponse['results'];
    notifyListeners();
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
}