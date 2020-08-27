import 'package:flutter/cupertino.dart';
import 'package:pixel_fit/screens/add_exercise.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Pixel Fit',
      home: AddExercise(),
    );
  }
}
