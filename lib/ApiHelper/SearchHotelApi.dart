import 'dart:convert';

import 'package:hotelmanagement/ApiHelper/urlApi.dart';
import 'package:hotelmanagement/entities/City.dart';
import 'package:hotelmanagement/entities/HotelDTO.dart';
import 'package:hotelmanagement/entities/HotelDetailDTO.dart';
import 'package:hotelmanagement/entities/SelectHelperHotel.dart';
import 'package:hotelmanagement/entities/hotel.dart';
import 'package:http/http.dart' as http;

class SearchHotelApi {
  String BASE_URL = UrlApi.BASE_URL;


  Future<List<HotelDetailDto>> findAll() async {
    var response = await http.get(Uri.parse(BASE_URL+"api/search/demo2"));

    if (response.statusCode == 200) {

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
  Future<List<City>> listCity() async {
    var response = await http.get(Uri.parse("https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json"));
    print("fffffaaaaa");
    if (response.statusCode == 200) {
      print("fffff");
      List<dynamic> result = jsonDecode(response.body);

      var aaaa=result.map((item) => City.fromMap(item)).toList();


      return     aaaa;

    } else {
      throw Exception("Bad Request");
    }
  }
  Future<List<HotelDetailDto>> findSelectHelperHotel(SelectHelperHotel selectHelper) async {

   var response = await http.post(
       Uri.parse(BASE_URL+"api/search/search"),
      body: json.encode(selectHelper.toMap()),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {

      List<dynamic> result = jsonDecode(response.body);
      var aaaa=result.map((item) => HotelDetailDto.fromMap(item)).toList();


      return     aaaa;

    } else {
      throw Exception("Bad Request");
    }
  }


}
