import 'package:first_flutter_codelab/helpers/string_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup Names"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved,)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
                (WordPair pair) {
              return ListTile(
                title: Text(
                  StringHelper.getFriendlyName(pair.asPascalCase),
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(         // Add 6 lines from here...
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );                       // ... to here.
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext _context, int i){

        if(i.isOdd)
          return Divider();

        final int index = i ~/2;
        if(index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair){
    final bool alreadySaved = _saved.contains(pair);
    return ListTile (
      title: Text(
        StringHelper.getFriendlyName(pair.asPascalCase),
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.purple : null,
      ),
      onTap: (){
        setState(() {
          if(alreadySaved)
            _saved.remove(pair);
          else
            _saved.add(pair);
        });
      },
    );
  }
}

