import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ui_project/Strings/Data.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/home.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

List<String> images = ["assets/images/Image icon.svg"];

class Customwidgets extends StatelessWidget {
  final String? text1;
  final String? text2;
  final String? text3;

  const Customwidgets({super.key, this.text1, this.text2, this.text3});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.orange,
      ),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: SvgPicture.asset(
                  "assets/images/Image icon.svg",
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(text: text1!, size: 24),
                AppSmallText(
                  text: text2!,
                  family: "Manrope",
                  size: 30,
                  weight: FontWeight.bold,
                ),
                DefaultText(text: text3!)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Customitembox extends StatefulWidget {
  final String? firstUnittext;
  final String? pricetext;
  final String? itemname;
  final String? itemtype;
  final String imagechahiye;
  const Customitembox(
      {super.key,
      this.firstUnittext,
      this.pricetext,
      this.itemname,
      this.itemtype,
      required this.imagechahiye});

  @override
  State<Customitembox> createState() => _CustomitemboxState();
}

class _CustomitemboxState extends State<Customitembox> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.01,
        height: MediaQuery.of(context).size.height * 0.09,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.darkyellow),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.network(
                widget.imagechahiye,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 80),
              child: AppSmallText(
                text: widget.itemname!,
                family: "Manrope",
                size: 12,
                color: AppColors.black90,
                weight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 90),
              child: DefaultText(
                text: widget.itemtype!,
                color: AppColors.black90,
              ),
            ),
            Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 1,
                    ),
                    DefaultText(
                        text: widget.firstUnittext!,
                        size: 15,
                        color: AppColors.black100),
                    AppSmallText(
                        text: "\$$result",
                        family: "Manrope",
                        weight: FontWeight.bold,
                        size: 15,
                        color: AppColors.black100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: AppColors.darkBlue),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  result = fixedamount * amount++;
                                });
                                print("REsult:$result");
                              },
                              icon: Icon(Icons.add),
                              iconSize: 15,
                              color: AppColors.black1,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatefulWidget {
  final String? text;
  final String? pprice;
  final String? urlimage;
  const CustomListTile({
    super.key,
    this.text,
    this.pprice,
    this.urlimage,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.black1,
      leading: Image.network(widget.urlimage!),
      title: Text(widget.text!),
      subtitle: Text(widget.pprice!),
      trailing: Wrap(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
          SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultText(
              text: "2",
              size: 15,
              color: AppColors.black100,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.remove))
        ],
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final String text;
  final double? size;
  final Function()? pressed;
  final String? family;
  final Color color;
  final FontWeight? weight;
  const AppButton(
      {super.key,
      required this.text,
      this.size,
      this.family,
      required this.color,
      this.weight,
      this.pressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: pressed,
      child: AppSmallText(
        text: text,
        family: "Manrope",
        size: size,
        weight: weight,
        color: color,
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkBlue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          fixedSize: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height)),
    );
  }
}

class imagecard extends StatefulWidget {
  final String imagechahiye;
  final String? firstUnittext;
  final String? pricetext;
  final Function()? pressed;
  final String? itemname;
  final String? itemtype;
  const imagecard(
      {super.key,
      required this.imagechahiye,
      this.firstUnittext,
      this.pricetext,
      this.itemname,
      this.itemtype,
      this.pressed});

  @override
  State<imagecard> createState() => _imagecardState();
}

class _imagecardState extends State<imagecard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(widget.imagechahiye),
                      fit: BoxFit.cover)),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSmallText(
                text: widget.itemname!,
                family: "Manrope",
                size: 20,
                color: AppColors.black100,
                weight: FontWeight.bold,
              ),
              AppSmallText(
                text: widget.itemtype!,
                family: "Manrope",
                size: 15,
                color: AppColors.black100,
                weight: FontWeight.w200,
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultText(
                      text: widget.firstUnittext!,
                      size: 16,
                      color: AppColors.black100),
                  AppSmallText(
                    text: widget.pricetext!,
                    color: AppColors.black100,
                    family: 'Manrope',
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.blue),
                    child: IconButton(
                        splashColor: AppColors.black10,
                        onPressed: widget.pressed,
                        icon: Icon(
                          Icons.add,
                          size: 20,
                          color: AppColors.black1,
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class newcard extends StatefulWidget {
  final String imagechahiye;
  final String? firstUnittext;
  final String? pricetext;
  final String? itemname;
  final String? itemtype;
  const newcard(
      {super.key,
      required this.imagechahiye,
      this.firstUnittext,
      this.pricetext,
      this.itemname,
      this.itemtype});

  @override
  State<newcard> createState() => _newcardState();
}

class _newcardState extends State<newcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 154,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFEFEF2),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Image.network(
              widget.imagechahiye,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              AppSmallText(
                text: widget.itemname!,
                family: "Manrope",
                size: 12,
                color: AppColors.black90,
                weight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
