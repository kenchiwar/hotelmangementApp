
import 'dart:convert';

import 'package:hotelmanagement/entities/RoomDTO.dart';
import 'package:intl/intl.dart';
import 'package:hotelmanagement/entities/CategoryimageDTO.dart';

class HotelDTO {
  int? idHotelDTO;
  int? accountDTOID;
  String? name;
  String? cancellationPolicy;
  String? description;
  int? rating;
  String? manager;
  bool? status;
  String? mainPhoto;
  String? secondaryPhoto;
  String? papers;
  String? regulation;
  int? idHandler;
  String? address;
  List<CategoryimageDTO>? categoryimages;
  List<RoomDTO>?  rooms;
  HotelDTO({
    this.idHotelDTO,
    this.accountDTOID,
    this.name,
    this.cancellationPolicy,
    this.description,
    this.rating,
    this.manager,
    this.status,
    this.mainPhoto,
    this.secondaryPhoto,
    this.papers,
    this.regulation,
    this.idHandler,
    this.address,
    this.categoryimages,
  });

  HotelDTO.fromMap(Map<String, dynamic> map) {
    var dateFormat = DateFormat("yyyy-MM-dd"); // Assuming a date format for consistency
    
    idHotelDTO = map["idHotelDTO"];
    accountDTOID = map["accountDTOID"];
    name = map["name"];
    cancellationPolicy = map["cancellationPolicy"];
    description = map["description"];
    rating = map["rating"];
    manager = map["manager"];
    status = map["status"];
    mainPhoto = map["mainPhoto"];
    secondaryPhoto = map["secondaryPhoto"];
    papers = map["papers"];
    regulation = map["regulation"];
    idHandler = map["idHandler"];
    address = map["address"];
    categoryimages = map["categoryimages"] != null
        ? List<CategoryimageDTO>.from(map["categoryimages"].map((x) => CategoryimageDTO.fromMap(x)))
        : null;
    rooms = map["rooms"] != null
        ? List<RoomDTO>.from(map["rooms"].map((x) => RoomDTO.fromMap(x)))
        : null;
  }

  Map<String, dynamic> toMap() {
    var dateFormat = DateFormat("yyyy-MM-dd");
    return <String, dynamic>{
      "idHotelDTO": idHotelDTO ?? 0,
      "accountDTOID": accountDTOID ?? 0,
      "name": name,
      "cancellationPolicy": cancellationPolicy,
      "description": description,
      "rating": rating,
      "manager": manager,
      "status": status,
      "mainPhoto": mainPhoto,
      "secondaryPhoto": secondaryPhoto,
      "papers": papers,
      "regulation": regulation,
      "idHandler": idHandler,
      "address": address,
      "categoryimages": categoryimages != null
          ? List<dynamic>.from(categoryimages!.map((x) => x.toMap()))
          : null,
    };
  }
}
