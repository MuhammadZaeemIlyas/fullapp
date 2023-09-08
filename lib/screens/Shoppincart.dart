import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_ui_project/Strings/Data.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/constan/appIcons.dart';
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
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage('assets/images/banner.jpg'),
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8, // Adjust the top position as needed
                  left: 8, // Adjust the left position as needed
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
            ),
            SizedBox(
              height: 15,
            ),
            if (items.isEmpty)
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.black10),
                child: Center(
                  child: Text(
                    "No items",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            else
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
                padding: const EdgeInsets.only(top: 15),
                child: Customcalculator(
                    BtnText: "Proceed to checkout",
                    buttonpressed: () {},
                    text1: 'Subtotal',
                    text2: '$Subtotal',
                    text3: 'Delivery',
                    text4: '$Delivery',
                    text5: 'Total',
                    text6: '$Total')),
          ],
        ),
      ),
    ));
  }
}
