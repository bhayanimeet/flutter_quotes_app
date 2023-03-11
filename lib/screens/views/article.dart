import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Article extends StatefulWidget {
  const Article({Key? key}) : super(key: key);

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Articles",
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
            myColumn(
              image: 'https://tse2.mm.bing.net/th?id=OIP.xMUALtAeOeePKvK2cYbcowHaE0&pid=Api&P=0',
              text: "Giving something back to the communities you care about",
            ),
            myColumn(
              image:
                  'https://tse2.mm.bing.net/th?id=OIP.1iRBXBnKvPWn327Nm6q3ngHaEK&pid=Api&P=0',
              text: "Doubt kill more dreams that failure ever will.",
            ),
            myColumn(
              image:
                  'https://tse3.mm.bing.net/th?id=OIP.tgZezoBbDAQ5-4Rh1mZYUQHaE8&pid=Api&P=0',
              text: "Reasons why wanting to be alone is good for you.",
            ),
            myColumn(
              image:
              'https://tse4.mm.bing.net/th?id=OIP.5tFGU4QsY1cfsFm9QZJD1wHaE9&pid=Api&P=0',
              text: "The amazing benefits of houseplants on your mind and body.",
            ),
            myColumn(
              image:
              'https://tse1.mm.bing.net/th?id=OIP.PwA_pMUtIBHjwRHJvJ465gHaEo&pid=Api&P=0',
              text: "Why self-compassion trumps self-Esteem.",
            ),
            myColumn(
              image:
              'https://tse2.mm.bing.net/th?id=OIP.xMUALtAeOeePKvK2cYbcowHaE0&pid=Api&P=0',
              text: "Giving something back to the communities you care about",
            ),
            const SizedBox(height: 20),
            LoadingAnimationWidget.discreteCircle(color: Colors.indigo,size: 40),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget myColumn({required String image, required String text}) {
    return Container(
      height: 240,
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: MediaQuery.of(context).size.width,
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
              height: 80,
              width: MediaQuery.of(context).size.width,
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
      ),
    );
  }
}
