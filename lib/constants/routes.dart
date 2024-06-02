import 'package:carpooling/pages/home/home_page.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String HOME = "/home";
  static String APP = "/";
  static List<GetPage> routes = [
    // GetPage(name: APP, page: () => App()),
    GetPage(name: HOME, page: () => const MyHomePage()),
  ];
}