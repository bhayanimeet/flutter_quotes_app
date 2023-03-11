import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../helper/db_helper.dart';
import '../../models/favorite.dart';

class Inspiration extends StatefulWidget {
  const Inspiration({Key? key}) : super(key: key);

  @override
  State<Inspiration> createState() => _InspirationState();
}

class _InspirationState extends State<Inspiration> {

  List myList = [
    {
      'link': 'http://becauseimaddicted.net/wp-content/uploads/2015/04/IMG_2085.jpg',
      'var': false,
    },
    {
      'link': 'https://tse2.mm.bing.net/th?id=OIP.FiBOEojEXc3gOd7D2XFEvAHaLL&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'http://www.lakehouserecoverycenter.com/wp-content/uploads/2015/01/Quote-Hardest-Climb.jpg',
      'var': false,
    },
    {
      'link': 'https://cutelovequotesforher.org/wp-content/uploads/2015/06/inspirational-motivational-quotes.jpg',
      'var': false,
    },
    {
      'link': 'https://i.pinimg.com/originals/20/d3/31/20d33153e6f4ad8ce51482b07cf3b209.jpg',
      'var': false,
    },
    {
      'link': 'https://www.dailyfunnyquote.com/wp-content/uploads/2019/04/60-Short-Motivational-Quotes-Inspirational-Sayings-13.jpg',
      'var': false,
    },
    {
      'link': 'https://quotesviral.net/wp-content/uploads/2017/09/inspiring-travel-quotes-you-need-in-your-lifepinterest-culture-trip.jpg',
      'var': false,
    },
    {
      'link': 'https://i.pinimg.com/originals/06/09/92/060992f1f4154fb0d57ccf81b75d4e26.jpg',
      'var': false,
    },
    {
      'link': 'https://boomsumo.com/wp-content/uploads/2018/07/65-Inspirational-Quotes-Life-And-Inspirational-Sayings-30.jpg',
      'var': false,
    },
    {
      'link': 'https://www.dreamsquote.com/wp-content/uploads/2019/07/Best-Life-Quotes.jpg',
      'var': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Inspiration Quotes",
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
