import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _HomePage(context);
  }
}

Widget _HomePage (BuildContext context) {

  return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 51, 78, 1),
        title: Text("Routely"),
      ),
      body: Container(
        // padding: EdgeInsets.only(top: 10.0, left: 20.0),
        width: MediaQuery.of(context).size.width,

        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.hasData){
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
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
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.network("${club!['Foto']}"),
                            SizedBox(height: 20,),
                            Row(
                              children: [Text(club['Title'],textAlign: TextAlign.left,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                SizedBox(width: 20,),
                                Text(club['Content'],style: TextStyle(fontSize: 12),),],
                            ),
                            SizedBox(height: 13,),
                            Row(
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.comment)),
                                IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
                              ],
                            )

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
      )
  );
}

  // videocek(BuildContext context,height) {
  //   return Container(
  //     height: height / 1.38,
  //     padding: EdgeInsets.only(top: 10.0, left: 20.0),
  //     child: FutureBuilder<List<Posts>>(
  //       future: PostList(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           var Postlar = snapshot.data;
  //           return GridView.builder(
  //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //               crossAxisCount: 2,
  //               childAspectRatio: 2 / 3,
  //             ),
  //             itemCount: Postlar!.length,
  //             itemBuilder: (context, index) {
  //               var Post = Postlar[index];
  //               return GestureDetector(
  //                 onTap: () {
  //                   // Navigator.push(
  //                   //     context,
  //                   //     MaterialPageRoute(
  //                   //         builder: (context) =>
  //                   //             vakiflarDetails(
  //                   //               vakif: vakif,
  //                   //             )));
  //                   // print("vakif adı: ${vakif.vakif_Adi}");
  //                 },
  //                 child: Card(
  //                   margin: EdgeInsets.all(5.0),
  //                   shape: RoundedRectangleBorder(
  //                     side: BorderSide(color: Colors.white70, width: 1),
  //                     borderRadius: BorderRadius.circular(20),
  //                   ),
  //                   color: Colors.green,
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: Image.network("${Post.post_Foto}"),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: Text(
  //                           Post.post_Title,
  //                           style: TextStyle(
  //                               fontSize: 16,
  //                               fontWeight: FontWeight.bold,
  //                               color: Colors.white),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.all(8.0),
  //                         child: Text(
  //                           Post.post_Content,
  //                           style: TextStyle(fontSize: 12, color: Colors.white),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               );
  //             },
  //           );
  //         }
  //         else {
  //           return Center(
  //               child: CircularProgressIndicator(
  //                 color: Color.fromRGBO(255, 169, 50, 1),
  //               ));
  //         }
  //       },
  //     ),
  //   );
  // }
