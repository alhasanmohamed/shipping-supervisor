import 'package:shipping_user_app/features/home/data/models/representative_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final Supabase supabase;
  final String supabaseUrl;
  final String roleKey;
  const SupabaseService(this.supabase, this.supabaseUrl, this.roleKey);

  Stream<List<RepresentativeModel>> getRepresentativesList() =>
      supabase.client.from('representatives').stream(primaryKey: ['id']).map((data) {
        return data.map<RepresentativeModel>((json) => RepresentativeModel.fromJson(json)).toList();
      });

  Stream getRepresentativeLocation(int userId) =>
      supabase.client.from('representatives')
          .stream(primaryKey: ['id'])
          .eq('id', userId)
          .limit(1)
          .map((event) => event.isNotEmpty ? event.first : null);

  PostgrestFilterBuilder<List<dynamic>> searchForRecipe({
    required String word,
  }) {
    return supabase.client.from('representatives').select().textSearch(
          'name',
          word,
          config: 'english',
          type: TextSearchType.websearch,
        );
  }
}
