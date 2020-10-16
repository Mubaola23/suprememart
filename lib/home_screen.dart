import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

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
      appBar: AppBar(
        title: Text('Supreme Mart'),
        actions: [],
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: _mainCategories(),
            ),
            SizedBox(height: 16.0),
            _otherCategories(),
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
}

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
