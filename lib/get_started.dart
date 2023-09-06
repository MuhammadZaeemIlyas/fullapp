import 'package:flutter/material.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/home_screen.dart';
import 'package:mini_ui_project/widget/appLargeText.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  List<Map<String, String>> images = [
    {"images": "assets/images/started 1.jpg"},
    {"images": "assets/images/started 2.jpg"},
  ];

  List<Map<String, String>> text = [
    {
      "title": "Your holiday shopping delivered to Screen one",
      "subtitle":
          "There's something for everyone to enjoy with Sweet Shop Favourites Screen 1"
    },
    {
      "title": "Your holiday shopping delivered to Screen Two",
      "subtitle":
          "There's something for everyone to enjoy with Sweet Shop Favourites Screen 2"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          itemCount: text.length,
          itemBuilder: (context, index) {
            return Container(
              padding:
                  EdgeInsets.only(top: 50, right: 25, left: 25, bottom: 25),
              color: AppColors.blue,
              width: double.infinity,
              height: double.infinity,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(
                        text: text[index]["title"]!, color: AppColors.black1),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 250,
                      child: AppSmallText(
                        text: text[index]["subtitle"]!,
                        color: AppColors.black45,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: List.generate(2, (indexDots) {
                        return Container(
                          margin: EdgeInsets.only(right: 5),
                          height: 5,
                          width: index == indexDots ? 30 : 15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots
                                  ? AppColors.black1
                                  : AppColors.black45),
                        );
                      }),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 163),
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image:
                                          AssetImage(images[index]["images"]!),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen(),
                                      ));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 70,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.black1,
                                  ),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Get Started",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Icon(
                                        Icons.arrow_right_alt_rounded,
                                        size: 40,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
