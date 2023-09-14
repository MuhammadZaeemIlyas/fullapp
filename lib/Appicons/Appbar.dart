import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class CustomAppbar extends StatefulWidget {
  final String bartitle;
  final Function() Appback;
  const CustomAppbar({Key? key, required this.bartitle, required this.Appback})
      : super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.black1,
                ),
                child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_sharp, size: 15),
                    onPressed: widget.Appback),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                  child: AppSmallText(
                      text: widget.bartitle,
                      color: AppColors.black100,
                      family: "Manrope",
                      size: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Stackbar extends StatefulWidget {
  final String imagedo;

  const Stackbar({super.key, required this.imagedo});

  @override
  State<Stackbar> createState() => _StackbarState();
}

class _StackbarState extends State<Stackbar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(widget.imagedo),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.black1),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_sharp, size: 15),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}
