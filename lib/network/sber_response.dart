class SberResponse {
  int? errorCode;
  String? errorComment;
  String? errorDetails;
  String? errorTrace;
  bool? success;
  String? signatureTimeMsk;
  String? signerFullName;
  String? signerInn;
  String? signatureGuid;
  String? documentOriginGuid;
  String? keyGuid;

  SberResponse(
      {this.errorCode,
      this.errorComment,
      this.errorDetails,
      this.errorTrace,
      this.success,
      this.signatureTimeMsk,
      this.signerFullName,
      this.signerInn,
      this.signatureGuid,
      this.documentOriginGuid,
      this.keyGuid});

  SberResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    errorComment = json['error_comment'];
    errorDetails = json['error_details'];
    errorTrace = json['error_trace'];
    success = json['success'];
    signatureTimeMsk = json['signature_time_msk'];
    signerFullName = json['signer_full_name'];
    signerInn = json['signer_inn'];
    signatureGuid = json['signature_guid'];
    documentOriginGuid = json['document_origin_guid'];
    keyGuid = json['key_guid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error_code'] = errorCode;
    data['error_comment'] = errorComment;
    data['error_details'] = errorDetails;
    data['error_trace'] = errorTrace;
    data['success'] = success;
    data['signature_time_msk'] = signatureTimeMsk;
    data['signer_full_name'] = signerFullName;
    data['signer_inn'] = signerInn;
    data['signature_guid'] = signatureGuid;
    data['document_origin_guid'] = documentOriginGuid;
    data['key_guid'] = keyGuid;
    return data;
  }
}
