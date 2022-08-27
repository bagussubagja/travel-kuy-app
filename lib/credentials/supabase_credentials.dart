// ignore_for_file: constant_identifier_names

import 'package:supabase/supabase.dart';

class SupabaseCredentials{
  static const String APIKEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpreWl5eWxjeXVycHltaXZyd256Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjE1ODI4MDksImV4cCI6MTk3NzE1ODgwOX0.5TJzKZsJNK6kJKSEGaSTYkWUNXmO83A3TGn2f-hgbRk";
  static const String APIURL = "https://zkyiyylcyurpymivrwnz.supabase.co";
  static SupabaseClient supabaseClient = SupabaseClient(APIURL, APIKEY);
}