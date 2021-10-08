import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:movie/components/cast/about_cast_loading_widget.dart';
import 'package:movie/components/cast/about_cast_widget.dart';
import 'package:movie/components/cast/cast_movie_widget.dart';
import 'package:movie/components/movie_detail/cast_data_widget_loading.dart';
import 'package:movie/components/shimmer_widget.dart';
import 'package:movie/constants.dart';
import 'package:movie/controller/cast/cast_detail_controller.dart';
import 'package:movie/controller/cast/cast_image_controller.dart';
import 'package:movie/components/cast/cast_image_widget.dart';
import 'package:movie/controller/cast/cast_movie_controller.dart';

class Cast extends StatelessWidget {
  final CastDetailController castDetailController = Get.put(CastDetailController());
  final CastMovieController castMovieController = Get.put(CastMovieController());
  final CastImageController castImageController = Get.put(CastImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: kHorizontalPaddingValue,
              right: kHorizontalPaddingValue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //!About cast
                Obx((){
                  if(!castDetailController.isLoading.value){
                    return AboutCastWidget(cast: castDetailController.castDetailData.value);
                  }else{
                    return AboutCastLoadingWidget();
                  }
                }),

                SizedBox(height: 20,),

                //  !Cast movie
                Obx((){
                  if(!castMovieController.isLoading.value){
                    return CastMovieWidget(castMovies: castMovieController.castMovieData,);
                  }else{
                    return CastDataWidgetLoading();
                  }
                }),


                SizedBox(height: 20,),

                //  !Cast Image
                Obx((){
                  if(!castImageController.isLoading.value){
                    return CastImageWidget(images: castImageController.castImagesData,);
                  }else{
                    return StaggeredGridView.countBuilder(
                      physics: NeverScrollableScrollPhysics(),
                      reverse: true,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 20),
                      staggeredTileBuilder: (int index) => StaggeredTile.count(2,1),
                      itemCount: 10,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      crossAxisCount: 4,
                      itemBuilder: (_, i) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(kCardBorderRadius),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              //!image
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: ShimmerWidget(),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
