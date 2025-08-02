import 'package:flutter/material.dart';
import 'home.dart';
import 'person.dart';
import 'geft.dart';
import 'adkar.dart';
import 'familylove.dart';
import 'money.dart';

class goals extends StatelessWidget {
  const goals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Directionality(
          textDirection: TextDirection.ltr,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_circle_right,
              color: Color(0xFF5D00A8),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 12, right: 8),
            child: Icon(Icons.more_vert, color: Color(0xFF5D00A8)),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Image.asset('asset/ai.png', height: 30),
            const SizedBox(height: 5),
            const Text(
              "مدعوم بالذكاء الاصطناعي",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF6B00A3), width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "أهداف العائلة",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3F0060),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  buildGoalCard(context, 'asset/geft.png', const Geft()),
                  buildGoalCard(context, 'asset/savemoney.png', const Adkar()),
                  buildGoalCard(context, 'asset/familylove.png', const Familylove()),
                  buildGoalCard(context, 'asset/flower.png', const Money()),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6B00A3),
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text(
                "إضافة هدف جديد",
                style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: "MOH", fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 90),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF9933), Color(0xFFFF0000)],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "استثمروا أموالكم بذكاء، لمستقبل آمن ومستدام للأسرة",
                style: TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      // ✅ شريط تنقل سفلي مثل home.dart
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
            navIcon(context, Icons.home, () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const home()));
            }),
            navIcon(context, Icons.track_changes, () {}, isSelected: true),
            navIcon(context, Icons.person, () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Person()));
            }),
          ],
        ),
      ),
    );
  }

  // ✅ تابع أيقونات شريط التنقل
  Widget navIcon(BuildContext context, IconData icon, VoidCallback onTap, {bool isSelected = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 40,
        color: isSelected ? Color(0xFFFF9933) : const Color(0xFF5D00A8),
      ),
    );
  }

  // ✅ كرت الأهداف مع التنقل لصفحات مختلفة
  Widget buildGoalCard(BuildContext context, String imagePath, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.center,
        child: Image.asset(imagePath, width: 120),
      ),
    );
  }
}
