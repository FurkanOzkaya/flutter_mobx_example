import 'dart:io';

import 'package:mobx_example/model/post_model.dart';
import 'package:mobx_example/service/base_service.dart';

class PostApiService {
  static const URL = "${BaseApiClient.baseUrl}/posts";
  final apiClient = BaseApiClient.instance.getClient;

  Future getPostsService() async {
    final response = await apiClient.get(URL);

    if (response.statusCode == HttpStatus.ok) {
      List res = response.data;
      return res.map((e) => Post.fromJson(e)).toList();
    } else {
      print("Error while fetching posts");
    }
  }
}
