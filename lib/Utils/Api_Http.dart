import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_rating/Screens/HomeScreen/Model/MoviesModel.dart';

class ApiHttp
{
  Future<MoviesModel?> GetMovieData(String search)async
  {
    var responce = await http.get(Uri.parse("https://imdb8.p.rapidapi.com/auto-complete?q=$search"),headers: {'X-RapidAPI-Key':'7cd293d082msh94aaf84a741d0e7p1876a3jsn70569604fabc','X-RapidAPI-Host':'imdb8.p.rapidapi.com'});
    if(responce.statusCode==200)
      {
        var json = jsonDecode(responce.body);
        return MoviesModel.fromJson(json);
      }
    return null;
  }
}