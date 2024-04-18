import 'dart:convert';
import 'package:study/core/response/Question.dart';

import '../response/QuestionIntro.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<QuestionIntro>> getQuestionIntro() async {
    final response = await http.get(
        Uri.parse("https://ttcsapp.000webhostapp.com/api_list_question.php"));
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

  Future<Question> postQuestion(Question question, int list_question_id) async {
    Map<String, dynamic> request = {
      "title": question.question,
      "cau_a": question.cau_a,
      "cau_b": question.cau_b,
      "cau_c": question.cau_c,
      "cau_d": question.cau_d,
      "true_answer": question.true_answer.toString(),
      "is_image": question.is_image,
      "list_question_id": list_question_id.toString()
    };
    final response = await http.post(
      Uri.parse("https://ttcsapp.000webhostapp.com/api_add_question.php"),
      headers: {
        'Content-Type': 'application/json', // Đặt kiểu dữ liệu là JSON
      },
      body: jsonEncode(request),
    );
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

  Future<void> postListQuestion(
      String title, int time, String description) async {
    Map<String, dynamic> request = {
      "title": title,
      "time": time.toString(),
      "description": description
    };
    final response = await http.post(
      Uri.parse("https://ttcsapp.000webhostapp.com/api_add_listquestion.php"),
      headers: {
        'Content-Type': 'application/json', // Đặt kiểu dữ liệu là JSON
      },
      body: jsonEncode(request),
    );
    if (response.statusCode == 200) {
    } else {
      throw Exception("Failed to load post");
    }
  }
}
