import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../helper/db_helper.dart';
import '../../models/favorite.dart';

class Michel extends StatefulWidget {
  const Michel({Key? key}) : super(key: key);

  @override
  State<Michel> createState() => _MichelState();
}

class _MichelState extends State<Michel> {

  List myList = [
    {
      'link': 'https://quotefancy.com/media/wallpaper/3840x2160/1764169-Michel-de-Montaigne-Quote-There-were-many-terrible-things-in-my.jpg',
      'var': false,
    },
    {
      'link': 'https://quotefancy.com/media/wallpaper/3840x2160/2490917-Michel-de-Montaigne-Quote-If-you-press-me-to-say-why-I-loved-him-I.jpg',
      'var': false,
    },
    {
      'link': 'https://quotefancy.com/media/wallpaper/3840x2160/2490918-Michel-de-Montaigne-Quote-If-you-press-me-to-say-why-I-loved-him-I.jpg',
      'var': false,
    },
    {
      'link': 'https://quotefancy.com/media/wallpaper/3840x2160/3719328-Michel-de-Montaigne-Quote-There-is-no-pleasure-to-me-without.jpg',
      'var': false,
    },
    {
      'link': 'https://quotefancy.com/media/wallpaper/3840x2160/2178625-Michel-de-Montaigne-Quote-The-soul-which-has-no-fixed-purpose-in.jpg ',
      'var': false,
    },
    {
      'link': 'https://quotefancy.com/media/wallpaper/3840x2160/1790488-Michel-de-Montaigne-Quote-The-soul-which-has-no-fixed-purpose-in.jpg',
      'var': false,
    },
    {
      'link': 'https://quotefancy.com/media/wallpaper/3840x2160/1931737-Michel-de-Montaigne-Quote-If-you-press-me-to-say-why-I-loved-him-I.jpg',
      'var': false,
    },
    {
      'link': 'https://quotefancy.com/media/wallpaper/3840x2160/2219984-Michel-de-Montaigne-Quote-There-were-many-terrible-things-in-my.jpg',
      'var': false,
    },
    {
      'link': 'https://quotefancy.com/media/wallpaper/3840x2160/2302650-Michel-de-Montaigne-Quote-The-reverse-side-of-truth-has-a-hundred.jpg',
      'var': false,
    },
    {
      'link': 'https://quotefancy.com/media/wallpaper/3840x2160/5355254-Michel-de-Montaigne-Quote-He-who-does-not-live-in-some-degree-for.jpg',
      'var': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Michel De Montaigne",
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
