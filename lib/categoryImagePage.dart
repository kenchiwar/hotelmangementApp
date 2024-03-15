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
      appBar: AppBar(
        title: Text(
          "Description And Policy",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
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
         return SizedBox(
             height: 100,
             width: MediaQuery.of(context).size.width,
             child: Column(
             mainAxisSize: MainAxisSize.min,
             verticalDirection: VerticalDirection.down,
             children: [
               Expanded(child: Text(e.name!)),
               Expanded(
                   child: Row(
                     children: imagesCategory.map((i) {
                       return Expanded(
                         child: Image.network(i,
                             height: 100,
                             width: 100,
                             alignment: Alignment.center,
                             fit: BoxFit.cover),
                       );
                     }).toList(),
                   ))
             ]));
       }).toList(),),
      ),
    );
  }
}
