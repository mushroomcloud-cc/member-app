class User {
  User({this.nickname,this.avatar,this.token});
  String nickname;
  String avatar;
  String token;
}

final defaultUser = User(
  nickname: '创客 Zero',
  avatar: 'assets/images/avatar.jpg'
);