import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// --- Import หน้าที่เกี่ยวข้องเพื่อใช้ในการกดสลับปุ่ม ---
import 'about_ui.dart';
import 'sub_a_home_ui.dart';
import 'sub_b_home_ui.dart';
import 'sub_c_home_ui.dart';

class SubDHomeUI extends StatefulWidget {
  const SubDHomeUI({super.key});

  @override
  State<SubDHomeUI> createState() => _SubDHomeUIState();
}

class _SubDHomeUIState extends State<SubDHomeUI> {
  // ฟังก์ชันโทรออกจริง
  Future<void> _makeCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  // ข้อมูลสาธารณูปโภคและค่ายมือถือ (คงเดิมครบถ้วน)
  final List<Map<String, String>> utilityList = [
    {
      "name": "ไฟฟ้านครหลวง",
      "number": "1130",
      "image": "assets/images/ไฟฟ้าประปา.png",
    },
    {
      "name": "ไฟฟ้าส่วนภูมิภาค",
      "number": "1129",
      "image": "assets/images/ไฟฟ้าประปา.png",
    },
    {
      "name": "ไฟฟ้าฝ่ายผลิต",
      "number": "1416",
      "image": "assets/images/ไฟฟ้าประปา.png",
    },
    {
      "name": "การประปานครหลวง",
      "number": "1125",
      "image": "assets/images/ไฟฟ้าประปา.png",
    },
    {
      "name": "การประปาส่วนภูมิภาค",
      "number": "1662",
      "image": "assets/images/ไฟฟ้าประปา.png",
    },
    {"name": "True", "number": "1242", "image": "assets/images/ทรู.png"},
    {"name": "dtac", "number": "1678", "image": "assets/images/ดีแทค.png"},
    {"name": "AIS", "number": "1175", "image": "assets/images/ais.png"},
    {"name": "TOT", "number": "1100", "image": "assets/images/tot.png"},
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
                    'assets/images/subD.png',
                    height: 120,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.plumbing,
                      size: 100,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'สายด่วนสาธารณูปโภค',
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
              itemCount: utilityList.length,
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
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          utilityList[index]['image']!,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.image),
                        ),
                      ),
                    ),
                    title: Text(
                      utilityList[index]['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      utilityList[index]['number']!,
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.phone_forwarded,
                        color: Colors.green,
                        size: 30,
                      ),
                      onPressed: () => _makeCall(utilityList[index]['number']!),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // --- เพิ่มปุ่ม BottomNavigationBar (Index 3 สำหรับหน้าสาธารณูปโภค) ---
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
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
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SubCHomeUI()),
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
