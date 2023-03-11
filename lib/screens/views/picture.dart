import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../helper/db_helper.dart';
import '../../models/favorite.dart';

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  List<Map<String, dynamic>> myList = [
    {
      'link':
          'https://i2.wp.com/tinypositive.com/wp-content/uploads/2018/08/155-Best-Deep-Meaningful-Quotes-With-Images-34.jpg?fit=734%2C1100&ssl=1',
      'var': false,
    },
    {
      'link':
          'https://tse1.mm.bing.net/th?id=OIP.Q92GlTcHmR45R2iUdS4jjwHaHa&pid=Api&P=0',
      'var': false,
    },
    {
      'link':
          'http://www.quotesforthemind.com/wp-content/uploads/2018/05/inspiring-and-uplifting-quotes-quote-images-image-about-you-can-only-fail-when-you-stop-trying-to-succeed-in-life.jpg',
      'var': false,
    },
    {
      'link':
          'https://tse4.mm.bing.net/th?id=OIP.qs2UDJVTmjU_RrAL8JHE4AHaNK&pid=Api&P=0',
      'var': false,
    },
    {
      'link':
          'https://tse2.mm.bing.net/th?id=OIP.PZ4LDNk3_k8ijLUK4clQ8QHaL2&pid=Api&P=0',
      'var': false,
    },
    {
      'link':
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/sunshinequotes21-1563300013.jpg  ',
      'var': false,
    },
    {
      'link':
          'https://cdn.theculturetrip.com/wp-content/uploads/2017/04/hope-quotes-long-31.png',
      'var': false,
    },
    {
      'link':
          'https://tse2.mm.bing.net/th?id=OIP.MLLHQs9TWK1anbqpDqJr5gHaL2&pid=Api&P=0',
      'var': false,
    },
    {
      'link':
          'https://tse1.mm.bing.net/th?id=OIP.wPacsXurnjICDJQ0chLbkAHaJ4&pid=Api&P=0',
      'var': false,
    },
    {
      'link':
          'https://tse1.mm.bing.net/th?id=OIP.BGk5IBu420X4VpmOsEtWCAHaKd&pid=Api&P=0',
      'var': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Latest Quotes",
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
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(15)),
                        color: Colors.black54,
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.download,
                              color: Colors.green, size: 30),
                          GestureDetector(
                            onTap: () async {
                              Favorite f1 = Favorite(
                                image: e['link'],
                              );
                              await DBHelper.dbHelper.insertData(data: f1);
                              setState(() {
                                if (e['var'] == false) {
                                  e['var'] = true;
                                } else if (e['var'] == true) {
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
                          const Icon(Icons.share, color: Colors.red, size: 30),
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
