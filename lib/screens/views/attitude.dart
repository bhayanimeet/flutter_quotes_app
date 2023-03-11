import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../helper/db_helper.dart';
import '../../models/favorite.dart';

class Attitude extends StatefulWidget {
  const Attitude({Key? key}) : super(key: key);

  @override
  State<Attitude> createState() => _AttitudeState();
}

class _AttitudeState extends State<Attitude> {

  List myList = [
    {
      'link': 'https://witszen.com/wp-content/uploads/2019/07/I-am-a-hot-dude-with-a-cool-attitude.-1.jpg',
      'var': false,
    },
    {
      'link': 'https://i.pinimg.com/originals/17/ec/c4/17ecc457abcf4af7d7cfc5897dab16a7.jpg',
      'var': false,
    },
    {
      'link': 'https://thedreamcatch.com/wp-content/uploads/2020/04/attitude-quote-824x1024.jpg',
      'var': false,
    },
    {
      'link': 'https://i.pinimg.com/originals/f1/db/8b/f1db8be09e4984dda8ff4f6999d67855.jpg',
      'var': false,
    },
    {
      'link': 'https://i.pinimg.com/736x/15/4a/9b/154a9b41a71739755571dfc30901b06b--positivity-attitude-positive-attitude-quotes.jpg',
      'var': false,
    },
    {
      'link': 'https://cherrypositive.files.wordpress.com/2013/09/attitude.jpg',
      'var': false,
    },
    {
      'link': 'http://www.quotesforthemind.com/wp-content/uploads/2018/04/winston-churchill-inspirational-and-motivational-quotes-and-images-abou-understand-that-a-positive-attitude-is-a-little-thing-that-can-make-a-big-difference.png',
      'var': false,
    },
    {
      'link': 'https://willingtotakeactions.com/wp-content/uploads/2019/05/20190503_204544-861x1024.png',
      'var': false,
    },
    {
      'link': 'https://i.etsystatic.com/6415555/r/il/6c047c/418678209/il_794xN.418678209_q1in.jpg',
      'var': false,
    },
    {
      'link': 'http://img.picturequotes.com/2/10/9923/a-positive-attitude-changes-everything-quote-1.jpg',
      'var': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Attitude Quotes",
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
