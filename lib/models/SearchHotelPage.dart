import 'package:flutter/material.dart';
import 'package:hotelmanagement/ApiHelper/SearchHotelApi.dart';
import 'package:hotelmanagement/entities/HotelDetailDTO.dart';

class SeachHotelPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SearchHotelPageState();
  }
}

class SearchHotelPageState extends State<SeachHotelPage> {
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _showSearchDialog(context);
            },
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body:
      FutureBuilder<List<HotelDetailDto>>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return     Padding(
              padding: EdgeInsets.only(top: 16.0, left: 2.0, right: 2.0),

              child :  GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.58,
                // Tỉ lệ giữa chiều rộng và chiều cao của card
                children : snapshot.data!.map((data1) {
                  return Card(
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
                }).toList(),

              ),
            );
          }
          else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }


          // Hiển thị loading indicator trong khi chờ dữ liệu
          return Center(child: CircularProgressIndicator());
        },
      ),





      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This

    );
  }
  void _incrementCounter(){
    setState(() {
      var apiHotelSearch = SearchHotelApi();
      data = apiHotelSearch.findAll();
    } );


  }
  void _showSearchDialog(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Tìm kiếm'),
        content: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Nhập từ khóa',
              ),
            ),
            ElevatedButton(
              child: Text('Tìm kiếm'),
              onPressed: () {
                // Xử lý dữ liệu nhập vào
               cancel();
              },
            ),
          ],
        ),
      ),
    );
  }
  void cancel(){
    Navigator.pop(context);
  }

}


