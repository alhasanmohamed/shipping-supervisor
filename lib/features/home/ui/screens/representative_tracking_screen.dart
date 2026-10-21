import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google;
import 'package:latlong2/latlong.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/widgets/profile_image.dart';
import 'package:shipping_user_app/core/widgets/shimmer_widget.dart';
import 'package:shipping_user_app/features/home/logic/home_cubit.dart';
import 'package:shipping_user_app/features/home/logic/home_state.dart';
import 'package:shipping_user_app/generated/l10n.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/features/home/data/models/representative_model.dart';
import 'package:shipping_user_app/features/home/ui/widgets/representative_card_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class RepresentativeTrackingScreen extends StatelessWidget {
  final RepresentativeModel representative;
  final HomeCubit homeCubit;
  const RepresentativeTrackingScreen({
    super.key,
    required this.representative,
    required this.homeCubit,
  });

  @override
  Widget build(BuildContext context) {
    final MapController mapController = MapController();
    final Completer<google.GoogleMapController> googleMapController =
        Completer<google.GoogleMapController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).representative_tracking,
          style: AppTextStyles.font20Bold,
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return StreamBuilder(
                  stream: context.read<HomeCubit>().representativeLocationStream,
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      final rep = RepresentativeModel.fromJson(snapshot.data);
                      return RepresentativeCardWidget(
                        representative: rep,
                        isOnline: homeCubit.isUserOnline(rep.lastSeen),
                      );
                    } else {
                      return Hero(
                        tag: representative.id,
                        child: RepresentativeCardWidget(
                          representative: representative,
                          isOnline: homeCubit.isUserOnline(representative.lastSeen),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
          FutureBuilder<google.BitmapDescriptor?>(
            future: createMarker(representative.avatar),
            builder: (context, customMarker) {
              return BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return StreamBuilder(
                    stream: context.read<HomeCubit>().representativeLocationStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SliverPadding(
                          padding: const EdgeInsets.only(bottom: 80),
                          sliver: SliverFillRemaining(
                            fillOverscroll: true,
                            hasScrollBody: true,
                            child: SkeletonizerWidget(
                              effect: PulseEffect(
                                duration: const Duration(milliseconds: 500),
                                from: Theme.of(context).colorScheme.shadow,
                                to: AppColors.gray,
                              ),
                              child: FlutterMap(
                                mapController: mapController,
                                children: [
                                  TileLayer(
                                    urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                                    userAgentPackageName: "dev.fleaflet.flutter_map_example",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return SliverFillRemaining(
                          fillOverscroll: false,
                          hasScrollBody: false,
                          child: Center(
                            child: Text(
                              S.of(context).error_unknown,
                              style: AppTextStyles.font16SemiBold,
                            ),
                          ),
                        );
                      }
                      final rep = RepresentativeModel.fromJson(snapshot.data);
                      if (snapshot.hasData) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          mapController.move(
                            LatLng(rep.lat, rep.lon),
                            18,
                          );
                          googleMapController.future.then((controller) {
                            controller.animateCamera(
                              google.CameraUpdate.newCameraPosition(
                                google.CameraPosition(
                                  target: google.LatLng(rep.lat, rep.lon),
                                  zoom: 18,
                                ),
                              ),
                            );
                          });
                        });
                      }
                      return SliverFillRemaining(
                        hasScrollBody: true,
                        fillOverscroll: false,
                        child: FlutterMap(
                          mapController: mapController,
                          options: MapOptions(
                            initialCenter: LatLng(rep.lat, rep.lon),
                            initialZoom: 18,
                            interactionOptions: const InteractionOptions(
                              flags: InteractiveFlag.scrollWheelZoom |
                                  InteractiveFlag.doubleTapZoom |
                                  InteractiveFlag.pinchZoom |
                                  InteractiveFlag.drag,
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                              subdomains: const ['a', 'b', 'c'],
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: LatLng(rep.lat, rep.lon),
                                  width: 60,
                                  height: 60,
                                  alignment: Alignment.center,
                                  child: CustomDriverMarker(
                                    imageUrl: representative.avatar ?? '',
                                    size: 60,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        // child: google.GoogleMap(
                        //   zoomControlsEnabled: false,
                        //   initialCameraPosition: google.CameraPosition(
                        //     target: google.LatLng(rep.lat, rep.lon),
                        //     zoom: 18,
                        //   ),
                        //   onMapCreated: (controller) {
                        //     googleMapController.complete(controller);
                        //   },
                        //   markers: {
                        //     google.Marker(
                        //       markerId: google.MarkerId(rep.id.toString()),
                        //       position: google.LatLng(rep.lat, rep.lon),
                        //       icon: customMarker.data ?? google.BitmapDescriptor.defaultMarker,
                        //     ),
                        //   },
                        // ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Future<google.BitmapDescriptor?> createMarker(String? imageUrl) async {
    return CustomDriverMarker(
      imageUrl: imageUrl ?? '',
      size: 60,
    ).toBitmapDescriptor();
  }
}

class CustomDriverMarker extends StatelessWidget {
  final String imageUrl;
  final double size;
  const CustomDriverMarker({
    super.key,
    required this.imageUrl,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.location_on,
          color: AppColors.primaryColor,
          size: size,
        ),
        Positioned(
          left: 0.3 * size,
          top: 0.16 * size,
          child: SizedBox(
            width: 0.4 * size,
            height: 0.4 * size,
            child: Center(
              child: ProfileImage(
                link: imageUrl,
                radius: 0.4 * size,
                errorWidget: Icon(
                  Icons.person_rounded,
                  size: 0.3 * size,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
