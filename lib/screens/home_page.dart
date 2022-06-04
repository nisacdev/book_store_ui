import 'package:book_store_ui/theme/colors.dart';
import 'package:book_store_ui/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../data/json.dart';
import '../widgets/avatar_person.dart';
import '../widgets/book_cover.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.vertical_distribute_rounded),
              ),
            ),
            Icon(Icons.search_rounded),
            SizedBox(
              width: 5.w,
            ),
            AvatarImage(
              profile,
              isSVG: false,
              width: 27,
              height: 27,
            )
          ],
        ),
      ),
      body: getBody(),
    );
  }

  getTop() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
            color: primary,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 35, right: 15),
                child: Text(
                  "Hi babe",
                  style: TextStyle(
                      color: secondary,
                      fontSize: 23,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 35, right: 15),
                child: Text(
                  "Welcome to ",
                  style: TextStyle(
                      color: secondary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Text(
                  "Popular Books ",
                  style: TextStyle(
                      color: secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        Container(
          height: 150,
          color: primary,
          child: Container(
            decoration: BoxDecoration(
                color: appBgColor,
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(100))),
          ),
        ),
      ],
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  child: getTop(),
                ),
                Positioned(
                  top: 140,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 260,
                    child: getPopularBooks(),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Text("Latest Books",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: getLatestBooks(),
              ),
              SizedBox(
                height: 25,
              )
            ],
          )
        ],
      ),
    );
  }

  getPopularBooks() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 5, left: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(popularBooks.length,
            (index) => BookCard(book: popularBooks[index])),
      ),
    );
  }

  getLatestBooks() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 5),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(latestBooks.length,
              (index) => BookCover(book: latestBooks[index]))),
    );
  }
}
