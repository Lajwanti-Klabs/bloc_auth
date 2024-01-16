class UserModelToken {
  String? token;

  UserModelToken({this.token});

  UserModelToken.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['token'] =token;
    return data;
  }
}