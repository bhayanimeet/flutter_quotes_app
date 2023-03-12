import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../helper/db_helper.dart';
import '../../models/favorite.dart';

class Latest extends StatefulWidget {
  const Latest({Key? key}) : super(key: key);

  @override
  State<Latest> createState() => _LatestState();
}

class _LatestState extends State<Latest> {
  List myList = [
    {
      'link': 'https://tse3.mm.bing.net/th?id=OIP.pS5KkQlb57aWwlhovdz_KgHaHa&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'http://4.bp.blogspot.com/-WSOYqObo5uY/UCkJEXfKKpI/AAAAAAAAYJY/oun85H8-Zlw/s1600/popular+quotes+(13).jpg',
      'var': false,
    },
    {
      'link': 'https://tse1.mm.bing.net/th?id=OIP.cNC1Pd0DtSWBfBQsotu-BgHaFj&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'http://becauseimaddicted.net/wp-content/uploads/2015/04/IMG_2085.jpg',
      'var': false,
    },
    {
      'link': 'https://tse4.mm.bing.net/th?id=OIP.qjVhsHOETmxpK0QJ9alA_gHaLV&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://tse1.mm.bing.net/th?id=OIP.SeG1OTU2opgA_2JCNCwK7AHaHa&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://www.blurmark.com/wp-content/uploads/2017/01/Motivational-quote-15.jpg',
      'var': false,
    },
    {
      'link': 'https://www.joshloe.com/wp-content/uploads/2019/05/25-inspirational-quotes-to-remind-you-that-life-is-beautiful.jpg',
      'var': false,
    },
    {
      'link':'https://littlenivi.com/wp-content/uploads/2018/10/59-Great-Motivational-Inspirational-Quotes-With-Images-To-Inspire-56.jpg',
      'var': false,
    },
    {
      'link': 'https://www.thehealthy.com/wp-content/uploads/2020/12/gratitude-quote-featured-image.jpg',
      'var': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Popular Quotes",
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
