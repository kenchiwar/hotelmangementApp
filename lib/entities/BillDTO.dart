import 'package:hotelmanagement/entities/BillDetailDTO.dart';
import 'package:intl/intl.dart';

class BillDTO {
  int? id;
  int? accountDTOID;
  int? paymentDTOID;
  String? paymentName;
  String? service;
  DateTime? checkInFrom;
  DateTime? checkInUntil;
  DateTime? checkOutFrom;
  DateTime? checkOutUntil;
  String? mainGuest;
  String? status;
  String? name;
  String? email;
  String? phone;
  String? note;
  String? securityCode;
  double? total;
  List<BillDetailDTO>? billDetails;

  BillDTO({
    this.id,
    this.accountDTOID,
    this.paymentDTOID,
    this.paymentName,
    this.service,
    this.checkInFrom,
    this.checkInUntil,
    this.checkOutFrom,
    this.checkOutUntil,
    this.mainGuest,
    this.status,
    this.name,
    this.email,
    this.phone,
    this.note,
    this.securityCode,
    this.total,
    this.billDetails,
  });

  BillDTO.fromMap(Map<String, dynamic> map) {
    var dateFormat = DateFormat("yyyy-MM-dd");
    id = map["id"];
    accountDTOID = map["accountDTOID"];
    paymentDTOID = map["paymentDTOID"];
    paymentName = map["paymentName"];
    service = map["service"];
    checkInFrom = dateFormat.parse(map["checkInFrom"]);
    checkInUntil = dateFormat.parse(map["checkInUntil"]);
    checkOutFrom = dateFormat.parse(map["checkOutFrom"]);
    checkOutUntil = dateFormat.parse(map["checkOutUntil"]);
    mainGuest = map["mainGuest"];
    status = map["status"];
    name = map["name"];
    email = map["email"];
    phone = map["phone"];
    note = map["note"];
    securityCode = map["securityCode"];
    total = map["total"];
    billDetails = map["billDetails"] != null
        ? (map["billDetails"] as List)
        .map((billDetail) => BillDetailDTO.fromMap(billDetail))
        .toList()
        : null;
  }

  Map<String, dynamic> toMap() {
    var dateFormat = DateFormat("yyyy-MM-dd");
    return <String, dynamic>{
      "id": id ?? 0,
      "accountDTOID": accountDTOID,
      "paymentDTOID": paymentDTOID,
      "paymentName": paymentName,
      "service": service,
      "checkInFrom": dateFormat.format(checkInFrom!),
      "checkInUntil": dateFormat.format(checkInUntil!),
      "checkOutFrom": dateFormat.format(checkOutFrom!),
      "checkOutUntil": dateFormat.format(checkOutUntil!),
      "mainGuest": mainGuest,
      "status": status,
      "name": name,
      "email": email,
      "phone": phone,
      "note": note,
      "securityCode": securityCode,
      "total": total,
      "billDetails": billDetails != null
          ? billDetails!.map((billDetail) => billDetail.toMap()).toList()
          : null,
    };
  }
}
