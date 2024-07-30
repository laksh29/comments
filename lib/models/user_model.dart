class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? profile;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.profile,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['id'],
      name: json['name'],
      email: json['email'],
      profile: json['profile'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': uid,
      'name': name,
      'email': email,
      'profile': profile,
    };
  }
}
