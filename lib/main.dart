import 'package:flutter/material.dart';
import 'package:mobx_example/model/post_model.dart';
import 'package:mobx_example/store/post_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(MobxExample());
}

class MobxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final postStore = PostStore();

  @override
  void initState() {
    postStore.getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final future = postStore.posts;
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) {
            switch (future?.status) {
              case FutureStatus.fulfilled:
                List<Post> users = future?.result;
                return buildPostList(users);
              case FutureStatus.rejected:
                return buildError();
              case FutureStatus.pending:
              default:
                return buildLoading();
            }
          },
        ),
      ),
    );
  }
}

Widget buildPostList(List<Post> posts) {
  return ListView.builder(
    itemCount: posts.length,
    itemBuilder: (ctx, index) {
      return Text(posts[index].title!);
    },
  );
}

Widget buildLoading() {
  return Center(child: CircularProgressIndicator());
}

Widget buildError() {
  return Center(child: Text("Failed to load posts"));
}
