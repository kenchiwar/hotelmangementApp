import 'package:flutter/material.dart';
import 'package:hotelmanagement/ApiHelper/SearchHotelApi.dart';
import 'package:hotelmanagement/entities/City.dart';
import 'package:hotelmanagement/entities/District.dart';
import 'package:hotelmanagement/entities/HotelDetailDTO.dart';
import 'package:hotelmanagement/entities/SelectHelperHotel.dart';
import 'package:hotelmanagement/entities/Ward.dart';
import 'package:hotelmanagement/homePage.dart';

class SeachHotelPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SearchHotelPageState();
  }
}

class SearchHotelPageState extends State<SeachHotelPage> {
  Future<List<HotelDetailDto>>? data ;
  List<City>? cities =[
  // City(Name:"met moi",Id:"aaa"),
  // City(Name:"met moi 123",Id:"naaaaan")
];



  List<District>? districts=[];
  List<Ward>? wards=[];
  var city = TextEditingController(text: "");
  var ward = TextEditingController(text: "");
  var username = TextEditingController(text: "");
  var district = TextEditingController(text: "");
  var priceMin = TextEditingController(text: "");
  var priceMax = TextEditingController(text: "");
  var services = TextEditingController(text: "");

  @override //load lại trang nhg code ở trong sẽ ko chạy, chỉ chạy lần đầu thôi
  void initState() {
    var apiHotelSearch = SearchHotelApi();
    data = apiHotelSearch.findAll();

     apiHotelSearch.listCity()!.then((value) {    // ! có hoặc ko có báo đỏ thì có đi
        cities = value ??[];
        cities!.add(City(Id:"",Name:"Select city"));
       return value ;
     } );

    // apiHotelSearch.listCity().then((value) => {
    // setState(() {
    // cities =value ??[];
    // } )
    //
    // });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Explore",
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
      body:Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],


        ),
        child :FutureBuilder<List<HotelDetailDto>>(
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
                    )
                    ;
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
      )
      ,





      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This
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
                // Handle the tap event here
                // Add your desired functionality
              },
              child: Column(
                children: [
                  Icon(Icons.explore, color: Colors.blue),
                  SizedBox(height: 4),
                  Divider(color: Colors.blue, height: 0), // Added Divider
                ],
              ),
            ),
            label: '',
          ),
        ],
      ),

    );
  }

  void _showSearchDialog(context) {
    showDialog(
      context: context,

      builder: (context) => StatefulBuilder(
          builder: (context, setState)=>  AlertDialog(
            title: Text('Tìm kiếm'),
            content: Column(
              children: <Widget>[
                TextFormField(
                    controller: priceMin,  //nhớ lưa ý vậy thôi
                    decoration: InputDecoration(  //thiết lập kiểu trang trí cho text
                      hintText: "Price Min", //kiểu như hint username pass word bình thường thôi
                    ),

                    maxLines: 1,
                    keyboardType: TextInputType.number, // chỉnh kiểu dữ liệu vậy thôi
                    onChanged: (value){
                      setState( () {
                        priceMin.text = value;
                      });
                    }
                ),
                TextFormField(
                    controller: priceMax,  //nhớ lưa ý vậy thôi
                    decoration: InputDecoration(  //thiết lập kiểu trang trí cho text
                      hintText: "Price Max", //kiểu như hint username pass word bình thường thôi
                    ),

                    maxLines: 1,
                    keyboardType: TextInputType.number, // chỉnh kiểu dữ liệu vậy thôi
                    onChanged: (value){
                      setState( () {
                        priceMax.text = value;
                      });
                    }
                ),

                DropdownButtonFormField(
                  value: city.text ?? "", // Selected value (initially null)
                  hint: Text("Select a city"), // Placeholder text
                  items: cities!
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value.Id,
                      child: Text("${value.Name}"),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState (()  {
                      ChangeCity(newValue);
                    });

                  }, // Function to handle selection change
                ),
                DropdownButtonFormField(
                  value: district.text ?? "", // Selected value (initially null)
                  hint: Text("Select a city"), // Placeholder text
                  items: districts!
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value.Id,
                      child: Text("${value.Name}"),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState (()  {
                      ChangDistric(newValue);
                    });
                  }, // Function to handle selection change
                ),
                DropdownButtonFormField(
                  value: ward.text ?? "", // Selected value (initially null)
                  hint: Text("Select a city"), // Placeholder text
                  items: wards!
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value.Id,
                      child: Text("${value.Name}"),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState (()  {
                      ChangeWard(newValue);
                    });

                  }, // Function to handle selection change
                ),


            Wrap(
              spacing: 3.0,
              children: [
                ElevatedButton(
                  onPressed: () => {
          setState (()  {
            reset();
          })
                  },
                  child: Text("Reset"),
                ),
                ElevatedButton(
                  onPressed: () =>  submit(),
                  child: Text("Submit"),
                ),
                ElevatedButton(
                  onPressed: () => cancel(),
                  child: Text("Cancel"),
                ),
              ],
            ),

              ],
            ),
          ),
      ),


    );
  }
  void ChangeWard(String? value){
    setState (()  {
      ward.text=value??"";


    });
  }
  void ChangDistric(String? value){

      district.text=value??"";
      ward.text="";

      var met = districts!.firstWhere((element) => element.Id==district.text, orElse: () => District()); // -1
      wards = met!.Wards ;
      wards!.add(Ward(Id:"",Name:"Select Ward"));



  }
  void ChangeCity(String? value){

     city.text=value??"";
     district.text="";
     ward.text="";


     var met = cities!.firstWhere((element) => element.Id==city.text, orElse: () => City()); // -1
     districts = met!.Districts ;
     districts!.add(District(Id:"",Name:"Select District"));
     wards=[];




    }
  void cancel(){
    Navigator.pop(context);
  }
  void reset(){

     districts=[];
    wards=[];
   city = TextEditingController(text: "");
     ward = TextEditingController(text: "");
     username = TextEditingController(text: "");
     district = TextEditingController(text: "");
     priceMin = TextEditingController(text: "");
     priceMax = TextEditingController(text: "");
     services = TextEditingController(text: "");

  }
  void submit(){
    var selectHelper = SelectHelperHotel(
        city: city.text, ward: ward.text, district: district.text

    );
    selectHelper.priceMin =  int.tryParse(priceMin.text) ;
    selectHelper.priceMax = int.tryParse(priceMax.text) ;
    var api = SearchHotelApi();
    var metmoi = SelectHelperHotel();
    metmoi.city="25";
    setState (() {
    data=  api.findSelectHelperHotel(metmoi);
    });

  }
    void _incrementCounter  () async{
    setState (() async{
      var apiHotelSearch = SearchHotelApi();
      data = apiHotelSearch.findAll();
      cities = await apiHotelSearch.listCity() ??[];

      cities!.add(City(Id:"",Name:"Select city"));
      cities!.first.Districts!.first.Wards!.forEach((element) {
        print(element.Id);
      }) ;
      reset();


    } );



  }
  void floatingActionButtonOnPressHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),  //tên function cần chuyển vậy thôi
      ),
    );
  }

}


