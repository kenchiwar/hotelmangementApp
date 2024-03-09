class BillDetailDTO {
  int? id;
  int? billDTOID;
  int? roomDTOID;
  String? roomName;
  double? price;
  double? priceDiscount;
  double? numberDay;
  double? total;
  String? reasonDiscount;
  int? numberHour;

  BillDetailDTO({
    this.id,
    this.billDTOID,
    this.roomDTOID,
    this.roomName,
    this.price,
    this.priceDiscount,
    this.numberDay,
    this.total,
    this.reasonDiscount,
    this.numberHour,
  });

  BillDetailDTO.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    billDTOID = map['billDTOID'];
    roomDTOID = map['roomDTOID'];
    roomName = map['roomName'];
    price = map['price'];
    priceDiscount = map['priceDiscount'];
    numberDay = map['numberDay'];
    total = map['total'];
    reasonDiscount = map['reasonDiscount'];
    numberHour = map['numberHour'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id ?? 0,
      'billDTOID': billDTOID,
      'roomDTOID': roomDTOID,
      'roomName': roomName,
      'price': price,
      'priceDiscount': priceDiscount,
      'numberDay': numberDay,
      'total': total,
      'reasonDiscount': reasonDiscount,
      'numberHour': numberHour,
    };
  }
}
