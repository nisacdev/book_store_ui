import 'dart:math';

import 'package:book_store_ui/theme/colors.dart';
import 'package:book_store_ui/widgets/avatar_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BookCover extends StatelessWidget {
  const BookCover({Key? key, required this.book}) : super(key: key);
  final book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 50, right: 40),
                width: 20.w,
                height: 25.w,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(1, 1),
                      ),
                    ]),
                child: Container(
                  width: 10.w,
                  height: 14.w,
                  decoration: BoxDecoration(
                      color:
                          Color(Random().nextInt(0xffffffff)).withAlpha(0xff),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(15))),
                ),
              ),
              Container(
                width: 20.w,
                height: 25.w,
                padding: EdgeInsets.all(8),
                child: AvatarImage(
                  book["image"],
                  isSVG: false,
                  radius: 8,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.w,
          ),
          Text(
            book["price"],
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
