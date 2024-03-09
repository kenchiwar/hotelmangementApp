import 'package:hotelmanagement/entities/HotelDTO.dart';
import 'package:intl/intl.dart';

class EvaluateDTO {
  // Use nullable types for optional data
  int? id;
  HotelDTO? hotel;
  int? number;
  String? comment;
  DateTime? created;
  bool? status; // Use bool for boolean values
  int? idEvaluateDTO;
  int? idBill;
  String? nameEvaluateDTO;

  // Constructor with named parameters for clarity
  EvaluateDTO({
    this.id,
    this.hotel,
    this.number,
    this.comment,
    this.created,
    this.status,
    this.idEvaluateDTO,
    this.idBill,
    this.nameEvaluateDTO,
  });

  // Factory constructor for creating EvaluateDTO from a Map
  EvaluateDTO.fromMap(Map<String, dynamic> map) {
    var dateFormat = DateFormat("yyyy-MM-dd"); // Use final for constants

      id: map["id"];
      hotel: HotelDTO.fromMap(map["hotel"]); // Assuming Hotel has a fromMap constructor
      number: map["number"];
      comment: map["comment"];
      created: dateFormat.parse(map["created"]);
      status: map["status"];
      idEvaluateDTO: map["idEvaluateDTO"];
      idBill: map["idBill"];
      nameEvaluateDTO: map["nameEvaluateDTO"];
  }

  // Method to convert EvaluateDTO to a Map
  Map<String, dynamic> toMap() {
    var dateFormat = DateFormat("yyyy-MM-dd");

    return <String, dynamic>{
      "id": id ?? 0,
      "hotel": hotel?.toMap(), // Use null-safe operator for optional properties
      "number": number,
      "comment": comment,
      "created": dateFormat.format(created!), // Use non-null assertion for required fields
      "status": status,
      "idEvaluateDTO": idEvaluateDTO,
      "idBill": idBill,
      "nameEvaluateDTO": nameEvaluateDTO,
    };
  }
}
