import 'package:flutter/material.dart';

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'สายด่วน THAILAND',
          style: TextStyle(
            color: Color.fromARGB(255, 251, 250, 250),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 27, 179, 93),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 114, 112, 112),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'ผู้จัดทำ',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // --- 1. ส่วนแสดงโลโก้มหาวิทยาลัย (กรอบม่วง) ---
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 108, 103, 109),
                    width: 2,
                  ), // เส้นขอบม่วง
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/images/sau.png', // เปลี่ยนเป็นชื่อไฟล์โลโก้มหาลัยของคุณ
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.school, size: 80, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'มหาวิทยาลัยเอเชียอาคเนย์',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              const SizedBox(height: 40),

              // --- 2. ส่วนรูปถ่ายนักศึกษา (วงกลม) ---
              const CircleAvatar(
                radius: 62,
                backgroundColor: Colors.grey, // ขอบนอกสีเทา
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    'assets/images/me.jpg',
                  ), // ใส่รูปถ่ายของคุณที่นี่
                  // ในกรณีที่ไม่มีรูป ให้ใช้ Icon แทน (errorBuilder ไม่รองรับ backgroundImage)
                  // child: Icon(Icons.person, size: 70, color: Colors.grey),
                ),
              ),

              const SizedBox(height: 30),

              // --- 3. ส่วนข้อมูลข้อความนักศึกษา ---
              _buildInfoText('รหัสนักศึกษา', '6619410036'),
              _buildInfoText('ชื่อ-สกุลนักศึกษา', 'พิมษ์พิกุล บุตรพรม'),
              _buildInfoText('อีเมลนักศึกษา', 's6619410036@sau.ac.th'),
              _buildInfoText('ชื่อสาขาวิชา', 'วิศวกรรมคอมพิวเตอร์'),
              _buildInfoText('ชื่อคณะ', 'วิศวกรรมศาสตร์'),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันช่วยสร้าง Text ข้อมูลนักศึกษาเพื่อความเป็นระเบียบ
  Widget _buildInfoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(value, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
