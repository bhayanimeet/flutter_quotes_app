import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../helper/db_helper.dart';
import '../../models/favorite.dart';

class William extends StatefulWidget {
  const William({Key? key}) : super(key: key);

  @override
  State<William> createState() => _WilliamState();
}

class _WilliamState extends State<William> {

  List myList = [
    {
      'link': 'https://i.pinimg.com/originals/70/8e/42/708e429370a5476fb402297127e2ff7f.jpg',
      'var': false,
    },
    {
      'link': 'https://i.pinimg.com/originals/70/8e/42/708e429370a5476fb402297127e2ff7f.jpg',
      'var': false,
    },
    {
      'link': 'https://lifechrome.com/wp-content/uploads/2019/10/William-Shakespeare-Quotes-5.jpg',
      'var': false,
    },
    {
      'link': 'https://i.pinimg.com/originals/4e/db/43/4edb43e4ae053f41f6752870168b55ca.jpg',
      'var': false,
    },
    {
      'link': 'https://i.pinimg.com/originals/2e/9e/7a/2e9e7ab1287e16f2feeba4eaaa2c0d3c.jpg',
      'var': false,
    },
    {
      'link': 'https://tse1.mm.bing.net/th?id=OIP.VCoUAAkekt-KezYAY1cFBwHaFj&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://i.pinimg.com/736x/50/21/6a/50216abf2ebbde903524f0d24bd3b3fe.jpg',
      'var': false,
    },
    {
      'link': 'https://cdn.quotesgram.com/img/90/48/1845109741-William_Shakespeare-Quotes-9.jpg',
      'var': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "William Shakespeare",
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
