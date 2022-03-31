import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _NotificationsPage(context);
  }
}

Widget _NotificationsPage (BuildContext context){
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromRGBO(0, 51, 78, 1),
      title: Text("Routely"),
    ),
    body: Container(
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child:
            StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Users').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                      physics: ClampingScrollPhysics(),
                      itemCount:  snapshot.data?.docs.length,
                      itemBuilder: (context,index){
                        var club=snapshot.data?.docs[index];
                        return GestureDetector(
                          onTap: (){
                            // print("okul adı: ${club.school_Ad}");
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsSchools(school: club ,)));
                          },
                          child:Container(
                            decoration: BoxDecoration( //                    <-- BoxDecoration
                              border: Border(bottom: BorderSide()),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(club!["ProfilePicture"]),
                              ),
                              title: Text(club["Nickname"]),
                              subtitle: Text("Liked Your Post"),
                              trailing: Icon(Icons.favorite),
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
    ),
  );



}