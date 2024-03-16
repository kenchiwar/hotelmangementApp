import 'package:hotelmanagement/ApiHelper/Category.dart';
import 'package:hotelmanagement/ApiHelper/IndexHotelApi.dart';

import 'package:hotelmanagement/entities/HotelDetailDTO.dart';
import 'package:hotelmanagement/util/emoticon_faces.dart';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanagement/entities/hotel.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

Future<List<HotelDetailDto>>? hotelsDTO;
var dateFormat = DateFormat("dd/MM/yyyy");

 @override
 void initState()  {

  var hotelAPI = IndexHotelApi();
  hotelsDTO = hotelAPI.findAll();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: ''),
        ],
      ),
      body: SafeArea(
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 25.0),
             child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                       "Hi Bro",
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 24,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     SizedBox(
                       height: 8,
                     ),
                     Text(
                       "23 Jan, 2021",
                       style: TextStyle(
                           color: Colors.blue[200]
                       ),
                     ),
                     Container(
                       decoration: BoxDecoration(
                         color: Colors.blue[600],
                         borderRadius: BorderRadius.circular(12),
                       ),
                       padding: EdgeInsets.all(12),
                       child: Icon(
                         Icons.notifications,
                         color: Colors.white,
                       ),
                     ),
                   ],
                 ),

                 SizedBox(
                   height: 25,
                 ),

                 //search
                 Container(
                   decoration: BoxDecoration(
                       color: Colors.blue[600],
                       borderRadius: BorderRadius.circular(12)
                   ),
                   padding: EdgeInsets.all(12),
                   child: Row(children: [
                     Icon(
                       Icons.search,
                       color: Colors.white,
                     ),
                     SizedBox(
                       width: 5,
                     ),
                     Text(
                       "Search",
                       style: TextStyle(
                           color: Colors.white
                       ),
                     )
                   ],),
                 ),

                 SizedBox(
                   height: 25,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text(
                       "How do you feel?",
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     Icon(Icons.more_horiz, color: Colors.white,)
                   ],
                 ),

                 SizedBox(
                   height: 25,
                 ),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                       children: [
                         EmoticonFace(emoticonFace: '😞'),
                         SizedBox(height: 8,),
                         Text("Bad", style: TextStyle(color: Colors.white),),
                       ],
                     ),
                     Column(
                       children: [
                         EmoticonFace(emoticonFace: '🙂'),
                         SizedBox(height: 8,),
                         Text("Fine", style: TextStyle(color: Colors.white),),
                       ],
                     ),
                     Column(
                       children: [
                         EmoticonFace(emoticonFace: '🤗'),
                         SizedBox(height: 8,),
                         Text("Well", style: TextStyle(color: Colors.white),),
                       ],
                     ),
                     Column(
                       children: [
                         EmoticonFace(emoticonFace: '😘'),
                         SizedBox(height: 8,),
                         Text("Excellent", style: TextStyle(color: Colors.white),),
                       ],
                     ),
                   ],
                 ),
               ],
             ),
           ),
          SizedBox(height: 25,),

          Expanded(
           child: Container(
             padding: EdgeInsets.all(25),
             color: Colors.grey[200],
             child: Center(
               child: FutureBuilder(
                 future: hotelsDTO,
                 builder: (BuildContext context, AsyncSnapshot<
                     List<HotelDetailDto>> snapshot) {
                   if (snapshot.hasData) {
                     return ListView.separated(
                       scrollDirection: Axis.horizontal,
                       itemCount: snapshot.data!.length,
                       separatorBuilder: (context, _) => SizedBox(width: 20,),
                       itemBuilder: (context, i){
                          return Container(

                            width: 220,
                            // height: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // Điều chỉnh vị trí của đường bóng
                                ),
                              ],
                              border: Border.all(
                                color: Colors.grey[200]!, // Màu viền
                                width: 1, // Độ dày của viền
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () => hotel_detail(snapshot.data![i].idAccount!),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                child: Column(
                                  children: [
                                    Image.network(
                                      snapshot.data![i].mainPhoto!,
                                      fit: BoxFit.cover,
                                      width: 230,
                                      height: 260,
                                    ),

                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:[
                                            Text(
                                              '${snapshot.data![i].name}',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Wrap(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${snapshot.data![i].haha}/5 ',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 16,
                                                          color: Colors.blueAccent
                                                      ),
                                                    ),
                                                    Text(
                                                      '(${snapshot.data![i].totalrating})',
                                                      style: TextStyle(
                                                        fontSize: 16,

                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            Wrap(
                                              spacing: 3.0,
                                              children: List.generate(snapshot.data!.length, (i) {
                                                return Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(Icons.star, color: Colors.yellow),
                                                  ],
                                                );
                                              },
                                              ),
                                            ),
                                            Wrap(
                                              spacing: 10.0,
                                              children: [
                                                Text(
                                                  "${snapshot.data![i].price!.toInt()} VND",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      decoration: TextDecoration.lineThrough,
                                                      fontSize: 18
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Wrap(
                                              spacing: 10.0,
                                              children: [

                                                Text("${snapshot.data![i].priceDiscount!.toInt()} VND",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 20
                                                  ),
                                                ),

                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          );
                       }
                     );
                   } else {
                     return Center(
                       child: CircularProgressIndicator(),);
                   }
                 },
               ),
             ),
           )
          )
        ],
              ),
      ),
    );
  }

  void hotel_detail(int id){
   print("${id}");
  }
}
