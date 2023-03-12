import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../helper/db_helper.dart';
import '../../models/favorite.dart';

class Entrepreneur extends StatefulWidget {
  const Entrepreneur({Key? key}) : super(key: key);

  @override
  State<Entrepreneur> createState() => _EntrepreneurState();
}

class _EntrepreneurState extends State<Entrepreneur> {

  List myList = [
    {
      'link': 'http://3.bp.blogspot.com/-L-Ol-QvCMdk/VmHaj-1DwXI/AAAAAAAAMnk/nbAG9SsmNMc/s1600/Entrepreneurial-Quotes-Entrepreneur-Mike-Schiemer-Entrepreneurship-Quote-Frugal-Business.jpg',
      'var': false,
    },
    {
      'link': 'https://www.yourselfquotes.com/wp-content/uploads/2018/10/Wipro-Azim-Premji-Entrepreneur-Quotes.jpg',
      'var': false,
    },
    {
      'link': 'https://cdn.quotesgram.com/img/90/5/1199460607-ea4419074f1bc9a1d625374607ec99b6.jpg',
      'var': false,
    },
    {
      'link': 'https://www.bestofforever.com/wp-content/uploads/Richard-Branson-Entrepreneur-Quotes-Twitter-7.jpg',
      'var': false,
    },
    {
      'link': 'https://i.pinimg.com/originals/e0/6e/46/e06e460f85776a1a4186a44c5f399cd5.jpg',
      'var': false,
    },
    {
      'link': 'https://tse4.mm.bing.net/th?id=OIP.1qQUmPUNEGABqJX_ctVdfQHaHa&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://i.pinimg.com/originals/cf/d5/be/cfd5bee945a0afb04552a8fb3a64e206.png',
      'var': false,
    },
    {
      'link': 'https://cdn.wealthygorilla.com/wp-content/uploads/2016/08/Entrepreneur-Lifestyle-Picture-Quotes-3.jpg',
      'var': false,
    },
    {
      'link': 'https://bestoflife.com/wp-content/uploads/2017/06/Work-Powerful-Quotes-for-Entrepreneurs.jpg',
      'var': false,
    },
    {
      'link': 'https://tse4.mm.bing.net/th?id=OIP.3EOadsZjS-16Ec-aJffbiwHaHh&pid=Api&P=0',
      'var': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Entrepreneur Quotes",
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
