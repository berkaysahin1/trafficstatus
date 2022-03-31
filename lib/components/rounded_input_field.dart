import 'package:flutter/material.dart';
import 'package:trafficstatus/components/text_field_container.dart';
import 'package:trafficstatus/constants.dart';

class RoundedInputField extends StatelessWidget {
  var tfkullanici=TextEditingController();

  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  RoundedInputField({
    Key ?key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: tfkullanici,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
