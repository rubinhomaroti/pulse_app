import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Avatar extends StatelessWidget {
  const Avatar({required this.avatarPath, Key? key}) : super(key: key);

  final String avatarPath;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(avatarPath);
  }
}

class AvatarCarousel extends StatefulWidget {
  const AvatarCarousel({Key? key}) : super(key: key);

  @override
  State<AvatarCarousel> createState() => _AvatarCarouselState();
}

class _AvatarCarouselState extends State<AvatarCarousel> {
  int _current = 0;
  final CarouselController _avatarController = CarouselController();
  final CarouselController _dotsController = CarouselController();

  final List<String> avatarPaths = [
    'assets/animations/afro-woman.json',
    'assets/animations/amy.json',
    'assets/animations/arts-man.json',
    'assets/animations/bowie.json',
    'assets/animations/dancer.json',
    'assets/animations/egyptian.json',
    'assets/animations/einsten.json',
    'assets/animations/elvis.json',
    'assets/animations/flowers.json',
    'assets/animations/freddie-mercury.json',
    'assets/animations/frida.json',
    'assets/animations/gamer.json',
    'assets/animations/guitarrist.json',
    'assets/animations/harry-potter.json',
    'assets/animations/lion.json',
    'assets/animations/money.json',
    'assets/animations/muslim.json',
    'assets/animations/mustache.json',
    'assets/animations/pirate.json',
    'assets/animations/wonder-woman.json',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _avatarController,
          options: CarouselOptions(
            height: 150,
            viewportFraction: 0.35,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
                _dotsController.animateToPage(index);
              });
            },
          ),
          items: avatarPaths.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Avatar(avatarPath: i);
              },
            );
          }).toList(),
        ),
        CarouselSlider(
          carouselController: _dotsController,
          options: CarouselOptions(
            height: 40.0,
            viewportFraction: 0.1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
                _avatarController.animateToPage(index);
              });
            },
          ),
          items: avatarPaths.asMap().entries.map((entry) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
