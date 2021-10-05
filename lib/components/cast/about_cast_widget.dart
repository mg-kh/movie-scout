import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:movie/components/no_file_widget.dart';
import 'package:movie/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class AboutCastWidget extends StatelessWidget {
  final cast;
  AboutCastWidget({required this.cast});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                //  !base
                ClipRRect(
                  borderRadius: BorderRadius.circular(kCardBorderRadius),
                  child: Stack(
                    children: [
                      cast.profilePath != null
                          ? ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(kCardBorderRadius),
                              child: Image.network(
                                'https://www.themoviedb.org/t/p/w300_and_h450_bestv2${cast.profilePath}',
                                width: double.infinity,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(
                              height: 150,
                        color: kSecondaryColor,
                            ),

                      //!filter
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //  !profile
                Positioned(
                    bottom: -30,
                    child: cast.profilePath != null
                        ? ClipOval(
                            child: Stack(
                              children: [
                                Container(
                                  color: Colors.grey,
                                  width: 120,
                                  height: 120,
                                  child: Center(
                                    child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: kSecondaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image:
                                      'https://www.themoviedb.org/t/p/w300_and_h450_bestv2${cast.profilePath}',
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                          )
                        : ClipOval(
                            child: NoFileWidget(
                              width: 120,
                              height: 120,
                            ),
                          ))
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),

          //!Name
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${cast.name} (${cast.knownForDepartment})',
                style:
                    TextStyle(color: context.theme.primaryColor, fontSize: 15),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),

          //!Age
          if (cast.birthday != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Age',
                  style: TextStyle(
                      fontSize: kSectionTitleSize,
                      color: context.theme.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${getAge(bd: cast.birthday, dd: cast.deathday)}',
                  style: TextStyle(
                    color: context.theme.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),

          //!birthday
          if (cast.birthday != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Birthday',
                  style: TextStyle(
                      fontSize: kSectionTitleSize,
                      color: context.theme.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${cast.birthday.toString().substring(0, 10)}',
                  style: TextStyle(
                    color: context.theme.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),

          //!dead day
          if (cast.deathday != null)
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Birthday',
                      style: TextStyle(
                          fontSize: kSectionTitleSize,
                          color: context.theme.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${cast.deathday.toString().substring(0, 10)}',
                      style: TextStyle(
                        color: context.theme.primaryColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),

          //!place of birth
          if (cast.birthday != null)
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Place of birth',
                style: TextStyle(
                    fontSize: kSectionTitleSize,
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${cast.placeOfBirth}',
                style: TextStyle(
                  color: context.theme.primaryColor,
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),

          //  !Bio
          if (cast.biography != null && cast.biography != '')
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //!Title
                  Text(
                    'Bio',
                    style: TextStyle(
                      color: context.theme.primaryColor,
                      fontSize: kSectionTitleSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  //!Text
                  Text(
                    '${cast.biography}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: context.theme.primaryColor,
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: kSecondaryColor),
                      onPressed: () {
                        Get.bottomSheet(ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child: Container(
                            color: context.theme.backgroundColor,
                            padding: EdgeInsets.only(top: 30),
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topCenter,
                              children: [
                                SingleChildScrollView(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: kHorizontalPaddingValue,
                                      left: kHorizontalPaddingValue,
                                      right: kHorizontalPaddingValue,
                                      bottom: kHorizontalPaddingValue + 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: context.theme.backgroundColor,
                                    ),
                                    child: Text(
                                      '${cast.biography}',
                                      style: TextStyle(
                                        color: context.theme.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: -20,
                                  child: Container(
                                    width: 80,
                                    height: 5,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(2)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
                      },
                      child: Text('Read more...')),
                  SizedBox(
                    height: 2,
                  ),
                ],
              ),
            ),

        ],
      ),
    );
  }

  String getAge({required bd, required dd}) {
    var today = DateTime.now().year;
    var birthday = DateTime.parse('$bd').year;
    var tdMnth = DateTime.now().month;
    var bdMnth = DateTime.parse('$bd').month;
    late var age;
    if (dd != null) {
      var deathday = DateTime.parse('$dd').year;
      age = deathday - birthday;
    } else {
      int result = today - birthday;
      if (bdMnth > tdMnth) {
        result = result - 1;
      }
      age = result;
    }
    return age.toString();
  }
}
