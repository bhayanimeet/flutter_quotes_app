import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../helper/db_helper.dart';
import '../../models/favorite.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  List myList = [
    {
      'link': 'https://tse2.mm.bing.net/th?id=OIP.PzFO_yU2rjpcG6vojc23PQHaL2&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://tse4.mm.bing.net/th?id=OIP.nVXfJVvwrYsI8nHSUQWEbQHaL2&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://belloblog.com/wp-content/uploads/2018/07/22020718-success-quotes-.jpg',
      'var': false,
    },
    {
      'link': 'https://www.dreamsquote.com/wp-content/uploads/2018/12/38-Motivational-Inspirational-Quotes-for-Success-in-Life-10.jpg',
      'var': false,
    },
    {
      'link': 'https://www.hdwallpaperspulse.com/wp-content/uploads/2020/08/full-top-best-success-quotes.jpg',
      'var': false,
    },
    {
      'link': 'https://tse2.mm.bing.net/th?id=OIP.DvQTuLlmhLqwPxfXJ-lSVQHaLD&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://boomsumo.com/wp-content/uploads/2018/08/56-Motivational-Quotes-Images-for-Success-Life-37.jpg',
      'var': false,
    },
    {
      'link': 'https://i1.wp.com/boomsumo.com/wp-content/uploads/2017/10/38-Motivational-quotes-for-success-1.jpg?resize=564%2C851',
      'var': false,
    },
    {
      'link': 'https://www.prettydesigns.com/wp-content/uploads/2015/05/Positive-Quotes-6.jpg',
      'var': false,
    },
    {
      'link': 'https://cutelovequotesforher.org/wp-content/uploads/2015/06/positive-inspirational-quotes.jpg',
      'var': false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Success Quotes",
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
