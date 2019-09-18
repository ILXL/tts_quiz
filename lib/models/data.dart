import 'package:meta/meta.dart';


class Data {

  final String answer;
  final String question;
  final String link;

  Data({
    @required this.question,
    @required this.answer,
    @required this.link,
  });

  Data.fromJson(Map<String, dynamic> json)
  :question = json['description'] as String,
  answer = json['name'] as String,
  link = json['link'] as String;

  
}