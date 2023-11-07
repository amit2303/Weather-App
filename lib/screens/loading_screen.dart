import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'location_screen.dart';
import 'package:http/http.dart' as http;




class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  
  void getLocation() async{
    Location location =Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);

  }
  Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}

  void initState(){
    super.initState();

    getLocation();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('cordinates in console'),
      ),

    );
  }
}
