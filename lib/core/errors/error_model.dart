class ErrorModel {
  final String errorMessage;

  ErrorModel({
    required this.errorMessage,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      errorMessage: parseErrorMessage(jsonData),
    );
  }
}

String parseErrorMessage(Map<String, dynamic> jsonData) {
  if (jsonData.containsKey('message')) {
    return jsonData['message'];
  } else if (jsonData.containsKey('errors') && jsonData['errors'] is List) {
    List errors = jsonData['errors'];
    String errorMessage = '';
    for (int i = 0; i < errors.length && i < 2; i++) {
      if (errors[i] is Map && errors[i].containsKey('msg')) {
        errorMessage += '${errors[i]['msg']} ';
      }
    }
    return errorMessage.trim();
  }
  return 'Unknown error';
}