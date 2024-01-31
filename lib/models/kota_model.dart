class Kota {
  String? id;
  String? provinceId;
  String? name;

  Kota({this.id, this.provinceId, this.name});

  Kota.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    provinceId = json['province_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['province_id'] = this.provinceId;
    data['name'] = this.name;
    return data;
  }
}
