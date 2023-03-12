import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Author extends StatefulWidget {
  const Author({Key? key}) : super(key: key);

  @override
  State<Author> createState() => _AuthorState();
}

class _AuthorState extends State<Author> {
  List<Map<String, dynamic>> myList = [
    {
      'id': 'AK',
      'name': 'Abdul Kalam',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'AE',
      'name': 'Albert Einstein',
      'color': Colors.purple,
      'navigate': 'ab',
    },
    {
      'id': 'BG',
      'name': 'Bill Gates',
      'color': Colors.blue,
      'navigate': 'ab',
    },
    {
      'id': 'BF',
      'name': 'Benjamin Franklin',
      'color': Colors.orange,
      'navigate': 'ab',
    },
    {
      'id': 'CD',
      'name': 'Charles Darwin',
      'color': Colors.grey.shade700,
      'navigate': 'ab',
    },
    {
      'id': 'CC',
      'name': 'Charlie Chaplin',
      'color': Colors.red,
      'navigate': 'ab',
    },
    {
      'id': 'DH',
      'name': 'David Hume',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'DT',
      'name': 'Donald Trump',
      'color': Colors.indigo,
      'navigate': 'ab',
    },
    {
      'id': 'EM',
      'name': 'Edward Murphy',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'EB',
      'name': 'Erma Bombeck',
      'color': Colors.purple,
      'navigate': 'ab',
    },
    {
      'id': 'FZ',
      'name': 'Frank Zappa',
      'color': Colors.blue,
      'navigate': 'ab',
    },
    {
      'id': 'FE',
      'name': 'Friedrich Engels',
      'color': Colors.orange,
      'navigate': 'ab',
    },
    {
      'id': 'GB',
      'name': 'Gautam Buddha',
      'color': Colors.grey.shade700,
      'navigate': 'ab',
    },
    {
      'id': 'GC',
      'name': 'George Carlin',
      'color': Colors.red,
      'navigate': 'ab',
    },
    {
      'id': 'HK',
      'name': 'Hellen Keller',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'HF',
      'name': 'Henry Ford',
      'color': Colors.indigo,
      'navigate': 'ab',
    },
    {
      'id': 'IG',
      'name': 'Indira Gandhi',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'IN',
      'name': 'Issac Newton',
      'color': Colors.purple,
      'navigate': 'ab',
    },
    {
      'id': 'JC',
      'name': 'Jackie Chan',
      'color': Colors.blue,
      'navigate': 'ab',
    },
    {
      'id': 'JA',
      'name': 'James Allen',
      'color': Colors.orange,
      'navigate': 'ab',
    },
    {
      'id': 'KM',
      'name': 'Karl Marx',
      'color': Colors.grey.shade700,
      'navigate': 'ab',
    },
    {
      'id': 'KC',
      'name': 'Kurt cobain',
      'color': Colors.red,
      'navigate': 'ab',
    },
    {
      'id': 'LA',
      'name': 'Laozi',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'LB',
      'name': 'Lord Byron',
      'color': Colors.indigo,
      'navigate': 'ab',
    },
    {
      'id': 'MG',
      'name': 'Mahatma Gandhi',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'MP',
      'name': 'Marco Polo',
      'color': Colors.purple,
      'navigate': 'ab',
    },
    {
      'id': 'NH',
      'name': 'Napoleon Hill',
      'color': Colors.blue,
      'navigate': 'ab',
    },
    {
      'id': 'NM',
      'name': 'Narayan Murthy',
      'color': Colors.orange,
      'navigate': 'ab',
    },
    {
      'id': 'OW',
      'name': 'Oscar Wilde',
      'color': Colors.grey.shade700,
      'navigate': 'ab',
    },
    {
      'id': 'OS',
      'name': 'Osho',
      'color': Colors.red,
      'navigate': 'ab',
    },
    {
      'id': 'PB',
      'name': 'Pearl Buck',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'PE',
      'name': 'Pele',
      'color': Colors.indigo,
      'navigate': 'ab',
    },
    {
      'id': 'QE',
      'name': 'Queen Elizabeth 2',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'RT',
      'name': 'Rabindranath Tagor',
      'color': Colors.purple,
      'navigate': 'ab',
    },
    {
      'id': 'RB',
      'name': 'Roland Barthes',
      'color': Colors.blue,
      'navigate': 'roland',
    },
    {
      'id': 'SB',
      'name': 'Sai Baba',
      'color': Colors.orange,
      'navigate': 'ab',
    },
    {
      'id': 'SV',
      'name': 'Swami Vivekananda',
      'color': Colors.grey.shade700,
      'navigate': 'swami',
    },
    {
      'id': 'TE',
      'name': 'Thomas Edison',
      'color': Colors.red,
      'navigate': 'ab',
    },
    {
      'id': 'TP',
      'name': 'Thomas Paine',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'UB',
      'name': 'Usain Bolt',
      'color': Colors.indigo,
      'navigate': 'ab',
    },
    {
      'id': 'VH',
      'name': 'Victor Hugo',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'VP',
      'name': 'Vladamir Putin',
      'color': Colors.purple,
      'navigate': 'ab',
    },
    {
      'id': 'WS',
      'name': 'William Shakespeare',
      'color': Colors.blue,
      'navigate': 'william',
    },
    {
      'id': 'WD',
      'name': 'Walt Disney',
      'color': Colors.orange,
      'navigate': 'ab',
    },
    {
      'id': 'YB',
      'name': 'Yogi Berra',
      'color': Colors.grey.shade700,
      'navigate': 'ab',
    },
    {
      'id': 'ZZ',
      'name': 'Zig Ziglar',
      'color': Colors.red,
      'navigate': 'ab',
    },
    {
      'id': 'ZZ',
      'name': 'Zinedine Zidane',
      'color': Colors.green,
      'navigate': 'ab',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quotes by Author",
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
          children: myList
              .map(
                (e) => GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, e['navigate']);
                  },
                  child: SizedBox(
              height: 100,
              child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: e['color'],
                          child: Text(
                            e['id'],
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          e['name'],
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
              ),
            ),
                ),
          )
              .toList(),
        ),
      ),
    );
  }
}
