import 'package:fetchingJsonData/model/Post.dart';
import 'package:fetchingJsonData/model/PostList.dart';
import 'package:fetchingJsonData/tools/network.dart';
import 'package:flutter/material.dart';

class JsonParsingMap extends StatefulWidget {
  @override
  _JsonParsingMapState createState() => _JsonParsingMapState();
}

class _JsonParsingMapState extends State<JsonParsingMap> {
  Future<PostList> data;

  @override
  void initState() {
    super.initState();
    String url = "https://jsonplaceholder.typicode.com/posts";
    Network network = Network(url);
    data = network.loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PODO"),
        ),
        body: Center(
          child: Container(
            child: FutureBuilder(
              future: data,
              builder: (context, AsyncSnapshot<PostList> snapshot) {
                List<Post> allPosts;
                if (snapshot.hasData) {
                  allPosts = snapshot.data.post;
                  return createListView(allPosts, context);
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ));
  }

  Widget createListView(List<Post> data, BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return Column(
              children: [
                ListTile(
                  title: Text("${data[index].title}"),
                  subtitle: Text("${data[index].body}"),
                  leading: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black26,
                        radius: 23,
                        child: Text(
                          "${data[index].id}",
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 5,
                ),
              ],
            );
          }),
    );
  }
}
