import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movie/constants.dart';

class MovieCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/detail');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //!Movie Image
          Container(
            height: 200,
            margin: EdgeInsets.only(bottom: 10),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://i.picsum.photos/id/1025/4951/3301.jpg?hmac=_aGh5AtoOChip_iaMo8ZvvytfEojcgqbCH7dzaz-H8Y',
                          ))),
                ),

                //!Overlay
                Container(
                  width: double.infinity,
                  height: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15)
                    ),
                ),

                //!Circular Progress
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircularProgressIndicator(
                    value: 0.3,
                    strokeWidth: 6,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                    backgroundColor: kSecondaryLightColor.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          //!Movie Text
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Hello',
              style: TextStyle(
                fontSize: 16
              ),
            ),
          )
        ],
      ),
    );
  }
}
