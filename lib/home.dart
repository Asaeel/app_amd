import 'package:app_amd/analys.dart';
import 'package:app_amd/bag.dart';
import 'package:app_amd/detels.dart';
import 'package:app_amd/finally.dart';
import 'package:flutter/material.dart';
import 'goals.dart';
import 'person.dart';

class home extends StatelessWidget {
  const home({super.key});

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
              Icons.notifications,
              color: Color.fromARGB(255, 248, 21, 21),size: 30,
            ),
            onPressed: () {
                  Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const   Finally  ()),
      );


          
            },
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "الرئيسية",
              style: TextStyle(
                fontFamily: "MOH",
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3F0060),
              ),
            ),
            const SizedBox(height: 40),

            buildCardItem(
              context,
              imagePath: 'asset/money.png',
              title: 'المحفظة العائلية',
              subtitle: '5000 ريال سعودي',
              onTap: () {
                  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => Bag()),
  ); //
              },
            ),

            buildCardItem(
              context,
              imagePath: '',
              title: 'الإنفاق',
              subtitleWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 10,
                        decoration: BoxDecoration(
                          color: Color(0xFFF0E5F5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      FractionallySizedBox(
                        alignment: Alignment.centerRight,
                        widthFactor: 0.7,
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: Color(0xFF3F0060),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "70%",
                    style: TextStyle(
                      fontFamily: "MOH",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3F0060),
                    ),
                  ),
                ],
              ),
              showImage: false,
            ),

            buildCardItem(
              context,
              imagePath: 'asset/twonte.png',
              title: 'أنفقت حسب الفئة',
              subtitle: "انفقت من المعتاد هذا الشهر ممتاز!",
              onTap: () {},
            ),

            buildCardItem(
              context,
              imagePath: 'asset/family basic.png',
              title: 'تحليل أفراد العائلة',
              subtitle: "تجاوز الحد الانفاقي",
              onTap: () {
                    Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Analys()),
            );
              },
            ),

            const SizedBox(height: 20),

            // ✅ زر بتدرج لوني
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: InkWell(
                onTap: () {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => Detels()),
  ); //


                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF9933), Color(0xFFFF0000)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "راجع الميزانية الآن !",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "MOH",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),

      //  شريط التنقل السفلي
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
            }, isSelected: true),
            navIcon(context, Icons.track_changes, () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const goals()));
            }),
            navIcon(context, Icons.person, () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Person()));
            }),
          ],
        ),
      ),
    );
  }

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

  Widget buildCardItem(
    BuildContext context, {
    required String title,
    String? subtitle,
    Widget? subtitleWidget,
    String imagePath = '',
    VoidCallback? onTap,
    bool showImage = true,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        constraints: const BoxConstraints(minHeight: 100),
        decoration: BoxDecoration(
          color:  Color(0xFFFFD9B4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            if (showImage && imagePath.isNotEmpty)
              Image.asset(imagePath, width: 70, height: 70),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: "MOH",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3F0060),
                    ),
                  ),
                  subtitleWidget ??
                      Text(
                        subtitle ?? '',
                        style: const TextStyle(
                          fontFamily: "MOH",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
