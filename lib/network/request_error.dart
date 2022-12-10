class Detail {
  List<String>? loc;
  String? msg;
  String? type;

  Detail({this.loc, this.msg, this.type});

  Detail.fromJson(Map<String, dynamic> json) {
    loc = json['loc'].cast<String>();
    msg = json['msg'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loc'] = loc;
    data['msg'] = msg;
    data['type'] = type;
    return data;
  }
}
