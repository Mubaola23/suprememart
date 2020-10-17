import 'package:flutter/material.dart';

import '../../core/constants.dart';

class WomenScreen extends StatefulWidget {
  @override
  _WomenScreenState createState() => _WomenScreenState();
}

class _WomenScreenState extends State<WomenScreen> {
  @override
  Widget build(BuildContext context) {
    return _womenCollection();
  }

  Widget _womenCollection() {
    final orientation = MediaQuery.of(context).orientation;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Women Collection",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          kSmallVerticalSpacing,
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(bottom: 16.0),
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return _womenItem(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _womenItem(int index) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/women_medium.jpg',
              fit: BoxFit.cover,
            ),
          )),
          SizedBox(height: 8.0),
          Text(
            '2019 Fashion Men Gyms Pants Joggers Fitness Casual Longs Pants Men Workout Skinny Sweatpants Jogger Tracksuit Cotton Trousers',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          Text(
            'Mart Mama',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          Text(
            '\$16.99',
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
