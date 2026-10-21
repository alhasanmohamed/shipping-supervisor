import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipping_user_app/features/bottom_nav/logic/bottom_nav_cubit.dart';
import 'package:shipping_user_app/features/bottom_nav/ui/widgets/custom_bottom_nav_bar.dart';
import 'package:shipping_user_app/features/chats/ui/views/chats_view.dart';
import 'package:shipping_user_app/features/login/logic/login_cubit.dart';
import 'package:shipping_user_app/features/profile/ui/views/profile_view.dart';
import 'package:shipping_user_app/features/home/ui/views/home_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: context.read<BottomNavCubit>().pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeView(),
          const ChatsView(),
          BlocProvider(
            create: (context) => context.read<LoginCubit>(),
            child: const ProfileView(),
          ),
        ],
      ),
      floatingActionButton: const CustomBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
