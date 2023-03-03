class AllDoctorsDataModel {
  int? id;
  String? doctorMobileNo;
  String? doctorName;
  String? hospitalName;
  String? doctorImage;
  String? doctorRatings;
  String? doctorFee;
  String? verificationDocuments;

  AllDoctorsDataModel(
      {this.id,
      this.doctorMobileNo,
      this.doctorName,
      this.hospitalName,
      this.doctorImage,
      this.doctorRatings,
      this.doctorFee,
      this.verificationDocuments});

  AllDoctorsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorMobileNo = json['doctor_mobile_no'];
    doctorName = json['doctor_name'];
    hospitalName = json['hospital_name'];
    doctorImage = json['doctor_image'];
    doctorRatings = json['doctor_ratings'];
    doctorFee = json['doctor_fee'];
    verificationDocuments = json['verification_documents'];
  }

  // AllDoctorsDataModel.fromJson(dynamic json) {
  //   id = json['id'];
  //   doctorMobileNo = json['doctor_mobile_no'];
  //   doctorName = json['doctor_name'];
  //   doctorImage = json['doctor_image'];
  //   doctorRatings = json['doctor_ratings'];
  //   doctorFee = json['doctor_fee'];
  //   verificationDocuments = json['verification_documents'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_mobile_no'] = this.doctorMobileNo;
    data['doctor_name'] = this.doctorName;
    data['doctor_image'] = this.doctorImage;
    data['doctor_ratings'] = this.doctorRatings;
    data['doctor_fee'] = this.doctorFee;
    data['verification_documents'] = this.verificationDocuments;
    return data;
  }
}
