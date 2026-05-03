import 'package:flutter/material.dart';
import 'sub_a_home_ui.dart';
import 'sub_b_home_ui.dart';
import 'sub_c_home_ui.dart';
import 'sub_d_home_ui.dart';
import 'about_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'สายด่วน THAILAND',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 27, 179, 93), // สีเข้มตามแบบดีไซน์
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {
              // เชื่อมไปหน้า About (ข้อ 8)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUI()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // ส่วนแสดงภาพแบนเนอร์ด้านบน
          Container(
            height: 180,
            width: double.infinity,
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/callsplash.png',
                ), // ระบุชื่อรูปตามข้อ 3
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'เลือกหมวดหมู่สายด่วน',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // รายการเมนูหลัก (Sub A, B, C, D)
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: [
                _buildMenuButton(
                  context,
                  'สอบถามข้อมูลการเดินทาง',
                  'เบอร์โทร',
                  Colors.orange,
                  Icons.directions_car,
                  const SubAHomeUI(),
                ),
                _buildMenuButton(
                  context,
                  'แจ้งเหตุด่วน-เหตุฉุกเฉิน',
                  'เบอร์โทร',
                  Colors.red,
                  Icons.emergency,
                  const SubBHomeUI(),
                ),
                _buildMenuButton(
                  context,
                  'ธนาคาร/สถาบันการเงิน',
                  'เบอร์โทร',
                  Colors.blue,
                  Icons.account_balance,
                  const SubCHomeUI(),
                ),
                _buildMenuButton(
                  context,
                  'สาธารณูปโภค',
                  'เบอร์โทร',
                  Colors.green,
                  Icons.plumbing,
                  const SubDHomeUI(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ฟังก์ชันสร้างปุ่มเมนู เพื่อความเป็นระเบียบของโค้ด
  Widget _buildMenuButton(
    BuildContext context,
    String title,
    String subtitle,
    Color color,
    IconData icon,
    Widget targetPage,
  ) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // ใช้ Navigator เพื่อเปลี่ยนหน้าจอ
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => targetPage),
          );
        },
      ),
    );
  }
}
