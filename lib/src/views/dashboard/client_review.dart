import 'package:admin_dash/src/constant/color.dart';
import 'package:admin_dash/src/constant/image.dart';
import 'package:admin_dash/src/constant/string.dart';
import 'package:admin_dash/src/constant/text.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class Clienresponse extends StatefulWidget {
  const Clienresponse({Key? key}) : super(key: key);

  @override
  State<Clienresponse> createState() => _ClienresponseState();
}

class _ClienresponseState extends State<Clienresponse> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 200),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ConstText.lightText(
              //   text: Strings.clientReviews,
              //   // color: ColorConst.grey800,
              //   fontWeight: FontWeight.bold,
              // ),
              Row(
                children: [
                  const CircleAvatar(
                    maxRadius: 20,
                    backgroundImage: AssetImage(Images.profileImage),
                  ),
                  FxBox.w10,
                  const Expanded(
                    child: Text(
                      'John Deo',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              ConstText.lightText(
                text: Strings.clientReviewText,
                fontSize: 15,
                //color: ColorConst.grey800,
                fontWeight: FontWeight.w500,
              ),
              _tableRowImage('John Deo'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tableRowImage(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // const CircleAvatar(
        //   maxRadius: 20,
        //   backgroundImage: AssetImage(Images.profileImage),
        // ),
        // FxBox.w10,
        // Expanded(
        //   child: Text(
        //     text,
        //     style: const TextStyle(
        //       fontWeight: FontWeight.w700,
        //     ),
        //   ),
        // ),
        ConstText.lightText(
          text: Strings.clientReviews,
          // color: ColorConst.grey800,
          fontWeight: FontWeight.bold,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward,
            size: 16,
            // color: ColorConst.primary,
          ),
        ),
      ],
    );
  }
}
