import 'package:webfeed/webfeed.dart';
import 'package:flutter/material.dart';
import 'package:trabajo/news/show_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trabajo/screens/home_screen.dart';
import 'package:trabajo/blocs/crypto/crypto_bloc.dart';
import 'package:trabajo/repositories/crypto_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CryptoBloc>(
      create: (_) => CryptoBloc(
        cryptoRepository: CryptoRepository(),
      )..add(AppStarted()),
      child: MaterialApp(
        title: 'Trabajo de Grado',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color (0xFF1abc9c),
          accentColor: Colors.tealAccent,
        ),
        //home: HomeScreen(),
        onGenerateRoute: (RouteSettings settings){
          WidgetBuilder builder;

          switch(settings.name){
            case '/':
              builder = (BuildContext context)=> HomeScreen();
              break;
            case '/show':
              var args = settings.arguments;
              if(args is RssItem) {
                builder = (BuildContext context) =>
                    ShowPage(
                      title: args.title,
                      content: 'Contenido',
                    );
              }
              break;
          }
          return MaterialPageRoute(
            builder: builder,
            settings: settings
          );
        },
      ),
    );
  }
}