import 'package:flutter/material.dart';
import 'package:trafficstatus/HomePage.dart';
import 'package:trafficstatus/Screens/Login/components/background.dart';
import 'package:trafficstatus/Screens/Signup/signup_screen.dart';
import 'package:trafficstatus/components/already_have_an_account_acheck.dart';
import 'package:trafficstatus/components/rounded_button.dart';
import 'package:trafficstatus/components/rounded_input_field.dart';
import 'package:trafficstatus/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trafficstatus/main_screen.dart';

import '../../../auth.dart';
import '../../../components/text_field_container.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
   Body({
    Key ?key,
  }) : super(key: key);
   var tfkullanici=TextEditingController();
   var tfsifre=TextEditingController();
  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            // SvgPicture.asset(
            //   "assets/icons/login.svg",
            //   height: size.height * 0.35,
            // ),
            Image.asset("assets/icons/2.png",width: 300,height: 300,),
            SizedBox(height: size.height * 0.03),


        TextFieldContainer(
          child: TextField(
            controller: tfkullanici,
            // onChanged: onChanged,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              icon: Icon(
                Icons.people,
                color: kPrimaryColor,
              ),
              hintText: "Your Email",
              border: InputBorder.none,
            ),
          ),
        ),
            // RoundedInputField(
            //   hintText: "Your Email",
            //   onChanged: (value) {
            //   },
            // ),

          TextFieldContainer(
            child: TextField(
              obscureText: true,
              controller: tfsifre,
              // onChanged: onChanged,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Password",
                icon: Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                suffixIcon: Icon(
                  Icons.visibility,
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
            child: ElevatedButton(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
          onPressed: (){
            _authService
                .signIn(
                tfkullanici.text, tfsifre.text)
                .then((value) {
              return Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainScreen()));
            });

          },
          style: ElevatedButton.styleFrom(
              primary: kPrimaryColor,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: TextStyle(
                  color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
        ),),),
            // RoundedButton(
            //   text: "LOGIN",
            //   press: () {
            //     _authService
            //         .signIn(
            //         tfkullanici.text, tfsifre.text)
            //         .then((value) {
            //       return Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => MainScreen()));
            //     });
            //   },
            // ),
            SizedBox(height: size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Don’t have an Account ? ",
                style: TextStyle(color: kPrimaryColor),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );

                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),

            // SizedBox(height: 70,)
          ],
        ),
      ),
    );
  }
}
