class GetIdData {
  final String id;

  GetIdData({required this.id});
  factory GetIdData.fromJson(Map<String, dynamic> jsonData) {
    return GetIdData(
      id: jsonData['data']['_id'],
    );
  }
}
