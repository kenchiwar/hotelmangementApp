import 'package:hotelmanagement/models/hotelModel.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanagement/entities/hotel.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<String> urls = [
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/2uNW4WbgBXL25BAbXGLnLqX71Sw.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/lNkDYKmrVem1J0aAfCnQlJOCKn.jpgT",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/wrFpXMNBRj2PBiN4Z5kix51XaIZ.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/r6pPUVUKU5eIpYj4oEzidk5ZibB.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/x1txcDXkcM65gl7w20PwYSxAYah.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/ptSrT1JwZFWGhjSpYUtJaasQrh.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/wMq9kQXTeQCHUZOG4fAe5cAxyUA.jpg",
    "https://image.tmdb.org/t/p/w370_and_h556_bestv2/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg",
  ];

  List<Hotel> hotels = [
    Hotel(1, "hotel 1", 5.6, 3, "assets/images/black_chair.jpg"),
    Hotel(2, "hotel 2", 5.6, 3, "assets/images/blue_sofa.jpg"),
    Hotel(3, "hotel 3", 5.6, 3, "assets/images/copper_lamp.jpg"),
    Hotel(4, "hotel 4", 5.6, 3, "assets/images/orange_lamp.jpg"),
    Hotel(5, "hotel 5", 5.6, 3, "assets/images/pink_chair.jpg"),
    Hotel(6, "hotel 6", 5.6, 3, "assets/images/white_chair.jpg"),
    Hotel(7, "hotel 4", 5.6, 7, "assets/images/white_lamp.jpg"),
  ];

  // @override
  // void initState() {
  //   var hotelModel = HotelModel();
  //   hotels = hotelModel.findAll();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Test Snap list scroll",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        height: 250,
        child: ScrollSnapList(
          itemBuilder: _buildListItem,
          itemCount: hotels.length,
          itemSize: 150,
          onItemFocus: (index) {},
          // dynamicItemSize: true,
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    Hotel hotel = hotels[index];
    return SizedBox(
      width: 200,
      height: 300,
      child: Card(
        elevation: 12,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  hotel.photo,
                  fit: BoxFit.cover,
                  width: 190,
                  height: 120,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  hotel.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${hotel.price}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${hotel.star} Reviews',
                            style: const TextStyle(color: Colors.blue),
                          )
                        ]))
              ]),
        ),
      ),
    );
  }
}
