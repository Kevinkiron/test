import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:test/utils/constants.dart';

import '../../bloc/splash_bloc/splash_bloc.dart';
import '../../utils/kstyles.dart';
import '../../utils/theme/app_colors.dart';

class ProductDeatil extends StatelessWidget {
  const ProductDeatil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: Constants.width,
          height: 50,
          child: ElevatedButton(
              onPressed: () async {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Kstyles()
                  .reg(text: "Add To Cart", color: AppColors.backgroundColor)),
        ),
      ),
      body: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      color: Colors.grey.withOpacity(0.1),
                      height: Constants.height * 0.45,
                      width: Constants.width,
                      child: Image.asset(
                        "assets/images/image-6.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: Constants.height * 0.08, left: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () {
                                context.pop();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: AppColors.backgroundColor,
                                    borderRadius: BorderRadius.circular(6)),
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 12,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: Constants.height * 0.08, right: 20),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                context.pop();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: AppColors.backgroundColor,
                                    borderRadius: BorderRadius.circular(6)),
                                child: const Center(
                                  child: Icon(
                                    Icons.blur_on_rounded,
                                    size: 15,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Gap(10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<SplashBloc>().add(Decrement());
                        },
                        child: const Icon(
                          Icons.remove_circle_outline_outlined,
                          color: AppColors.backgroundColor,
                          size: 15,
                        ),
                      ),
                      const Gap(5),
                      Kstyles().reg(
                        text: state.value.toString(),
                        fontWeight: FontWeight.w600,
                        color: AppColors.backgroundColor,
                      ),
                      const Gap(5),
                      InkWell(
                        onTap: () {
                          context.read<SplashBloc>().add(Increament());
                        },
                        child: const Icon(Icons.add_circle_outline_outlined,
                            color: AppColors.backgroundColor, size: 15),
                      ),
                    ],
                  ),
                ),
                const Gap(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Kstyles().reg(
                            text: 'Beef Burger',
                            size: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          Kstyles().reg(text: 'Cheesy Mozarella'),
                        ],
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: '\$',
                            style: Kstyles()
                                .reg(
                                  text: '',
                                  size: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                )
                                .style),
                        TextSpan(
                            text: '6.89',
                            style: Kstyles()
                                .reg(
                                    text: '',
                                    size: 18,
                                    fontWeight: FontWeight.bold)
                                .style),
                      ]))
                    ],
                  ),
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: AppColors.black.withOpacity(0.4),
                          ),
                          Kstyles().reg(text: ' 4.8')
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.fireplace,
                            color: AppColors.black.withOpacity(0.4),
                          ),
                          Kstyles().reg(text: ' 150 Kcal')
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timer_sharp,
                            color: AppColors.black.withOpacity(0.4),
                          ),
                          Kstyles().reg(text: ' 5-10 Min')
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Kstyles().reg(
                          size: 12,
                          fontWeight: FontWeight.w200,
                          text:
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
