import 'package:flutter/material.dart';

class IconAndTitleCard extends StatelessWidget {
  final double width;
  final double height;
  final IconData iconData;
  final String title;
  final Function onPressed;

  const IconAndTitleCard({
    Key key,
    this.width = 120.0,
    this.height = 120.0,
    this.onPressed,
    @required this.iconData,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(left: 16.0),
        height: height,
        width: width,
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, size: 32.0),
              SizedBox(height: 4.0),
              Text(
                title,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
