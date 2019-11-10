import 'dart:async';
import 'dart:convert';

import 'package:flutterapp/bloc/bloc.dart';
import 'package:flutterapp/model/forex.dart';
import 'package:http/http.dart' as http;

class ForexBloc implements Bloc {
  Forex _forex;
  Forex get currentForex => _forex;

  final _forexController = StreamController<Forex>();
  Stream<Forex> get forexStream => _forexController.stream;

  void getForex() {
    print("get forex called");
    http.get("https://www.freeforexapi.com/api/live?pairs=EURUSD").then((response) {
          if(response.statusCode == 200) {
            print(response.body);
            _forex = Forex.fromJson(jsonDecode(response.body));
            _forexController.sink.add(_forex);
          }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _forexController.close();
  }

}