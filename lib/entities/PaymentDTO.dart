import 'package:hotelmanagement/entities/BillDTO.dart';
import 'package:intl/intl.dart';

class PaymentDTO {
  int? id;
  String? method;
  bool? status;
  DateTime? date;
  Set<BillDTO> bills = {}; // Using a Set for bills

  // Primary constructor with optional parameters
  PaymentDTO({this.id, this.method, this.status, this.date});

  // Named constructor to create an PaymentDTO from a Map
  PaymentDTO.fromMap(Map<String, dynamic> map) {
    var dateFormat = DateFormat("yyyy-MM-dd");
    id = map["id"];
    method = map["method"];
    status = map["status"];
    date = dateFormat.parse(map["date"]);
    // Assuming "bills" in the map is a list of Bill objects
    bills = map["bills"]?.map((billMap) => BillDTO.fromMap(billMap)).toSet() ?? {};
  }

  // Method to convert PaymentDTO to a Map
  Map<String, dynamic> toMap() {
    var dateFormat = DateFormat("yyyy-MM-dd");
    return <String, dynamic>{
      "id": id ?? 0,
      "method": method,
      "status": status,
      "date": dateFormat.format(date!),
      "bills": bills.map((bill) => bill.toMap()).toList(), // Convert bills back to list
    };
  }
}
