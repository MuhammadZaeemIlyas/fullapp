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
  final String? imagebanner;
  const Customwidgets(
      {super.key, this.text1, this.text2, this.text3, this.imagebanner});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.17,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
              image: NetworkImage(imagebanner!), fit: BoxFit.cover)),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: SvgPicture.asset(
                  "assets/images/Image Icon.svg",
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 25, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultText(text: text1!, size: 24),
                AppSmallText(
                  text: text2!,
                  family: "Manrope",
                  size: 35,
                  weight: FontWeight.bold,
                ),
                Expanded(
                  child: DefaultText(
                    text: text3!,
                    size: 17,
                  ),
                )
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
  final String text;
  final String quantitytext;
  final int pprice;
  final Function() pressedminus;
  final Function() pressedplus;
  final Function() crosspressed;
  final String urlimage;
  const CustomListTile({
    super.key,
    required this.text,
    required this.pprice,
    required this.urlimage,
    required this.pressedminus,
    required this.pressedplus,
    required this.quantitytext,
    required this.crosspressed,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.black1,
      leading: Container(
        width: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(widget.urlimage), fit: BoxFit.cover)),
      ),
      title:
          DefaultText(text: widget.text, color: AppColors.black100, size: 17),
      subtitle: DefaultText(
          text: widget.pprice?.toString() ?? 'N/A', color: AppColors.black100),
      trailing: Wrap(
        children: [
          IconButton(
            onPressed: widget.pressedplus,
            icon: Icon(Icons.add),
            iconSize: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DefaultText(
              text: widget.quantitytext,
              size: 15,
              color: AppColors.black100,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: widget.pressedminus,
            icon: Icon(Icons.remove),
            iconSize: 15,
          ),
          IconButton(
            onPressed: widget.crosspressed,
            icon: Icon(Icons.close_rounded),
            iconSize: 15,
          ),
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
  final int? pricetext;
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
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(widget.imagechahiye),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppSmallText(
                        text: widget.itemname!,
                        family: "Manrope",
                        size: 20,
                        color: AppColors.black100,
                        weight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border_rounded))
                  ],
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
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.black10),
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
                    text: widget.pricetext?.toString() ?? 'N/A',
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

class Customcalculator extends StatefulWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final Function() buttonpressed;
  final String BtnText;
  const Customcalculator(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4,
      required this.text5,
      required this.text6,
      required this.buttonpressed,
      required this.BtnText});

  @override
  State<Customcalculator> createState() => _CustomcalculatorState();
}

class _CustomcalculatorState extends State<Customcalculator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.black10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppSmallText(
                  text: widget.text1,
                  family: "Manrope",
                  color: AppColors.black100,
                ),
                AppSmallText(
                  text: widget.text2,
                  family: "Manrope",
                  color: AppColors.black100,
                  weight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppSmallText(
                  text: widget.text3,
                  family: "Manrope",
                  color: AppColors.black100,
                ),
                AppSmallText(
                  text: widget.text4,
                  family: "Manrope",
                  color: AppColors.black100,
                  weight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppSmallText(
                  family: "Manrope",
                  text: widget.text5,
                  color: AppColors.black100,
                ),
                AppSmallText(
                  family: "Manrope",
                  text: widget.text6,
                  color: AppColors.black100,
                  weight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.09,
                child: AppButton(
                  pressed: widget.buttonpressed,
                  text: widget.BtnText,
                  color: AppColors.black1,
                  family: 'Manrope',
                  weight: FontWeight.bold,
                  size: 15,
                )),
          ],
        ),
      ),
    );
  }
}

class ShoppingBagWithBadge extends StatefulWidget {
  final Widget icon1;
  final int badgeCount;
  final Function() buttonpressed;

  ShoppingBagWithBadge({
    required this.icon1,
    required this.badgeCount,
    required this.buttonpressed,
  });

  @override
  State<ShoppingBagWithBadge> createState() => _ShoppingBagWithBadgeState();
}

class _ShoppingBagWithBadgeState extends State<ShoppingBagWithBadge> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: widget.buttonpressed, icon: widget.icon1, iconSize: 25),
        Positioned(
          top: 2,
          right: 2,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            constraints: BoxConstraints(
              minWidth: 20,
              minHeight: 20,
            ),
            child: Center(
              child: Text(
                widget.badgeCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
