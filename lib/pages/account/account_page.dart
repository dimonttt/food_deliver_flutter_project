import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgests/account_widget.dart';
import 'package:food_delivery/widgests/app_icon.dart';
import 'package:food_delivery/widgests/big_text.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.heigth20),
        child: Column(
          children: [
            //profile icon
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.heigth45 + Dimensions.heigth30,
              size: Dimensions.heigth15 * 10,
            ),
            SizedBox(
              height: Dimensions.heigth30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //name
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.person,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.heigth10 * 5 / 2,
                          size: Dimensions.heigth10 * 5,
                        ),
                        bigText: BigText(
                          text: "Olga",
                        )),
                    SizedBox(
                      height: Dimensions.heigth15,
                    ),
                    //phone
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.phone,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.heigth10 * 5 / 2,
                          size: Dimensions.heigth10 * 5,
                        ),
                        bigText: BigText(
                          text: "8 912 335-25-64",
                        )),
                    SizedBox(
                      height: Dimensions.heigth15,
                    ),
                    //email
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.email,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.heigth10 * 5 / 2,
                          size: Dimensions.heigth10 * 5,
                        ),
                        bigText: BigText(
                          text: "dimont@yandex.ru",
                        )),
                    SizedBox(
                      height: Dimensions.heigth15,
                    ),
                    //address
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.location_on,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.heigth10 * 5 / 2,
                          size: Dimensions.heigth10 * 5,
                        ),
                        bigText: BigText(
                          text: "Address",
                        )),
                    SizedBox(
                      height: Dimensions.heigth15,
                    ),
                    //massage
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.message_outlined,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: Dimensions.heigth10 * 5 / 2,
                          size: Dimensions.heigth10 * 5,
                        ),
                        bigText: BigText(
                          text: "Messages",
                        )),
                    SizedBox(
                      height: Dimensions.heigth15,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (Get.find<AuthController>().userLoggedIn()) {
                          Get.find<AuthController>().clearSharedData();
                          Get.find<CartController>().clear();
                          Get.find<CartController>().clearCartHistory();
                          Get.offNamed(RouteHelper.getSignInPage());
                        } else {
                          print("you logged out");
                        }
                      },
                      child: AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.logout_sharp,
                            backgroundColor: Colors.redAccent,
                            iconColor: Colors.white,
                            iconSize: Dimensions.heigth10 * 5 / 2,
                            size: Dimensions.heigth10 * 5,
                          ),
                          bigText: BigText(
                            text: "Log out",
                          )),
                    ),
                    SizedBox(
                      height: Dimensions.heigth15,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
