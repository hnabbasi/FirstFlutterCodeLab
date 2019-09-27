import 'package:first_flutter_codelab/views/random_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(RandomWordsApp());

class RandomWordsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: RandomWords(),
      debugShowCheckedModeBanner: false,
    );
  }
}
