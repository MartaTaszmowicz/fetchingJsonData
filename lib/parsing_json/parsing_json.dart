import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonParsingSimple extends StatefulWidget {
  @override
  _JsonParsingSimpleState createState() => _JsonParsingSimpleState();
}

class _JsonParsingSimpleState extends State<JsonParsingSimple> {
  Future data;

  @override
  void initState() {
    super.initState();
    data = getData();
  }

  Future getData() async {
    var data;
    String url = "https://jsonplaceholder.typicode.com/posts";
    Network network = Network(url);

    data = network.fetchData();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parsing Json"),
      ),
    );
  }
}

/// todo: Return always status code
class Network {
  final String url;

  Network(this.url);

  Future fetchData() async {
    //print("$url");
    Response response = await get(Uri.encodeFull(url));
    if (response.statusCode == 200) {
      //print(response.body);
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
}
