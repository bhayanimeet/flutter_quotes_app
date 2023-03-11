import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes/screens/views/Latest.dart';
import 'package:quotes/screens/views/article.dart';
import 'package:quotes/screens/views/attitude.dart';
import 'package:quotes/screens/views/categories.dart';
import 'package:quotes/screens/views/favoritePage.dart';
import 'package:quotes/screens/views/inspiration.dart';
import 'package:quotes/screens/views/picture.dart';
import 'package:quotes/screens/views/positive.dart';
import 'package:quotes/screens/views/success.dart';
import 'package:quotes/screens/views/truth.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'category': (context) => const Categories(),
        'latest': (context) => const Latest(),
        'quotes': (context) => const Quotes(),
        'article': (context) => const Article(),
        'favorite': (context) => const FavoritePage(),
        'inspiration': (context) => const Inspiration(),
        'success': (context) => const Success(),
        'positive': (context) => const Positive(),
        'truth': (context) => const Truth(),
        'attitude': (context) => const Attitude(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> myList = [
    {
      'icon': '📚',
      'topic': 'By Topic',
    },
    {
      'icon': '🤵',
      'topic': 'By Author',
    },
    {
      'icon': '⭐',
      'topic': 'Favorites',
    },
    {
      'icon': '💡',
      'topic': 'Quote of the day',
    },
    {
      'icon': '⭐',
      'topic': 'Favourite Pictures',
    },
    {
      'icon': '🎥',
      'topic': 'Videos',
    },
  ];

  List<Map<String, dynamic>> myList1 = [
    {
      'icon': Icons.settings,
      'topic': 'Settings',
    },
    {
      'icon': Icons.share,
      'topic': 'Share',
    },
    {
      'icon': Icons.star_rate,
      'topic': 'Rate',
    },
    {
      'icon': Icons.mail_sharp,
      'topic': 'Feedback',
    },
    {
      'icon': Icons.info_outline,
      'topic': 'About',
    },
  ];

  List<Map<String, dynamic>> imageList = [
    {
      'text': "Life is too short to spend it with\npeople you don't like.",
      'image': 'assets/images/1.jpg',
    },
    {
      'text': "Really is a dream that someone was\nbrave enough to conquer.",
      'image': 'assets/images/2.jpg',
    },
    {
      'text':
          "You just have to be happy. If you are,\neverything else will fall into place.",
      'image': 'assets/images/3.jpg',
    },
    {
      'text': "Keep going forward.",
      'image': 'assets/images/4.jpg',
    },
    {
      'text':
          "Your time is limited.so don't waste it\nliving someone else life.",
      'image': 'assets/images/5.jpg',
    },
  ];

  List<Map<String, dynamic>> typeList = [
    {
      'text': "Categories",
      'color': const Color(0xffa35684),
      'icon': 'assets/images/menu.png',
      'navigate': 'category',
    },
    {
      'text': "Pic Quotes",
      'color': const Color(0xff7688c8),
      'icon': 'assets/images/picture.png',
      'navigate': 'latest',
    },
    {
      'text': "Latest Quotes",
      'color': const Color(0xffba8e43),
      'icon': 'assets/images/flower.png',
      'navigate': 'quotes',
    },
    {
      'text': "Articles",
      'color': const Color(0xff6c9978),
      'icon': 'assets/images/application.png',
      'navigate': 'article',
    },
  ];

  CarouselController carouselController = CarouselController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff5973be),
                        Color(0xff5f77c1),
                      ],
                    ),
                  ),
                  child: Text(
                    "Life quotes and\nSayings",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ...myList
                  .map(
                    (e) => Container(
                      height: 50,
                      color: Colors.white,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Text(
                            "${e['icon']}",
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "${e['topic']}",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              Divider(thickness: 2, height: 25, color: Colors.grey.shade300),
              Container(
                height: 30,
                margin: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Communicate",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              ...myList1
                  .map(
                    (e) => Container(
                      height: 50,
                      color: Colors.white,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          Icon(e['icon'], color: Colors.black, size: 30),
                          const SizedBox(width: 15),
                          Text(
                            "${e['topic']}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Life Quotes & Sayings",
          style: GoogleFonts.arya(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        actions: [
          const Center(
            child: Text(
              "🔔",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'favorite');
            },
            child: const Icon(Icons.favorite, color: Colors.pink),
          ),
          const SizedBox(width: 8),
        ],
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  initialPage: currentPage,
                  onPageChanged: (val, _) {
                    setState(() {
                      currentPage = val;
                    });
                  },
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(seconds: 4),
                  autoPlayCurve: Curves.easeInOut,
                  pauseAutoPlayInFiniteScroll: true,
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                ),
                items: imageList
                    .map(
                      (e) => Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                  height: 350,
                                  width: 350,
                                  child: Image.asset(e['image'],
                                      fit: BoxFit.fill)),
                              Text(
                                e['text'],
                                style: GoogleFonts.play(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 130,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: imageList.map(
                                (e) {
                                  int i = imageList.indexOf(e);
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        carouselController.animateToPage(
                                          i,
                                          curve: Curves.easeInOut,
                                          duration:
                                              const Duration(milliseconds: 500),
                                        );
                                      });
                                    },
                                    child: CircleAvatar(
                                      radius: 4,
                                      backgroundColor: (i == currentPage)
                                          ? Colors.grey.shade300
                                          : Colors.grey.shade600,
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: typeList
                    .map(
                      (e) => Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, e['navigate']);
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: e['color'],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(
                                e['icon'],
                                height: 30,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(e['text'], style: GoogleFonts.play()),
                        ],
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Most Popular",
                    style: GoogleFonts.play(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'inspiration');
                      },
                      child: myColumn(
                          image:
                              'https://www.success.com/wp-content/uploads/legacy/sites/default/files/5_18.jpg',
                          text: "Inspiration Quotes"),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'success');
                      },
                      child: myColumn(
                          image:
                              'https://tse3.mm.bing.net/th?id=OIP.opn2iEWdbLQqizd4Shj_wgHaE-&pid=Api&P=0',
                          text: "Success Quotes"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, 'positive');
                      },
                      child: myColumn(
                          image:
                              'https://tse3.mm.bing.net/th?id=OIP.TJxjNrKbfZlSmjS4CKSQbgHaEK&pid=Api&P=0',
                          text: "Positive Quotes"),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, 'truth');
                      },
                      child: myColumn(
                          image:
                              'https://tse1.mm.bing.net/th?id=OIP.rapKXc1rSb4fPNeePEFdqwHaFk&pid=Api&P=0',
                          text: "Truth Quotes"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quotes by Category",
                      style: GoogleFonts.play(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "View All >",
                      style: GoogleFonts.play(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, 'attitude');
                      },
                      child: myColumn(
                          image:
                              'https://tse3.mm.bing.net/th?id=OIP.Dc5h-FaqfeUXGOHItfLrTwHaEK&pid=Api&P=0',
                          text: "Attitude Quotes"),
                    ),
                    myColumn(
                        image:
                            'https://tse3.mm.bing.net/th?id=OIP.Xko9fIT6G0_zt1HVYrqBAwHaE7&pid=Api&P=0',
                        text: "Bravery Quotes"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    myColumn(
                        image:
                            'https://tse4.explicit.bing.net/th?id=OIP.PnQQaW_JIrxWX0SoWWDf0wHaEo&pid=Api&P=0',
                        text: "Courage Quotes"),
                    myColumn(
                        image: 'https://wallpapercave.com/wp/wp1959924.jpg',
                        text: "Humor Quotes"),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quotes by Authors",
                      style: GoogleFonts.play(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "View All >",
                      style: GoogleFonts.play(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    myContainer(
                        color: const Color(0xffefe4b4),
                        text: "Michel De\nMontaigne"),
                    myContainer(
                        color: const Color(0xffb8d7e9),
                        text: "Swami\nVivekananda"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    myContainer(
                        color: const Color(0xfffde490),
                        text: "William\nShakespeare"),
                    myContainer(
                        color: const Color(0xfff6cddf),
                        text: "Roland\nBarthes"),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Featured",
                    style: GoogleFonts.play(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    myContainer1(
                        color: const Color(0xfff4cc5d), text: "Short\nQuotes"),
                    myContainer1(
                        color: const Color(0xffff8675), text: "Proverbs"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    myContainer1(
                        color: const Color(0xfffde490),
                        text: "Entrepreneur\nQuotes"),
                    myContainer1(
                        color: const Color(0xfff6cddf), text: "Top\nQuotes"),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/day.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/today.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Articles",
                      style: GoogleFonts.play(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, 'article');
                      },
                      child: Text(
                        "View All >",
                        style: GoogleFonts.play(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 7),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    myColumn1(
                        image:
                            'https://tse2.mm.bing.net/th?id=OIP.xMUALtAeOeePKvK2cYbcowHaE0&pid=Api&P=0',
                        text:
                            "Giving something back to the\ncommunities you care about"),
                    myColumn1(
                        image:
                            'https://tse2.mm.bing.net/th?id=OIP.1iRBXBnKvPWn327Nm6q3ngHaEK&pid=Api&P=0',
                        text:
                            "Doubt kill more dreams\nthat failure ever will."),
                    myColumn1(
                        image:
                            'https://tse3.mm.bing.net/th?id=OIP.tgZezoBbDAQ5-4Rh1mZYUQHaE8&pid=Api&P=0',
                        text:
                            "Reasons why wanting to be alone is\ngood for you."),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myContainer({required Color color, required String text}) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width / 2.2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.play(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 23,
        ),
      ),
    );
  }

  Widget myContainer1({required Color color, required String text}) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width / 2.2,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.play(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontSize: 23,
        ),
      ),
    );
  }

  Widget myColumn({required String image, required String text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          width: MediaQuery.of(context).size.width / 2.2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          text,
          style: GoogleFonts.play(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget myColumn1({required String image, required String text}) {
    return Container(
      height: 220,
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width / 1.2,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(10)),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              text,
              textAlign: TextAlign.start,
              style: GoogleFonts.play(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
