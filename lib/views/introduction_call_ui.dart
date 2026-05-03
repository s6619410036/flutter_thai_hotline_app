import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'home_ui.dart';

class IntroductionCallUI extends StatefulWidget {
  const IntroductionCallUI({super.key});

  @override
  State<IntroductionCallUI> createState() => _IntroductionCallUIState();
}

class _IntroductionCallUIState extends State<IntroductionCallUI> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      // 1. รายชื่อหน้าแนะนำ (Pages)
      pages: [
        // หน้าที่ 1: สายด่วน THAILAND
        PageViewModel(
          title: "สายด่วน THAILAND",
          body: "รวบรวมสายด่วนที่จำเป็นสำหรับคุณไว้ในที่เดียว",
          image: Padding(
            padding: const EdgeInsets.only(top: 100.0), // ดึงรูปลงมาจากขอบบนสุด
            child: Center(
              child: Image.asset(
                'assets/images/callsplash.png',
                height: 250, // ปรับขนาดรูปให้เด่นขึ้นเล็กน้อย
                fit: BoxFit.contain,
              ),
            ),
          ),
          decoration: const PageDecoration(
            bodyAlignment:
                Alignment.center, // จัดกลุ่มเนื้อหาให้อยู่กึ่งกลางหน้าจอ
            imagePadding: EdgeInsets.only(
              bottom: 25,
            ), // ระยะห่างระหว่าง "รูป" กับ "หัวข้อ"
            titlePadding: EdgeInsets.only(
              bottom: 20,
            ), // ระยะห่างระหว่าง "หัวข้อ" กับ "คำอธิบาย"
            titleTextStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodyTextStyle: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),

        // หน้าที่ 2: โทรออกได้ทันที
        PageViewModel(
          title: "โทรออกได้ทันที",
          body: "กดเพียงปุ่มเดียวเพื่อโทรออกหาหน่วยงานที่ต้องการได้ทันที",
          image: Padding(
            padding: const EdgeInsets.only(top: 100.0), // ดึงรูปลงมาจากขอบบนสุด
            child: Center(
              child: Image.asset(
                'assets/images/callsplash.png',
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
          ),
          decoration: const PageDecoration(
            bodyAlignment: Alignment.center,
            imagePadding: EdgeInsets.only(
              bottom: 25,
            ), // ระยะห่างระหว่างรูปกับตัวหนังสือ
            titlePadding: EdgeInsets.only(
              bottom: 20,
            ), // ระยะห่างระหว่างหัวข้อกับเนื้อหา
            titleTextStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodyTextStyle: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
      ],

      // 2. การควบคุมการเปลี่ยนหน้า
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeUI()),
        );
      },
      onSkip: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeUI()),
        );
      },

      // 3. ตั้งค่าปุ่มและหน้าตา
      showSkipButton: true,
      skip: const Text(
        "ข้าม",
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: Color.fromARGB(255, 113, 119, 124),
      ),
      done: const Text(
        "เริ่มต้นใช้งาน",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 24, 241, 129),
        ),
      ),

      // 4. การปรับแต่งจุดเลื่อน (Dots)
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: const Color.fromARGB(255, 77, 83, 92),
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
