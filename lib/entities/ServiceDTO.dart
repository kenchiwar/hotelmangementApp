import 'package:hotelmanagement/entities/RoomDTO.dart';

class ServiceDTO {
  int? id;
  String? name;
  Set<RoomDTO>? rooms;

  ServiceDTO({this.id, this.name, this.rooms});

  ServiceDTO.fromMap(Map<String, dynamic> map) {

      id: map["id"];
      name: map["name"];
      rooms: map["rooms"] != null ? (map["rooms"] as List).cast<RoomDTO>() : null;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id ?? 0,
      "name": name,
      "rooms": rooms?.toList(), // Convert Set to List if necessary for external use
    };
  }
}
