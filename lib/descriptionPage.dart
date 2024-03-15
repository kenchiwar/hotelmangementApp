import 'package:hotelmanagement/ApiHelper/Category.dart';
import 'package:hotelmanagement/entities/HotelDTO.dart';
import 'package:hotelmanagement/entities/HotelDetailDTO.dart';

import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanagement/entities/hotel.dart';

import 'entities/CategoryimageDTO.dart';

class DescriptionPage extends StatefulWidget {
  String? description;
  String? policy;
  DescriptionPage({required this.description,required this.policy});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<DescriptionPage>  {

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
        automaticallyImplyLeading: true,
        
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
               ListTile(
                    title: Text("Descriptin Hotel",style: TextStyle(fontFamily: 'Roboto',fontSize: 20,fontWeight: FontWeight.w600)),
                  subtitle: Text(widget.description!,style: TextStyle(fontFamily: 'Roboto',fontSize: 15,), ),
                ),

              ListTile(
                  title: Text("Policy Hotel",style: TextStyle(fontFamily: 'Roboto',fontSize: 20,fontWeight: FontWeight.w600)),
                  subtitle: Text(widget.policy!,style: TextStyle(fontFamily: 'Roboto',fontSize: 15,),),
                ),

            ],
          )
      )
    );
  }
}

