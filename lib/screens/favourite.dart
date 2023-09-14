import 'package:flutter/material.dart';
import 'package:mini_ui_project/screens/home.dart';
import 'package:mini_ui_project/widget/Customwidgets.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
        itemCount: favoriteitems.length,
        itemBuilder: (context, index) {
          return CustomListTile(
              text: favoriteitems[index]['name'],
              pprice: favoriteitems[index]['Price'],
              urlimage: favoriteitems[index]['Image'],
              pressedminus: () {},
              pressedplus: () {},
              quantitytext: '2',
              crosspressed: () {
                setState(() {
                  favoriteitems.removeAt(index);
                });
              });
        },
      )),
    );
  }
}
