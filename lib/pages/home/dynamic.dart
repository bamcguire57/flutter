import 'package:flutter/material.dart';

class DynamicContent extends StatefulWidget {
  @override
  _DynamicContentState createState() => _DynamicContentState();
}

enum Answer { YES, NO }

class _DynamicContentState extends State<DynamicContent> {
  String _answer = '';

  void setAnswer(String value) {
    setState(() {
      _answer = value;
    });
  }

  Future<Null> _askUser() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(title: Text('Well do ya?'), children: <Widget>[
            SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Answer.YES);
                },
                child: const Text('Heck Yeah!')),
            SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Answer.NO);
                },
                child: const Text('Nah, I\'m alright'))
          ]);
        })) {
      case Answer.YES:
        setAnswer('Heck Yeah!');
        break;
      case Answer.NO:
        setAnswer('Nah, I\'m alright');
        break;
      default:
        setAnswer('Whoops');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text('Your Response: $_answer'),
              RaisedButton(
                  onPressed: () {
                    _askUser();
                  },
                  child: Text('You wanna see some dynamic content??')),
            ],
          ),
        ),
      ),
    );
  }
}
