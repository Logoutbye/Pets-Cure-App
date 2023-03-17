class LoginGetApiModel {
  int? id;
  String? name;
  int? mobileNo;
  String? token;

  LoginGetApiModel({this.id, this.name, this.mobileNo, this.token});

  LoginGetApiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobileNo = json['mobile_no'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile_no'] = this.mobileNo;
    data['token'] = this.token;
    return data;
  }
}
