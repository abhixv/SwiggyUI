import 'dart:convert';

VerifyOtp verifyOtpFromJson(String str) => VerifyOtp.fromJson(json.decode(str));

String verifyOtpToJson(VerifyOtp data) => json.encode(data.toJson());

class VerifyOtp {
  VerifyOtp({
    required this.message,
    required this.token,
    required this.isNewUser,
  });

  String message;
  String token;
  bool isNewUser;

  factory VerifyOtp.fromJson(Map<String, dynamic> json) => VerifyOtp(
        message: json["message"],
        token: json["token"],
        isNewUser: json["isNewUser"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "isNewUser": isNewUser,
      };
}
