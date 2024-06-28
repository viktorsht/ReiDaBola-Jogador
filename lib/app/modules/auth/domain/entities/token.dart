class Token {
  String? access;

  Token({this.access});

  Token.fromJson(Map<String, dynamic> json) {
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = access;
    return data;
  }
}
