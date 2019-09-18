
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tts_quiz/models/model.dart';

class Question extends StatelessWidget {
  const Question ({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);
    final quiz = model.quiz;
    return Text(
      quiz.correct.question,
      style: Theme.of(context).textTheme.headline,
      
    );
  }
}

