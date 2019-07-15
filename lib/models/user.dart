class User {
  User({this.nickname, this.avatar, this.token});
  String nickname;
  String avatar;
  String token;
  String username;
  String password;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        nickname: json['nickname'] ?? json['username'],
        avatar: json['nickname'],
        token: json['token']);
  }
  Map toJson() {
    return {
      'username': username,
      'nickname': nickname,
      'avatar': avatar,
      'token': token
    };
  }
}

final defaultUser =
    User(nickname: '创客 Zero', avatar: 'assets/images/avatar.jpg');
