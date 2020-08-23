import 'dart:convert';
import 'package:http/http.dart';

/// todo: Return always status code
class Network {
  final String url;

  Network(this.url);

  Future fetchDataJson() async {
    //print("$url");
    Response response = await get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      //print(response.body);
      return json.decode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
