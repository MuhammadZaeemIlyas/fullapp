import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/favorite/widgets/favorite_widgets.dart';
import 'package:mini_ui_project/screens/home.dart';
import 'package:mini_ui_project/widget/Customwidgets.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Padding(
                padding: const EdgeInsets.only(top: 45, left: 20),
                child: AppSmallText(
                  text: "Favourites",
                  color: AppColors.black1,
                  family: "Manrope",
                  size: 50,
                  weight: FontWeight.bold,
                ),
              ),
              color: AppColors.blue,
            ),
            favoriteitems.isEmpty
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.black10),
                    child: Center(
                      child: Text(
                        "No favourite items",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: favoriteitems.length,
                    itemBuilder: (context, index) {
                      return favoritetile(
                          crosspressed: () {
                            setState(() {
                              favoriteitems.removeAt(index);
                            });
                          },
                          text: favoriteitems[index]['name'],
                          Price: favoriteitems[index]['Price'],
                          urlImage: favoriteitems[index]['Image']);
                    },
                  ),
          ],
        )),
      ),
    );
  }
}
