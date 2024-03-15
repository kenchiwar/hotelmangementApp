import 'package:flutter/cupertino.dart';
import 'package:hotelmanagement/ApiHelper/Category.dart';
import 'package:hotelmanagement/entities/CategoryimageDTO.dart';
import 'package:hotelmanagement/entities/HotelDTO.dart';
import 'package:hotelmanagement/entities/HotelDetailDTO.dart';

import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanagement/entities/hotel.dart';

class CategoryImagePage extends StatefulWidget {
  List<CategoryimageDTO>? categoryimageDTO;
  CategoryImagePage({required this.categoryimageDTO});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<CategoryImagePage> {
  List<String> imagesCategory = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        title: Text(
          "All Photos",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Color(0xff000000),
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(

       child: Column(
         mainAxisSize: MainAxisSize.min,
         children: widget.categoryimageDTO!.map((e) {
         imagesCategory.clear();
         e.images!.forEach((element) {
           if (element != null) {
             imagesCategory.add(element.name.toString());
           }
         });
         print(e.name);
         print(imagesCategory);
         return ListView(
             shrinkWrap: true,
             children: [
               Flexible(child: Text(e.name!,style: TextStyle(color: Colors.white,fontFamily: 'Roboto',fontSize: 20,fontWeight: FontWeight.w600),)),
               Flexible(
                   child: Wrap(
                     spacing: 8.0, // gap between adjacent chips
                     runSpacing: 4.0,
                     children: imagesCategory.map((i) {
                       return Image.network(i,
                             height: 100,
                             width: 100,
                             alignment: Alignment.center,
                             fit: BoxFit.cover,
                       );
                     }).toList(),
                   ))
             ]);
       }).toList(),),
      ),
    );
  }
}
