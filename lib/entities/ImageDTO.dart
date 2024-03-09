import 'package:intl/intl.dart'; // Import for date formatting

class ImageDTO {
  int? id;
  int? categoryimageDTOID;
  String? name;
  DateTime? date;

  ImageDTO({this.id, this.categoryimageDTOID, this.name, this.date});

  ImageDTO.fromMap(Map<String, dynamic> map) {
    var dateFormat = DateFormat("yyyy-MM-dd");
    id = map["id"];
    categoryimageDTOID = map["categoryimageDTOID"];
    name = map["name"];
    date = dateFormat.parse(map["date"]);
  }

  Map<String, dynamic> toMap() {
    var dateFormat = DateFormat("yyyy-MM-dd");
    return <String, dynamic>{
      "id": id ?? 0,
      "categoryimageDTOID": categoryimageDTOID,
      "name": name,
      "date": dateFormat.format(date!),
    };
  }
}
