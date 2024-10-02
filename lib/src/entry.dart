import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:test/src/cart_view/cart_view.dart';
import 'package:test/src/home_view/home_view.dart';
import 'package:test/src/profile_%20view/profile_view.dart';
import 'package:test/src/search_view/search_view.dart';
import 'package:test/src/wishlist_view/wishlist_view.dart';
import '../bloc/bottom_nav_bloc/bottom_nav_bloc.dart';
import '../utils/constants.dart';
import '../utils/theme/app_colors.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  final List<Widget> _pages = const [
    SearchView(),
    WishlistView(),
    HomeView(),
    CartView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          return _pages[state.index];
        },
      ),
      bottomNavigationBar: SizedBox(
        height: Constants.height * 0.12,
        child: _bottomNav(context),
      ),
    );
  }

  MotionTabBar _bottomNav(BuildContext context) {
    return MotionTabBar(
      initialSelectedTab: "Home",
      labels: const ["Search", "Wishlist", "Home", "Cart", "Profile"],
      icons: const [
        Icons.search,
        Icons.heart_broken,
        Icons.home,
        Icons.shopping_cart,
        Icons.person,
      ],
      tabSize: 50,
      tabBarHeight: 55,
      textStyle: const TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      tabIconColor: Colors.grey[600],
      tabIconSize: 28.0,
      tabIconSelectedSize: 26.0,
      tabSelectedColor: Colors.red,
      tabIconSelectedColor: Colors.white,
      onTabItemSelected: (int value) {
        context.read<BottomNavBloc>().add(BottomNavigationIndex(index: value));
      },
    );
  }
}
