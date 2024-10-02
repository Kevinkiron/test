import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test/data/model.dart';
import 'package:test/utils/constants.dart';
import 'package:test/utils/kstyles.dart';

import '../bloc/splash_bloc/splash_bloc.dart';
import '../routes/route_constanst.dart';
import '../utils/theme/app_colors.dart';

List<OnboardModel> content = [
  OnboardModel(
    title: 'The Fastest In\n Delivey Food',
    subtitle:
        'Our jo is to filling your tummy with\n delicious food and fast delivery.',
    img: "assets/images/image-3.jpg",
  ),
  OnboardModel(
    title: 'The Fastest In\n Delivey Food',
    subtitle:
        'Our jo is to filling your tummy with\n delicious food and fast delivery.',
    img: "assets/images/image-2.jpg",
  ),
  OnboardModel(
    title: 'The Fastest In\n Delivey Food',
    subtitle:
        'Our jo is to filling your tummy with\n delicious food and fast delivery.',
    img: "assets/images/image-1.jpg",
  ),
];

class OnboardView extends StatelessWidget {
  OnboardView({super.key});
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                  controller: controller,
                  onPageChanged: (index) {
                    context
                        .read<SplashBloc>()
                        .add(NavigateToNextPage(currentIndex: index));
                  },
                  itemCount: content.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            content[index].img,
                            height: Constants.height * 0.6,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ClipPath(
                            clipper: UpwardOvalClipper(),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              height: Constants.height * 0.6,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Kstyles().reg(
                                    text: content[index].title,
                                    size: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(height: 15),
                                  Kstyles().reg(
                                      text: content[index].subtitle,
                                      size: 14,
                                      fontWeight: FontWeight.w300,
                                      textAlign: TextAlign.center),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SmoothPageIndicator(
                        controller: controller,
                        count: content.length,
                        onDotClicked: (p0) {
                          controller.animateToPage(
                            p0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear,
                          );
                        },
                        effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.yellow,
                          dotColor: Colors.black,
                          dotHeight: 8,
                          dotWidth: 8,
                          spacing: 4,
                          expansionFactor: 3,
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: Constants.width,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (state.onBoardOndex == content.length - 1) {
                                // final prefs =
                                //     await SharedPreferences.getInstance();
                                // prefs.setBool('onBoard', false);
                                if (context.mounted) {
                                  context.goNamed(RoutesConstants.entryName);
                                }
                              } else {
                                controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.linear,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Kstyles().reg(
                                text: state.onBoardOndex == content.length - 1
                                    ? "Get Started"
                                    : "Continue",
                                color: AppColors.backgroundColor)),
                      ),
                      const Gap(40)
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class UpwardOvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width / 2,
      0,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
