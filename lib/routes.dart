
import 'package:get/get.dart';
import 'package:movie/screens/cast.dart';
import 'package:movie/screens/detail.dart';
import 'package:movie/screens/home.dart';
import 'package:movie/screens/search.dart';
import 'package:movie/screens/setting.dart';

List<GetPage> routes = [
  GetPage(name: '/home', page: () => Home(),),
  GetPage(name: '/search', page: () => Search(),),
  GetPage(name: '/detail/:id', page: () => Detail(),),
  GetPage(name: '/cast/:id', page: () => Cast(),),
  GetPage(name: '/setting', page: () => Setting(),),
];