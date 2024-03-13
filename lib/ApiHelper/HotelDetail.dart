import 'dart:convert';

import 'package:hotelmanagement/ApiHelper/urlApi.dart';
import 'package:hotelmanagement/entities/HotelDTO.dart';
import 'package:hotelmanagement/entities/hotel.dart';
import 'package:http/http.dart' as http;
class HotelDetail {


  String BASE_URL = UrlApi.BASE_URL;
  Future<HotelDTO> find(int id) async {
    var response = await http.get(Uri.parse(BASE_URL+'hoteldetail/$id'));

    if (response.statusCode == 200) {

      return HotelDTO.fromMap(jsonDecode(response.body));
    } else {
      throw Exception("Bad Request");
    }
  }

}