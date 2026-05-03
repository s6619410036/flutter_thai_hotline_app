import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_ui.dart';
// --- เพิ่มการ import หน้าอื่นๆ เพื่อให้ปุ่มกดสลับได้ ---
import 'sub_a_home_ui.dart';
import 'sub_b_home_ui.dart';
import 'sub_d_home_ui.dart';

class SubCHomeUI extends StatefulWidget {
  const SubCHomeUI({super.key});

  @override
  State<SubCHomeUI> createState() => _SubCHomeUIState();
}

class _SubCHomeUIState extends State<SubCHomeUI> {
  // ฟังก์ชันสำหรับการโทรออกจริง (คงเดิม)
  Future<void> _makeCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  // ข้อมูลธนาคารและเบอร์โทรศัพท์ (คงเดิมครบถ้วน 16 รายการ)
  final List<Map<String, String>> bankList = [
    {
      "name": "ธนาคารกรุงเทพ",
      "number": "1333",
      "image": "assets/images/กรุงเทพ.png",
    },
    {
      "name": "ธนาคารออมสิน",
      "number": "1115",
      "image": "assets/images/ออมสิน.png",
    },
    {
      "name": "ธนาคารกสิกรไทย",
      "number": "02 888 8888",
      "image": "assets/images/กสิกร.png",
    },
    {
      "name": "ธนาคารกรุงไทย",
      "number": "02 111 1111",
      "image": "assets/images/กรุงไทย.png",
    },
    {
      "name": "ธนาคารกรุงศรีอยุธยา",
      "number": "1572",
      "image": "assets/images/กรุงศรี.png",
    },
    {
      "name": "ธนาคารทหารไทยธนชาต",
      "number": "1428",
      "image": "assets/images/ttb.png",
    },
    {
      "name": "ธนาคารซิตี้แบงก์",
      "number": "1588",
      "image": "assets/images/citi.png",
    },
    {
      "name": "ธนาคารแลนด์ แอนด์ เฮ้าส์",
      "number": "1327",
      "image": "assets/images/LH.png",
    },
    {
      "name": "ธนาคารอาคารสงเคราะห์",
      "number": "02 645 9000",
      "image": "assets/images/ธอส.png",
    },
    {
      "name": "ธนาคารไทยพาณิชย์",
      "number": "02 777 7777",
      "image": "assets/images/scb.png",
    },
    {
      "name": "ธนาคารเกียรตินาคินภัทร",
      "number": "02 165 5555",
      "image": "assets/images/phatar.png",
    },
    {
      "name": "ธนาคารไทยเครดิต",
      "number": "02 697 5454",
      "image": "assets/images/ไทยเครดิต.png",
    },
    {
      "name": "ธนาคารยูโอบี",
      "number": "02 285 1555",
      "image": "assets/images/uob.png",
    },
    {
      "name": "ธนาคารทิสโก้",
      "number": "02 633 6000",
      "image": "assets/images/tisco.png",
    },
    {
      "name": "ธนาคารอิสลาม",
      "number": "02 204 2766",
      "image": "assets/images/อิสลาม.png",
    },
    {
      "name": "ธนาคารซีไอเอ็มบี ไทย",
      "number": "02 626 7777",
      "image": "assets/images/CIMB.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'สายด่วน THAILAND',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 27, 179, 93),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
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
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/subC.png',
                    height: 120,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.account_balance,
                      size: 100,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'สายด่วนธนาคาร',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: bankList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          bankList[index]['image']!,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.image),
                        ),
                      ),
                    ),
                    title: Text(
                      bankList[index]['name']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      bankList[index]['number']!,
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.phone_enabled,
                        color: Colors.green,
                        size: 30,
                      ),
                      onPressed: () => _makeCall(bankList[index]['number']!),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // --- ส่วนที่เพิ่ม: แถบเมนูด้านล่าง (Index 2 คือหน้าธนาคาร) ---
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SubAHomeUI()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SubBHomeUI()),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SubDHomeUI()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'การเดินทาง',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: 'อุบัติเหตุ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'ธนาคาร',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.plumbing),
            label: 'สาธารณูปโภค',
          ),
        ],
      ),
    );
  }
}
