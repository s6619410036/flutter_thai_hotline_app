import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// นำเข้าหน้าจอแรกของแอปตามที่ระบุในลำดับขั้นตอนการทำงาน (Splash Screen)
import 'package:thai_hotline_app/views/splash_screen_ui.dart';

void main() {
  runApp(const ThaiHotlineApp());
}

//-------------------------------------------------
// เปลี่ยนชื่อ Class ให้สอดคล้องกับโปรเจกต์ thai_hotline_app
class ThaiHotlineApp extends StatefulWidget {
  const ThaiHotlineApp({super.key});

  @override
  State<ThaiHotlineApp> createState() => _ThaiHotlineAppState();
}

class _ThaiHotlineAppState extends State<ThaiHotlineApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // กำหนดหน้าจอแรกเป็น SplashScreenUI ตามข้อ 2
      home: const SplashScreenUI(),
      theme: ThemeData(
        // ใช้ Google Fonts (Kanit) เพื่อให้แอปดูทันสมัยและรองรับภาษาไทยได้สวยงาม
        textTheme: GoogleFonts.kanitTextTheme(Theme.of(context).textTheme),
        // คุณสามารถกำหนดสีหลัก (Primary Color) ของแอปที่นี่ได้ตามใจชอบ (ข้อ 10)
        primarySwatch: Colors.grey,
        useMaterial3: true,
      ),
    );
  }
}
