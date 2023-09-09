import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ui_project/Appicons/my_flutter_app_icons.dart';
import 'package:mini_ui_project/Strings/Data.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/Shoppincart.dart';
import 'package:mini_ui_project/screens/categories.dart';
import 'package:mini_ui_project/screens/favourite.dart';
import 'package:mini_ui_project/screens/home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mini_ui_project/screens/more.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;

  final List _screen = [
    Home(),
    Catedories(),
    Favourite(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectIndex],
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.decelerate,
        backgroundColor: AppColors.black20,
        buttonBackgroundColor: AppColors.black100,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _selectIndex = index;
          });
        },
        items: [
          Icon(
            Icons.home,
            color: AppColors.iconcolor,
          ),
          Icon(
            Icons.category_rounded,
            color: AppColors.iconcolor,
          ),
          Icon(
            Icons.favorite,
            color: AppColors.iconcolor,
          ),
          Icon(
            Icons.more_vert_outlined,
            color: AppColors.iconcolor,
          ),
        ],
      ),
    );
  }
}
