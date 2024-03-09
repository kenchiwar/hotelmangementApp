import 'package:intl/intl.dart';

class ComplainDTO {
  // Use or const for immutable properties (recommended)
  int? id;
  int? senderComplainDTOId;
  int? handlerComplainDTOId;
  DateTime? dateSent;
  DateTime? settlementDate;
  String? title;
  String? content;
  String? status;

  // Consider using a named constructor for clarity
  ComplainDTO({
    this.id,
    this.senderComplainDTOId,
    this.handlerComplainDTOId,
    this.dateSent,
    this.settlementDate,
    this.title,
    this.content,
    this.status,
  });

  // Factory constructor for creating ComplainDTO from a Map (optional)
  ComplainDTO.fromMap(Map<String, dynamic> map) {
    var dateFormat = DateFormat("yyyy-MM-dd");
      id: map["id"];
      senderComplainDTOId: map["senderComplainDTOId"];
      handlerComplainDTOId: map["handlerComplainDTOId"];
      dateSent: dateFormat.parse(map["dateSent"]);
      settlementDate: dateFormat.parse(map["settlementDate"]);
      title: map["title"];
      content: map["content"];
      status: map["status"];
  }

  // Method to convert ComplainDTO to a Map (optional)
  Map<String, dynamic> toMap() {
    var dateFormat = DateFormat("yyyy-MM-dd");
    return <String, dynamic>{
      "id": id ?? 0,
      "senderComplainDTOId": senderComplainDTOId,
      "handlerComplainDTOId": handlerComplainDTOId,
      "dateSent": dateFormat.format(dateSent!),
      "settlementDate": dateFormat.format(settlementDate!),
      "title": title,
      "content": content,
      "status": status,
    };
  }
}
