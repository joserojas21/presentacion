import 'package:flutter/material.dart';

class EditUser extends StatefulWidget {
  final String user;
  EditUser(this.user);

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {

  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.user);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valor del Ethereum en Dolares que poses'),
        elevation: 0,
        backgroundColor: Color.fromARGB(154, 30, 0, 255),
        brightness: Brightness.dark,
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(children: <Widget>[
            TextField(controller: _controller),
            RaisedButton(
              child: Text('Save'),
              onPressed: (){
                Navigator.of(context).pop(_controller.text);
              },
            )
          ],
          ),
        ),
      ),
    );
  }
}