


import 'package:geolocator/geolocator.dart';

class Location{
 double longitude;
 double latitude;


 Future<void> getCurrentPosition() async{
     try {
       Geolocator geolocation = Geolocator()
         ..forceAndroidLocationManager = true;
       Position position = await geolocation.getCurrentPosition(
           desiredAccuracy: LocationAccuracy.low);
       this.latitude = position.latitude;
       this.longitude = position.longitude;
     }catch(err){
       print(err.message);
     }

  }


}