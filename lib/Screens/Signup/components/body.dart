import 'package:flutter/material.dart';
import 'package:trafficstatus/Screens/Signup/components/background.dart';
import 'package:trafficstatus/components/rounded_button.dart';
import 'package:trafficstatus/components/rounded_input_field.dart';
import 'package:trafficstatus/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN IN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            // SvgPicture.asset(
            //   "assets/icons/signup.svg",
            //   height: size.height * 0.35,
            // ),
            Image.asset("assets/icons/2.png",width: 300,height: 300,),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGN IN",
              press: () {},
            ),

          ],
        ),
      ),
    );
  }
}
