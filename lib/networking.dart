

import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper{
  String url;

  NetworkHelper(this.url);

  Future getData() async{
    http.Response r = await http.get(url);
    if(r.statusCode == 200){
        return jsonDecode(r.body);
    }else{
      print(r.statusCode);
    }
  }

}