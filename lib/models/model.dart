import 'dart:async';
import 'package:flutter/foundation.dart';
import 'quiz_loader.dart';
import 'quiz.dart';
import 'data.dart';

///enum Progresss with four variable members to hold
///the state of each Quiz
enum Progress {
  correct,
  incorrect,
  current,
  notYet,
}

class Model extends ChangeNotifier {
  Model({@required this.quizLoader}) {
    _load();
  }

  int finalScore = 0;
  final QuizLoader quizLoader;
  List<Quiz> quizList;
  bool quizListLoaded = false;
  int index = 0;
  final answers = <Data>[];

  final answered = StreamController<bool>();
  final isFinal = StreamController<bool>();

  int get score => finalScore;

  ///Check if Quiz list is loaded
  bool get isQuizListLoaded => quizListLoaded;

  /// Check if there still have quiz question left
  ///
  /// return true if index greater or equal than zero
  /// And index less than this null aware operator
  /// (quizList.length ?? 0) if quizList.length is not null then return its length,
  /// otherwise return 0
  bool get hasQuiz => index >= 0 && index < (quizList.length ?? 0);

  /// return a quiz object in list at current index if there still a quiz
  Quiz get quiz => hasQuiz ? quizList[index] : null;

  //TODO: create Progress list for Progress bar
  ///Return a list of quiz and assign with Progress enum
  // List<Progress> get progress => quizList
  //     // convert quizList to map
  //     .asMap()
  //     // Returns a new map where all entries of this map are transformed by
  //     // the given function.
  //     .map<int, Progress>((i, quiz) => MapEntry<int, Progress>(
  //         i,
  //         i >= 0 && i < answers.length
  //             ? (answers[i] == quizList[i].correct//if object answer at index i equal to object in quizList
  //                 ? Progress.correct
  //                 : Progress.incorrect)
  //             : index == i ? Progress.current : Progress.notYet))
  //     .values
  //     .toList();

  // /// return a progress at index
  // Progress get current => progress[index];

  /// return current answer if Progress is incorrect or correct
  // Data get currentAnswer =>
  //     current == Progress.correct || current == Progress.incorrect
  //         ? answers[index]
  //         : null;

  ///return list bool stream of answers
  Stream<bool> get streamAnswer => answered.stream;

  void answer(Data data) {
    //is quiz.correct that data
    final correct = quiz.correct == data;

    answers.add(data);
    answered.add(correct);

    if (correct) {
      finalScore++;
    }

    if (index ==
        quizList.length - 1) //if it is last question, then add true to stream
    {
      isFinal.add(true);
    } else {
      isFinal.add(false);
    }

    notifyListeners();
  }

  void next() //go to next question
  {
    index++;
    if (!hasQuiz) {
      return;
    }
    notifyListeners();
  }

  ///Load the quiz with Provider
  ///
  ///
  void _load() async {
    // await Future<void>.delayed(Duration(seconds: 1));
    quizList = await quizLoader.load();
    quizListLoaded = true;
    notifyListeners();
  }

  @override
  void dispose() {
    answered.close();
    isFinal.close();
    super.dispose();
  }
}
