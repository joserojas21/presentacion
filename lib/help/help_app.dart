import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trabajo/news/news_screen.dart';
import 'package:trabajo/portofolio_user/portofolio_user.dart';
import 'package:trabajo/screens/home_screen.dart';
import 'package:trabajo/show_edit/text_edit_name.dart';

class HelpApp extends StatefulWidget {
  @override
  _HelpAppState createState() => _HelpAppState();
}

class _HelpAppState extends State<HelpApp>{
  String _texts = 'José Gregorio Rojas';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
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

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail:RaisedButton.icon(
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=>
                          TextEditName(_texts),
                      )).then((result){
                    if(result != null) {
                      setState(() {
                        _texts = result;
                      });
                    }
                  });
                },
                icon: Icon(FontAwesomeIcons.edit),
                color: Colors.lightBlueAccent,
                label: Text(_texts,
                  style: TextStyle(fontSize: 10.0),),
              ),

              accountName: Text('toolfortheuseoftrading@gmail.com'),

              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/maplestory.jpg'),
              ),
            ),

            ListTile(
              title: Text("Home"),
              leading: Icon(FontAwesomeIcons.home),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        HomeScreen()));
              },
            ),
            ListTile(
              title: Text("Portofolio"),
              leading: Icon(FontAwesomeIcons.wallet),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        PortoFolio()));
              },
            ),
            ListTile(
              title: Text("News"),
              leading: Icon(FontAwesomeIcons.newspaper),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        NewsScreen()));
              },
            ),
            ListTile(
              title: Text("Help"),
              leading: Icon(FontAwesomeIcons.questionCircle),
              selected: true,
              onTap: ()=> Navigator.of(context).pop(),
            ),
            Divider(),
            ListTile(
              title: Text("Close"),
              leading: Icon(FontAwesomeIcons.timesCircle),
              onTap: ()=> Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }
}