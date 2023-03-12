import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quotes/screens/views/Latest.dart';
import 'package:quotes/screens/views/article.dart';
import 'package:quotes/screens/views/attitude.dart';
import 'package:quotes/screens/views/author.dart';
import 'package:quotes/screens/views/categories.dart';
import 'package:quotes/screens/views/courage.dart';
import 'package:quotes/screens/views/entrepreneur.dart';
import 'package:quotes/screens/views/favoritePage.dart';
import 'package:quotes/screens/views/health.dart';
import 'package:quotes/screens/views/homepage.dart';
import 'package:quotes/screens/views/inspiration.dart';
import 'package:quotes/screens/views/michel.dart';
import 'package:quotes/screens/views/picture.dart';
import 'package:quotes/screens/views/positive.dart';
import 'package:quotes/screens/views/proverb.dart';
import 'package:quotes/screens/views/religion.dart';
import 'package:quotes/screens/views/roland.dart';
import 'package:quotes/screens/views/short.dart';
import 'package:quotes/screens/views/success.dart';
import 'package:quotes/screens/views/swami.dart';
import 'package:quotes/screens/views/top.dart';
import 'package:quotes/screens/views/truth.dart';
import 'package:quotes/screens/views/william.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        'home': (context) => const HomePage(),
        'category': (context) => const Categories(),
        'latest': (context) => const Latest(),
        'quotes': (context) => const Quotes(),
        'article': (context) => const Article(),
        'favorite': (context) => const FavoritePage(),
        'author': (context) => const Author(),
        'inspiration': (context) => const Inspiration(),
        'success': (context) => const Success(),
        'positive': (context) => const Positive(),
        'truth': (context) => const Truth(),
        'attitude': (context) => const Attitude(),
        'religion': (context) => const Religion(),
        'courage': (context) => const Courage(),
        'health': (context) => const Health(),
        'michel': (context) => const Michel(),
        'swami': (context) => const Swami(),
        'william': (context) => const William(),
        'roland': (context) => const Roland(),
        'short': (context) => const Short(),
        'proverbs': (context) => const Proverb(),
        'entrepreneur': (context) => const Entrepreneur(),
        'top': (context) => const Top(),
      },
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Random random = Random();

  List myList = [
    'http://becauseimaddicted.net/wp-content/uploads/2015/04/IMG_2085.jpg',
    'https://i.pinimg.com/originals/fd/bd/54/fdbd541a4917c35f1b80eb84adf41c70.jpg',
    'https://tse4.mm.bing.net/th?id=OIP.qs2UDJVTmjU_RrAL8JHE4AHaNK&pid=Api&P=0',
    'https://tse2.mm.bing.net/th?id=OIP.PzFO_yU2rjpcG6vojc23PQHaL2&pid=Api&P=0',
    'https://tse1.mm.bing.net/th?id=OIP.Q92GlTcHmR45R2iUdS4jjwHaHa&pid=Api&P=0',
    'https://quotereel.com/wp-content/uploads/2019/02/short-friendship-quote-26.jpg',
    'https://tse2.mm.bing.net/th?id=OIP._oPObwwXtx_gi8V_xd4F-wHaHa&pid=Api&P=0',
    'https://tinypositive.com/wp-content/uploads/2019/02/56-Short-Inspirational-Quotes-And-Short-Inspirational-Sayings-3.jpg',
    'http://wdy.h-cdn.co/assets/15/52/wdy_quotes2_02.jpg',
    'https://www.dailyfunnyquote.com/wp-content/uploads/2018/07/300-Short-Inspirational-Quotes-And-Short-Inspirational-Sayings-013.jpg',
  ];

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, 'home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            myList.elementAt(random.nextInt(9)),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
