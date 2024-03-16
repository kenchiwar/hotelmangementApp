import 'package:hotelmanagement/entities/Ward.dart';

class District {
  String? Id;
  String? Name;
  List<Ward>? Wards =[];
  District({
    this.Id,
    this.Name,

  });
  District.fromMap(Map<String, dynamic> map) {
    Id= map['Id'];
    Name = map['Name'];
    Wards = map["Wards"] != null
        ? List<Ward>.from(map["Wards"].map((x) => Ward.fromMap(x)))
        : null;
  }
}