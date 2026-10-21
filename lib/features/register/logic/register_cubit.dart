import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/local/secure_storage/secure_storage_service.dart';
import 'package:shipping_user_app/core/local/shared_pref_service/shared_pref_service.dart';
import 'package:shipping_user_app/features/register/data/models/register_request_body.dart';
import 'package:shipping_user_app/features/register/data/repo/register_repo.dart';
import 'package:shipping_user_app/features/register/logic/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  final SecureStorageService _secureStorageService;
  final SharedPrefService _sharedPrefService;
  RegisterCubit(
    this._registerRepo,
    this._secureStorageService,
    this._sharedPrefService,
  ) : super(const RegisterState.initial());

  /// Personal Information Step
  final personalInformationKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final medicalInsuranceController = TextEditingController();
  final phoneController = TextEditingController();
  final countryCodeController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  /// Licences Step
  final licencesKey = GlobalKey<FormState>();
  final nationalityController = TextEditingController();
  final iDOrIqamaNumberController = TextEditingController();
  final iDOrIqamaImageController = TextEditingController();
  final passportNumberController = TextEditingController();
  final passportImageController = TextEditingController();
  CountryWithPhoneCode? country;
  XFile? iDOrIqamaImage;
  XFile? passportImage;

  /// Business Data Step
  final businessDataKey = GlobalKey<FormState>();
  final regionController = TextEditingController();
  final providerController = TextEditingController();
  final drivingLicenseIdController = TextEditingController();
  final drivingLicenseIdImageController = TextEditingController();
  final plateNumberController = TextEditingController();
  final plateImageController = TextEditingController();
  final guaranteeDocumentImageController = TextEditingController();
  XFile? drivingLicenseIdImage;
  XFile? plateImage;
  XFile? guaranteeDocumentImage;

  bool isTermsAndConditionsSelected = false;


  void validateForms() {
    if (businessDataKey.currentState!.validate()) {
     // emitRegisterStates();
    }
  }

  void emitRegisterStates({
    required RegisterRequestBody registerRequestBody,
  }) async {
    emit(const RegisterState.registerLoading());
    final response = await _registerRepo.register(registerRequestBody: registerRequestBody);
    response.when(
      success: (registerResponse) async {
        await Future.wait([
          _secureStorageService.writeString(
            key: AppConstants.kTokenKey,
            value: '', // Save the token returned from the login response
          ),
          _sharedPrefService.setInt(
            key: AppConstants.kUserId,
            value: 0, // Save the user id returned from the login response
          ),
        ]).then((_) {
          emit(RegisterState.registerSuccess(registerResponse));
        });
      },
      failure: (error) {
        emit(RegisterState.registerError(message: error.getAllErrorMessages()));
      },
    );
  }
}
