import 'package:freezed_annotation/freezed_annotation.dart';
part 'bottom_nav_state.freezed.dart';

@freezed
class BottomNavState<BottomNavBarPage> with _$BottomNavState<BottomNavBarPage> {
  const factory BottomNavState.bottomNavBarState({required BottomNavBarPage page}) = BottomNavBarState<BottomNavBarPage>;
}
