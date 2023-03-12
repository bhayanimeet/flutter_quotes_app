import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../helper/db_helper.dart';
import '../../models/favorite.dart';

class Religion extends StatefulWidget {
  const Religion({Key? key}) : super(key: key);

  @override
  State<Religion> createState() => _ReligionState();
}

class _ReligionState extends State<Religion> {

  List myList = [
    {
      'link': 'https://faithit.com/wp-content/uploads/2018/01/quotes-Religion-says-I-ob.png',
      'var': false,
    },
    {
      'link': 'https://cdn.quotesgram.com/img/3/57/2013297822-inspirational-motivational-image-quotes-quotations-quotes-of-the-day-roxanajones-com-god-is-not-religion.jpg',
      'var': false,
    },
    {
      'link': 'https://ih0.redbubble.net/image.698151442.7266/flat,1000x1000,075,f.u5.jpg',
      'var': false,
    },
    {
      'link': 'https://i.pinimg.com/originals/fa/28/8f/fa288f773eb4ea41c1ec5484591e7418.jpg',
      'var': false,
    },
    {
      'link': 'https://tse1.mm.bing.net/th?id=OIP.e0ujwQc8zsp3m2JqTrn01QHaEc&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://tse1.mm.bing.net/th?id=OIP.ndyhPR-fXobUh4HpoddefQHaKe&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'http://img.picturequotes.com/2/611/610711/experience-quote-3-picture-quote-1.jpg',
      'var': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Religion Quotes",
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
