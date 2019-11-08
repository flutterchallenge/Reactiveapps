import 'package:flutter/material.dart';
import 'package:flutterapp/bloc/config_bloc.dart';

import 'bloc/bloc_provider.dart';
import 'model/config.dart';

void main() => runApp(ConfigFetch());

class ConfigFetch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final configBloc = ConfigBloc();
    configBloc.getConfig();
    return BlocProvider<ConfigBloc>(
      bloc: ConfigBloc(),
      child: BlocProvider<ConfigBloc>(
        bloc: configBloc,
        child: MaterialApp(
          title: 'Flutter App',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: SplashScreen(),
        ),
      ),
    );
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
      return Scaffold(body: StreamBuilder<Config> (
          stream: BlocProvider.of<ConfigBloc>(context).configStream,
          builder: (context, snapshot) {
            if(snapshot.data == null) {
              return Container( child: Center( child : CircularProgressIndicator()),);
            } else {
              return Container( child: Center( child : Text(snapshot.data.appName)),);
            }
          },

      ));
  }
}
