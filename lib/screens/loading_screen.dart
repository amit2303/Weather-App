import 'package:flutter/material.dart';
import 'package:weather/services/location.dart';
import 'location_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '12906ab78ca334c03cfb8a7e9797b998';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;
  @override
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    print(location.latitude);
    print(location.longitude);
    getData();
  }

  void getData() async {
    var url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey');



    // var response;
    try {
      // Make the GET request
      var response = await http.get(url);

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
    // Parse the response body (assuming it's JSON in this example)
        // print(response.body); //to print the JSON response


        //fetching data from JSON file
        var cityName =jsonDecode(response.body)['city']['name'];
        var country = jsonDecode(response.body)['city']['country'];
        var weatherDesc = jsonDecode(response.body)['list'][39]['weather'][0]['description'];
        var temp = jsonDecode(response.body)['list'][0]['main']['temp'];


                                                  // var DecodeData =jsonDecode(response.body);

                                                  // String cityName =jsonDecode(response.body)['city']['name'];
                                                  // String country = DecodeData['city']['country'];
                                                  // String weatherDesc = DecodeData['list'][39]['weather'][0]['description'];
                                                  // double temp = DecodeData['list'][0]['main']['temp'];


        print(cityName);
        print(country);
        print(weatherDesc);
        print(temp);

      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void initState() {
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
