import 'Post.dart';

class PostList {
  final List<Post> post;

  PostList({this.post});

  factory PostList.fromJson(List<dynamic> parseJson) {
    List<Post> posts = new List<Post>();

    posts = parseJson.map((i) => Post.fromJson(i)).toList();

    return new PostList(post: posts);
  }
}
