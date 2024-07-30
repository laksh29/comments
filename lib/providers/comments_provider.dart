import 'dart:developer';

import 'package:comments/services/comments_adapter.dart';
import 'package:comments/services/navigator.dart';
import 'package:flutter/widgets.dart';

import '../models/comments_info_model.dart';

class CommentsProvider extends ChangeNotifier {
  List<CommentsInfoModel?> _commentsList = [];
  List<CommentsInfoModel?> get commentsList => _commentsList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future getComments(BuildContext context) async {
    _isLoaded = false;
    _commentsList = [];
    notifyListeners();

    try {
      _commentsList = await CommentsAdapter().fetchComments();
    } catch (e) {
      log("get comments error : $e");
      NavigatorService()
          .showSnackbar(context, "Server Error! Please try again later.");
    }
    _isLoaded = true;
    notifyListeners();
  }
}
