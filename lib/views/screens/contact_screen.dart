import 'package:flutter/material.dart';

import '../../core/constants.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

final formKey = GlobalKey<FormState>();

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contact Us",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            kSmallVerticalSpacing,
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Name',
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5),
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      kSmallVerticalSpacing,
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      kSmallVerticalSpacing,
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      ),
                      kSmallVerticalSpacing,
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Message',
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5),
                          ),
                        ),
                        maxLines: 8,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                      ),
                      kSmallVerticalSpacing,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RaisedButton(
                            onPressed: () {},
                            padding: const EdgeInsets.all(16.0),
                            color: Colors.grey.shade800,
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
