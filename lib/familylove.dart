import 'package:app_amd/fmlovemore.dart';
import 'package:app_amd/home.dart';
import 'package:flutter/material.dart';
import 'package:app_amd/Nextpage.dart'; // غيري اسم الصفحة اللي تبغي تروحين لها هنا

class Familylove extends StatelessWidget {
  const Familylove({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 12, right: 8),
            child: Icon(Icons.more_vert, color: Color(0xFF5D00A8)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Image.asset('asset/ai.png', height: 30),
            const Text(
              "مدعوم بالذكاء الاصطناعي",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            const Text(
              "قطات العائلة",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3F0060),
              ),
            ),
            const SizedBox(height: 20),

            // صورة تبرع 1
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Fmlovemore()), // غيّري الصفحة حسب رغبتك
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'asset/mamam.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 220,
                  ),
                ),
              ),
            ),

            //  صورة تبرع 2
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const home()), // نفس الشي، غيري الصفحة لو تبين
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'asset/babaaa.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 220,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // زر إضافة قطة
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6B00A3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Center(
                  child: Text(
                    "إضافة قطة",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "MOH",
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
