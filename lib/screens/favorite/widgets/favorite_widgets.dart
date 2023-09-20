import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class favoritetile extends StatefulWidget {
  final String text;
  final Function() crosspressed;
  final int Price;
  final String urlImage;
  const favoritetile(
      {super.key,
      required this.text,
      required this.Price,
      required this.urlImage,
      required this.crosspressed});

  @override
  State<favoritetile> createState() => _favoritetileState();
}

class _favoritetileState extends State<favoritetile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.black1,
      leading: Container(
        width: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(widget.urlImage), fit: BoxFit.cover)),
      ),
      title:
          DefaultText(text: widget.text, color: AppColors.black100, size: 17),
      subtitle: DefaultText(
          text: widget.Price?.toString() ?? 'N/A', color: AppColors.black100),
      trailing: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppSmallText(
              text: "Favourite",
              color: AppColors.black100,
              family: "Manrope",
              size: 15,
              weight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: widget.crosspressed,
            icon: Icon(Icons.close),
            iconSize: 15,
          )
        ],
      ),
    );
  }
}

class Delivertile extends StatefulWidget {
  final String text;
  final Function() crosspressed;
  final String Price;
  final String urlImage;

  const Delivertile(
      {super.key,
      required this.text,
      required this.crosspressed,
      required this.Price,
      required this.urlImage});

  @override
  State<Delivertile> createState() => _DelivertileState();
}

class _DelivertileState extends State<Delivertile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.black1,
      leading: Container(
        width: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(widget.urlImage), fit: BoxFit.cover)),
      ),
      title:
          DefaultText(text: widget.text, color: AppColors.black100, size: 17),
      subtitle: AppSmallText(
        text: widget.Price,
        color: AppColors.black100,
        size: 25,
        weight: FontWeight.bold,
      ),
      trailing: Wrap(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: AppColors.blue),
            child: IconButton(
              onPressed: widget.crosspressed,
              icon: Icon(Icons.chat_bubble),
              iconSize: 25,
              color: AppColors.black1,
            ),
          )
        ],
      ),
    );
  }
}
