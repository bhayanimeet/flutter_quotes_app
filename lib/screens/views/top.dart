import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../helper/db_helper.dart';
import '../../models/favorite.dart';

class Top extends StatefulWidget {
  const Top({Key? key}) : super(key: key);

  @override
  State<Top> createState() => _TopState();
}

class _TopState extends State<Top> {

  List<Map<String,dynamic>> myList = [
    {
      'link': 'https://cutelovequotesforher.org/wp-content/uploads/2015/06/business-motivational-quotes.jpg',
      'var': false,
    },
    {
      'link': 'https://www.dreamsquote.com/wp-content/uploads/2019/07/Best-Life-Quotes.jpg',
      'var': false,
    },
    {
      'link': 'https://2.bp.blogspot.com/-36SeQz6fuXs/VUOFTPySX2I/AAAAAAAAByA/o5jTukAwFcI/s1600/Amazing-quotes-I-never-made-one-of-my.jpg',
      'var': false,
    },
    {
      'link': 'https://tse4.mm.bing.net/th?id=OIP.P4rcV_WcHIARQ40wTK0TzgHaLJ&pid=Api&P=0',
      'var': false,
    },
    {
      'link': "http://4.bp.blogspot.com/-u2pcAbSxGX0/VUWONEzKM1I/AAAAAAAACL8/WVQo1ygh1lc/s1600/Failure-quotes-It's-fine-to-celebrate-success.jpg",
      'var': false,
    },
    {
      'link': 'https://www.joshloe.com/wp-content/uploads/2018/11/100-short-inspirational-quotes-for-women-inspiring-famous-quotes.jpg',
      'var': false,
    },
    {
      'link': 'http://www.baztro.com/wp-content/uploads/2016/01/life-lessons-quotes-tumblr-cool-famous-quotes-about-life-lessons-quotes-wallpaper-hd-wallpaper-hd.jpg',
      'var': false,
    },
    {
      'link': 'https://www.dreamsquote.com/wp-content/uploads/2018/11/Top-40-Funny-Inspirational-Quotes-That-Will-Inspire-You-Extremely-13.jpg',
      'var': false,
    },
    {
      'link': 'https://www.dailyfunnyquote.com/wp-content/uploads/2019/02/59-Best-Positive-Quotes-for-Success-Short-Inspirational-Quotes-54.jpg',
      'var': false,
    },
    {
      'link': 'https://tse3.mm.bing.net/th?id=OIP.zzDACgiydwMg4kG0f3lU-QHaHa&pid=Api&P=0',
      'var': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Top Quotes",
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
