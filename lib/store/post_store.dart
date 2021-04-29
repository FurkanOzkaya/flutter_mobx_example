import 'package:mobx/mobx.dart';
import 'package:mobx_example/model/post_model.dart';
import 'package:mobx_example/service/post_service.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  PostApiService _service = PostApiService();
  @observable
  ObservableFuture<List<Post>>? posts;

  @action
  Future getPosts() async {
    posts = ObservableFuture(_service.getPostsService().then((value) => value));
  }
}
