import 'package:intl/intl.dart'; // Import for date formatting

class ImageDTO {
  int? id;
  int? categoryimageDTOID;
  String? name;


  ImageDTO({this.id, this.categoryimageDTOID, this.name});

  ImageDTO.fromMap(Map<String, dynamic> map) {

    id = map["id"];
    print("1");
    categoryimageDTOID = map["categoryimageDTOID"];
    print("2");
    name = map["name"];
    print("3");

  }

  Map<String, dynamic> toMap() {
    var dateFormat = DateFormat("yyyy-MM-dd");
    return <String, dynamic>{
      "id": id ?? 0,
      "categoryimageDTOID": categoryimageDTOID,
      "name": name,

    };
  }
}
