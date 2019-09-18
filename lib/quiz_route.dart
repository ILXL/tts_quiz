import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiz_page.dart';
import 'models/quiz_loader.dart';


///This Starting page of application
class QuizRoute extends StatefulWidget {
  const QuizRoute({Key key}) : super(key: key);

  @override
  _QuizRouteState createState() => _QuizRouteState();
}

class _QuizRouteState extends State<QuizRoute> {
  @override
  Widget build(BuildContext context) {
    
    ///Navigate to the quiz page
    void _navigationToQuizRoute(BuildContext context) {
      Navigator.of(context)
          .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
        return MultiProvider(
          providers: [
            Provider.value(value: QuizLoader()),
          ],
          child: MaterialApp(
            home: QuizPage(),
          ),
        );
      }));
    }

    Widget _material() {
      return Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              width: double.infinity,
              height: 100,
              child: RaisedButton(
                
                color: Colors.white,
                onPressed: () => _navigationToQuizRoute(context),//go to quiz page after onpress
                child: const Text(
                  'Start',
                  style: TextStyle(fontSize: 22.0),
                ),
                textColor: Colors.pink[900],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        title: Text('Quiz Text To Speech'),
      ),
      body: _material(),
    );
  }
}
