class User {
  final String username;

  const User({this.username = "Fail"});

  factory User.fromJson(Map<String, dynamic> json) {
    String username = json['username'][0];
    return User(username: username);
  }
}
