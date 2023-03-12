import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../helper/db_helper.dart';
import '../../models/favorite.dart';

class Roland extends StatefulWidget {
  const Roland({Key? key}) : super(key: key);

  @override
  State<Roland> createState() => _RolandState();
}

class _RolandState extends State<Roland> {

  List myList = [
    {
      'link': 'https://quotefancy.com/media/wallpaper/3840x2160/2073512-Roland-Barthes-Quote-The-birth-of-the-reader-must-be-at-the-cost.jpg',
      'var': false,
    },
    {
      'link': 'https://quotefancy.com/media/wallpaper/3840x2160/2452344-Roland-Barthes-Quote-The-text-is-a-tissue-of-quotations-drawn-from.jpg',
      'var': false,
    },
    {
      'link': 'https://quotefancy.com/media/wallpaper/3840x2160/2359520-Roland-Barthes-Quote-What-I-claim-is-to-live-to-the-full-the.jpg',
      'var': false,
    },
    {
      'link': 'https://tse1.mm.bing.net/th?id=OIP.l4hjlzAgqeD7aqPgjC7qWAHaEK&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://quotefancy.com/media/wallpaper/3840x2160/5707710-Roland-Barthes-Quote-How-does-meaning-get-into-the-image-Where.jpg',
      'var': false,
    },
    {
      'link': 'https://statusmind.com/images/2013/11/Clever-Facebook-Status-27330-statusmind.com.jpg',
      'var': false,
    },
    {
      'link': 'https://quotefancy.com/media/wallpaper/3840x2160/4979771-Roland-Barthes-Quote-Every-exploration-is-an-appropriation.jpg',
      'var': false,
    },
    {
      'link': 'https://quotefancy.com/media/wallpaper/3840x2160/1801337-Roland-Barthes-Quote-I-love-you-is-unsubtle-It-removes.jpg',
      'var': false,
    },
    {
      'link': 'https://quotefancy.com/media/wallpaper/3840x2160/6472496-Roland-Barthes-Quote-There-is-nothing-in-discourse-that-is-not-to.jpg',
      'var': false,
    },
    {
      'link': 'https://tse3.mm.bing.net/th?id=OIP.Vz5_fILLHiSD7qavFo8K2AHaEK&pid=Api&P=0',
      'var': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Roland Barthes",
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
