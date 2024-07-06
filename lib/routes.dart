import 'package:get/get.dart';
import 'package:ParkWhiz/about_us.dart';

var pages = [
  GetPage(
    name: '/about-us',
    page: () => AboutUsPage(),
    transition: Transition.rightToLeft,
  ),
];
