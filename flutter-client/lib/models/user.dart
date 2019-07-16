class User {
  User({this.nickname, this.avatar, this.token, this.workshopTimes = 0});
  String nickname;
  String avatar;
  String token;
  String username;
  String password;
  int workshopTimes = 0;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        nickname: json['nickname'] ?? json['username'],
        avatar: json['avatar'],
        token: json['token'],
        workshopTimes: json['workshopTimes']??0);
  }
  Map toJson() {
    return {
      'username': username,
      'nickname': nickname,
      'avatar': avatar,
      'token': token,
      'workshopTimes': workshopTimes
    };
  }
}

final defaultUser =
    User(nickname: '创客 Zero', avatar: 'assets/images/avatar.jpg', workshopTimes: 0);
