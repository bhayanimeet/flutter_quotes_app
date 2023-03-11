import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../helper/db_helper.dart';
import '../../models/favorite.dart';

class Positive extends StatefulWidget {
  const Positive({Key? key}) : super(key: key);

  @override
  State<Positive> createState() => _PositiveState();
}

class _PositiveState extends State<Positive> {

  List myList = [
    {
      'link': 'https://tse1.mm.bing.net/th?id=OIP.Q92GlTcHmR45R2iUdS4jjwHaHa&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://tse3.mm.bing.net/th?id=OIP.JkaGFGWTVvUp2a4x5AVKUgHaHa&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://tse1.mm.bing.net/th?id=OIP.SeG1OTU2opgA_2JCNCwK7AHaHa&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://tse4.mm.bing.net/th?id=OIP.rrqiBaxmRSBMTLof-B_2SgHaHa&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://tse3.mm.bing.net/th?id=OIP.QltPJlM_kQLklBUdV3cGwwHaHa&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://tse3.mm.bing.net/th?id=OIP.kb7i_XCyUGTR8aUNN2A26AHaHa&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'http://1.bp.blogspot.com/--2N1ps7bV4k/Uoh2mLHbHdI/AAAAAAAAOLc/rf-9KGe4wPU/s1600/inspirational+picture+quotes+(18).jpg',
      'var': false,
    },
    {
      'link': 'https://tse2.mm.bing.net/th?id=OIP.nyW8a5Dci6cSRO9EBiv5-QHaHa&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://tse3.mm.bing.net/th?id=OIP.Dny_TpyAngtir1oqyl74twHaHa&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://www.dailyfunnyquote.com/wp-content/uploads/2019/02/59-Best-Positive-Quotes-for-Success-Short-Inspirational-Quotes-42.jpg',
      'var': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Positive Quotes",
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
