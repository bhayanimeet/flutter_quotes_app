import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../helper/db_helper.dart';
import '../../models/favorite.dart';

class Truth extends StatefulWidget {
  const Truth({Key? key}) : super(key: key);

  @override
  State<Truth> createState() => _TruthState();
}

class _TruthState extends State<Truth> {

  List myList = [
    {
      'link': 'https://www.quotescover.com/wp-content/uploads/Truth-is-hidden-but-nothing__quotes-by-Latin-Proverb-11.png',
      'var': false,
    },
    {
      'link': 'https://www.quotescover.com/wp-content/uploads/The-truth-will-set-you__quotes-by-Gloria-Steinem-50.png',
      'var': false,
    },
    {
      'link': 'https://i.pinimg.com/originals/d4/aa/36/d4aa36db791dbe017b7f90dcfd662649.png',
      'var': false,
    },
    {
      'link': 'https://cache.lovethispic.com/uploaded_images/169314-Truth-Can-Only-Be-Seen-By-Those-With-Truth-In-Them.-Suzy-Kassem-Quotes.jpg',
      'var': false,
    },
    {
      'link': 'https://quotlr.com/images/quotes/there-is-no-higher-truth-no-greater-knowledge-than-never-doubting-who-you-are.jpg',
      'var': false,
    },
    {
      'link': 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/807d88de-95ff-4f79-8403-9f25191a911c/d63lhxr-df3569f8-b2d3-4b9f-839d-f70db216a776.jpg/v1/fill/w_894,h_894,q_75,strp/quotes___tell_the_truth_by_rabidbribri-d63lhxr.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwic3ViIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl0sIm9iaiI6W1t7InBhdGgiOiIvZi84MDdkODhkZS05NWZmLTRmNzktODQwMy05ZjI1MTkxYTkxMWMvZDYzbGh4ci1kZjM1NjlmOC1iMmQzLTRiOWYtODM5ZC1mNzBkYjIxNmE3NzYuanBnIiwid2lkdGgiOiI8PTg5NCIsImhlaWdodCI6Ijw9ODk0In1dXX0.MCedt3GXl5uUM23fpr2KDYikhClm1hP8eXVmoCYUzcQ',
      'var': false,
    },
    {
      'link': 'https://quotescover.com/wp-content/uploads/Truth-is-the-most-valuable__quotes-by-Mark-Twain-9-1024x1024.png',
      'var': false,
    },
    {
      'link': 'http://img.picturequotes.com/2/6/5645/nothing-better-than-listening-to-a-lie-when-you-already-know-the-truth-quote-1.jpg',
      'var': false,
    },
    {
      'link': 'https://quotescover.com/wp-content/uploads/Honesty-is-the-first-chapter__quotes-by-Thomas-Jefferson-40.png',
      'var': false,
    },
    {
      'link': 'https://tse4.mm.bing.net/th?id=OIP.gFfIE6NbttztN5hRsmcsKQHaLH&pid=Api&P=0',
      'var': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Truth Quotes",
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
