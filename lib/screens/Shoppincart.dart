import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ui_project/Strings/Data.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/screens/BuyScreen.dart';
import 'package:mini_ui_project/screens/home.dart';
import 'package:mini_ui_project/widget/Customwidgets.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({
    super.key,
  });

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

int Subtotal = 0;
int Delivery = 2;
int Total = 0;
int quantity = 0;

class _ShoppingCartState extends State<ShoppingCart> {
  void calculator() {
    // Calculate subtotal by summing the 'Price' values multiplied by 'quantity' for items
    Subtotal = 0;
    for (var item in items) {
      Subtotal += (item['Price'] as int) * item['Quantity'] as int;
    }

    // Calculate Total by adding Subtotal and Delivery
    Total = Subtotal + Delivery;
  }

  @override
  Widget build(BuildContext context) {
    calculator();
    return Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(Icons.arrow_back_ios_new),
        //   ),
        // ),
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/banner.jpg'),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high),
              ),
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: items.length,
                padding: EdgeInsets.only(top: 5),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {});
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BuyScreen(
                                    productname: items[index]['name'],
                                    productprice: items[index]['Price'],
                                    Imageontap: items[index]["Image"],
                                  )));
                    },
                    child: CustomListTile(
                      pprice: items[index]['Price'],
                      urlimage: items[index]['Image'],
                      text: items[index]['name'],
                      pressedminus: () {
                        setState(() {
                          // Decrement quantity for the current item
                          if (items[index]['Quantity'] > 0) {
                            items[index]['Quantity']--;
                            calculator(); // Recalculate when quantity changes
                          }
                        });
                      },
                      pressedplus: () {
                        setState(() {
                          // Increment quantity for the current item
                          items[index]['Quantity']++;
                          calculator(); // Recalculate when quantity changes
                        });
                      },
                      quantitytext: (' ${items[index]['Quantity']}'),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 100, left: 100, top: 15),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppSmallText(
                          text: "Subtotal",
                          color: AppColors.black100,
                        ),
                        AppSmallText(
                          text: "$Subtotal",
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
                          text: "Delivery",
                          color: AppColors.black100,
                        ),
                        AppSmallText(
                          text: "$Delivery",
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
                          text: "Total",
                          color: AppColors.black100,
                        ),
                        AppSmallText(
                          text: "$Total",
                          color: AppColors.black100,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.09,
                child: AppButton(
                  pressed: () {
                    print('afdsafasdfhello');
                  },
                  text: "Proceed to Checkout",
                  color: AppColors.black1,
                  family: 'Manrope',
                  weight: FontWeight.bold,
                  size: 15,
                )),
          ],
        ),
      ),
    ));
  }
}
