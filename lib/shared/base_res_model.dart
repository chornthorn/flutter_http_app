class BaseResModel {
  late final String statusMessage;
  late final int statusCode;

  BaseResModel.fromJson(Map<String, dynamic> json) {
    statusMessage = json['status_message'];
    statusCode = json['status_code'];
  }
}
