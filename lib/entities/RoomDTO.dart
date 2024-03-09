import 'dart:collection';

import 'package:hotelmanagement/entities/BillDetailDTO.dart';
import 'package:hotelmanagement/entities/HotelDTO.dart';

class RoomDTO {
  int? id;
  HotelDTO? hotel;
  String? name;
  bool? status;
  double? price = 0.0;
  double? priceDiscount = 0.0;
  String? reasonDiscount;
  int? roomMax = 0;
  int? roomNow = 0;
  int? peopleMin = 0;
  int? peopleMax = 0;
  String? describes;
  Set<BillDetailDTO> billDetails = {};

  RoomDTO({
    this.id,
    this.hotel,
    this.name,
    this.status,
    this.price,
    this.priceDiscount,
    this.reasonDiscount,
    this.roomMax,
    this.roomNow,
    this.peopleMin,
    this.peopleMax,
    this.describes,
  });

    RoomDTO.fromMap(Map<String, dynamic> map) {
    id = map['id'] as int?;
    hotel = map['hotel'] is Map ? HotelDTO.fromMap(map['hotel'] as Map<String, dynamic>) : null;
    name = map['name'] as String?;
    status = map['status'] as bool?;
    price = map['price'] as double? ?? 0.0;
    priceDiscount = map['priceDiscount'] as double? ?? 0.0;
    reasonDiscount = map['reasonDiscount'] as String?;
    roomMax = map['roomMax'] as int? ?? 0;
    roomNow = map['roomNow'] as int? ?? 0;
    peopleMin = map['peopleMin'] as int? ?? 0;
    peopleMax = map['peopleMax'] as int? ?? 0;
    describes = map['describes'] as String?;
    if (map["billDetails"] != null) {
      billDetails = (map["billDetails"] as List<dynamic>)
          .map((billDetailMap) => BillDetailDTO.fromMap(
        billDetailMap as Map<String, dynamic>,
      ))
          .toSet();
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id ?? 0,
      'hotel': hotel?.toMap(),
      'name': name,
      'status': status,
      'price': price,
      'priceDiscount': priceDiscount,
      'reasonDiscount': reasonDiscount,
      'roomMax': roomMax,
      'roomNow': roomNow,
      'peopleMin': peopleMin,
      'peopleMax': peopleMax,
      'describes': describes,
      'billDetails': billDetails.toList().map((bd) => bd.toMap()).toList(),
    };
  }
}
