import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quotes/helper/db_helper.dart';

import '../../models/favorite.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  late Future<List<Favorite>> favorite;

  @override
  void initState() {
    super.initState();
    favorite = DBHelper.dbHelper.selectData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite Quotes",
          style: GoogleFonts.arya(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: favorite,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<Favorite>? data = snapshot.data;
            return (data != null)
                ? ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, i) => Padding(
                      padding: const EdgeInsets.all(15),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SizedBox(
                            height: 500,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    "${data[i].image}",
                                    fit: BoxFit.fill)),
                          ),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(15)),
                              color: Colors.black54,
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: ()async{
                                    int res = await DBHelper.dbHelper
                                        .deleteData(index: data[i].id!);

                                    if (res == 1) {
                                      setState(() {
                                        favorite =
                                            DBHelper.dbHelper.selectData();
                                      });
                                    }
                                  },
                                  child: const Icon(Icons.delete,
                                      color: Colors.red, size: 30),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: Text(
                      "Data not found...",
                    ),
                  );
          } else {
            return Center(
              child: LoadingAnimationWidget.discreteCircle(
                  color: Colors.indigo, size: 40),
            );
          }
        },
      ),
    );
  }
}
