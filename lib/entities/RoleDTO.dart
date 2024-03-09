import 'package:intl/intl.dart';

class RoleDTO {
  int? id;
  String? name;
  DateTime? date;
  Set<RoleDTO> accounts = {}; // Dart uses {} for sets

  RoleDTO({this.id, this.name, this.date});

  RoleDTO.fromMap(Map<String, dynamic> map) {
    var dateFormat = DateFormat("yyyy-MM-dd");
    id = map["id"];
    name = map["name"];
    date = dateFormat.parse(map["date"]);

    if (map["accounts"] != null) {
      accounts = (map["accounts"] as List<dynamic>)
          .map((accountMap) => RoleDTO.fromMap(
        accountMap as Map<String, dynamic>,
      ))
          .toSet();
    }
  }

  Map<String, dynamic> toMap() {
    var dateFormat = DateFormat("yyyy-MM-dd");
    return <String, dynamic>{
      "id": id ?? 0,
      "name": name,
      "date": dateFormat.format(date!),
      "accounts": accounts.map((account) => account.toMap()).toList(),
    };
  }
}
