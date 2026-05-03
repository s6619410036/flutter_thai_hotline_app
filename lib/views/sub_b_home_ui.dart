import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_ui.dart';
import 'sub_a_home_ui.dart';
import 'sub_c_home_ui.dart';
import 'sub_d_home_ui.dart';

class SubBHomeUI extends StatefulWidget {
  const SubBHomeUI({super.key});

  @override
  State<SubBHomeUI> createState() => _SubBHomeUIState();
}

class _SubBHomeUIState extends State<SubBHomeUI> {
  Future<void> _makeCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  final List<Map<String, String>> emergencyList = [
    {
      "name": "เหตุด่วนเหตุร้าย",
      "number": "191",
      "image": "assets/images/ตำรวจb.png",
    },
    {
      "name": "แจ้งไฟไหม้ สัตว์เข้าบ้าน",
      "number": "199",
      "image": "assets/images/ไฟไหม้.png",
    },
    {
      "name": "สายด่วนรถหาย",
      "number": "1192",
      "image": "assets/images/ตำรวจb.png",
    },
    {
      "name": "อุบัติเหตุทางน้ำ",
      "number": "1196",
      "image": "assets/images/ทางน้ำ.png",
    },
    {"name": "แจ้งคนหาย", "number": "1300", "image": "assets/images/คนหาย.png"},
    {
      "name": "ศูนย์ปลอดภัยคมนาคม",
      "number": "1356",
      "image": "assets/images/คมนาคม.png",
    },
    {
      "name": "หน่วยแพทย์กู้ชีพ",
      "number": "1554",
      "image": "assets/images/กู้ชีพ.png",
    },
    {
      "name": "ศูนย์เอราวัณ",
      "number": "1646",
      "image": "assets/images/เอราวัณ.png",
    },
    {
      "name": "เจ็บป่วยฉุกเฉิน",
      "number": "1669",
      "image": "assets/images/เจ็บป่วย.png",
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
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutUI()),
            ),
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
                    'assets/images/subB.png',
                    height: 120,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.emergency,
                      size: 100,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'สายด่วน\nอุบัติเหตุ-เหตุฉุกเฉิน',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const Divider(thickness: 1),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: emergencyList.length,
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
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          emergencyList[index]['image']!,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.image),
                        ),
                      ),
                    ),
                    title: Text(
                      emergencyList[index]['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      emergencyList[index]['number']!,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.phone_in_talk,
                        color: Colors.green,
                        size: 30,
                      ),
                      onPressed: () =>
                          _makeCall(emergencyList[index]['number']!),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        selectedItemColor: Colors.blue[900],
        onTap: (index) {
          if (index == 0)
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SubAHomeUI()),
            );
          if (index == 2)
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SubCHomeUI()),
            );
          if (index == 3)
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SubDHomeUI()),
            );
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
