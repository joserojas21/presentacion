import 'package:flutter/material.dart';
import 'package:trabajo/help/help_app.dart';
import 'package:trabajo/news/news_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabajo/show_edit/text_edit_name.dart';
import 'package:trabajo/blocs/crypto/crypto_bloc.dart';
import 'package:trabajo/portofolio_user/portofolio_user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _scrollController = ScrollController();
  String _texts = 'José Gregorio Rojas';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallet"),
        actions: <Widget>[

          IconButton(
              icon: Icon(FontAwesomeIcons.bell),
              onPressed: (){},
          ),

        ],
        elevation: 0,
        backgroundColor: Color.fromARGB(154, 30, 0, 255),
        brightness: Brightness.dark,
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.black,
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
              selected: true,
              onTap: ()=> Navigator.of(context).pop(),
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

      body: BlocBuilder<CryptoBloc, CryptoState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).primaryColor,
                  Colors.grey[900],
                ],
              ),
            ),
            child: _buildBody(state),
          );
        },
      ),
    );
  }

  _buildBody(CryptoState state) {

    if (state is CryptoLoading) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Theme.of(context).accentColor),
        ),
      );
    } else if (state is CryptoLoaded) {
      return RefreshIndicator(
        color: Theme.of(context).accentColor,
        onRefresh: () async {
          context.bloc<CryptoBloc>().add(RefreshCoins());
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) =>
              _onScrollNotification(notification, state),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: state.coins.length,
            itemBuilder: (BuildContext context, int index) {
              final coin = state.coins[index];
              return ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${++index}',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                title: Text(
                  coin.fullName,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  coin.name,
                  style: TextStyle(color: Colors.white70),
                ),
                trailing: Text(
                  '\$${coin.price.toStringAsFixed(4)}',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
          ),
        ),
      );
    } else if (state is CryptoError) {
      return Center(
        child: Text(
          'Error loading coins!\nPlease check your connection \nNo hay Conexión a internet',
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 18.0,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }
  }

  bool _onScrollNotification(ScrollNotification notif, CryptoLoaded state) {
    if (notif is ScrollEndNotification && _scrollController.position.extentAfter == 0) {
      context.bloc<CryptoBloc>().add(LoadMoreCoins(coins: state.coins));
    }
    return false;
  }
}