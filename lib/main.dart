import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';

import 'package:shipping_user_app/shipping_supervisor_app.dart';
import 'package:shipping_user_app/core/helpers/bloc_observer.dart';
import 'package:shipping_user_app/core/di/dependency_injection.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  await Future.wait([
    dotenv.load(fileName: '.env').then((_) async => await Supabase.initialize(
          url: dotenv.env[AppConstants.kSupabaseUrl] ?? '',
          anonKey: dotenv.env[AppConstants.kSupabaseAnonKey] ?? '',
          authOptions: const FlutterAuthClientOptions(
            authFlowType: AuthFlowType.pkce,
          ),
        ).then(
          (value) async => await setupGetIt(
            supabaseUrl: dotenv.env[AppConstants.kSupabaseUrl] ?? '',
            roleKey: dotenv.env[AppConstants.kServerRole] ?? '',
          ),
        )),
  ]);
  Bloc.observer = CustomBlocObserver();
  await init();
  runApp(
    const ShippingSupervisorApp(),
  );
}
