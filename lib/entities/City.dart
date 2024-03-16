import 'package:hotelmanagement/entities/District.dart';

class City {
  String? Id;
  String? Name;
  List<District>? Districts;
  City({
    this.Id,
    this.Name,

  });
  City.fromMap(Map<String, dynamic> map) {
    Id= map['Id'];
    Name = map['Name'];
    Districts = map["Districts"] != null
        ? List<District>.from(map["Districts"].map((x) => District.fromMap(x)))
        : [];
  }
}