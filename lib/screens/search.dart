import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:movie/constants.dart';
import 'package:movie/controller/search/search_controller.dart';
import 'package:movie/screens/movie_tab.dart';
import 'package:movie/screens/person_tab.dart';
import 'package:movie/screens/tv_show_tab.dart';
import 'package:movie/constants.dart';

class Search extends StatelessWidget {
  final SearchController searchController = Get.put(SearchController());
  var searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: kSecondaryColor,
          title: Container(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                TextFormField(
                  autofocus: true,
                  controller: searchText,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search movie, tv show, person',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                  ),
                ),
                //! search button
                Positioned(
                  right: 5,
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: ()async {
                      searchController.searchEverything(query: searchText.text);
                    },
                    icon: Icon(FeatherIcons.search),
                  ),
                )
              ],
            ),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Movies',),
              Tab(text: 'Tv shows',),
              Tab(text: 'Person',),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MovieTab(),
            TvShowTab(),
            PersonTab()
          ],
        ),
      ),
    );
  }
}
