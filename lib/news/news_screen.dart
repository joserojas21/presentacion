import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trabajo/portofolio_user/portofolio_user.dart';
import 'package:trabajo/show_edit/text_edit_name.dart';
import 'package:trabajo/screens/home_screen.dart';
import 'package:trabajo/help/help_app.dart';
import 'package:trabajo/news/newtwork.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'dart:math';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen>{
  String _texts = 'José Gregorio Rojas';
  ScrollController _controller;
  double backgroundHeight = 120.0;
  Future<RssFeed> future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    future = getNews();

    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        backgroundHeight = max(0,180.0 - _controller.offset
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(154, 30, 0, 255).withOpacity(0.6),
        elevation: 0.0,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text('Ultimas Noticias',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
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
              selected: true,
              onTap: ()=> Navigator.of(context).pop(),
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
      body: _body(),
    );
  }

  Widget _body(){
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<RssFeed> snapshot) {
        switch(snapshot.connectionState){
          case ConnectionState.none:
            case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  if(snapshot.hasError)
                    return Text('Error: ${snapshot.error}');

                  return Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: backgroundHeight,
                        color: Color(0xFF1abc9c),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28.0),
                        child: ListView.builder(
                          controller: _controller,
                          itemCount: snapshot.data.items.length + 2,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              return Padding(
                                padding: EdgeInsets.only(top: 8.0, bottom: 1.0),
                                child: Text(snapshot.data.description),
                              );
                            }
                            if (index == 1) {
                              return _bigItem();
                            }
                            return _item(snapshot.data.items[index - 2]);
                          },
                        ),
                      ),
                    ],
                  );
        }
        return null;
      },
    );
  }

  Widget _bigItem(){
    var screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: (screenWidth - 64) * 3 / 5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/big_item.jpg'),
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ],
    );
  }

  Widget _item(RssItem item){

    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('/show', arguments: item);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 25.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21.0),
                            color: Color(0xff363cb0),
                          ),
                          child: Center(
                            child: Text(item.categories.first.value[0],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 2.0),
                        Text(item.categories.first.value,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    //SizedBox(height: 14.0),
                    Text(item.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                    //SizedBox(height: 6.0),
                    Text(item.dc.creator,
                      style: TextStyle(
                        color: Color(0xff545c6b),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 8.0),

              Container(
                width: 50,
                height: 50,
                child: Image(
                    image: AssetImage('images/item_4.png'),
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}