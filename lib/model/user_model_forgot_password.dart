class UserModelForForgotPassword {
  int? id;
  String? name;
  String? mobileNo;
  String? email;
  String? token;

  UserModelForForgotPassword(
      {this.id, this.name, this.mobileNo, this.email, this.token});

  UserModelForForgotPassword.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobileNo = json['mobile_no'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile_no'] = this.mobileNo;
    data['email'] = this.email;
    data['token'] = this.token;
    return data;
  }
}
