import 'package:flutter/material.dart';
import 'package:trabajo/help/help_app.dart';
import 'package:trabajo/news/news_screen.dart';
import 'package:trabajo/screens/home_screen.dart';
import 'package:trabajo/show_edit/text_edit_name.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PortoFolio extends StatefulWidget {
  @override
  _PortoFolioState createState() => _PortoFolioState();
}

class _PortoFolioState extends State<PortoFolio>{
  String _texts = 'José Gregorio Rojas';
  String _moneys = '35';
  String _user = 'Drake';
  String _eth = '0.0001915';


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Portofolio'),
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
              selected: true,
              onTap: ()=> Navigator.of(context).pop(),
            ),
            ListTile(
              title: Text("News"),
              leading: Icon(FontAwesomeIcons.newspaper),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        NewsScreen()));
              },
            ),
            ListTile(
              title: Text("Help"),
              leading: Icon(FontAwesomeIcons.questionCircle),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        HelpApp()));
              },
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

      body: Container(
        color: Color(0xFFbdc3c7),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(

          child: Column(
            children: <Widget>[

              Container(
                margin: EdgeInsets.only(bottom: 10,),
                decoration: BoxDecoration(
                    color: Color.fromARGB(154, 30, 0, 255),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )
                ),
                child: Container(

                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.balanceScale),
                            SizedBox(height: 3,),
                            Text("Current Balance(General)",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Text("USD",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF2ecc71),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                                  child: RaisedButton.icon(
                                    onPressed: (){
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context)=>
                                              TextEditName(_moneys),
                                          )).then((result){
                                        if(result != null) {
                                          setState(() {
                                            _moneys = result;
                                          });
                                        }
                                      });
                                    },
                                    color: Color(0xFF2ecc71),
                                    icon: Icon(FontAwesomeIcons.dollarSign),
                                    label: Text(_moneys,
                                      style: TextStyle(fontSize: 25.0),),
                              ),
                                ),

                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF2ecc71),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                              child: RaisedButton.icon(
                                onPressed: (){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context)=>
                                          TextEditName(_user),
                                      )).then((result){
                                    if(result != null) {
                                      setState(() {
                                        _user = result;
                                      });
                                    }
                                  });
                                },
                                  color: Color(0xFF2ecc71),
                                  icon: Icon(FontAwesomeIcons.userEdit),
                                  label: Text(_user,
                                    style: TextStyle(fontSize: 10.0),)
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 80,),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                        child: Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.ethereum),
                            Text(_eth,style: TextStyle(fontSize: 18.0),),
                            SizedBox(width: 10,),
                            Container(
                                decoration: BoxDecoration(
                                color: Color(0xFF2ecc71),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                              child: RaisedButton(
                                child: Text('\E\T\H <= Cantidad',
                                  style: TextStyle(fontSize: 12.0),),
                                  onPressed: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context)=>
                                            TextEditName(_eth),
                                        )).then((result){
                                      if(result != null) {
                                        setState(() {
                                          _eth = result;
                                        });
                                      }
                                    });
                                  },
                                color: Color(0xFF2ecc71),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 150,),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFf1c40f),
                        Color(0xFF8e44ad),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 200,),
            ],
          ),
        ),
      ),
    );
  }
}
