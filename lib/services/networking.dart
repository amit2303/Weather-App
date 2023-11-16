import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  String getUrl;
  NetworkHelper(this.getUrl);

  Future getData() async {
    var url = Uri.parse(getUrl);

    // var response;
    try {
      // Make the GET request
      var response = await http.get(url);

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response body (assuming it's JSON in this example)
        // print(response.body); //to print the JSON response
        return jsonDecode(response.body);

        
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}













// //fetching data from JSON file
// import 'dart:convert'; 
//         var cityName = jsonDecode(response.body)['city']['name'];
//         var country = jsonDecode(response.body)['city']['country'];
//         var weather = jsonDecode(response.body)['list'][0]['weather'][0]['id'];
//         var weatherDesc =
//             jsonDecode(response.body)['list'][39]['weather'][0]['description'];
//         var temp = jsonDecode(response.body)['list'][0]['main']['temp'];

//         // var DecodeData =jsonDecode(response.body);
//         // String cityName =jsonDecode(response.body)['city']['name'];
//         // String country = DecodeData['city']['country'];
//         // String weatherDesc = DecodeData['list'][39]['weather'][0]['description'];
//         // double temp = DecodeData['list'][0]['main']['temp'];

//         print(cityName);
//         print(country);
//         print(weather);
//         print(weatherDesc);
//         print(temp);