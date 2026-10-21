import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipping_user_app/features/home/data/models/representative_model.dart';
import 'package:shipping_user_app/features/home/data/repo/home_repo.dart';
import 'package:shipping_user_app/features/home/logic/home_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());
  /// Get Representatives
  Stream<List<RepresentativeModel>> representativesStream = const Stream<List<RepresentativeModel>>.empty();
  List<RepresentativeModel> cachedRepresentatives = [];
  Timer? _timer;
  void getRepresentatives() {
    emit(const HomeState.representativesLoading());
    try {
      representativesStream =  _homeRepo.getRepresentativesList();
      _timer ??= Timer.periodic(const Duration(seconds: 15), (timer){
          emit(const HomeState.updateStatus(false));
          emit(const HomeState.updateStatus(true));
        });
      emit(const HomeState.representativesSuccess());
    } on SocketException catch (error) {
      emit(HomeState.representativesError(message: error.message));
    } on AuthException catch (error) {
      emit(HomeState.representativesError(message: error.message));
    } on Exception catch (error) {
      emit(HomeState.representativesError(message: error.toString()));
    } catch (error) {
      emit(HomeState.representativesError(message: error.toString()));
    }
  }

  bool isUserOnline(String? lastSeen) {
    if (lastSeen == null) {
      return false;
    } else {
      final now = DateTime.now();
      final difference = now.difference(DateTime.parse(lastSeen).toLocal()).inSeconds;
      return difference < 10;
    }

  }

  void cacheRepresentatives(List<RepresentativeModel> representatives) {
    cachedRepresentatives = representatives;
  }

  /// Get Representative Location
  Stream representativeLocationStream =  const Stream.empty();
  void getRepresentativeLocation(userId) {
    emit(const HomeState.representativesLoading());
    try {
      representativeLocationStream =  _homeRepo.getRepresentativeLocation(userId);
      emit(const HomeState.representativesSuccess());
    } on SocketException catch (error) {
      emit(HomeState.representativesError(message: error.message));
    } on AuthException catch (error) {
      emit(HomeState.representativesError(message: error.message));
    } on Exception catch (error) {
      emit(HomeState.representativesError(message: error.toString()));
    } catch (error) {
      emit(HomeState.representativesError(message: error.toString()));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    _timer = null;
    return super.close();
  }
}
