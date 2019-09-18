import 'package:flutter/material.dart';
import 'quiz_page_sections/question.dart';
import 'quiz_page_sections/result_dialog.dart';
import 'package:provider/provider.dart';
import 'models/quiz_loader.dart';
import 'quiz_page_sections/selection.dart';
import 'models/model.dart';
import 'quiz_page_sections/text_to_speech.dart';

const _horizontalMargin = 18.0;//

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) =>
          Model(quizLoader: Provider.of<QuizLoader>(context, listen: false)),
      child: const Page(),
    );
  }
}

class Page extends StatefulWidget {
  const Page({Key key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  Model get _model => Provider.of<Model>(context, listen: false);
  
  final resultDialog = ResultDialog();// create result dialog object

  @override
  void initState() {
    super.initState();
    ///listen to stream and get boolean value from isFinal
    _model.isFinal.stream.listen((isLastQuestion) {
      if (isLastQuestion)//if true
       {
        resultDialog.show(context, model: _model);
      } 
      else //false
      {
        _model.next();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor:Colors.pink[400] ,
        title: const Text('Quiz Page'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    final model = Provider.of<Model>(context);
    return SafeArea(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 1),
        child: model.quizListLoaded
            ? _buildQuiz()
            : Center(
                child: const CircularProgressIndicator(),
              ),
      ),
    );
  }

  Widget _buildQuiz() {
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(_horizontalMargin),
            physics: AlwaysScrollableScrollPhysics(),
            
            child: Question(),
          ),
        ),
        Padding(
          
          child: Selections(),
          padding: EdgeInsets.symmetric(horizontal: _horizontalMargin),
        ),
        TextToSpeech(),
      ],
    );
  }
}
