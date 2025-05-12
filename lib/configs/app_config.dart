import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppConfig {
  static Future<void> loadEnv() async {
    await dotenv.load(fileName: "/Users/herb/Developer/Flutter/template/.env");
  }

  static String getSupabaseUrl() {
    final supabaseUrl = dotenv.env['SUPABASE_URL'];
    if (supabaseUrl == null) {
      throw Exception("Environment variable SUPABASE_URL is not set.");
    }
    return supabaseUrl;
  }

  static String getSupabaseAnonKey() {
    final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];
    if (supabaseAnonKey == null) {
      throw Exception("Environment variable SUPABASE_ANON_KEY is not set.");
    }
    return supabaseAnonKey;
  }

  static Future<void> initializeSupabase() async {
    await Supabase.initialize(
      url: getSupabaseUrl(),
      anonKey: getSupabaseAnonKey(),
    );
  }
}
