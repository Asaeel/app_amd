import 'package:flutter/material.dart';
import 'person.dart';
import 'goals.dart';
import 'home.dart';

class Addanalys extends StatelessWidget {
  const Addanalys({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //  الشريط العلوي البنفسجي
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 290,
            decoration: const BoxDecoration(
              color: Color(0xFF5D00A8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    right: 20,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    child: Icon(Icons.close, color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 150, bottom: 100, right: 50),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 160),
                          child: Text(
                            "تفاصيل التقرير",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              fontFamily: "MOH",
                              color: Color(0xFFFF9933),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Text(
                            "اطلع على تحليل مفصل لكل فرد من الأسرة...",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "MOH",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // محتوى الصفحة (فارغ حاليًا)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(child: Image.asset("asset/robot.png")),
            ),
          ),
        ],
      ),

      // الشريط السفلي نفسه من كودك
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
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const home()));
            }, isSelected: false),
            navIcon(context, Icons.track_changes, () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const goals()));
            }, isSelected: true),
            navIcon(context, Icons.person, () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const Person()));
            }),
          ],
        ),
      ),
    );
  }

  // أيقونة الشريط السفلي
  Widget navIcon(BuildContext context, IconData icon, VoidCallback onTap,
      {bool isSelected = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 40,
        color: isSelected ? Color(0xFF5D00A8) : const Color(0xFF5D00A8),
      ),
    );
  }
}
