class VerifyOtp {
  String? message;
  String? token;
  bool? isNewUser;

  VerifyOtp({this.message, this.token, this.isNewUser});

  VerifyOtp.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    isNewUser = json['isNewUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    data['isNewUser'] = this.isNewUser;
    return data;
  }
}
