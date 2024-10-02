import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test/routes/route_constanst.dart';
import 'package:test/routes/routes.dart';
import 'package:test/utils/kstyles.dart';

import '../bloc/splash_bloc/splash_bloc.dart';
import '../utils/theme/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state.status == StatusState.onboard) {
              context.go(RoutesConstants.onboardName);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Kstyles().reg(text: 'Test App'),
              ),
            ],
          ),
          // ),
        ));
  }
}
