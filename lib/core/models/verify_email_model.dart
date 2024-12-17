// ignore_for_file: camel_case_types

class verifyModel {
  final String emailVerification;

  verifyModel({required this.emailVerification});

  factory verifyModel.fromJson(Map<String, dynamic> jsonData) {
    return verifyModel(
      emailVerification: jsonData["resetCode"],
    );
  }
}
