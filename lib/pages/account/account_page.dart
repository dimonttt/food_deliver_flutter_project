import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/user_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgests/account_widget.dart';
import 'package:food_delivery/widgests/app_icon.dart';
import 'package:food_delivery/widgests/big_text.dart';
import 'package:get/get.dart';

import '../../base/custom_loader.dart';
import '../../utils/colors.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      print("User has logged in");
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: "Profile",
            size: 24,
            color: Colors.white,
          ),
        ),
        body: GetBuilder<UserController>(
          builder: (userController) {
            return _userLoggedIn
                ? (userController.isLoading
                    ? Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(top: Dimensions.heigth20),
                        child: Column(
                          children: [
                            //profile icon
                            AppIcon(
                              icon: Icons.person,
                              backgroundColor: AppColors.mainColor,
                              iconColor: Colors.white,
                              iconSize:
                                  Dimensions.heigth45 + Dimensions.heigth30,
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
                                          text: userController.userModel.name,
                                        )),
                                    SizedBox(
                                      height: Dimensions.heigth15,
                                    ),
                                    //phone
                                    AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.phone,
                                          backgroundColor:
                                              AppColors.yellowColor,
                                          iconColor: Colors.white,
                                          iconSize: Dimensions.heigth10 * 5 / 2,
                                          size: Dimensions.heigth10 * 5,
                                        ),
                                        bigText: BigText(
                                          text: userController.userModel.phone,
                                        )),
                                    SizedBox(
                                      height: Dimensions.heigth15,
                                    ),
                                    //email
                                    AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.email,
                                          backgroundColor:
                                              AppColors.yellowColor,
                                          iconColor: Colors.white,
                                          iconSize: Dimensions.heigth10 * 5 / 2,
                                          size: Dimensions.heigth10 * 5,
                                        ),
                                        bigText: BigText(
                                          text: userController.userModel.email,
                                        )),
                                    SizedBox(
                                      height: Dimensions.heigth15,
                                    ),
                                    //address
                                    AccountWidget(
                                        appIcon: AppIcon(
                                          icon: Icons.location_on,
                                          backgroundColor:
                                              AppColors.yellowColor,
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
                                    // AccountWidget(
                                    //     appIcon: AppIcon(
                                    //       icon: Icons.message_outlined,
                                    //       backgroundColor: Colors.redAccent,
                                    //       iconColor: Colors.white,
                                    //       iconSize: Dimensions.heigth10 * 5 / 2,
                                    //       size: Dimensions.heigth10 * 5,
                                    //     ),
                                    //     bigText: BigText(
                                    //       text: "Messages",
                                    //     )),
                                    // SizedBox(
                                    //   height: Dimensions.heigth15,
                                    // ),
                                    GestureDetector(
                                      onTap: () {
                                        if (Get.find<AuthController>()
                                            .userLoggedIn()) {
                                          Get.find<AuthController>()
                                              .clearSharedData();
                                          Get.find<CartController>().clear();
                                          Get.find<CartController>()
                                              .clearCartHistory();
                                          Get.offNamed(
                                              RouteHelper.getSignInPage());
                                        } else {
                                          print("you logged out");
                                        }
                                      },
                                      child: AccountWidget(
                                          appIcon: AppIcon(
                                            icon: Icons.logout_sharp,
                                            backgroundColor: Colors.redAccent,
                                            iconColor: Colors.white,
                                            iconSize:
                                                Dimensions.heigth10 * 5 / 2,
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
                      )
                    : CustomLoader())
                : Container(
                    child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getSignInPage());
                          },
                          child: Container(
                            width: double.maxFinite,
                            height: Dimensions.heigth20 * 5,
                            margin: EdgeInsets.only(
                                left: Dimensions.width20,
                                right: Dimensions.width20),
                            decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20)),
                            child: Center(
                                child: BigText(
                              text: "Sign in",
                              color: Colors.white,
                              size: Dimensions.font26,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ));
          },
        ));
  }
}
