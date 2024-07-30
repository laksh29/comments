import 'package:comments/services/remote_config_services.dart';

class CommentsInfoModel {
  final int id;
  final String name;
  final String email;
  final String comment;

  CommentsInfoModel({
    required this.id,
    required this.name,
    required this.email,
    required this.comment,
  });

  factory CommentsInfoModel.fromJson(Map<String, dynamic> json) {
    String maskEmail(String email) {
      bool isMask = RemoteConfigServices().maskEmail();
      if (isMask == true) {
        var nameuser = email.split("@")[0];
        var emailcaracter =
            email.replaceRange(2, nameuser.length, "*" * (nameuser.length - 2));

        return emailcaracter;
      } else {
        return email;
      }
    }

    return CommentsInfoModel(
      id: json['id'],
      name: json['name'],
      email: maskEmail(json['email']),
      comment: json['body'],
    );
  }
}
