import 'package:flutter/material.dart';
import 'package:tts_quiz/models/model.dart';

class ResultDialog {
  void show(
    BuildContext context, {
    @required Model model,
  }) {
    showDialog<void>(
        context: context,
        builder: (context) {
          
          
          return AlertDialog(
            
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Score: ${model.finalScore} / ${model.quizList.length}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[900],
                  ),
                ),
                const SizedBox(height: 8),
                
              ],
            ),
            actions: [
              
              FlatButton(
                child: const Text('RESTART'),
                textColor: Colors.pink[900],
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}
