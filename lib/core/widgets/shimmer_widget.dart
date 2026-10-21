import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flutter/material.dart';

class SkeletonizerWidget extends StatelessWidget {
  final Widget child;
  final PaintingEffect? effect;
  const SkeletonizerWidget({
    super.key,
    required this.child,
    this.effect,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: effect ??
          ShimmerEffect(
            baseColor: Theme.of(context).colorScheme.shadow,
            highlightColor: AppColors.gray,
          ),
      child: child,
    );
  }
}
