import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipping_user_app/core/helpers/enums.dart';

class BottomNavCubit extends Cubit<BottomNavBarPage> {
  BottomNavCubit() : super(BottomNavBarPage.home){
    initPageController(BottomNavBarPage.home);
  }

  late PageController pageController;
  void initPageController(BottomNavBarPage page) {
    pageController = PageController(initialPage: BottomNavBarPage.values.indexOf(page));
    emit(page);
  }
  void changePage(int page) {
    pageController.jumpToPage(page);
    emit(BottomNavBarPage.values[page]);
  }
}
