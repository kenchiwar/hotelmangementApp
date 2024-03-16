import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:hotelmanagement/ApiHelper/Category.dart';
import 'package:hotelmanagement/entities/CategoryimageDTO.dart';
import 'package:hotelmanagement/entities/HotelDTO.dart';
import 'package:hotelmanagement/entities/HotelDetailDTO.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanagement/entities/hotel.dart';

import 'ApiHelper/HotelDetail.dart';
import 'categoryImagePage.dart';
import 'descriptionPage.dart';
import 'homePage.dart';
import 'models/SearchHotelPage.dart';

class DetailPage extends StatefulWidget {
  var id;
  DetailPage({required this.id});
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
  var description;
  var policy;
  var categoryimageDTO;
  var Rooms;
  void getApiStudent() {
    HotelDetail hotelAPI = new HotelDetail();
    hotel = hotelAPI.find(widget.id);
  }

  @override
  void initState() {
    getApiStudent();
    name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "$name",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: true,
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
                  name = snapshot.data!.name!;
                  description = snapshot.data!.description!;
                  policy = snapshot.data!.cancellationPolicy!;
                  categoryimageDTO = snapshot.data!.categoryimages!;
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
                      scrollDirection: Axis.vertical,
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
                                  child: GestureDetector(
                                    child: Image.network(item,
                                        height: 100,
                                        width: 100,
                                        alignment: Alignment.center,
                                        fit: BoxFit.cover),
                                    onTap: () => tapCategoryImage(),
                                  ));
                            }).toList(),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
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
                            margin: EdgeInsets.only(bottom: 5),
                          ),
                          Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_sharp),
                                  Expanded(
                                      child: Text(snapshot.data!.address!,
                                          style:
                                              TextStyle(fontFamily: 'Roboto')))
                                ],
                              )),
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                          ),
                          Container(
                              child: ListTile(
                            title: Text("Descriptin Hotel",
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600)),
                            subtitle: Text(
                              snapshot.data!.description!,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 15,
                              ),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                          Container(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            child: TextButton(
                              child: Text(
                                "See more",
                                style: TextStyle(
                                  color: Color(0xff0194f3),
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              onPressed: () => descriptionPage(),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("Room",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.all(10),
                                itemCount: snapshot.data!.rooms!.length,
                                itemBuilder: (context, i) {
                                  return SizedBox(
                                      height: 220,

                                      child: Card(

                                          color: Color(0xffffffff),
                                          margin: EdgeInsets.only(bottom: 10),
                                          elevation: 2,
                                          child: ListTile(
                                            horizontalTitleGap: 20,
                                            title: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "Room : ${snapshot.data!.rooms![i].name!}",
                                                    style: TextStyle(
                                                      fontSize: 24,
                                                      color: Color(0xff0194f3),
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                      "People : ${snapshot.data!.rooms![i].peopleMax!}",style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xff000000),
                                                    fontWeight:
                                                    FontWeight.w700,
                                                  ),),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                      "\₫ ${snapshot.data!.rooms![i].price!}",
                                                    style: TextStyle(decoration: TextDecoration.lineThrough,fontWeight: FontWeight.w500,fontSize: 16)),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 10),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                      "\₫${snapshot.data!.rooms![i].priceDiscount!}",
                                                      style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: Color(0xffff5e1f)),),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(bottom: 10),
                                                ),
                                                Flexible(
                                                  flex : 1,
                                                  child: TextButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(Color(
                                                                    0xffff5e1f))),
                                                    child: Text(
                                                      "Book Now",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xffffffff),
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    onPressed: () =>
                                                        Booknow(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )));
                                }),
                          ),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                floatingActionButtonOnPressHomePage();
              },
              child: Icon(Icons.home),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                floatingActionButtonOnPressSearchPage();
                // Handle the tap event here
                // Add your desired functionality
              },
              child: Column(
                children: [
                  Icon(Icons.explore, ),


                ],
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  void descriptionPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DescriptionPage(
                  description: description,
                  policy: policy,
                )));
  }

  void tapCategoryImage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                CategoryImagePage(categoryimageDTO: categoryimageDTO)));
  }
  void Booknow(){
    showDialog(
        context: context,
        builder: (context) {
          return Text("False");
        });
  }
  void floatingActionButtonOnPressHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),  //tên function cần chuyển vậy thôi
      ),
    );
  }
  void floatingActionButtonOnPressSearchPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SeachHotelPage(),  //tên function cần chuyển vậy thôi
      ),
    );
  }



}
