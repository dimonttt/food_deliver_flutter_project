import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgests/app_column.dart';
import 'package:food_delivery/widgests/big_text.dart';
import 'package:food_delivery/widgests/icon_and_text_widget.dart';
import 'package:food_delivery/widgests/small_text.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageVallue = 0.0;
  final double _scaleFactor = 0.8;
  final double _heigth = Dimensions.pageViewContainer;

  bool isSort = false;
  List<RecommendedProductController> items = [];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageVallue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider section
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? SizedBox(
                  //color: Colors.redAccent,
                  height: Dimensions.pageView,

                  child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProducts.popularProductList.length,
                    itemBuilder: (context, position) {
                      return _buildPageItem(position,
                          popularProducts.popularProductList[position]);
                    },
                  ),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),

        //dots
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return DotsIndicator(
              dotsCount: popularProducts.popularProductList.isEmpty
                  ? 1
                  : popularProducts.popularProductList.length,
              position: _currPageVallue,
              decorator: DotsDecorator(
                activeColor: AppColors.mainColor,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            );
          },
        ),

        //Popular text
        SizedBox(
          height: Dimensions.heigth30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommend"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".", color: Colors.black26),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() => isSort = !isSort);
                  //recommendedProduct.recommendedProductList[index].name!),
                },
                child: Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SmallText(
                              text: "Sorting",
                              color: Colors.black54,
                              size: Dimensions.font20,
                            ),
                            isSort
                                ? Icon(Icons.arrow_drop_down_rounded)
                                : Icon(Icons.arrow_drop_up_rounded),
                          ],
                        )
                      ],
                    )
                    // child: SmallText(
                    //   text: "Sorting",
                    //   size: Dimensions.font20,
                    // ),
                    ),
              )
            ],
          ),
        ),
        //recommended food
        //list of food and images
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          if (recommendedProduct.isLoaded) {
            recommendedProduct.recommendedProductList.sort((a, b) {
              return (a.price?.compareTo(b.price ?? 0) ?? 0) *
                  (isSort ? 1 : -1);
            });
          }
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    //final sortedItems =
                    //isSort ? recommendedProduct.recommendedProductList.reversed.toList() : recommendedProduct.recommendedProductList;

                    //final item = sortedItems[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            RouteHelper.getRecommendedFood(index, "home"));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                            bottom: Dimensions.heigth10),
                        child: Row(
                          children: [
                            //image section
                            Container(
                              width: Dimensions.ListViewImgSize,
                              height: Dimensions.ListViewImgSize,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white38,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(AppConstans.BASE_URL +
                                        AppConstans.UPLOAD_URL +
                                        recommendedProduct
                                            .recommendedProductList[index]
                                            .img!)),
                              ),
                            ),
                            //text container
                            Expanded(
                              child: Container(
                                height: Dimensions.ListViewTextContSize,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimensions.radius20),
                                    bottomRight:
                                        Radius.circular(Dimensions.radius20),
                                  ),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimensions.width10,
                                      right: Dimensions.width10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BigText(
                                          text: recommendedProduct
                                              .recommendedProductList[index]
                                              .name!),
                                      SizedBox(
                                        height: Dimensions.heigth10,
                                      ),
                                      SmallText(
                                          text: "With chinese characterictics"),
                                      SizedBox(
                                        height: Dimensions.heigth10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconAndTextWidget(
                                              icon: Icons.circle_sharp,
                                              text: recommendedProduct
                                                  .recommendedProductList[index]
                                                  .price
                                                  .toString(),
                                              iconColor: AppColors.iconColor1),
                                          IconAndTextWidget(
                                              icon: Icons.location_on,
                                              text: "1.7km",
                                              iconColor: AppColors.mainColor),
                                          IconAndTextWidget(
                                              icon: Icons.access_time_rounded,
                                              text: "32min",
                                              iconColor: AppColors.iconColor2)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        })
      ],
    );
  }

  Widget _buildPageItem(int index, popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageVallue.floor()) {
      var currScale = 1 - (_currPageVallue - index) * (1 - _scaleFactor);
      var currTrans = _heigth * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageVallue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageVallue - index + 1) * (1 - _scaleFactor);
      var currTrans = _heigth * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageVallue.floor() - 1) {
      var currScale = 1 - (_currPageVallue - index) * (1 - _scaleFactor);
      var currTrans = _heigth * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _heigth * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          //showing the header
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(index, "home"));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstans.BASE_URL +
                      AppConstans.UPLOAD_URL +
                      popularProduct.img!),
                ),
              ),
            ),
          ),
          //showing the body
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.heigth30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                ],
              ),
              child: AppColumn(text: popularProduct.name!),
            ),
          ),
        ],
      ),
    );
  }
}
