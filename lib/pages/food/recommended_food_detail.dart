import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgests/app_icon.dart';
import 'package:food_delivery/widgests/big_text.dart';

import '../../widgests/exandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  child: Center(
                      child: BigText(
                          size: Dimensions.font26, text: "Chinese Side")),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.radius20),
                          topRight: Radius.circular(Dimensions.radius20))),
                )),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandbleTextWidget(
                      text:
                          "Chinese cuisine is one of my favourites. I know that it’s rather old and full of authentic traditions. Over the time there were added some foreign ingredients, but the core of the cuisine remained unchanged. Perhaps the most famous Chinese dishes include fried rice, sweet-and-sour chicken, Peking duck and turtle soup. Chinese tea is also rather popular and full of useful features. One of the basic principles of Chinese food is that it should consist of small pieces. Hence the two culinary secrets include the right cut and proper roasting. All in all there are more than thirty ways of cooking there. Food can be quick fried, fried in deep oil layer, cooked in water, vinegar or syrup, fried on low heat, stewed. One of my favourite dishes is the sweet-and-sour chicken. In my opinion, this dish has a very tender taste and I could eat it for lunch, dinner and breakfast. It’s worth mentioning that Chinese people appreciate not only the taste of the dish they prepare, but also the color, aroma and overall appearance. That’s why when we eat Chinese, we get aesthetic pleasure. In fact, it’s not a secret that most Chinese dishes are eaten with two chopsticks. It is rather convenient when you are used to them. For example, my mum can’t hold them properly, so she prefers ordinary fork and knife instead. As for me, I have recently learned how to use them, which is why I enjoy eating with chopsticks very much. For those who try the Chinese for the first time I’d recommend a chicken noodle soup and fortune cookies."),
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.heigth10,
              bottom: Dimensions.heigth10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconSize: Dimensions.IconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.remove),
                BigText(
                  text: "\$12.88 " + " X " + " 0 ",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                    iconSize: Dimensions.IconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.add),
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.heigth30,
                bottom: Dimensions.heigth30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.heigth10,
                      bottom: Dimensions.heigth10,
                      left: Dimensions.width10,
                      right: Dimensions.width10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.heigth10,
                      bottom: Dimensions.heigth10,
                      left: Dimensions.width10,
                      right: Dimensions.width10),
                  child: BigText(
                    text: "\$10 | Add to cart",
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
