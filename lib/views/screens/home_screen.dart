import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../widgets/icon_and_title_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _visibleCarouselIndex = 0;

  final List<Widget> imageSliders = [
    'assets/images/men.jpg',
    'assets/images/women.jpg',
  ]
      .map((item) => Container(
            child: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  child: Image.asset(item, fit: BoxFit.cover, width: 1000.0)),
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: _mainCategories(),
            ),
            SizedBox(height: 16.0),
            _otherCategories(),
            SizedBox(height: 16.0),
            _featuredCollection(),
          ],
        ),
      ),
    );
  }

  Widget _mainCategories() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            initialPage: 1,
            autoPlay: true,
            viewportFraction: 0.9,
            onPageChanged: (index, _) {
              setState(() {
                _visibleCarouselIndex = index;
              });
            },
          ),
          items: imageSliders,
        ),
        SizedBox(height: 8.0),
        Text(
          _visibleCarouselIndex == 0 ? 'Men\'s Wear' : 'Women\'s Wear',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _otherCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text(
            "Collection List",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 120,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              IconAndTitleCard(
                onPressed: () {},
                title: 'Women \nClothings',
                iconData: LineIcons.female,
              ),
              IconAndTitleCard(
                onPressed: () {},
                title: 'Men \nClothings',
                iconData: LineIcons.male,
              ),
              IconAndTitleCard(
                onPressed: () {},
                title: 'Shoes',
                iconData: LineIcons.street_view,
              ),
              IconAndTitleCard(
                onPressed: () {},
                title: 'Gadgets',
                iconData: LineIcons.gamepad,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _featuredCollection() {
    final orientation = MediaQuery.of(context).orientation;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text(
            "Featured Collection",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16.0),
        Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 1.9),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
              return _featuredItem(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _featuredItem(int index) {
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
