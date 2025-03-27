import 'package:flutter/material.dart';
import 'package:rent_app/Screens/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://nwokzdbmajcpnhilzlwv.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im53b2t6ZGJtYWpjcG5oaWx6bHd2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ0MzIyOTIsImV4cCI6MjA1MDAwODI5Mn0.kfzd_3W9bWg653oBgHKCwLOwJYSUrNf31Ysf7ldNQ2M',
  );

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    ),
  );
}
