import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Map<String, dynamic>> myList = [
    {
      'id': 'AB',
      'name': 'Ability',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'AT',
      'name': 'Attitude',
      'color': Colors.purple,
      'navigate': 'attitude',
    },
    {
      'id': 'BB',
      'name': 'Base Ball',
      'color': Colors.blue,
      'navigate': 'ab',
    },
    {
      'id': 'BA',
      'name': 'Batman',
      'color': Colors.orange,
      'navigate': 'ab',
    },
    {
      'id': 'CH',
      'name': 'Challenge',
      'color': Colors.grey.shade700,
      'navigate': 'ab',
    },
    {
      'id': 'CO',
      'name': 'Courage',
      'color': Colors.red,
      'navigate': 'courage',
    },
    {
      'id': 'DE',
      'name': 'Defeat',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'DR',
      'name': 'Dreams',
      'color': Colors.indigo,
      'navigate': 'ab',
    },
    {
      'id': 'ED',
      'name': 'Education',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'EM',
      'name': 'Emotions',
      'color': Colors.purple,
      'navigate': 'ab',
    },
    {
      'id': 'FA',
      'name': 'Failure',
      'color': Colors.blue,
      'navigate': 'ab',
    },
    {
      'id': 'FR',
      'name': 'Friendship',
      'color': Colors.orange,
      'navigate': 'ab',
    },
    {
      'id': 'GO',
      'name': 'Goals',
      'color': Colors.grey.shade700,
      'navigate': 'ab',
    },
    {
      'id': 'GT',
      'name': 'Good Thoughts',
      'color': Colors.red,
      'navigate': 'ab',
    },
    {
      'id': 'HA',
      'name': 'Happy',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'HE',
      'name': 'Health',
      'color': Colors.indigo,
      'navigate': 'health',
    },
    {
      'id': 'ID',
      'name': 'Ideas',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'IN',
      'name': 'Inspiration',
      'color': Colors.purple,
      'navigate': 'inspiration',
    },
    {
      'id': 'JO',
      'name': 'Joy',
      'color': Colors.blue,
      'navigate': 'ab',
    },
    {
      'id': 'JE',
      'name': 'Jealousy',
      'color': Colors.orange,
      'navigate': 'ab',
    },
    {
      'id': 'KA',
      'name': 'Karma',
      'color': Colors.grey.shade700,
      'navigate': 'ab',
    },
    {
      'id': 'KN',
      'name': 'Knowledge',
      'color': Colors.red,
      'navigate': 'ab',
    },
    {
      'id': 'LA',
      'name': 'Language',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'LE',
      'name': 'Leadership',
      'color': Colors.indigo,
      'navigate': 'ab',
    },
    {
      'id': 'MA',
      'name': 'Manners',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'MI',
      'name': 'Mindful',
      'color': Colors.purple,
      'navigate': 'ab',
    },
    {
      'id': 'NA',
      'name': 'Nature',
      'color': Colors.blue,
      'navigate': 'ab',
    },
    {
      'id': 'NY',
      'name': 'New Year',
      'color': Colors.orange,
      'navigate': 'ab',
    },
    {
      'id': 'OP',
      'name': 'Opportunities',
      'color': Colors.grey.shade700,
      'navigate': 'ab',
    },
    {
      'id': 'OP',
      'name': 'Optimism',
      'color': Colors.red,
      'navigate': 'ab',
    },
    {
      'id': 'PA',
      'name': 'Passion',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'PO',
      'name': 'Positive',
      'color': Colors.indigo,
      'navigate': 'positive',
    },
    {
      'id': 'QU',
      'name': 'Quotations',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'RE',
      'name': 'Religion',
      'color': Colors.purple,
      'navigate': 'religion',
    },
    {
      'id': 'RE',
      'name': 'Respect',
      'color': Colors.blue,
      'navigate': 'ab',
    },
    {
      'id': 'SM',
      'name': 'Success',
      'color': Colors.orange,
      'navigate': 'success',
    },
    {
      'id': 'SR',
      'name': 'Self Respect',
      'color': Colors.grey.shade700,
      'navigate': 'ab',
    },
    {
      'id': 'TA',
      'name': 'Talent',
      'color': Colors.red,
      'navigate': 'ab',
    },
    {
      'id': 'TR',
      'name': 'Truth',
      'color': Colors.green,
      'navigate': 'truth',
    },
    {
      'id': 'VI',
      'name': 'Victory',
      'color': Colors.indigo,
      'navigate': 'ab',
    },
    {
      'id': 'VI',
      'name': 'Virtues',
      'color': Colors.green,
      'navigate': 'ab',
    },
    {
      'id': 'WE',
      'name': 'Wealth',
      'color': Colors.purple,
      'navigate': 'ab',
    },
    {
      'id': 'WI',
      'name': 'Wise',
      'color': Colors.blue,
      'navigate': 'ab',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quotes by Category",
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
