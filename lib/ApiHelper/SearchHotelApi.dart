import 'dart:convert';

import 'package:hotelmanagement/ApiHelper/urlApi.dart';
import 'package:hotelmanagement/entities/HotelDTO.dart';
import 'package:hotelmanagement/entities/hotel.dart';
import 'package:http/http.dart' as http;
class SearHotelApi {


  String BASE_URL = UrlApi.BASE_URL;
  Future<HotelDTO> findAll() async {
    var response = await http.get(Uri.parse(BASE_URL));
    print("fffffaaaaa");
    if (response.statusCode == 200) {
      print("fffff");
      dynamic result = jsonDecode(response.body);
      var aaaa=HotelDTO.fromMap(jsonDecode(response.body));
      print("${aaaa.address}");
      aaaa.categoryimages!.forEach((element) {
        print("category:${element.name} ");

      });
      return     aaaa;

    } else {
      throw Exception("Bad Request");
    }
  }
}