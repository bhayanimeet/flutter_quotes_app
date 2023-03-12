import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../helper/db_helper.dart';
import '../../models/favorite.dart';

class Swami extends StatefulWidget {
  const Swami({Key? key}) : super(key: key);

  @override
  State<Swami> createState() => _SwamiState();
}

class _SwamiState extends State<Swami> {

  List myList = [
    {
      'link': 'https://tse3.mm.bing.net/th?id=OIP.0UrFBlD7agInWu_YT9OPvQHaF7&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://assets.wallpapersin4k.org/uploads/2017/04/Swami-Vivekananda-HD-Wallpapers-With-Quotes-2.jpeg',
      'var': false,
    },
    {
      'link': 'https://www.bhaktisansar.com/wp-content/uploads/2019/07/swami-vivekananda-quotes-images.jpg',
      'var': false,
    },
    {
      'link': 'https://i.pinimg.com/originals/a0/65/77/a065776caa7fb8a9034ba862fc10579c.jpg',
      'var': false,
    },
    {
      'link': 'https://tse3.mm.bing.net/th?id=OIP.y6FRJ8TIK3PPTfc0_efaCwHaF7&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://i.pinimg.com/originals/10/71/92/107192eada5073af1321c03abd665a90.jpg',
      'var': false,
    },
    {
      'link': 'https://st1.photogallery.ind.sh/wp-content/uploads/indiacom/motivational-quote-by-swami-vivekananda-201709-1505116815.jpg',
      'var': false,
    },
    {
      'link': 'https://i.pinimg.com/originals/91/38/f9/9138f9299650f6d579fef09d1bcc0c2c.jpg',
      'var': false,
    },
    {
      'link': 'https://i.pinimg.com/originals/28/c1/14/28c11407c7c7b6366005da2a7c701a48.jpg',
      'var': false,
    },
    {
      'link': 'https://i.pinimg.com/originals/c5/4a/72/c54a72dc92613a60803eef408b36b594.jpg',
      'var': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Swami Vivekananda",
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
