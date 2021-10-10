import 'package:get/get.dart';
import 'package:movie/screens/cast.dart';
import 'package:movie/screens/detail.dart';
import 'package:movie/screens/home.dart';
import 'package:movie/screens/search.dart';
import 'package:movie/screens/setting.dart';
import 'package:movie/screens/trending.dart';

import 'controller/movie_detail/cast_controller.dart';
import 'controller/movie_detail/movie_detail_controller.dart';
import 'controller/movie_detail/related_movie_controller.dart';
import 'screens/popular.dart';

List<GetPage> routes = [
  GetPage(
    name: '/home',
    page: () => Home(),
  ),
  GetPage(
    name: '/search',
    page: () => Search(),
  ),
  GetPage(
    name: '/detail/:id',
    page: () => Detail(),
    binding: BindingsBuilder((){
      Get.lazyPut<MovieDetailController>(() => MovieDetailController(), fenix: true);
      Get.lazyPut<CastController>(() => CastController(), fenix: true);
      Get.lazyPut<RelatedMovieController>(() => RelatedMovieController(), fenix: true);
    })
  ),
  GetPage(
    name: '/cast/:id',
    page: () => Cast(),
  ),
  GetPage(name: '/popular', page: () => Popular()),
  GetPage(name: '/trending', page: () => Trending()),
  GetPage(
    name: '/setting',
    page: () => Setting(),
  ),
];
