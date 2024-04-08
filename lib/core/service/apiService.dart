import 'dart:convert';
import 'package:study/core/response/Question.dart';

import '../response/QuestionIntro.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<QuestionIntro>> getQuestionIntro() async {
    final response = await http.get(
        Uri.parse("http://192.168.58.1/backend_php/api_list_question.php"));
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

  Future<Question> postQuestion(Question question) async {
    var url = Uri.parse('http://192.168.58.1/backend_php/api_add_question.php');
    var headers = {'Content-Type': 'application/json'};
    var data = {
      "title": question.question,
      "cau_a": question.cau_a,
      "cau_b": question.cau_b,
      "cau_c": question.cau_c,
      "cau_d": question.cau_d,
      "true_answer": question.true_answer,
      "is_image": question.is_image
    };

    final response =
        await http.post(url, headers: headers, body: jsonEncode(data));
    if (response.statusCode == 200) {
      return Question(
          question: "question",
          cau_a: "cau_a",
          cau_b: "cau_b",
          cau_c: "cau_c",
          cau_d: "cau_d",
          true_answer: 1,
          is_image: "is_image");
    } else {
      throw Exception("Failed to load post");
    }
  }
}
