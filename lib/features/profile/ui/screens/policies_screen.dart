import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:shipping_user_app/core/theming/app_colors.dart';
import 'package:shipping_user_app/core/theming/app_text_styles.dart';
import 'package:shipping_user_app/features/profile/data/models/policies_documents_response.dart';

class PoliciesScreen extends StatelessWidget {
  final PoliciesDocuments policiesDocument;
  const PoliciesScreen({
    super.key,
    required this.policiesDocument,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          policiesDocument.title?.getLocalizedValue(context) ?? '',
          style: AppTextStyles.font16SemiBold,
        ),
        shape: const Border(
          bottom: BorderSide(
            color: AppColors.secondGray,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: HtmlWidget(
            policiesDocument.body?.getLocalizedValue(context) ?? '',
            textStyle: AppTextStyles.font12Medium,
            onErrorBuilder: (context, element, error) => Text(error.toString()),
            onLoadingBuilder: (context, element, loadingProgress) {
              return const Center(
                child: LinearProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
