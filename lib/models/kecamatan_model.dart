class Kecamatan {
  String? id;
  String? regencyId;
  String? name;

  Kecamatan({this.id, this.regencyId, this.name});

  Kecamatan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    regencyId = json['regency_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['regency_id'] = this.regencyId;
    data['name'] = this.name;
    return data;
  }
}
