import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shipping_user_app/core/helpers/app_constants.dart';
import 'package:shipping_user_app/core/helpers/country_code_to_flag.dart';
import 'package:shipping_user_app/core/helpers/de_bouncer.dart';
import 'package:shipping_user_app/core/routing/app_router.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/core/widgets/text_form_fields/app_text_form_fields.dart';
import 'package:shipping_user_app/generated/l10n.dart';

class NationalityDialog extends StatefulWidget {
  final void Function(CountryWithPhoneCode) onCountrySelected;

  const NationalityDialog({
    super.key,
    required this.onCountrySelected,
  });

  @override
  State<NationalityDialog> createState() => _NationalityDialogState();
}

class _NationalityDialogState extends State<NationalityDialog> {
  late List<CountryWithPhoneCode> allCountries;
  late List<CountryWithPhoneCode> filteredCountries;
  final deBouncer = DeBouncer(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    allCountries = CountryManager().countries
      ..sort((a, b) => a.countryName!.compareTo(b.countryName!))
      ..removeWhere((element) => element.countryCode == 'IL');
    filteredCountries = allCountries;
  }

  void _filterCountries(String query) {
    setState(() {
      filteredCountries = allCountries
          .where((country) => country.countryName!
          .toLowerCase()
          .contains(query.toLowerCase().trim()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: AppConstants.kHorizontalPadding14,
        vertical: AppConstants.kVerticalPadding16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppConstants.kVerticalPadding8,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSearchBar(
                hintText: S.of(context).country_search,
                onChanged: (value) {
                  deBouncer.run(() {
                    _filterCountries(value);
                  });
                },
              ),
            ),
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: filteredCountries.length,
                  itemBuilder: (context, index) {
                    final country = filteredCountries[index];
                    return ListTile(
                      onTap: () {
                        goRouter.pop();
                        widget.onCountrySelected(country);
                      },
                      dense: true,
                      visualDensity: VisualDensity.compact,
                      leading: Text(
                        countryCodeToEmoji(country.countryCode),
                        style: TextStyle(fontSize: 24.sp),
                      ),
                      title: Text(
                        country.countryName ?? '',
                        style: AppTextStyles.font14Medium,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

