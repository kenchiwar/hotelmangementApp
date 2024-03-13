import 'dart:convert';

import 'package:hotelmanagement/ApiHelper/urlApi.dart';
import 'package:hotelmanagement/entities/HotelDTO.dart';
import 'package:hotelmanagement/entities/HotelDetailDTO.dart';
import 'package:hotelmanagement/entities/hotel.dart';
import 'package:http/http.dart' as http;

class SearchHotelApi {
  String BASE_URL = UrlApi.BASE_URL;


  Future<List<HotelDetailDto>> findAll() async {
    var response = await http.get(Uri.parse(BASE_URL));
    print("fffffaaaaa");
    if (response.statusCode == 200) {
      print("fffff");
      List<dynamic> result = jsonDecode(response.body);
      var aaaa=result.map((item) => HotelDetailDto.fromMap(item)).toList();
      aaaa.forEach((element) {
        print("${element.totalrating}");
      });

      return     aaaa;

    } else {
      throw Exception("Bad Request");
    }
  }


}
