import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}
final List<String> imgList = [
  'https://idsb.tmgrup.com.tr/ly/uploads/images/2020/03/04/23495.jpg',
  'https://www.swarco.com/sites/default/files/public/2020-02/shutterstock_110041646%20congestion%20cars.jpg',
  'https://cdnuploads.aa.com.tr/uploads/Contents/2014/04/01/thumbs_b_c_ba91353caf2e6291f8ccdf66ed523df4.jpg',
  'https://www.ingilteredeyasiyorum.com/wp-content/uploads/2017/11/Trafik-Kaza.jpg',

];
class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return _SearchPage(context);
  }



final List<Widget> imageSliders = imgList.map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

              ),
            ),
          ],
        )
    ),
  ),
)).toList();
  int _current = 0;
Widget _SearchPage (BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromRGBO(0, 51, 78, 1),
      title: Text("Routely"),
      actions: [
        IconButton(onPressed: () {

        }, icon: Icon(Icons.search_rounded))
      ],
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              child: GestureDetector(
                onTap: () {
                  print("tıklandı ${imgList[_current]}");
                },
                child: CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      initialPage: 2,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }
                  ),

                ),
              )),
          SizedBox(height: 20,),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.hasData){
                    return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 3 / 3,
                      ),
                      itemCount:  snapshot.data?.docs.length,
                      itemBuilder: (context,index){
                        var club=snapshot.data?.docs[index];
                        return GestureDetector(
                          onTap: (){
                            // print("okul adı: ${club.school_Ad}");
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsSchools(school: club ,)));
                          },
                          child: Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network("${club!['Foto']}",fit: BoxFit.fill),
                                // Text("${club['Title']}")

                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }else{
                    return Center(child: CircularProgressIndicator(color: Color.fromARGB(255, 169, 50, 1),));
                  }
                }
            ),
          ),
        ],
      ),
    ),
  );
}
}