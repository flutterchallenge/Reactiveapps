import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/bloc/bloc_provider.dart';
import 'package:flutterapp/bloc/forex_bloc.dart';

import 'model/forex.dart';

class ForexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _forexBloc = ForexBloc();
    _forexBloc.getForex();
    return BlocProvider<ForexBloc>(
        bloc: _forexBloc,
        child: ForexPageWidgets());
  }
}

class ForexPageWidgets extends StatefulWidget {
  @override
  _ForexPageWidgetsState createState() => _ForexPageWidgetsState();
}

class _ForexPageWidgetsState extends State<ForexPageWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EUR -> USD"),
        centerTitle: true,
      ),
      body: StreamBuilder<Forex>(
        stream: BlocProvider.of<ForexBloc>(context).forexStream,
        builder: (context, snapshot) {
          if(snapshot.data == null) {
            return Center( child: CircularProgressIndicator(),);
          } else {
            return  Align(
                alignment: Alignment(0, 0),
                child: Column( crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text("Todays rate", style: TextStyle(fontSize: 16.0),),
                  SizedBox(height: 16.0,),
                  Text(" 1 EUR = \$ ${snapshot.data.rates.eURUSD.rate}", style: TextStyle(fontSize: 16.0),),

                ],),
              );
          }
        },
      ),
    );
  }
}

