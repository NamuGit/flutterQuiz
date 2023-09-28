import 'package:untitled/models/quiz_question.dart';

class QuizResponse {
  final int? responseCode;
  final List<QuizQuestion>? results;

  QuizResponse({required this.responseCode, required this.results});

  factory QuizResponse.fromJson(Map<String, dynamic> json) {
    return QuizResponse(
      responseCode: json['response_code'],
      results: List<QuizQuestion>.from(
        json['results']?.map((result) => QuizQuestion.fromJson(result)) ?? [],
      ),
    );
  }

}