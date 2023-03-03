class AllHospitalDataModel {
  int? id;
  String? hospitalName;
  String? hospitalCity;
  String? hospitalAddress;
  String? hospitalOpeningHours;
  String? hospitalHelpLine;

  AllHospitalDataModel(
      {this.id,
      this.hospitalName,
      this.hospitalCity,
      this.hospitalAddress,
      this.hospitalOpeningHours,
      this.hospitalHelpLine});

  AllHospitalDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hospitalName = json['hospital_name'];
    hospitalCity = json['hospital_city'];
    hospitalAddress = json['hospital_address'];
    hospitalOpeningHours = json['hospital_opening_hours'];
    hospitalHelpLine = json['hospital_help_line'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hospital_name'] = this.hospitalName;
    data['hospital_city'] = this.hospitalCity;
    data['hospital_address'] = this.hospitalAddress;
    data['hospital_opening_hours'] = this.hospitalOpeningHours;
    data['hospital_help_line'] = this.hospitalHelpLine;
    return data;
  }
}
