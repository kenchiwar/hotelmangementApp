import 'package:hotelmanagement/ApiHelper/Category.dart';
import 'package:hotelmanagement/entities/CategoryimageDTO.dart';
import 'package:hotelmanagement/entities/HotelDTO.dart';
import 'package:hotelmanagement/entities/HotelDetailDTO.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanagement/entities/hotel.dart';

import 'ApiHelper/HotelDetail.dart';

class DetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<DetailPage> {
  Future<HotelDTO>? hotel;
  List<String> urlImages = [];
  var name;
  void getApiStudent() {
    HotelDetail hotelAPI = new HotelDetail();
    hotel = hotelAPI.find(3);
  }

  @override
  void initState() {
    getApiStudent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "e",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: hotel,
        builder: (BuildContext context, AsyncSnapshot<HotelDTO> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: 1,
                itemBuilder: (context, i) {
                  int indexImage = 0;
                  urlImages.clear();
                  print(snapshot.data!.address!);
                  snapshot.data!.categoryimages!.forEach((element) {
                    element.images!.forEach((e) {
                      if (indexImage < 4) {
                        urlImages.add(e.name.toString());
                      }
                      indexImage++;
                    });
                  });
                  return SingleChildScrollView(
                    scrollDirection : Axis.vertical,
                      child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 1),
                          child: Image.network(snapshot.data!.mainPhoto!,
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              fit: BoxFit.cover)),
                      Row(
                        children: urlImages.map((item) {
                          indexImage++;
                          print(indexImage);

                          return Expanded(
                              flex: 2,
                              child: Image.network(item,
                                  height: 100,
                                  width: 100,
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover));
                        }).toList(),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(snapshot.data!.name!,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(Icons.location_on_sharp),
                              Expanded(
                                  child: Text(snapshot.data!.address!,
                                      style: TextStyle(fontFamily: 'Roboto')))
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          child: ListTile(
                            title: Text("Descriptin Hotel",style: TextStyle(fontFamily: 'Roboto',fontSize: 20,fontWeight: FontWeight.w600)),
                            subtitle: Text(snapshot.data!.description!,style: TextStyle(fontFamily: 'Roboto',fontSize: 18,)),
                          ))
                    ],
                  ));
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}