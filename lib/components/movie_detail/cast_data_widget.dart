import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:movie/components/no_file_widget.dart';
import 'package:movie/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class CastDataWidget extends StatelessWidget {
  final cast;
  CastDataWidget({required this.cast});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //! Section title
        Text(
          'Casts ( ${cast.length} )',
          style: TextStyle(
            fontSize: kSectionTitleSize,
            fontWeight: FontWeight.bold,
            color: context.theme.primaryColor,
          ),
        ),
        SizedBox(
          height: 15,
        ),

        //!Casts
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...cast.map((cast) => GestureDetector(
                    onTap: () {
                      Get.toNamed('/cast/${cast.id}');
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //!profile
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(kCardBorderRadius),
                            child: cast.profilePath != null
                                ? Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        width: 103,
                                        color: Colors.grey,
                                        child: Center(
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: CircularProgressIndicator(
                                              color: kSecondaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                        width: 103,
                                        child: FadeInImage.memoryNetwork(
                                          placeholder: kTransparentImage,
                                          image:
                                              'https://www.themoviedb.org/t/p/w220_and_h330_face${cast.profilePath}',
                                          height: double.infinity,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    ],
                                  )
                                : NoFileWidget(
                                    width: 103,
                                    height: 150,
                                  ),
                          ),

                          SizedBox(
                            height: 5,
                          ),

                          //!name
                          LimitedBox(
                            maxWidth: 100,
                            child: Text(
                              '${cast.name}',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold,color: context.theme.primaryColor,),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),

                          //!character
                          LimitedBox(
                            maxWidth: 90,
                            child: Text(
                              '- ${cast.character}',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 11,color: context.theme.primaryColor,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
