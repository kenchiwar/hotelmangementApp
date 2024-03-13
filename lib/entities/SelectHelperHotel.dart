import 'package:intl/intl.dart';

class SelectHelperHotel {
  // Khai báo các thuộc tính riêng tư
  final String city;
  final String ward;
  final String district;
  final int priceMin;
  final int priceMax;
  final List<String> services;

  // Contructor
  SelectHelperHotel({
    required this.city,
    required this.ward,
    required this.district,
    required this.priceMin,
    required this.priceMax,
    required this.services,
  });

  // Hàm tạo từ Map (fromJson)
  SelectHelperHotel.fromMap(Map<String, dynamic> map)
      : city = map["city"] ?? "",
        ward = map["ward"] ?? "",
        district = map["district"] ?? "",
        priceMin = map["priceMin"] ?? 0,
        priceMax = map["priceMax"] ?? 0,
        services = List<String>.from(map["services"] ?? []);

  // Hàm chuyển đổi sang Map (toJson)
  Map<String, dynamic> toMap() {
    return {
      "city": city,
      "ward": ward,
      "district": district,
      "priceMin": priceMin,
      "priceMax": priceMax,
      "services": services,
    };
  }
}
