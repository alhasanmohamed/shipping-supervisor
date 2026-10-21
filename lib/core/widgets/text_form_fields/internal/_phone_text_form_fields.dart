import 'package:shipping_user_app/core/widgets/text_form_fields/app_text_form_fields.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppPhoneTextFormField extends StatefulWidget {
  final TextEditingController phoneController;
  final TextEditingController phoneCodeController;

  /// Set the initial country code, must be in ISO code format, eg: ['SA'].
  final String initialCountryCode;
  final TextDirection? textDirection;
  final String labelText;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final bool? unFocusOnTapOutside;
  final Color? enabledBorderColor;
  const AppPhoneTextFormField({
    super.key,
    required this.phoneController,
    required this.phoneCodeController,
    required this.initialCountryCode,
    required this.labelText,
    this.onFieldSubmitted,
    this.focusNode,
    this.textDirection,
    this.validator,
    this.textCapitalization,
    this.textInputAction,
    this.onTap,
    this.suffixIcon,
    this.unFocusOnTapOutside,
    this.enabledBorderColor,
  });

  @override
  State<AppPhoneTextFormField> createState() => _AppPhoneTextFormFieldState();
}

class _AppPhoneTextFormFieldState extends State<AppPhoneTextFormField> {
  late CountryWithPhoneCode country = const CountryWithPhoneCode.us();
  @override
  void initState() {
    super.initState();
    loadCountry().then((country) {
      widget.phoneCodeController.text = '+${country.phoneCode}';
    });
  }

  Future<CountryWithPhoneCode> loadCountry() async {
    final countries = await getAllSupportedRegions();
    country = countries[widget.initialCountryCode]!;
    return country;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return GeneralTextFormField(
          onChanged: (value) {
            widget.phoneController.text = formatNumberSync(
              value,
              country: country,
              inputContainsCountryCode: false,
              phoneNumberFormat: PhoneNumberFormat.national,
              phoneNumberType: PhoneNumberType.fixedLine,
            );
          },
          suffixIcon: widget.suffixIcon,
          onTap: widget.onTap,
          controller: widget.phoneController,
          onFieldSubmitted: widget.onFieldSubmitted,
          focusNode: widget.focusNode,
          textDirection: widget.textDirection,
          validator: widget.validator,
          textCapitalization: widget.textCapitalization,
          textInputAction: widget.textInputAction,
          textInputType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          labelText: widget.labelText,
          hintText: country.phoneMaskFixedLineNational,
          unFocusOnTapOutside: widget.unFocusOnTapOutside,
          enabledBorderColor: widget.enabledBorderColor,
        );
      },
    );
  }
}
