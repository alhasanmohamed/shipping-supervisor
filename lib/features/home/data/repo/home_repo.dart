import 'package:shipping_user_app/core/networking/supabase/supabase_service.dart';
import 'package:shipping_user_app/features/home/data/models/representative_model.dart';

class HomeRepo {
  final SupabaseService _supabaseService;

  HomeRepo(this._supabaseService);

  Stream<List<RepresentativeModel>> getRepresentativesList () => _supabaseService.getRepresentativesList();

  Stream getRepresentativeLocation (int userId) => _supabaseService.getRepresentativeLocation(userId);
}