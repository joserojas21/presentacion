import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class ShowPage extends StatefulWidget {
  final String title;
  final String content;

  const ShowPage({Key key, this.title, this.content}): super(key: key);

  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(154, 30, 0, 255),
        elevation: 0.0,
        centerTitle: false,
        leading: InkWell(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(FontAwesomeIcons.angleLeft,
            color: Colors.black,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(widget.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
      body: _body(),
    );
  }
  Widget _body(){
    return Container();
  }
}
