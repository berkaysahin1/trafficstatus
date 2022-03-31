import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trafficstatus/Screens/Login/login_screen.dart';
import 'package:trafficstatus/profile_header_widget.dart';

import 'auth.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _ProfilePage(context);
  }
}

Widget _ProfilePage (BuildContext context)
{
  AuthService _authService = AuthService();
  return Scaffold(

    appBar:  AppBar(
          backgroundColor: Color.fromRGBO(0, 51, 78, 1),
          title: Text(
            "bsahin.py",
            style:
            TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          centerTitle: false,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () {
                _authService.signOut();
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) =>LoginScreen()));
                }
            )
          ],
        ),


    body: DefaultTabController(
      length: 2,
      child: NestedScrollView(

        headerSliverBuilder: (context, _) {
          return [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  profileHeaderWidget(context),
                ],
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Material(
                color: Colors.white,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[400],
                  indicatorWeight: 1,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.grid_on_sharp,
                        color: Colors.black,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.people,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: TabBarView(
                  children: [
                    StreamBuilder(
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
                                        Image.network("${club!['Foto']}"),

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
                    StreamBuilder(
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
                                        Image.network("${club!['Foto']}"),

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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}



