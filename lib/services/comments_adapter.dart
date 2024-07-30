import 'dart:developer';

import 'package:comments/models/comments_info_model.dart';
import 'package:comments/services/api_services.dart';

class CommentsAdapter {
  Future<List<CommentsInfoModel?>> fetchComments({int? initialLoad}) async {
    log("fetch comments");
    var temp = await ApiService()
        .apiGet(apiUrl: "https://jsonplaceholder.typicode.com/comments");

    // log("response : ${jsonEncode(temp)}");

    List<CommentsInfoModel> commentsList = [];
    if (temp != null || temp.isNotEmpty) {
      for (var x in temp) {
        commentsList.add(CommentsInfoModel.fromJson(x));
      }
    }
    return commentsList;
  }
}
