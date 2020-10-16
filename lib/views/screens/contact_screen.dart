import 'package:flutter/material.dart';
import '../../core/constants.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

final formKey = GlobalKey<FormState>();

class _ContactScreenState extends State<ContactScreen> {
//  String name;
//  String email;
//  String phoneNumber;
//  String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kSmallVerticalSpacing,
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Contact Us",
                style: kHeadingTextStyle,
              ),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Name',
                        contentPadding: EdgeInsets.all(8.0),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 0.5),
                        ),
                        labelStyle: TextStyle(color: kHintColor),
                      ),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: validateName,
                    ),
                    kExtraSmallVerticalSpacing,
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        contentPadding: EdgeInsets.all(8.0),
                        border: const OutlineInputBorder(),
                        labelStyle: TextStyle(color: kHintColor),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: validateEmail,
                    ),
                    kExtraSmallVerticalSpacing,
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        contentPadding: EdgeInsets.all(8.0),
                        border: const OutlineInputBorder(),
                        labelStyle: TextStyle(color: kHintColor),
                      ),
                      maxLength: 11,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: validatePhoneNumber,
                    ),
                    kExtraSmallVerticalSpacing,
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Message',
                        contentPadding: EdgeInsets.all(8.0),
                        border: const OutlineInputBorder(),
                        labelStyle: TextStyle(color: kHintColor),
                      ),
                      maxLines: 8,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      validator: validatePhoneNumber,
                    ),
                    kExtraSmallVerticalSpacing,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RaisedButton(
                          onPressed: () {},
                          color: kPrimaryColor,
                          child: Text(
                            'SEND',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String validateName(String value) =>
      value.isEmpty ? 'Enter a valid Name' : null;

  String validateMessage(String value) =>
      value.isEmpty ? 'Enter a Message' : null;

  String validatePhoneNumber(String value) =>
      value.length < 11 ? 'Enter a valid Phone Number' : null;

  String validateEmail(String value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    return !emailValid ? 'Enter a Valid Email Address' : null;
  }
}
