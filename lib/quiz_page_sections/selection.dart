import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tts_quiz/models/data.dart';
import 'package:tts_quiz/models/model.dart';

var questionNumber = 0;

class Selections extends StatefulWidget {
  const Selections({Key key}) : super(key: key);

  @override
  _SelectionsState createState() => _SelectionsState();
}

class _SelectionsState extends State<Selections> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: model.quiz.candidates
          .map((data) => _buildButton(context, data: data))
          .toList(),
    );
  }

  Widget _buildButton(BuildContext context, {@required Data data}) {
    final model = Provider.of<Model>(context);

    // final currentAnswer = model.currentAnswer;
    // final answered = model.current == Progress.correct ||
    //     model.current == Progress.incorrect;
    // final isCorrectData = answered ? data == model.quiz.correct : null;

    return RaisedButton(
      child: Text(data.answer),
      color: Colors.white,
      textColor: Colors.pink[900],
      // color: currentAnswer == null
      //     ? null
      //     : isCorrectData
      //         ? Colors.green
      //         : (currentAnswer == data ? Colors.red : null),
      onPressed: () {
        model.answer(data);
        
      },
    );
  }
}
