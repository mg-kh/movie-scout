
import 'package:get/get.dart';
import 'package:movie/screens/detail.dart';
import 'package:movie/screens/home.dart';
import 'package:movie/screens/search.dart';

List<GetPage> routes = [
  GetPage(name: '/home', page: () => Home(),),
  GetPage(name: '/search', page: () => Search(),),
  GetPage(name: '/detail', page: () => Detail(),),
];