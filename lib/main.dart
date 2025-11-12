import 'package:flutter/material.dart';
import 'screens/exam_list_screen.dart';


void main() 
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  static const String studentIndex = '221159';

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Распоред за испити',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: ExamListScreen(appTitle: 'Распоред за испити - $studentIndex'),
    );
  }
}