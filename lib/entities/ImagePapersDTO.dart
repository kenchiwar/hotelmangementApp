import 'package:hotelmanagement/entities/HotelDTO.dart';
import 'package:intl/intl.dart';

class ImagePapersDTO {
  int? id;
  HotelDTO? hotel;
  String? name;
  DateTime? date;

  ImagePapersDTO({this.id, this.hotel, this.name, this.date});

  ImagePapersDTO.fromMap(Map<String, dynamic> map) {
    var dateFormat = DateFormat("yyyy-MM-dd");
    id = map["id"];
    hotel = HotelDTO.fromMap(map["hotel"]); // Assuming Hotel has a fromMap constructor
    name = map["name"];
    date = dateFormat.parse(map["date"]);
  }

  Map<String, dynamic> toMap() {
    var dateFormat = DateFormat("yyyy-MM-dd");
    return <String, dynamic>{
      "id": id ?? 0,
      "hotel": hotel?.toMap(), // Assuming Hotel has a toMap method
      "name": name,
      "date": dateFormat.format(date!),
    };
  }
}
