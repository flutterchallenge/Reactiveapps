import 'dart:async';
import 'dart:convert';

import 'package:flutterapp/bloc/bloc.dart';
import 'package:flutterapp/model/config.dart';
import 'package:http/http.dart' as http;

class ConfigBloc implements Bloc {
  Config _config;
  Config get appConfig => _config;

  final _configController = StreamController<Config>();
  Stream<Config> get configStream => _configController.stream;

  void getConfig() {
    print("get config called");
    http.post("https://ls.hamroapi.com/v5/", body: {'action': 'config'},
        headers: {'X-APP-ID': '565ea2d8af566', 'X-AGENT-TOKEN': '565ef83e7402f', 'X-App-pkg': 'com.nepali.gk',
        'x-app-version': '1.0', 'x-request-secret': 'dfhsdsdlkfj'}).then((response) {
          if(response.statusCode == 200) {
            print(response.body);
            _config = Config.fromJson(jsonDecode(response.body));
            _configController.sink.add(_config);
          }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _configController.close();
  }

}