import 'dart:convert';
import '../response/QuestionIntro.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<QuestionIntro>> getQuestionIntro() async {
    final response = await http
        .get(Uri.parse("http://localhost/backend_php/api_list_qusetion.php"));
    if (response.statusCode == 200) {
      final List<dynamic> decodeData =
          json.decode(response.body)['list_question'];
      return decodeData
          .map((list_question) => QuestionIntro.fromJson(list_question))
          .toList();
    } else {
      throw Exception("Something happend");
    }
  }
}
