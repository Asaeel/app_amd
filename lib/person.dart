import 'package:app_amd/goals.dart';
import 'package:app_amd/home.dart';
import 'package:flutter/material.dart';


class Person extends StatefulWidget {
  const Person({super.key});

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  int selectedIndex = 2;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    // الانتقالات حسب الأيقونة المختارة
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const home()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const goals()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Person()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Directionality(
          textDirection: TextDirection.ltr,
          child: IconButton(
            icon: const Icon(
              Icons.settings,
              color: Color(0xFF5D00A8),
            ),
            onPressed: () {},
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                "ملفك الشخصي",
                style: TextStyle(
                  fontFamily: "MOH",
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3F0060),
                ),
              ),
              const SizedBox(height: 15),
              const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF3F0060),
                child: CircleAvatar(
                  radius: 47,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('asset/granddad.png'),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "أهلاً فهد !",
                style: TextStyle(
                  fontFamily: "MOH",
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3F0060),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "أفراد العائلة",
                style: TextStyle(
                  fontFamily: "MOH",
                  fontSize: 18,
                  color: Color(0xFF3F0060),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildFamilyMember("asset/sist.png", "سارة", "مساهم"),
                  const SizedBox(width: 12),
                  buildFamilyMember("asset/grandmam.png", "الأم", "مساهم"),
                  const SizedBox(width: 12),
                  buildFamilyMember("asset/granddad.png", "الأب", "مدير المحفظة"),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.white),
                label: const Text(
                  "إضافة عضو جديد",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "MOH",
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5D00A8),
                  shape: const StadiumBorder(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "بطاقاتي",
                    style: TextStyle(
                      fontFamily: "MOH",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3F0060),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: [
                    Container(
                      width: 60,
                      margin: const EdgeInsets.only(
                          top: 8, bottom: 8, left: 8, right: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1EEF5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Icon(Icons.add, color: Color(0xFF3F0060)),
                      ),
                    ),
                    buildCard(Colors.deepPurple, Colors.deepPurpleAccent),
                    buildCard(Color(0xFFB073F8), Color(0xFFFFC96C)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            navIcon(Icons.home, 0),
            navIcon(Icons.track_changes, 1),
            navIcon(Icons.person, 2),
          ],
        ),
      ),
    );
  }

  Widget navIcon(IconData icon, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Icon(
        icon,
        size: 40,
        color: isSelected ? const Color(0xFFFF9933) : const Color(0xFF5D00A8),
      ),
    );
  }

  Widget buildFamilyMember(String image, String name, String role) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFFF9933),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(image, height: 50, width: 50),
        ),
        const SizedBox(height: 6),
        Text(name, style: const TextStyle(fontFamily: "MOH", fontSize: 14)),
        Text(role,
            style: const TextStyle(
                fontFamily: "MOH", fontSize: 10, color: Colors.grey)),
      ],
    );
  }

  Widget buildCard(Color startColor, Color endColor) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(Icons.credit_card, color: Colors.white, size: 28),
          SizedBox(height: 10),
          Text("6542 5643 8888 43",
              style: TextStyle(
                  color: Colors.white, fontSize: 18, letterSpacing: 1.2)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Jason Wilson", style: TextStyle(color: Colors.white70)),
              Text("03/27", style: TextStyle(color: Colors.white70)),
            ],
          ),
        ],
      ),
    );
  }
}
