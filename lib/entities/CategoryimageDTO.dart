import 'package:hotelmanagement/entities/ImageDTO.dart';

class CategoryimageDTO {
  int? id; // Use for immutable properties
  int? hotelDTOID;
  String? name;
  List<ImageDTO>? images;

  CategoryimageDTO({
    this.id,
    this.hotelDTOID,
    this.name,
    this.images
  });

  CategoryimageDTO.fromMap(Map<String, dynamic> map) {
      id = map["id"];
      print("id");
      hotelDTOID = map["hotelDTOID"];
      print("dtoid");
      name = map["name"];
      print("dtoname");
      images = map["images"] != null
          ? List<ImageDTO>.from(map["images"].map((x) => ImageDTO.fromMap(x)))
          : null;
      // images = map["images"] != null
      //     ? (map["images"] as List)
      //     .map((image) => ImageDTO.fromMap(image))
      //     .toList()
      //     : null;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id ?? 0,
      'hotelDTOID': hotelDTOID,
      'name': name,
      "images": images != null
          ? images!.map((image) => image.toMap()).toList()
          : null,
    };
  }

  map(Null Function(dynamic item) param0) {}
}

