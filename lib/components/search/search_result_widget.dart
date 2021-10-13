import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:movie/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class SearchResultWidget extends StatelessWidget {
  final id;
  final text;
  final image;
  final year;
  final rating;
  final routeType;
  SearchResultWidget({
    required this.id,
    required this.text,
    required this.image,
    this.year : '',
    this.rating : '',
    required this.routeType,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/$routeType/$id');
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: context.theme.cardColor,
            borderRadius: BorderRadius.circular(kCardBorderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              )
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //!image
            image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(kCardBorderRadius),
                    child: Container(
                      width: 70,
                      height: 150,
                      color: Colors.grey.withOpacity(0.5),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'resources/images/fake_poster.png',
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image:
                                'https://www.themoviedb.org/t/p/w220_and_h330_face$image',
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ),
                  )
                : Container(
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kCardBorderRadius),
                        color: Colors.grey),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(FeatherIcons.file),
                          SizedBox(
                            height: 5,
                          ),
                          Text('No photo')
                        ],
                      ),
                    ),
                  ),

            SizedBox(
              width: 15,
            ),

            //  !Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //!Title
                  Text(
                    '$text',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: context.theme.primaryColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  //!release date
                  if (year != "")
                    Column(
                      children: [
                        Text(
                          '${year.toString().substring(0, 4)}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),

                  //  !Rating
                  if (rating != "")
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            FeatherIcons.star,
                            color: kSecondaryColor,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '$rating',
                            style: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    )
                ],
              ),
            ),

            //! Icon button
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: kSecondaryLightColor,
                  radius: 25,
                  child: Icon(
                    FeatherIcons.arrowRight,
                    color: kSecondaryColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
