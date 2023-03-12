import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../helper/db_helper.dart';
import '../../models/favorite.dart';

class Health extends StatefulWidget {
  const Health({Key? key}) : super(key: key);

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  List myList = [
    {
      'link': 'https://tse1.mm.bing.net/th?id=OIP.j9xD_uPKYvd5hTqMCU1_gwHaHa&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://www.theinspiringjournal.com/wp-content/uploads/2018/08/To-keep-the-body-in-good-health-is-a-duty%E2%80%A6-otherwise-we-shall-not-be-able-to-keep-our-mind-strong-and-clear-%E2%80%93-Buddha-quotes.jpg',
      'var': false,
    },
    {
      'link': 'https://tse2.mm.bing.net/th?id=OIP.PPF-4kDmOw79-EY0BGG9uAHaHa&pid=Api&P=0',
      'var': false,
    },
    {
      'link': 'https://www.theinspiringjournal.com/wp-content/uploads/2018/08/Happiness-is-the-highest-form-of-health-Dalai-Lama.jpg',
      'var': false,
    },
    {
      'link': 'https://www.theinspiringjournal.com/wp-content/uploads/2018/08/Every-human-being-is-the-author-of-his-own-health-or-disease-Buddha-quotes.jpg',
      'var': false,
    },
    {
      'link': 'http://tamboracai.com/assets/INSPIRATIONAL-QUOTES_HEALTH-WELLNESS_TAMBOR-ACAI-02.jpg',
      'var': false,
    },
    {
      'link': 'https://www.theinspiringjournal.com/wp-content/uploads/2018/08/Health-is-the-greatest-gift-contentment-the-greatest-wealth-faithfulness-the-best-relationship-Buddha-quotes.jpg',
      'var': false,
    },
    {
      'link': 'https://www.theinspiringjournal.com/wp-content/uploads/2018/08/Take-care-of-your-body-Its-the-only-place-you-have-to-live-Jim-Rohn-quotes.jpg',
      'var': false,
    },
    {
      'link': 'https://www.theinspiringjournal.com/wp-content/uploads/2018/08/The-first-wealth-is-health-Ralph-Waldo-Emerson-quotes.jpg',
      'var': false,
    },
    {
      'link': 'https://tamboracai.com/assets/INSPIRATIONAL-QUOTES_HEALTH-WELLNESS_TAMBOR-ACAI-05.jpg',
      'var': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Health Quotes",
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
