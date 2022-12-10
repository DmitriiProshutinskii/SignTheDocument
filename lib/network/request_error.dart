class ErrorMessage {
  String message = '';
  String messageTemplate = '';
  String path = '';
  String invalidValue = '';

  ErrorMessage(
      {this.message = '',
      this.messageTemplate = '',
      this.path = '',
      this.invalidValue = ''});

  ErrorMessage.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    messageTemplate = json['messageTemplate'] ?? '';
    path = json['path'] ?? '';
    invalidValue = json['invalidValue'] ?? '';
  }
}
