import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:shipping_user_app/core/helpers/native_functions.dart';
import 'package:shipping_user_app/core/helpers/show_dialog.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/generated/l10n.dart';
import 'package:shipping_user_app/features/permission/logic/permission_state.dart';

// Added needed imports in native side to make this code work properly
class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit() : super(const PermissionState.initial());

  Future<void> checkLocationService() async {
    loc.Location location = loc.Location();
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService().then((value) {
        value ? null : checkLocationService();
        return value;
      });
    }
  }

  StreamSubscription<geolocator.ServiceStatus> serviceStatusStream() {
    return geolocator.Geolocator.getServiceStatusStream().listen((geolocator.ServiceStatus status) {
      status == geolocator.ServiceStatus.enabled ? null : checkLocationService();
    });
  }

  Future<bool> askLocationPermission(context) async {
    return await Permission.location.request().then((value) async {
      if (value.isDenied ||
          value.isPermanentlyDenied ||
          value.isRestricted ||
          value.isLimited ||
          value.isProvisional) {
        showSingleChoiceDialog(
          context,
          title: S.of(context).warning_title,
          content: S.of(context).warning_location_permission,
          buttonText: S.of(context).open_app_settings,
          onPressed: () async {
            Navigator.of(context).pop();
            openAppSettings();
          },
          icon: Icon(
            Icons.warning,
            size: 50.sp,
            color: AppColors.yellow,
          ),
        );
        return false;
      } else {
        return true;
      }
    });
  }

  Future<bool> askNotificationPermission(context) async {
    return await Permission.notification.request().then((value) async {
      if (value.isDenied ||
          value.isPermanentlyDenied ||
          value.isRestricted ||
          value.isLimited ||
          value.isProvisional) {
        showSingleChoiceDialog(
          context,
          title: S.of(context).warning_title,
          content: S.of(context).warning_notification_permission,
          buttonText: S.of(context).open_app_settings,
          onPressed: () async {
            Navigator.of(context).pop();
            openAppSettings();
          },
          icon: Icon(
            Icons.warning,
            size: 50.sp,
            color: AppColors.yellow,
          ),
        );
        return false;
      } else {
        return true;
      }
    });
  }

  Future<bool> askCameraPermission(context) async {
    return await Permission.camera.request().then((value) async {
      if (value.isDenied ||
          value.isPermanentlyDenied ||
          value.isRestricted ||
          value.isLimited ||
          value.isProvisional) {
        showSingleChoiceDialog(
          context,
          title: S.of(context).warning_title,
          content: S.of(context).warning_camera_permission,
          buttonText: S.of(context).open_app_settings,
          onPressed: () async {
            Navigator.of(context).pop();
            openAppSettings();
          },
          icon: Icon(
            Icons.warning,
            size: 50.sp,
            color: AppColors.yellow,
          ),
        );
        return false;
      } else {
        return true;
      }
    });
  }

  Future<bool> askPhotoPermission(context) async {
    if (Platform.isAndroid) {
      final androidSdkVersion = await NativeFunctions.getAndroidVersion();
      if (androidSdkVersion <= 32) {
        return await Permission.storage.request().then((value) async {
          if (value.isDenied ||
              value.isPermanentlyDenied ||
              value.isRestricted ||
              value.isLimited ||
              value.isProvisional) {
            showSingleChoiceDialog(
              context,
              title: S.of(context).warning_title,
              content: S.of(context).warning_photos_permission,
              buttonText: S.of(context).open_app_settings,
              onPressed: () async {
                Navigator.of(context).pop();
                openAppSettings();
              },
              icon: Icon(
                Icons.warning,
                size: 50.sp,
                color: AppColors.yellow,
              ),
            );
            return false;
          } else {
            return true;
          }
        });
      } else {
        return await Permission.photos.request().then((value) async {
          if (value.isDenied ||
              value.isPermanentlyDenied ||
              value.isRestricted ||
              value.isLimited ||
              value.isProvisional) {
            showSingleChoiceDialog(
              context,
              title: S.of(context).warning_title,
              content: S.of(context).warning_photos_permission,
              buttonText: S.of(context).open_app_settings,
              onPressed: () async {
                Navigator.of(context).pop();
                openAppSettings();
              },
              icon: Icon(
                Icons.warning,
                size: 50.sp,
                color: AppColors.yellow,
              ),
            );
            return false;
          } else {
            return true;
          }
        });
      }
    } else if (Platform.isIOS) {
      return await Permission.photos.request().then((value) async {
        if (value.isDenied ||
            value.isPermanentlyDenied ||
            value.isRestricted ||
            value.isLimited ||
            value.isProvisional) {
          showSingleChoiceDialog(
            context,
            title: S.of(context).warning_title,
            content: S.of(context).warning_photos_permission,
            buttonText: S.of(context).open_app_settings,
            onPressed: () async {
              Navigator.of(context).pop();
              openAppSettings();
            },
            icon: Icon(
              Icons.warning,
              size: 50.sp,
              color: AppColors.yellow,
            ),
          );
          return false;
        } else {
          return true;
        }
      });
    } else {
      return false;
    }
  }

  Future<void> checkLocationPermission() async {
    emit(const PermissionState.checkLocationPermissionLoading());
    final isGranted = await Permission.location.isGranted;
    if (!isGranted) {
      emit(const PermissionState.checkLocationPermissionError());
    } else {
      emit(const PermissionState.checkLocationPermissionSuccess());
    }
  }
}
