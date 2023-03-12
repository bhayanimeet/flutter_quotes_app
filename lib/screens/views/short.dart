import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../helper/db_helper.dart';
import '../../models/favorite.dart';

class Short extends StatefulWidget {
  const Short({Key? key}) : super(key: key);

  @override
  State<Short> createState() => _ShortState();
}

class _ShortState extends State<Short> {

  List myList = [
    {
      'link': 'https://tse4.mm.bing.net/th?id=OIP.TO1jvLY7Z4hNUr3jppZaOQHaHa&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://iamfearlesssoul.com/wp-content/uploads/2016/07/18.jpg',
      'var': false,
    },
    {
      'link': 'https://thegoalchaser.com/wp-content/uploads/VERY-SHORT-QUOTES-14.jpg',
      'var': false,
    },
    {
      'link': 'https://positivefox.com/wp-content/uploads/2019/04/short-quotes-famous-quotes-meaningful-quotes-11.png',
      'var': false,
    },
    {
      'link': 'https://thegoalchaser.com/wp-content/uploads/VERY-SHORT-QUOTES-4.jpg',
      'var': false,
    },
    {
      'link': 'https://liketogirls.com/uploads/2020060601/2020060612545125449.jpg',
      'var': false,
    },
    {
      'link': 'http://wdy.h-cdn.co/assets/15/52/wdy_quotes2_02.jpg',
      'var': false,
    },
    {
      'link': 'http://wdy.h-cdn.co/assets/15/52/wdy_quotes2_02.jpg',
      'var': false,
    },
    {
      'link': 'https://tinypositive.com/wp-content/uploads/2019/02/56-Short-Inspirational-Quotes-And-Short-Inspirational-Sayings-1.jpg',
      'var': false,
    },
    {
      'link': 'https://qph.fs.quoracdn.net/main-qimg-463af6d3b8c62ab0c1285dad07cc3ae5-c',
      'var': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Short Quotes",
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
