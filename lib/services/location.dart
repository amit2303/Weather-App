  import 'package:geolocator/geolocator.dart';
  

  
  class Location {
    late double latitude;
    late double longitude;
    

    

  //function to get location
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    

    
    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   return Future.error('Location services are disabled.');
    // }

    // //this can also be done using try catch
    try{
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
    }
    catch(e){
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    // Position position= await Geolocator.getCurrentPosition();
    // print(position);
    latitude = position.latitude;
    longitude =position.longitude;
    return position;
    
  }
  }



// import 'package:geolocator/geolocator.dart';

// class Location {
//   late double latitude;
//   late double longitude;

//   Future<void> getCurrentLocation() async {
//     try {
//       Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

//       latitude = position.latitude;
//       longitude = position.longitude;
//     } catch (e) {
//       print(e);
//     }
//   }
// }
