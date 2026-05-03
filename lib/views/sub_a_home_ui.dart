import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_ui.dart';
import 'sub_b_home_ui.dart';
import 'sub_c_home_ui.dart';
import 'sub_d_home_ui.dart';

class SubAHomeUI extends StatefulWidget {
  const SubAHomeUI({super.key});

  @override
  State<SubAHomeUI> createState() => _SubAHomeUIState();
}

class _SubAHomeUIState extends State<SubAHomeUI> {
  Future<void> _makeCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  final List<Map<String, String>> hotlineList = [
    {
      "name": "กรมทางหลวงชนบท",
      "number": "1146",
      "image": "assets/images/กรมทางหลวงชนบท.png",
    },
    {
      "name": "ตำรวจท่องเที่ยว",
      "number": "1155",
      "image": "assets/images/ตำรวจท่องเที่ยว.png",
    },
    {
      "name": "ตำรวจทางหลวง",
      "number": "1193",
      "image": "assets/images/ตำรวจทางหลวง.png",
    },
    {
      "name": "ข้อมูลจราจร",
      "number": "1197",
      "image": "assets/images/ตำรวจจราจร.png",
    },
    {"name": "ขสมก.", "number": "1348", "image": "assets/images/ขสมก.png"},
    {"name": "บขส.", "number": "1490", "image": "assets/images/บขส.png"},
    {
      "name": "เส้นทางบนทางด่วน",
      "number": "1543",
      "image": "assets/images/ทางด่วน.png",
    },
    {
      "name": "กรมทางหลวง",
      "number": "1586",
      "image": "assets/images/กรมทางหลวง.png",
    },
    {
      "name": "การรถไฟแห่งประเทศไทย",
      "number": "1690",
      "image": "assets/images/การรถไฟ.png",
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
                    'assets/images/subA.png',
                    height: 120,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.directions_car,
                      size: 100,
                      color: Colors.blue[900],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'สายด่วนการเดินทาง',
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
              itemCount: hotlineList.length,
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
                          hotlineList[index]['image']!,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.image),
                        ),
                      ),
                    ),
                    title: Text(
                      hotlineList[index]['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      hotlineList[index]['number']!,
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
                      onPressed: () => _makeCall(hotlineList[index]['number']!),
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
        currentIndex: 0,
        selectedItemColor: Colors.blue[900],
        onTap: (index) {
          if (index == 1)
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SubBHomeUI()),
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
