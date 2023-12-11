import 'package:flutter/material.dart';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// OMDb API: http://www.omdbapi.com/?i=tt3896198&apikey=d4435ceb

/// Flutter code sample for [CupertinoSearchTextField].

// void main() => runApp(const SearchTextFieldApp());
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: SearchTextFieldExample(),
    );
  }
}

class SearchTextFieldExample extends StatefulWidget {
  const SearchTextFieldExample({super.key});

  @override
  State<SearchTextFieldExample> createState() => _SearchTextFieldExampleState();
}

class _SearchTextFieldExampleState extends State<SearchTextFieldExample> {
  String text = '';
  var text2 = '';
/*
  Future<void> _Searching() async {
    final bip = await http.get(Uri.parse(' http://www.omdbapi.com/s=$value&apikey=d4435ceb'));
    if (bip.statusCode == 200)
    {
      Map<String, dynamic> data = json.decode(bip.body);
      print('debug say $data');
      setState(() {
        _Result = data['Search'];
      });
    }
    else
    {
      print ("fuck you");
    }
    // return Void;
  }
// */

  final TextEditingController _SearchingBis = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('whatever the fuck am I doing right now...'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SearchTextField(
                fieldValue: (String value) {
                  setState(() {
                    text = value;
                  });
                },
              ),
            ),/*
            Expanded(
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {

            })), // */
            const Text("hi \n I'm here to test \n\n\n\n\n\n\nhi\n\n\n\nhello\n\n, what does that do ?"), // that's to test things...
          ],
        ),
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.fieldValue,
  });

  final ValueChanged<String> fieldValue;

  @override
  Widget build(BuildContext context) {
    List<dynamic> _Result = [];
    return CupertinoSearchTextField(
      onChanged: (String value) {
        fieldValue('The text has changed to: $value');
      },
      onSubmitted: (String value) {
        fieldValue('Submitted text: $value');
        // now, only work when searching...
        var returnValue = _searchMovie(value);
        returnValue.then((value) => handleValue(value));
        returnValue.then((value) => handleValue(value))
            .catchError((error) => handleError(error));
        // returnValue.decode;// to a fucking String;
        fieldValue('Result: $returnValue');
        // _Searching(value, _Result);
      },
    );
  }
}
/*
// */
//
//*
Future<String> _searchMovie(value) async {
  final bip = await http.get(Uri.parse('http://www.omdbapi.com/s=$value&apikey=d4435ceb'));
  /*
  if (bip.statusCode == 200)
    {
      final returnValue = json.decode(bip.body);
      return returnValue;
    }
  else
    {
      return "No result";
    }
    */
  return 'fuck me I guess';
}

// */

//