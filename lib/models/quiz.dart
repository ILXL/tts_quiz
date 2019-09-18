import 'package:meta/meta.dart';
import 'data.dart';


/// a [Quiz] keeps track of a quiz object
class Quiz {

  final Data correct;
  final List<Data> candidates;
 
  Quiz({
    @required this.correct,
    @required List<Data> others,
  }): candidates = others
      ..add(correct)
      ..shuffle();

}







