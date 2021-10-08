import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:movie/components/no_data_found.dart';
import 'package:movie/components/search/search_result_widget.dart';
import 'package:movie/components/shimmer_widget.dart';
import 'package:movie/constants.dart';
import 'package:movie/controller/search_person/search_person_controller.dart';

class PersonTab extends StatelessWidget {
  final SearchPersonController searchPersonController = Get.put(SearchPersonController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          child: searchPersonController.isLoading.value != true
              ? searchPersonController.resultPersonData.length != 0
                  ? StaggeredGridView.countBuilder(
                      itemCount: searchPersonController.resultPersonData.length,
                      crossAxisCount: 4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 15,
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, left: 15, right: 15),
                      staggeredTileBuilder: (int index) =>
                          StaggeredTile.count(4, 1.2),
                      itemBuilder: (_, i) {
                        return SearchResultWidget(
                          routeType: 'cast',
                          id: searchPersonController.resultPersonData[i].id,
                          image:
                              searchPersonController.resultPersonData[i].profilePath,
                          text: searchPersonController.resultPersonData[i].name,
                        );
                      },
                    )
                  : NoDataFound(
                      color: context.theme.primaryColor,
                    )
              : StaggeredGridView.countBuilder(
                  itemCount: 6,
                  crossAxisCount: 4,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 15,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(4, 1.2),
                  itemBuilder: (_, i) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(kCardBorderRadius),
                      child: ShimmerWidget(),
                    );
                  },
                ),
        ));
  }
}
