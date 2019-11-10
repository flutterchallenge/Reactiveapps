import 'package:flutter/material.dart';
import 'package:flutterapp/bloc/forex_bloc.dart';
import 'package:flutterapp/bloc_example.dart';
import 'package:flutterapp/item_list.dart';

void main() => runApp(ConfigFetch());

class ConfigFetch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Flutter App',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,);
  }
}
class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text("Reactive app"), centerTitle: true,),
          body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton( child: Text("Scopped Model (counter)"), onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Items()));
            },),
            SizedBox(height: 8.0,),
            RaisedButton( child: Text("Bloc pattern (currency converter)"), onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForexPage()));
            },)
          ],
        ),
      ));
  }
}
