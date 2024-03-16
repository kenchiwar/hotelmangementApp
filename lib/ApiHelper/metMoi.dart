import 'package:flutter/material.dart';
import 'package:hotelmanagement/ApiHelper/SearchHotelApi.dart';
import 'package:hotelmanagement/entities/HotelDetailDTO.dart';

class ddddd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return aa();
  }
}

class aa extends State<ddddd> {
  Future<List<HotelDetailDto>>? data ;
  @override //load lại trang nhg code ở trong sẽ ko chạy, chỉ chạy lần đầu thôi
  void initState() {
    var apiHotelSearch = SearchHotelApi();
    data = apiHotelSearch.findAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Demo 12 Page",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body:Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16.0, left: 2.0, right: 2.0),

            child :  GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.51,
              // Tỉ lệ giữa chiều rộng và chiều cao của card
              children: List.generate(8, (index) {

                return Card(
                  color: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: <Widget>[
                      Expanded(child: Image.network(
                        '${data1.mainPhoto}',

                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),),

                      Divider(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${data1.name}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,



                              ),
                            ),
                            Text("${data1.address}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black38,



                              ),
                            ),
                            Text("${data1.description}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            Wrap(
                              spacing: 3.0,
                              children: <Widget>[
                                Icon(Icons.star, color: Colors.yellow),
                                Text('${data1.haha}/5'),
                                Text('(${data1.totalrating})')
                              ],
                            ),
                            Wrap(
                              spacing: 10.0,
                              children: <Widget>[
                                // Container(
                                //   decoration: BoxDecoration(
                                //     color: Colors.pink,
                                //
                                //     borderRadius: BorderRadius.circular(10),
                                //   ),
                                //   child:Padding(
                                //     padding: EdgeInsets.all(3),
                                //     child :  Text(
                                //       'Your Text',
                                //       style: TextStyle
                                //         (fontSize: 12,color: Colors.lightGreenAccent),
                                //     ),
                                //   ),
                                // ),
                                Text("${data1.priceDiscount} VND",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                Text(
                                  "${data1.price} VND",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.red,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),

                            Align(
                              alignment: Alignment.topRight,

                              child: ElevatedButton(onPressed: () {},

                                child: Text('Button')
                                ,
                              ),
                            ),


                          ],
                        ),
                      ),


                    ],
                  ),
                );

              }),

            ),
          ),
        ],
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This

    );
  }
  void _incrementCounter(){

  }

}


