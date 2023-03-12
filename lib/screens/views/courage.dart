import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../helper/db_helper.dart';
import '../../models/favorite.dart';

class Courage extends StatefulWidget {
  const Courage({Key? key}) : super(key: key);

  @override
  State<Courage> createState() => _CourageState();
}

class _CourageState extends State<Courage> {
  List myList = [
    {
      'link': 'https://tse3.mm.bing.net/th?id=OIP.j4dtYOf0f2Gm3cwtveQnEwHaL2&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://quotess.net/wp-content/uploads/2017/10/1509222272_life-quote-courage-doesnt-mean-you-dont-get-afraid-courage-means-you.jpg',
      'var': false,
    },
    {
      'link': 'https://quotescover.com/wp-content/uploads/Courage-is-knowing-what-not__quotes-by-Plato-15.png',
      'var': false,
    },
    {
      'link': 'https://quotescover.com/wp-content/uploads/2016/04/courage-1.jpg',
      'var': false,
    },
    {
      'link': 'https://d3ewd3ysu1dfsj.cloudfront.net/images/stories/original/44411.jpg?1525984310',
      'var': false,
    },
    {
      'link': 'https://julieflygare.com/wp-content/uploads/2013/01/courage-doesnt-always-roar-inspirational-quote.jpg',
      'var': false,
    },
    {
      'link': 'https://quotescover.com/wp-content/uploads/There-is-a-courage-of__quotes-by-Alfred-Adler-37.png',
      'var': false,
    },
    {
      'link': 'https://i0.wp.com/hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/strength-quotes-courage-is-the-most-important-1551211507.jpg',
      'var': false,
    },
    {
      'link': 'https://tse4.mm.bing.net/th?id=OIP.HBsn5CjhM6WAkM9MjLTjIAHaL2&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://cdn.quotesgram.com/img/13/13/1284212337-courage.jpg',
      'var': false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Courage Quotes",
          style: GoogleFonts.arya(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ...myList.map(
                  (e) => Padding(
                padding: const EdgeInsets.all(15),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(e['link'], fit: BoxFit.fill)),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
                        color: Colors.black54,
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/book.png',height: 30),
                          Image.asset('assets/images/copy.png',height: 30),
                          const Icon(Icons.share, color: Colors.red, size: 30),
                          const Icon(Icons.download, color: Colors.green, size: 30),
                          GestureDetector(
                            onTap: () async{
                              Favorite f1 = Favorite(
                                image: e['link'],
                              );
                              await DBHelper.dbHelper.insertData(data: f1);
                              setState(() {
                                if(e['var']==false){
                                  e['var'] = true;
                                }
                                else if (e['var'] == true) {
                                  e['var'] = false;
                                }
                              });
                            },
                            child: (e['var'] == false)
                                ? const Icon(
                              Icons.star_border_outlined,
                              color: Colors.pink,
                              size: 30,
                            )
                                : const Icon(
                              Icons.star,
                              color: Colors.pink,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            LoadingAnimationWidget.discreteCircle(
                color: Colors.indigo, size: 40),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
