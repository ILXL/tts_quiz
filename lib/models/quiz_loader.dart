import 'dart:convert';
import 'package:flutter/services.dart';
import 'quiz.dart';
import 'data.dart';

class QuizLoader {
  Future<List<Quiz>> load() async {
    final data = (jsonDecode(
                await rootBundle.loadString('assets/data/complex_quiz.json'))
            as List)
        .map<Data>(
            (dynamic json) => Data.fromJson(json as Map<String, dynamic>))
        .toList();

    return (data..shuffle())
        .sublist(0, 10)
        .map<Quiz>((correct) => Quiz(
            correct: correct,
            others: (data..shuffle())
                .where((w) => w.answer != correct.answer)
                .toList()
                .sublist(0, 3)))
        .toList();
  }
}
