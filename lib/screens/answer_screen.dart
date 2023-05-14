import 'package:flutter/material.dart';

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({Key? key}) : super(key: key);

  @override
  State<AnswerScreen> createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  final List<String> _previousAnswers = [];
  final List<String> _previousQuestions = [];
  String currentQuestion = 'How Many Hours ';

  String currentAnswer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(""),
            Row(
              children: [
                ElevatedButton(onPressed: (){}, child: Icon(Icons.check)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
