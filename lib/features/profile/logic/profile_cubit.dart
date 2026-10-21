import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipping_user_app/features/home/data/models/info_model.dart';
import 'package:shipping_user_app/features/profile/data/models/policies_documents_response.dart';
import 'package:shipping_user_app/features/profile/data/repo/profile_repo.dart';
import 'package:shipping_user_app/features/profile/logic/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(
    this._profileRepo,
  ) : super(const ProfileState.initial());

  final InfoModel info = InfoModel(
    name: 'Hasan Mohamed',
    id: '3251234213',
    avatar: 'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
    coinBalance: 300,
    balance: 4643,
  );
  /// Policies Documents Documents
  List<PoliciesDocuments> policiesDocs = [];
  void getPoliciesDocuments() async {
    emit(const ProfileState.getPoliciesDocumentsLoading());
    final response = await _profileRepo.getPoliciesDocuments();
    response.when(
      success: (response) {
        policiesDocs.clear();
        policiesDocs.addAll(response.docs);
        emit(const ProfileState.getPoliciesDocumentsSuccess());
      },
      failure: (error) => emit(
        ProfileState.getPoliciesDocumentsError(message: error.error?.message ?? ''),
      ),
    );
  }
}
