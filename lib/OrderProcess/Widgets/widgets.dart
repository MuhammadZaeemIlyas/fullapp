import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/widget/Customwidgets.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class CustomTextfield extends StatefulWidget {
  final String title;

  const CustomTextfield({super.key, required this.title});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultText(text: widget.title, color: AppColors.black100, size: 15),
          TextField(
            decoration: InputDecoration(focusColor: AppColors.blue),
          )
        ],
      ),
    );
  }
}

class Orderlisttile extends StatefulWidget {
  final String text;
  final String Orderwaytext;
  final String quantitytext;
  final int pprice;
  final String ridername;

  final String urlimage;

  final String riderimage;
  const Orderlisttile(
      {super.key,
      required this.text,
      required this.quantitytext,
      required this.pprice,
      required this.urlimage,
      required this.riderimage,
      required this.Orderwaytext,
      required this.ridername});

  @override
  State<Orderlisttile> createState() => _OrderlisttileState();
}

class _OrderlisttileState extends State<Orderlisttile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          tileColor: AppColors.black1,
          leading: Container(
            width: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(widget.urlimage), fit: BoxFit.cover)),
          ),
          title: DefaultText(
              text: widget.text, color: AppColors.black100, size: 17),
          subtitle: DefaultText(
              text: widget.pprice?.toString() ?? 'N/A',
              color: AppColors.black100),
          trailing: Wrap(
            children: [
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultText(
                  text: 'ID #765433',
                  size: 15,
                  color: AppColors.black100,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 65),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(widget.urlimage),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Positioned(
                    bottom: -20,
                    top: 60,
                    left: 30,
                    right: 30,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.black10,
                              style: BorderStyle.solid,
                              width: 5),
                          shape: BoxShape.circle,
                          color: AppColors.black10,
                          image: DecorationImage(
                              image: NetworkImage(widget.riderimage),
                              fit: BoxFit.cover)),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 40,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.Orderwaytext,
                      maxLines: 10,
                      style: TextStyle(
                        color: AppColors.black100,
                        fontFamily: "Manrope",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        width: 150,
                        height: 60,
                        child: AppButton(
                          text: 'TrackOrder',
                          color: AppColors.black1,
                          family: "Manrope",
                          size: 15,
                          pressed: () {},
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 70, top: 12),
          child: Row(
            children: [
              DefaultText(
                  text: 'Meet our rider :',
                  color: AppColors.black100,
                  size: 15),
              AppSmallText(
                  family: "Manrope",
                  weight: FontWeight.bold,
                  text: widget.ridername,
                  color: AppColors.black100,
                  size: 15),
            ],
          ),
        ),
      ],
    );
  }
}
