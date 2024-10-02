import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:test/routes/route_constanst.dart';
import 'package:test/src/onboard.dart';
import 'package:test/utils/constants.dart';
import 'package:test/utils/kstyles.dart';
import 'package:test/utils/theme/app_colors.dart';

import '../../data/model.dart';

List<BannerModel> imgBanner = [
  BannerModel(
    title: "Promo Buy 1,\n Get 1 more!",
    img: "assets/images/image-4.jpg",
  ),
  BannerModel(
    title: "Promo Two Free!",
    img: "assets/images/image-7.jpg",
  )
];

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: SizedBox(
                height: Constants.height * 0.45,
                child: Stack(
                  children: [
                    _carouselSliderContent(),
                    Positioned(
                      top: 30,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Kstyles().reg(
                                text: 'Location',
                                size: 14,
                                color: AppColors.backgroundColor),
                            const Gap(5),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Icon(
                                      Icons.pin_drop,
                                      color: AppColors.backgroundColor,
                                      size: 15,
                                    ),
                                  ),
                                  TextSpan(text: 'St, Abigael'),
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppColors.backgroundColor,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: Constants.height * 0.38,
                      left: 20,
                      right: 20,
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.black.withOpacity(0.1),
                                offset: const Offset(1, 1),
                                spreadRadius: 5,
                                blurRadius: 10)
                          ],
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                          style: Kstyles()
                              .reg(
                                  text: '',
                                  size: 12,
                                  fontWeight: FontWeight.w500)
                              .style,
                          cursorHeight: 15,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(8),
                            hintText: 'Search food, restauarnts,etc',
                            hintStyle: Kstyles()
                                .reg(
                                    text: '',
                                    size: 12,
                                    fontWeight: FontWeight.w200)
                                .style,
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: Constants.height * 0.1,
              child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColors.black.withOpacity(0.2))),
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          radius: 17,
                          backgroundImage:
                              AssetImage("assets/images/image-4.jpg"),
                        ),
                        Kstyles().reg(text: 'Rice', color: Colors.red),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Kstyles().reg(
                      text: 'Top Rated Food',
                      color: AppColors.black,
                      fontWeight: FontWeight.w600),
                ),
                const Gap(10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: 4,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.pushNamed(RoutesConstants.productDetailName);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.backgroundColor,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.black.withOpacity(0.1),
                                  offset: const Offset(1, 1),
                                  spreadRadius: 1,
                                  blurRadius: 5)
                            ],
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: Constants.height * 0.1,
                                width: Constants.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/image-7.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.backgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      margin: const EdgeInsets.all(10),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 1),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.star_rounded,
                                            color: Colors.amber,
                                            size: 11,
                                          ),
                                          Kstyles().reg(
                                              text: "(4.9)",
                                              size: 8,
                                              fontWeight: FontWeight.w500)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Kstyles().reg(
                                        text: "Burger Beef 'anjaz'",
                                        size: 12,
                                        color: Colors.black),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Kstyles().reg(
                                            text: "Burger Bos'",
                                            size: 12,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Colors.black.withOpacity(0.1)),
                                        Kstyles().reg(
                                            size: 12,
                                            text: "\$45.80'",
                                            color: Colors.black),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  CarouselSlider _carouselSliderContent() {
    return CarouselSlider(
      options: CarouselOptions(
        height: Constants.height * 0.4,
        enlargeCenterPage: false,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 1,
      ),
      items: imgBanner.map((imageUrl) {
        return Container(
          width: Constants.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  imageUrl.img.toString(),
                ),
                fit: BoxFit.fill),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Kstyles().reg(
                  text: imageUrl.title,
                  fontWeight: FontWeight.w600,
                  size: 16,
                  color: AppColors.backgroundColor,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
