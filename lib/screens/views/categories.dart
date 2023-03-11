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
    },
    {
      'id': 'AC',
      'name': 'Accuracy',
      'color': Colors.purple,
    },
    {
      'id': 'BB',
      'name': 'Base Ball',
      'color': Colors.blue,
    },
    {
      'id': 'BA',
      'name': 'Batman',
      'color': Colors.orange,
    },
    {
      'id': 'CH',
      'name': 'Challenge',
      'color': Colors.grey.shade700,
    },
    {
      'id': 'CH',
      'name': 'Change',
      'color': Colors.red,
    },
    {
      'id': 'DE',
      'name': 'Defeat',
      'color': Colors.green,
    },
    {
      'id': 'DR',
      'name': 'Dreams',
      'color': Colors.indigo,
    },
    {
      'id': 'ED',
      'name': 'Education',
      'color': Colors.green,
    },
    {
      'id': 'EM',
      'name': 'Emotions',
      'color': Colors.purple,
    },
    {
      'id': 'FA',
      'name': 'Failure',
      'color': Colors.blue,
    },
    {
      'id': 'FR',
      'name': 'Friendship',
      'color': Colors.orange,
    },
    {
      'id': 'GO',
      'name': 'Goals',
      'color': Colors.grey.shade700,
    },
    {
      'id': 'GT',
      'name': 'Good Thoughts',
      'color': Colors.red,
    },
    {
      'id': 'HA',
      'name': 'Happy',
      'color': Colors.green,
    },
    {
      'id': 'HE',
      'name': 'Health',
      'color': Colors.indigo,
    },
    {
      'id': 'ID',
      'name': 'Ideas',
      'color': Colors.green,
    },
    {
      'id': 'IN',
      'name': 'Inspiration',
      'color': Colors.purple,
    },
    {
      'id': 'JO',
      'name': 'Joy',
      'color': Colors.blue,
    },
    {
      'id': 'JE',
      'name': 'Jealousy',
      'color': Colors.orange,
    },
    {
      'id': 'KA',
      'name': 'Karma',
      'color': Colors.grey.shade700,
    },
    {
      'id': 'KN',
      'name': 'Knowledge',
      'color': Colors.red,
    },
    {
      'id': 'LA',
      'name': 'Language',
      'color': Colors.green,
    },
    {
      'id': 'LE',
      'name': 'Leadership',
      'color': Colors.indigo,
    },
    {
      'id': 'MA',
      'name': 'Manners',
      'color': Colors.green,
    },
    {
      'id': 'MI',
      'name': 'Mindful',
      'color': Colors.purple,
    },
    {
      'id': 'NA',
      'name': 'Nature',
      'color': Colors.blue,
    },
    {
      'id': 'NY',
      'name': 'New Year',
      'color': Colors.orange,
    },
    {
      'id': 'OP',
      'name': 'Opportunities',
      'color': Colors.grey.shade700,
    },
    {
      'id': 'OP',
      'name': 'Optimism',
      'color': Colors.red,
    },
    {
      'id': 'PA',
      'name': 'Passion',
      'color': Colors.green,
    },
    {
      'id': 'PE',
      'name': 'Peace',
      'color': Colors.indigo,
    },
    {
      'id': 'QU',
      'name': 'Quotations',
      'color': Colors.green,
    },
    {
      'id': 'RE',
      'name': 'Religion',
      'color': Colors.purple,
    },
    {
      'id': 'RE',
      'name': 'Respect',
      'color': Colors.blue,
    },
    {
      'id': 'SM',
      'name': 'Self Motivation',
      'color': Colors.orange,
    },
    {
      'id': 'SR',
      'name': 'Self Respect',
      'color': Colors.grey.shade700,
    },
    {
      'id': 'TA',
      'name': 'Talent',
      'color': Colors.red,
    },
    {
      'id': 'TE',
      'name': 'Teamwork',
      'color': Colors.green,
    },
    {
      'id': 'VI',
      'name': 'Victory',
      'color': Colors.indigo,
    },
    {
      'id': 'VI',
      'name': 'Virtues',
      'color': Colors.green,
    },
    {
      'id': 'WE',
      'name': 'Wealth',
      'color': Colors.purple,
    },
    {
      'id': 'WI',
      'name': 'Wise',
      'color': Colors.blue,
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
                (e) => SizedBox(
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
              )
              .toList(),
        ),
      ),
    );
  }
}
