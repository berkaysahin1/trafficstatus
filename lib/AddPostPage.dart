import 'package:flutter/material.dart';

import 'components/text_field_container.dart';
import 'constants.dart';

class AddPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _AddPostPage(context);
  }
}

Widget _AddPostPage (BuildContext context){
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromRGBO(0, 51, 78, 1),
      title: Text("Routely"),
    ),
    body: Container(
      child: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFieldContainer(
              child: TextField(
                obscureText: true,
                // controller: tfsifre,
                // onChanged: onChanged,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Content",
                  icon: Icon(
                    Icons.arrow_circle_right,
                    color: kPrimaryColor,
                  ),

                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                obscureText: true,
                // controller: tfsifre,
                // onChanged: onChanged,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Add Location",
                  icon: Icon(
                    Icons.location_on,
                    color: kPrimaryColor,
                  ),

                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.photo_camera),
                  label: Text("Add Photo",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: (){

                  },
                  style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      textStyle: TextStyle(
                          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                ),),),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.ios_share),
                  label: Text("Share",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: (){

                  },
                  style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      textStyle: TextStyle(
                          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                ),),),
          ],
        ),
      ),
    ),
  );



}