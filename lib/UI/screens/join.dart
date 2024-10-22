import 'package:flutter/material.dart';

import 'chat.dart';

class JoinScreen extends StatefulWidget {
  @override
  _JoinScreenState createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  TextEditingController _textEditingController;

  void _joinChat() {
    if (_textEditingController.text.isEmpty) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ChatScreen(_textEditingController.text),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Flutter Socket IO Chat'),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Center(
                        child: Container(
                            height: 250,
                            child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                ),
                                margin: const EdgeInsets.all(20),
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                            Row(
                                                children: <Widget>[
                                                    Icon(Icons.person_add),
                                                    SizedBox(width: 10),
                                                    Text(
                                                        'Add Chat',
                                                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                                                    ),
                                                ],
                                            ),
                                            SizedBox(
                                                height: 10,
                                            ),
                                            TextField(
                                                controller: _textEditingController,
                                                decoration: InputDecoration(
                                                labelText: "Full Name",
                                                ),
                                                onSubmitted: (_) {
                                                    _joinChat();
                                                },
                                            ),
                                            SizedBox(
                                                height: 30,
                                            ),
                                            MaterialButton(
                                                minWidth: double.infinity,
                                                onPressed: _joinChat,
                                                color: Theme.of(context).primaryColor,
                                                textColor: Theme.of(context).textTheme.title.color,
                                                child: Text('JOIN'),
                                            ),
                                        ],
                                    ),
                                ),
                            ),
                        ),
                    );
              });
            },
            isExtended: true,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            icon: Icon(
                Icons.person_add, 
                color: Colors.white,
            ),
            backgroundColor: Colors.teal,
            label: Text('Create Chat', style: TextStyle(color: Colors.white),),
        ),
    );
  }
}