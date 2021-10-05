import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:movie/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class CastImageWidget extends StatelessWidget {
  final images;
  CastImageWidget({required this.images});

  @override
  Widget build(BuildContext context) {
    return images != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gallery',
                style: TextStyle(
                  fontSize: kSectionTitleSize,
                  fontWeight: FontWeight.bold,
                  color: context.theme.primaryColor,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              StaggeredGridView.countBuilder(
                physics: NeverScrollableScrollPhysics(),
                reverse: true,
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 20),
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(1, index % 2 == 0 ? 2 : 1),
                itemCount: images.length,
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
                          child: Image.network(
                            'https://www.themoviedb.org/t/p/w300_and_h450_bestv2${images[i].filePath}',
                            fit: BoxFit.cover,
                          ),
                        ),

                        //  !filter
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.black.withOpacity(0.3),
                        ),

                        //  !button
                        IconButton(
                          onPressed: () {
                            Get.dialog(
                              Padding(
                                padding: EdgeInsets.all(0),
                                child: UnconstrainedBox(
                                  child: Center(
                                    child: Container(
                                      color: Colors.black,
                                      child: Image.network(
                                        'https://www.themoviedb.org/t/p/w300_and_h450_bestv2${images[i].filePath}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            FeatherIcons.maximize,
                            color: Colors.white,
                            size: 14,
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          )
        : Container();
  }
}
