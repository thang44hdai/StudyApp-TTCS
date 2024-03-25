import '../../common/constant.dart';

class Api {
  String url = "${Constants.apiUrl};

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(trendingUrl));
    if (response.statusCode == 200) {
      final List<dynamic> decodeData = json.decode(response.body)['results'];
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Something happend");
    }
  }

  Future<List<Movie>> getIsPlayingMovies() async {
    final response = await http.get(Uri.parse(isPlayingUrl));
    if (response.statusCode == 200) {
      final List<dynamic> decodeData = json.decode(response.body)['results'];
      return decodeData.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception("Error");
    }
  }

  Future<List<Movie>> getUpComingMovies() async {
    final respone = await http.get(Uri.parse(upComingUrl));
    if (respone.statusCode == 200) {
      final List<dynamic> decodeData = json.decode(respone.body)['results'];
      return decodeData.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception("Error");
    }
  }
}