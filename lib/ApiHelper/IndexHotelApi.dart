import 'dart:convert';

import 'package:hotelmanagement/ApiHelper/urlApi.dart';

import 'package:hotelmanagement/entities/HotelDetailDTO.dart';

import 'package:http/http.dart' as http;
class IndexHotelApi {

  String BASE_URL = UrlApi.BASE_URL + "hotel/";

  Future<List<HotelDetailDto>>? findAll() async {
    var response = await http.get(Uri.parse(BASE_URL));
    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(response.body);
var aaa =result.map((e) => HotelDetailDto.fromMap(e)).toList();
aaa.forEach((element) {
  print("aaaaaaa ${element.name}");
});
      return  aaa;

    } else {
      throw Exception("Bad Request");
    }
  }
}