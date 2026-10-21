import 'package:shipping_user_app/core/widgets/shimmer_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String link;
  final double radius;
  final Widget? child;
  final Widget? errorWidget;

  /// The color of the icon that will be displayed as placeholder or if link is corrupted.
  final Color? iconColor;

  const ProfileImage({
    super.key,
    required this.link,
    required this.radius,
    this.child,
    this.errorWidget,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          shape: const CircleBorder(
            side: BorderSide.none,
          ),
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.zero,
          child: CachedNetworkImage(
            imageUrl: link,
            cacheKey: link,
            imageBuilder: (context, imageProvider) => Image(
              image: ResizeImage(
                imageProvider,
                height: (radius * 2 * MediaQuery.of(context).devicePixelRatio).toInt(),
                width: (radius * 2 * MediaQuery.of(context).devicePixelRatio).toInt(),
                allowUpscaling: true,
                policy: ResizeImagePolicy.fit,
              ),
              fit: BoxFit.cover,
              height: radius * 2,
              width: radius * 2,
            ),
            placeholder: (_, url) {
              return SkeletonizerWidget(
                child: Card(
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  elevation: 0,
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.zero,
                  child: Icon(
                    Icons.ac_unit,
                    color: iconColor,
                    size: radius * 1.2,
                  ),
                ),
              );
            },
            errorWidget: (_, url, error) {
              return errorWidget ??
                  Card(
                    shape: CircleBorder(
                      side: BorderSide(
                        color: Theme.of(context).primaryColor.withValues(alpha: 0.8),
                        width: 1,
                      ),
                    ),
                    elevation: 0,
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.zero,
                    child: Center(
                      child: Icon(
                        Icons.person_rounded,
                        color: iconColor,
                        size: radius * 1.4,
                      ),
                    ),
                  );
            },
            errorListener: (value) {},
            fit: BoxFit.cover,
            height: radius * 2,
            width: radius * 2,
          ),
        ),
        Positioned(
          right: -5,
          bottom: -5,
          child: child ?? const SizedBox.shrink(),
        ),
      ],
    );
  }
}
