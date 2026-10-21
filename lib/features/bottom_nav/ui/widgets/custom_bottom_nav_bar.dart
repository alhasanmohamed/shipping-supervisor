import 'package:shipping_user_app/features/bottom_nav/logic/bottom_nav_cubit.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/helpers/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavBarCubit = context.read<BottomNavCubit>();
    final double iconSize = 25;
    return BlocBuilder<BottomNavCubit, BottomNavBarPage>(
      builder: (context, state) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)
          ),
          margin: const EdgeInsets.symmetric(horizontal: 14),
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          child: NavigationBar(
            onDestinationSelected: bottomNavBarCubit.changePage,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            selectedIndex: state.index,
            indicatorColor: Theme.of(context).primaryColor,
            indicatorShape: CircleBorder(
              side: BorderSide(
                color: Theme.of(context).primaryColor,
                strokeAlign: 0,
                width: 20,
              )
            ),
            elevation: 5,
            height: 60,
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  size: iconSize,
                ),
                selectedIcon: Icon(
                  Icons.home,
                  size: iconSize,
                  color: AppColors.white,
                ),
                label: 'Home',
                tooltip: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  CupertinoIcons.chat_bubble_text,
                  size: iconSize,
                ),
                selectedIcon: Icon(
                  CupertinoIcons.chat_bubble_text_fill,
                  size: iconSize,
                  color: AppColors.white,
                ),
                label: 'Chats',
                tooltip: 'Chats',
              ),
              NavigationDestination(
                icon: Icon(
                  CupertinoIcons.person,
                  size: iconSize,
                ),
                selectedIcon: Icon(
                  CupertinoIcons.person_fill,
                  size: iconSize,
                  color: AppColors.white,
                ),
                label: 'Profile',
                tooltip: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }

  ColorFilter? setSelectedItemColor(BottomNavBarPage item, BottomNavBarPage state) {
    if (item == state) {
      return const ColorFilter.mode(
        AppColors.primaryColor,
        BlendMode.srcIn,
      );
    }
    return null;
  }
}
