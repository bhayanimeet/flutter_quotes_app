import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../helper/db_helper.dart';
import '../../models/favorite.dart';

class Proverb extends StatefulWidget {
  const Proverb({Key? key}) : super(key: key);

  @override
  State<Proverb> createState() => _ProverbState();
}

class _ProverbState extends State<Proverb> {

  List myList = [
    {
      'link': 'https://quotescover.com/wp-content/uploads/He-who-makes-no-mistakes__quotes-by-English-Proverb-96.png',
      'var': false,
    },
    {
      'link': 'https://www.hapiquotes.com/images/proverb-quote-hq0135.jpg',
      'var': false,
    },
    {
      'link': 'https://www.hapiquotes.com/images/proverb-quote-hq0054.jpg',
      'var': false,
    },
    {
      'link': 'https://www.hapiquotes.com/images/proverb-quote-hq0108.jpg',
      'var': false,
    },
    {
      'link': 'https://www.hapiquotes.com/quotes/images/proverb-quote-hq0136.jpg',
      'var': false,
    },
    {
      'link': 'https://www.hapiquotes.com/images/proverb-quote-hq0022.jpg',
      'var': false,
    },
    {
      'link': 'https://www.hapiquotes.com/images/proverb-quote-hq0443.jpg',
      'var': false,
    },
    {
      'link': 'https://www.hapiquotes.com/quotes/images/proverb-quote-hq0209.jpg',
      'var': false,
    },
    {
      'link': 'https://hapiquotes.com/images/proverb-quote-hq0335.jpg',
      'var': false,
    },
    {
      'link': 'https://www.hapiquotes.com/images/proverb-quote-hq0153.jpg',
      'var': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Proverbs",
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
