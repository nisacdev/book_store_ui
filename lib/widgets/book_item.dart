import 'dart:math';

import 'package:book_store_ui/theme/colors.dart';
import 'package:book_store_ui/widgets/avatar_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BookItem extends StatelessWidget {
  const BookItem({Key? key, required this.book}) : super(key: key);
  final book;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.only(top: 15),
        child: Row(
          children: [
            Stack(children: [
              Container(
                  padding: EdgeInsets.only(bottom: 50, right: 40),
                  width: 20.w,
                  height: 22.w,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    width: 10.w,
                    height: 11.w,
                    decoration: BoxDecoration(
                        color:
                            Color(Random().nextInt(0xffffffff)).withAlpha(0xff),
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(15))),
                  )),
              Container(
                width: 20.w,
                height: 22.w,
                padding: EdgeInsets.all(8),
                child: AvatarImage(
                  book["image"]!,
                  isSVG: false,
                  radius: 8,
                ),
              )
            ]),
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book["title"],
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.w,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: book["price"],
                      style: TextStyle(
                          fontSize: 16,
                          color: primary,
                          fontWeight: FontWeight.w500)),
                  TextSpan(text: "   "),
                  TextSpan(
                      text: book["ori_price"],
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w500)),
                ]))
              ],
            )
          ],
        ));
  }
}
