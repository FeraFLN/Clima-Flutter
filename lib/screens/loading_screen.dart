import 'dart:convert';

import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:http/http.dart' as http;

import 'location_screen.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getDataLocation() async{
  var result = await WeatherModel().getCurrenteWeather();

   Navigator.push(context,
       MaterialPageRoute(builder:(context){
                return LocationScreen(result);
       })
   );
  }

  @override
  void initState(){
    super.initState();
    getDataLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size:100.0,
        ),
      ),
    );
  }
}
